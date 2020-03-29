#!/bin/bash

# WARNING this is for a very specific use case. 
# It assumes a lot about everything.

mkdir -v ./muxes

for mkv in *.mkv; do
srt=${mkv/.mkv/.srt}
mkvextract $mkv tracks 2:$srt --raw
sed -ri "s/[A-Z'. -]+: ?|-?\([A-Z'. -]+\)//g" $srt
mkvmerge --output ./muxes/$mkv \
--no-subtitles --language 0:eng --default-track 0:yes \
--display-dimensions 0:1280x720 \
--language 1:eng --default-track 1:yes $mkv \
--language 0:eng --default-track 0:yes $srt \
--track-order 0:0,0:1,1:0
done

rm *.srt
