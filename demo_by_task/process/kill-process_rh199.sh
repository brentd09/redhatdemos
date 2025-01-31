#!/bin/bash

sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null

echo 'ps -ef | grep devops'
read -sp '' promptvar
ps -ef | grep '^devops'
echo ''

echo 'pgrep -u devops'
read -sp '' promptvar
pgrep -u devops
echo ''

echo 'pkill -SIGKILL -u devops'
read -sp '' promptvar
pkill -SIGKILL -u devops &> /dev/null
echo ''

echo 'pgrep -u devops'
read -sp '' promptvar
pgrep -u devops
echo ''
