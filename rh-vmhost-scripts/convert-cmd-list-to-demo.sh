#!/bin/bash

if [[ -f $1 ]];then 
  cat $1 | grep -v ^$ | while read line;do
    if [[ $line =~ \# ]];then 
      echo $line
      continue
    fi    
    if [[ $line =~ ^echo ]];then 
      echo $line
      continue
    fi        
    echo "echo -n \"$line\""
    echo "read -sp '' promptvar"
    echo "echo ''"
    echo $line
    echo "echo ''"
    echo ''
  done  
else 
  echo "Usage: $0 <filename>"
  exit 1
fi
