#!/bin/sh

for file in *;
do
  if [[ -f "$file" && "${file:${#file}-4}" = ".mp3" ]]; then
  name=$(basename "$file");
    ffmpeg -v 24 -i "$name" -codec:a libmp3lame -qscale:a 5 "_q5_$name";
    rm "$file";
  fi
done
for qxfile in *;
do
  if [[ -f "$qxfile" ]]; then
  qxfilename=$(basename "$qxfile");
    mv "$qxfilename" "${qxfilename#_q5_}";
  fi
done
echo 'HOMMAT TULI VALMIIKS'
