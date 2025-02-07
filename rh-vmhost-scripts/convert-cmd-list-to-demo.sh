#!/bin/bash

if [[ -f $1 ]];then 
  echo \#!/bin/bash
  echo ''
  echo 'me=$(whoami)'
  echo ''
  echo 'if [[ $me != root ]];then'
  echo '  echo \'Usage: Must be run as root on serverb\''
  echo '  exit 1'
  echo 'fi'
  echo ''
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
    echo ''
    echo $line
    echo "echo ''"
    echo ''
  done  
else 
  echo "Usage: $0 <filename>"
  exit 1
fi
