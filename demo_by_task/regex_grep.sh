#!/bin/bash

if [[ ! -f ./linux_benefits.txt ]];then 
  echo "Usage: Move to the directory that contains the linux_benefits.txt file"
  exit 1
fi

echo -e "\e[31mgrep re. ./linux_benefits.txt\e[0m"
echo -e "\e[31m-----------------------------\e[0m"
grep --color=auto re. ./linux_benefits.txt
echo ''
echo -e "\e[31mgrep re\. ./linux_benefits.txt\e[0m"
echo -e "\e[31m-----------------------------\e[0m"
grep --color=auto re\. ./linux_benefits.txt
echo ''
echo -e "\e[31mgrep 're\.' ./linux_benefits.txt\e[0m"
echo -e "\e[31m-----------------------------\e[0m"
grep --color=auto 're\.' ./linux_benefits.txt

echo -e "\e[31mThis text is red!\e[0m"
