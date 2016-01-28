#!/bin/bash
 
for file in *;
do
  echo Converting "$file" to "${file// /_}"
  mv "$file" "${file// /_}"
done
