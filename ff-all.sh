#!/bin/bash

main=$1
ffmpeg -hide_banner \
    -i $main \
    -filter_complex \
    "[0:v]trim=0:918,setpts=PTS-STARTPTS[v1];
     [0:v]trim=918:998,setpts=0.5*(PTS-STARTPTS)[blue_install];
     [0:v]trim=998:1165,setpts=PTS-STARTPTS[v2];
     [0:v]trim=1165:1309,setpts=0.5*(PTS-STARTPTS)[yellow_install];
     [0:v]trim=1309:1716,setpts=PTS-STARTPTS[v3];
     [0:v]trim=1716:1777,setpts=0.5*(PTS-STARTPTS)[buttons];
     [0:v]trim=1777:2025,setpts=PTS-STARTPTS[v4];
     [0:v]trim=2025:3655,setpts=0.25*(PTS-STARTPTS)[full_install];
     [0:v]trim=3655:4786,setpts=PTS-STARTPTS[v5];
     [0:a]atrim=0:918,asetpts=PTS-STARTPTS[a1];
     [0:a]atrim=918:998,asetpts=0.5*(PTS-STARTPTS),volume=0[ablue_install];
     [0:a]atrim=998:1165,asetpts=PTS-STARTPTS[a2];
     [0:a]atrim=1165:1309,asetpts=0.5*(PTS-STARTPTS),volume=0[ayellow_install];
     [0:a]atrim=1309:1716,asetpts=PTS-STARTPTS[a3];
     [0:a]atrim=1716:1777,asetpts=0.5*(PTS-STARTPTS),volume=0[abuttons];
     [0:a]atrim=1777:2025,asetpts=PTS-STARTPTS[a4];
     [0:a]atrim=2025:3655,asetpts=0.25*(PTS-STARTPTS),volume=0[afull_install];
     [0:a]atrim=3655:4786,asetpts=PTS-STARTPTS[a5];
     [v1][a1][blue_install][ablue_install]
     [v2][a2][yellow_install][ayellow_install]
     [v3][a3][buttons][abuttons]
     [v4][a4][full_install][afull_install]
     [v5][a5]concat=n=9:v=1:a=1" \
         full-ff.mkv
