#!/bin/bash

sec=$(($1 % 60))
min=$((($1 % 3600)/60))
hours=$(($1 / 3600))

printf "%02d:%02d:%02d\n" $hours $min $sec
