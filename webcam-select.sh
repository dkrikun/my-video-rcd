#!/bin/bash

format=${1:-h264}
dims=${2:-1920x1080}

ls /dev/video* | xargs -L1 ./webcam-caps.sh 2>&1 \
    | grep -A1 $format | grep -A1 $dims | grep "/dev/video" \
    | cut -d: -f1
