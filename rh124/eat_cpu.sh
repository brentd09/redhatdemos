#!/bin/bash

# loop to consume CPU resources
for x in {1..10}; do
  for i in {1..1000000}; do
    ((i * i))
    echo "$(date +%T) " >> /usr/tmp/eat_cpu.log 
  done
done
# rm -f /usr/tmp/eat_cpu.log
