#!/bin/sh

for file in *;
do
  if [[ -f "$file" && "${file:${#file}-4}" = ".mp3" ]]; then
    name=$(basename "$file");
    echo "Ruttaa paraikaa tätä: $name";
    ffmpeg -v 16 -i "$name" -codec:a libmp3lame -qscale:a 5 "_q5_$name";
    rm "$file";
  fi
done
echo 'Nimeää väliaikastiedostot takas alkuperäsiks...'
for qxfile in *;
do
  if [[ -f "$qxfile" ]]; then
    qxfilename=$(basename "$qxfile");
    mv "$qxfilename" "${qxfilename#_q5_}";
  fi
done
echo 'HOMMAT TULI VALMIIKS'
