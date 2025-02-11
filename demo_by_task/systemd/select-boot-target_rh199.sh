#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root'
  exit 1
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

echo 'List the four common boot targets'
echo -n "systemctl list-unit-files --type=target | grep -P '(graph|multi|emer|resc)' | awk '{print \$1}' | tr '\n' ' ' | awk '{\$2\"\n\"\$3\"\n\"\$4\"\n\"\$1\"\n\"}' "
read -sp '' promptvar
echo ''
systemctl list-unit-files --type=target | grep -P '(graph|multi|emer|resc)' | awk '{print $1}' | tr '\n' ' ' | awk '{$2" "$3" "$4" "$1" "}'  
echo ''
