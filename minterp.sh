#!/bin/bash

main=$1

ffmpeg -hide_banner -loglevel info \
    -i $main \
    -filter:v "minterpolate='mi_mode=mci:mc_mode=aobmc:vsbmc=1:fps=120'" \
    minterp.mkv
