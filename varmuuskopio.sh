#!/bin/bash
#ionice -c 3 rsync -avh /home/ojr/ /run/media/ojr/NIPPON/
echo 'Varmuuskopioidaan kaikki ulkoiselle asemalle...'
ionice -c 3 rsync -avzh /home/ojr/ /run/media/ojr/NIPPON
echo 'Tiedostot kopioitu, kopioidaan asetukset...'
#ionice -c 3 rsync -avh /home/ojr /run/media/ojr/NIPPON/
echo 'Varmuuskopionti valmis!'
echo 'Tilaa asemalla: ' 
df -h | grep NIPPON
echo '\n'
