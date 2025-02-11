#!/bin/bash

for a in $(seq 100000);do 
  curl https://raw.githubusercontent.com/openethereum/wordlist/refs/heads/master/res/wordlist.txt &> /dev/null
done  
