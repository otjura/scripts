#!/bin/bash

for input in * ; 
do
  if [[ -d "$input" ]] ;
    then chmod 755 "$input" ;
    else chmod 664 "$input" ;
  fi 
done
