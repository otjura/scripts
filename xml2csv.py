# Otso Rajala <ojrajala@gmail.com> 190702-WORKING
#
# XML2CSV converts very specific XML files into a single CSV file.
# It operates simply by parsing all XML files in script run directory and then outputs a CSV file named data.csv
#
# !!! WARNING This will overwrite existing data.csv file in same location by design !!!

import os
import xml.etree.ElementTree as ET
import pprint

# Convinience class for moving data around.
# Has every sample attribute from machine outputs.
# This does not include pipetting map data.
class Sample:
    def __init__(self, filename, plate_id, plate_model, plate_serial, name, well, xs, ys):
        self.filename = filename
        self.plate_id = plate_id
        self.plate_model = plate_model
        self.plate_serial = plate_serial
        self.name = name
        self.well = well
        self.xs = xs
        self.ys = ys

# DEPRECATED missing values are now filled with filler function
# Sanity check for filesize, must be close to 1Mb.
# Some datas are partially failed runs with missing wells. This messes up x and y coordinates.
# Full map needs to have all 96 wells computed with 50 X and Y datapoints.
#
# @return True on sanity
def is_proper_filesize(file):
    size = os.stat(file).st_size
    if size > 1100000 or size < 1000000:
        return False
    else:
        return True

# Gather all XML files in a given folder (default: current directory) under assumption that they are same datatype,
# datatype being the one from machines, every machine producing output in identical format.
#
# @param directory path as str
# @return list of XML files as os.DirEntry objects
def get_xml_files(directory='.'):
    files = []
    xml_files = []
    with os.scandir(directory) as path:
        [files.append(x) for x in path if x.is_file()]
        [xml_files.append(x) for x in files if x.name.split('.')[1] == 'xml']
    return xml_files

# Get coordinate points and attributes from XML files.
#
# @param os.DirEntry object list
# @return vector with Sample objects
def parse_xml_trees(xml_files):
    sample_object_vector = []
    for x in xml_files:
        filename = x.name.split('.')[0]
        tree = ET.parse(x)
        root = tree.getroot()

        # parse plate attributes
        plate = root[1] # all samples are on one plate
        pid = plate.get('PlateID')
        pm = plate.get('Model')
        psn = plate.get('SerialNumber')

        # parse sample attributes
        samples = plate[0] # in one plate there is one samples tag

        # Loop over all samples and store each of them as Sample object in sample_vector array
        for sample in samples:
            name = sample.get('Name')
            well = sample.get('Well')
            xs = []
            ys = []
            tic = sample[1][1]
            for point in tic:
                xy = point.text.split(', ')
                x = float(xy[0])
                y = float(xy[1])
                xs.append(x)
                ys.append(y)
            s = Sample(filename,pid,pm,psn,name,well,xs,ys)
            sample_object_vector.append(s)

    return sample_object_vector

# Create new CSV file in run directory overwriting old one if present.
#
# @return nothing
def create_csv_data(data_vector, csv):
    for sample in data_vector:
        row = str(sample.filename) + ',' \
            + str(sample.plate_id) + ',' + str(sample.plate_model) + ',' + str(sample.plate_serial) + ',' \
            + str(sample.name) + ',' + str(sample.well) + ','
        for x in sample.xs:
            row = row + str(x) + ','
        for y in sample.ys:
            row = row + str(y) + ','
        row = row + '2\n' # 2 is place holder for 0/1 truth value
        csv.write(row)

# Create CSV file header with manual naming and assumption of specific order.
# Constructs x and y datapoints assuming full plate.
#
# @return nothing
def create_csv_header(data_vector, csv):
    header = 'Filename,PlateID,PlateModel,PlateSerial,NameByMachine,Well,'
    for x in range(0,len(data_vector[0].xs)):
        header = header + 'x' + str(x) + ','
    for y in range(0,len(data_vector[0].ys)):
        header = header + 'y' + str(y) + ','
    header = header + 'OK_TIC\n' # 1 for good tic 0 for bad tic 2 placeholder unknown
    csv.write(header)

# There exists +/- 0.0001 difference in some machine x-axis values, so it's good to normalise these to three digit precision.
# Function also ensures every return value is float.
#
# @param float OR integer with value 0
# @return float
def trunc(f):
    x = str(f)
    if len(x) != 1:
        a,b = x.split('.')
        b = b[0:3]
        x = float(a+'.'+b)
    return float(x)

# Fills in empty coordinates of a sample with zero by checking if time value aka x-coordinate exists in that particular spot.
# timevalues x0..x50 from file EXPORT.xml which is verified proper full test run.
def filler(sample_objects):
    timevalues = [
        0, 0.0294, 0.0587, 0.088, 0.1174, 0.1467, 0.1761, 0.2054, 0.2347, 0.2641, 0.2934, 0.3227, 0.3521, 0.3814,
        0.4107, 0.4401, 0.4694, 0.4988, 0.5281, 0.5574, 0.5868, 0.6161, 0.6454, 0.6748, 0.7041, 0.7334, 0.7628,
        0.7921, 0.8215, 0.8508, 0.8801, 0.9095, 0.9388, 0.9681, 0.9975, 1.0268, 1.0561, 1.0855, 1.1148, 1.1441,
        1.1735, 1.2028, 1.2322, 1.2615, 1.2908, 1.3202, 1.3495, 1.3788, 1.4082, 1.4375, 1.4668 ]
    #timevalues_t = [trunc(x) for x in timevalues]
    for sample in sample_objects:
        #sxs_t = [trunc(x) for x in sample.xs]
        if len(sample.xs) != len(timevalues):
            #[(i,x) for (i,x) in enumerate(a) for y in b if x == y]
            mask1 = [(i, a) for (i, a) in enumerate(timevalues) for b in sample.xs if a == b]  # list of tuples (index, timestamp)
            mask2 = [0 for i in range(51)]
            mask3 = mask2[:]
            for i in range(0,len(mask1)-1):
                mask2[mask1[i][0]] = mask1[i][1]  # now x values x[1] are in their proper place x[0] on mask2 with everything else zero
                mask3[mask1[i][0]] = sample.ys[i]  # because we can trust len(mask1) == len(sample.xs) == len(sample.ys)
            sample.xs = mask2
            sample.ys = mask3
    return sample_objects

# Run all of the above in correct order.
# Outputs proper CSV file with wanted data into working folder.
def main():
    xml_files = get_xml_files('Data')
    print('XML-tiedostot:')
    pprint.pprint(xml_files)
    sample_objects = parse_xml_trees(xml_files)
    xml_data = filler(sample_objects)
    csv = open('data.csv', 'w+', encoding='utf-8')
    create_csv_header(xml_data, csv)
    create_csv_data(xml_data, csv)
    csv.close()
    print('Valmis!')

if __name__ == '__main__':
    main()
