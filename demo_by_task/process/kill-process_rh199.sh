#!/bin/bash

sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null
sudo -u devops sleep 10000 & &> /dev/null

echo 'ps -ef | grep devops'

ps -ef | grep devops
