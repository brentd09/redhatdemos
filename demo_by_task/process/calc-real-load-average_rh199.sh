#!/bin/bash

numsock=$(lscpu | grep Socket | awk '{print $NF}')
numcore=$(lscpu | grep Core | awk '{print $NF}')
numcpus=$((numsock * numcore))

loadave=$(uptime | awk 'BEGIN{FS=","}{$3, $4, $5}')
echo $loadave
