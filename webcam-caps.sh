#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: $0 VIDEO_DEVICE" >&2
    exit 1
fi

ffmpeg -hide_banner \
    -f v4l2 -list_formats all -i $1
