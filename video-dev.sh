#!/bin/bash

case "$1" in
    '') exit 0 ;;
    *[!0-9]*) echo "$1" ;;
    *) echo "/dev/video$1" ;;
esac
