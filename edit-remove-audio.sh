#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: $0 INPUT [OUTPUT]" >&2
fi


if [ -z "$2" ]; then
    output=$(./helper-mod-filename.sh)
else
    output=$2
fi

ffmpeg -hide_banner -loglevel error \
    -i $1 -vcodec copy -an $output
