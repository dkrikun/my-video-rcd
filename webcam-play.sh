#!/bin/bash

format=h264
dims=1920x1080
framerate=30
device=$(webcam-select.sh $format $dims)

ffplay -hide_banner -loglevel error \
    -f v4l2 -video_size $dims -framerate $framerate \
    "$@" \
    -i $device
