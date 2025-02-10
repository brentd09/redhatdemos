#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root'
fi

echo -n "systemctl get-default"
read -sp '' promptvar
echo ''
systemctl get-default
echo ''

echo -n "systemctl set-default multi-user.target"
read -sp '' promptvar
echo ''
systemctl set-default multi-user.target
echo ''

echo -n "systemctl set-default graphical.target"
read -sp '' promptvar
echo ''
systemctl set-default graphical.target
echo ''

echo -n "cat /usr/lib/systemd/system/graphical.target"
read -sp '' promptvar
echo ''
cat /usr/lib/systemd/system/graphical.target
echo ''

echo -n "systemctl isolate multi-user.target"
read -sp '' promptvar
echo ''
systemctl isolate multi-user.target
echo ''
