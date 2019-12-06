#!/bin/bash

main="$1"
dims=1920x1080
framerate=30

ffmpeg -y -hide_banner -loglevel info \
    -i $main \
    -i $2 \
    -filter_complex \
        "[1:v]setpts=PTS-STARTPTS+14/TB[trans];
         [trans][0:v]scale2ref=oh*mdar:ih[scaled][ref];
         [ref]boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:enable='between(t,14,157)'[xref];
         [xref][scaled]overlay=x=W/2-w/2:enable='between(t,14,157)'[video];
         [0:a]anull[audio]" \
           -map "[video]" -map "[audio]" once.mkv






