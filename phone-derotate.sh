#!/bin/bash

if [ -z "$1" || -z "$2" ]; then
    echo "usage: $0 INPUT OUTPUT" >&2
    exit 1
fi

ffmpeg -i $1 -metadata:s:v rotate=180 -codec copy $2
