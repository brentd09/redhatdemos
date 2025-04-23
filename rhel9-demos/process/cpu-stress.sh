#!/bin/bash

start_time=$(date +%s)
if [[ $1 =~ ^[0-9]+$ ]]; then
  maxloops=$1
else
  maxloops=50	
fi	
count=1
echo "Starting the $maxloops CPU Stress loops - Press Ctrl-C to stop"
while [[ $count -le $maxloops ]]; do
  echo Loop $count
  a=0
  b=1
  for ((i = 0; i < 1000000; i++)); do
    fn=$((a + b))
    a=$b
    b=$fn
  done
  count=$((count + 1))
done
end_time=$(date +%s)
total_time=$(( $end_time - $start_time ))
echo "Time to complete loops in Sec. $total_time"
