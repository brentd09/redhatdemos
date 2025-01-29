#!/bin/bash

numsock=$(lscpu | grep Socket | awk '{print $NF}')
numcore=$(lscpu | grep Core | awk '{print $NF}')
numcpus=$((numsock * numcore))
uptime=$(uptime )
loadave=$(awk -F, '{print $3", "$4", "$5}' <<< "$uptime" )
realave=$(awk -v numcpus="$numcpus" '{print $3 / numcpus ", " $4 / numcpus ", " $5 / numcpus }' <<< "$uptime" )
echo $loadave
echo "real average: $realave
