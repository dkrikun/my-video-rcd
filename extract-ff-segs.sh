#!/bin/bash

main=full.mkv
ffmpeg -hide_banner \
    -i $main -ss 00:15:18 -to 00:16:38 -c copy blue-install.mkv

ffmpeg -hide_banner \
    -i $main -ss 00:19:25 -to 00:21:49 -c copy yellow-install.mkv

ffmpeg -hide_banner \
    -i $main -ss 00:28:36 -to 01:19:46 -c copy buttons.mkv

ffmpeg -hide_banner \
    -i $main -ss 00:33:45 -to 01:00:55 -c copy full-install.mkv
