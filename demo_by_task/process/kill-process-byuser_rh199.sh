#!/bin/bash

echo 'Starting a series of processes as the devops user'
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
echo ''

echo -n 'ps -ef | grep devops'
read -sp '' promptvar
echo ''
ps -ef | grep '^devops'
echo ''

echo -n 'pgrep -u devops'
read -sp '' promptvar
echo ''
pgrep -u devops
echo ''

echo -n 'pkill -SIGKILL -u devops'
read -sp '' promptvar
echo ''
pkill -SIGKILL -u devops &> /dev/null
wait
echo ''

echo -n 'pgrep -u devops'
read -sp '' promptvar
echo ''
pgrep -u devops
echo ''
