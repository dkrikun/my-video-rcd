#!/bin/bash

t0=$(date --date='00:00:00' +%s)
t=$(date --date=$1 +%s)
echo $(($t-$t0))
