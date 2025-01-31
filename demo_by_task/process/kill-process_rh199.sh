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
