#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: $0 INPUT [OUTPUT]" >&2
fi

output=${2:-$(helper-mod-filename.sh)}
ffmpeg -hide_banner -loglevel error \
    -i $1 -vcodec copy -an $output
