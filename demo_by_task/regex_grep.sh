#!/bin/bash

if [[ ! -f ./linux_benefits.txt ]];then 
  echo "Usage: Move to the directory that contains the linux_benefits.txt file"
  exit 1
fi

echo 'grep re. ./linux_benefits.txt'
echo '-----------------------------'
grep --color=auto re. ./linux_benefits.txt
echo ''
echo 'grep re\. ./linux_benefits.txt'
echo '-----------------------------'
grep --color=auto re\. ./linux_benefits.txt
echo ''
echo 'grep 're\.' ./linux_benefits.txt'
echo '-----------------------------'
grep --color=auto 're\.' ./linux_benefits.txt

