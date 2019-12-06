#!/bin/bash

if [ -z "$1" || -z "$2" ]; then
    echo "usage: $0 INPUT SUFFIX" >&2
    exit 1
fi

input=$1
suffix=$2

base=$(basename -- "$input")
dir=$(dirname -- "$input")
ext=${base##*.}
file=${base%.*}
output=$dir/${file}_$suffix.$ext

echo $output
