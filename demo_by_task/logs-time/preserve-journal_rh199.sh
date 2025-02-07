#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi 

echo -n "mkdir -p /var/log/journal"
read -sp '' promptvar
echo ''
mkdir -p /var/log/journal
echo ''

echo -n "vim /etc/systemd/journald.conf"
read -sp '' promptvar
echo ''
vim /etc/systemd/journald.conf
echo ''

echo -n "less /etc/systemd/journald.conf"
read -sp '' promptvar
echo ''
less /etc/systemd/journald.conf
echo ''

echo -n "systemctl restart systemd-journald"
read -sp '' promptvar
echo ''
systemctl restart systemd-journald
echo ''

echo -n "ls /var/log/journal"
read -sp '' promptvar
echo ''
ls /var/log/journal
echo ''

echo If the persistent logs are not automatically created
echo ''
echo -n "grep 'Storage=' /etc/systemd/journald.conf"
read -sp '' promptvar
echo ''
grep 'Storage=' /etc/systemd/journald.conf
echo ''

echo -n "chown root:systemd-journal /var/log/journal/"
read -sp '' promptvar
echo ''
chown root:systemd-journal /var/log/journal/
echo 'Should show and uncommented Storage=Persistent'
echo ''

echo -n "chmod 2775 /var/log/journal"
read -sp '' promptvar
echo ''
chmod 2775 /var/log/journal
echo ''

echo -n "systemctl restart systemd-journald"
read -sp '' promptvar
echo ''
systemctl restart systemd-journald
echo ''

echo -n "journalctl --flush"
read -sp '' promptvar
echo ''
journalctl --flush
echo ''

echo -n "journalctl --verify"
read -sp '' promptvar
echo ''
journalctl --verify
echo ''

echo -n "logger Testing the persistent journal"
read -sp '' promptvar
echo ''
logger Testing the persistent journal
echo ''

echo -n "journalctl -n 10"
read -sp '' promptvar
echo ''
journalctl -n 10
echo ''

echo -n "ls /var/log/journal"
read -sp '' promptvar
echo ''
ls /var/log/journal
echo ''
