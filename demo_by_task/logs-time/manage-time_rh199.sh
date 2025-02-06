#!/bin/bash
echo "timedatectl"
read -sp '' promptvar
timedatectl
echo ''

echo "timedatectl --list-timezones"
read -sp '' promptvar
timedatectl --list-timezones
echo ''

echo "timedatectl --list-timezones | grep -i australia"
read -sp '' promptvar
timedatectl --list-timezones | grep -i australia
echo ''

echo "timedatectl set-timezone Australia/Brisbane"
read -sp '' promptvar
timedatectl set-timezone Australia/Brisbane
echo ''

echo "timedatectl"
read -sp '' promptvar
timedatectl
echo ''

echo "timedatectl set-ntp true"
read -sp '' promptvar
timedatectl set-ntp true
echo ''

# chronyd time sync service
echo "vim /etc/chrony.conf"
read -sp '' promptvar
vim /etc/chrony.conf
echo ''

echo "systemctl restart chronyd.service"
read -sp '' promptvar
systemctl restart chronyd.service
echo ''

echo To force the ntp timesync
echo "chronyc makestep"
read -sp '' promptvar
chronyc makestep
echo ''

echo "chronyc sources -v"
read -sp '' promptvar
chronyc sources -v
echo ''
