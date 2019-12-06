#!/bin/bash

main="$1"
dims=1920x1080
framerate=30

ffmpeg -y -hide_banner -loglevel info \
    -i $main \
    -i $2 \
    -i $3 \
    -i $4 \
    -i $5 \
    -i $6 \
    -i $7 \
    -filter_complex \
        "[0:v][1:v]overlay=enable='between(t,284,437)'[a]; \
           [a][2:v]overlay=enable='between(t,532,595)'[b]; \
           [b][3:v]overlay=enable='between(t,639,881)'[c]; \
           [c][4:v]overlay=enable='between(t,1153,1197)'[d]; \
           [d][5:v]overlay=enable='between(t,1223,1248)'[e]; \
           [e][6:v]overlay=enable='between(t,4038,4059)'[f]; \
           [f][7:v]overlay=enable='between(t,4138,4607)'[video]; \
           [0:a]anull[audio]" \
           -map "[video]" -map "[audio]" blackout.mkv






