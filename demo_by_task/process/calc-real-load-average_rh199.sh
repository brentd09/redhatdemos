#!/bin/bash

numsock=$(lscpu | grep Socket | awk '{print $NF}')
numcore=$(lscpu | grep Core | awk '{print $NF}')
numcpus=$((numsock * numcore))
uptime=$(uptime )
loadave=$(awk '{print $(NF-2) $(NF-1) $NF}' <<< "$uptime" | awk '{print $1 $2 $3}')
realave=$(awk -F, -v numcpus="$numcpus" '{print $1 / numcpus "," $2 / numcpus "," $3 / numcpus }' <<< "$loadave" )
echo "load average: $loadave"
echo "real average: $realave"
