#!/bin/bash

# loop to consume CPU resources
for x in {1..2}; do
  for i in {1..1000000}; do
    ((i * i))
    echo -n "$(date +%T) " >> /usr/tmp/eat_cpu.log 
    if [[ ! -z $1 ]]; then 
      if $(expr $1 + 0) &> /dev/null; then 
        sleep $1
      fi
    fi
  done
done
# rm -f /usr/tmp/eat_cpu.log
