#!/bin/bash

album=$1
dest=$2

mkdir -p $dest
adb-sync --reverse /storage/emulated/0/DCIM/$album $dest
