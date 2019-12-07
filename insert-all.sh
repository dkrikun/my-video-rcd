#!/bin/bash

main="$1"
dims=1920x1080
framerate=30

ffmpeg -y -hide_banner -loglevel info \
    -i $main \
    -filter_complex \
        "movie=blue.mp4,setpts=PTS-STARTPTS+284/TB,scale=iw*9/16:-1[blue_scaled];
         movie=yellow.mp4,setpts=PTS-STARTPTS+532/TB,scale=iw*9/16:-1[yellow_scaled];
         movie=switch_pile.mp4,setpts=PTS-STARTPTS+639/TB,scale=iw*9/16:-1[switch_pile_scaled];
         movie=clip1.mp4,setpts=PTS-STARTPTS+1153/TB,scale=iw*9/16:-1[clip1_scaled];
         movie=clip2.mp4,setpts=PTS-STARTPTS+1223/TB,scale=iw*9/16:-1[clip2_scaled];
         movie=fei_intro.mp4,setpts=PTS-STARTPTS+4038/TB,scale=iw*9/16:-1[fei_intro_scaled];
         movie=lube_fei.mp4,setpts=PTS-STARTPTS+4138/TB,scale=iw*9/16:-1[lube_fei_scaled];
         [0:v][blue_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,284,437)'[o1];
          [o1][yellow_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,532,595)'[o2];
          [o2][switch_pile_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,639,881)'[o3];
          [o3][clip1_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,1153,1197)'[o4];
          [o4][clip2_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,1223,1248)'[o5];
          [o5][fei_intro_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,4038,4059)'[o6];
          [o6][lube_fei_scaled]overlay=x=0.8*W-0.8*w:enable='between(t,4138,4607)'[video];
          [0:a]anull[audio]" \
           -map "[video]" -map "[audio]" full-overlayed.mkv






