#!/bin/bash

# loop to consume CPU resources
for x in {1..4}; do
  for i in {1..1000000}; do
    ((i * i))
    echo -n "$(date +%T) " >> /usr/tmp/eat_cpu.log 
    sleep 2
  done
done
# rm -f /usr/tmp/eat_cpu.log
