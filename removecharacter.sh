#!/bin/bash
echo Give pattern to remove: 
read remove
echo Give substituting pattern:
read insert
count=[0]
for i in *; 
do 
    mv "${i}" "${i/$remove/$insert}"; 
    count=$[count+1]
done
echo All finished! $count files renamed
