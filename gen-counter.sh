#!/bin/bash

dims=800x600
framerate=60

ffmpeg -f lavfi -i testsrc=duration=100:size=$dims:rate=$framerate \
-vf "drawtext=text=%{n}:fontsize=72:r=60:x=(w-tw)/2: y=h-(2*lh):fontcolor=white:box=1:boxcolor=0x00000099" \
counter.mkv
