#!/bin/bash

for i in * ; 
do
    if [[ -d $i ]] ;
    then chmod 755 "$i" ;
    else chmod 664 "$i" ;
    fi 
done
