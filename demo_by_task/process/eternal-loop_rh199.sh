#!/bin/bash

count=0
while true; do
  ((count++))
  sleep 2
  echo -n "$count "
done  
