#!/bin/bash

me=$(whoami)
if [[ $me != 'root' ]]; then
  echo 'Usage: This script must be run as root'
  exit 1
fi

echo Run a process as a real time priority
echo 'chrt -f 21 sleep 1000 &'
chrt -f 21 sleep 1000 &

top $!
