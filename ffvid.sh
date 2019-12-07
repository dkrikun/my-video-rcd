#!/bin/bash

ffmpeg -hide_banner \
    -i $1 -filter_complex \
        "[0:v]setpts=(1/$3)*PTS[video];
         [0:a]volume=0[audio]" \
         -map "[video]" -map "[audio]" \
         $2
