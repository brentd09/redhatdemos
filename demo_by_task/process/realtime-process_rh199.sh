#!/bin/bash

echo Run a process as a real time priority
echo 'chrt -f 21 sleep 1000 &'
sudo chrt -f 21 sleep 1000 &

top $!
