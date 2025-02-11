#!/bin/bash
echo -n "timedatectl"
read -sp '' promptvar
echo ''
timedatectl
echo ''

echo -n "timedatectl list-timezones"
read -sp '' promptvar
echo ''
timedatectl list-timezones
echo ''

echo -n "timedatectl list-timezones | grep -i australia"
read -sp '' promptvar
echo ''
timedatectl list-timezones | grep -i australia
echo ''

echo -n "timedatectl set-timezone Australia/Brisbane"
read -sp '' promptvar
echo ''
timedatectl set-timezone Australia/Brisbane
echo ''

echo -n "timedatectl"
read -sp '' promptvar
echo ''
timedatectl
echo ''

echo -n "timedatectl set-ntp true"
read -sp '' promptvar
echo ''
timedatectl set-ntp true
echo ''

# chronyd time sync service
echo -n "vim /etc/chrony.conf"
read -sp '' promptvar
echo ''
vim /etc/chrony.conf
echo ''

echo -n "systemctl restart chronyd.service"
read -sp '' promptvar
echo ''
systemctl restart chronyd.service
echo ''

echo 'To force the ntp timesync'
echo -n "chronyc makestep"
read -sp '' promptvar
echo ''
chronyc makestep
echo ''

echo -n "chronyc sources -v"
read -sp '' promptvar
chronyc sources -v
echo ''
