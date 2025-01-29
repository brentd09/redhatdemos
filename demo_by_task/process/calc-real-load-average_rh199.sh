#!/bin/bash

numsock=$(lscpu | grep Socket | awk '{print $NF}')
numcore=$(lscpu | grep Core | awk '{print $NF}')
numcpus=$((numsock * numcore))
uptime=$(uptime)
loadave=$(awk -F, '{print $3", "$4", "$5}' <<< "$uptime" )
echo $loadave
