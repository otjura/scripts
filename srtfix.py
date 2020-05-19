import os
import subprocess
import re
import fileinput

# UNFINISHED Refer to subcleaner.sh for working version doing what this should

#folder = input('Path to folder with mkv files:')

folder = os.getcwd()
mkvextract = 'C:\\Program Files\\MKVToolNix\\mkvextract.exe' 
mkvmerge = 'C:\\Program Files\\MKVToolNix\\mkvmerge.exe' 

regex = re.compile(r"^([A-Z'-]+:\s|-?\([A-Z\s'-]+\))", re.MULTILINE)

with os.scandir(folder) as files:
    for item in files:
        if item.is_file() and item.name[-4:] == '.mkv':
            srt = item.name.replace('.mkv','.srt')
            subprocess.run([mkvextract, item, 'tracks', '2:'+srt, '--raw'])
            with open(srt, 'r+', encoding='utf-8') as f:
                for line in f:
                    regex.sub(line, '')
            #subprocess.run([mkvmerge, '-o '+item.name, srt])
                    
          
           
