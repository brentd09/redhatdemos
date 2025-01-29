#!/bin/bash

username=$(whoami)
if [[ $username != root ]]; then
  echo Usage: please login as root before running this script
  exit 1
fi

echo Create backup script
sudo echo sleep 1000 > /usr/bin/backup.sh
sudo chmod 755 /usr/bin/backup.sh

echo Create backup service unit file
sudo echo '[Unit]' > /etc/systemd/system/my_backup.service
sudo echo 'Description=Run my backup script' >> /etc/systemd/system/my_backup.service
sudo echo '' >> /etc/systemd/system/my_backup.service
sudo echo '[Service]' >> /etc/systemd/system/my_backup.service
sudo echo 'Type=oneshot' >> /etc/systemd/system/my_backup.service
sudo echo 'ExecStart=/usr/bin/backup.sh' >> /etc/systemd/system/my_backup.service

echo Create timer unit file
sudo echo '[Unit]' > /etc/systemd/system/my_backup.timer
sudo echo 'Description=Run My Backup Script Monthly' >> /etc/systemd/system/my_backup.timer
sudo echo '' >> /etc/systemd/system/my_backup.timer
sudo echo '[Timer]' >> /etc/systemd/system/my_backup.timer
sudo echo 'OnCalendar=*:0/2' >> /etc/systemd/system/my_backup.timer
sudo echo 'Persistent=true' >> /etc/systemd/system/my_backup.timer
sudo echo '' >> /etc/systemd/system/my_backup.timer
sudo echo '[Install]' >> /etc/systemd/system/my_backup.timer
sudo echo 'WantedBy=timers.target' >> /etc/systemd/system/my_backup.timer

echo Show backup script - /usr/bin/backup.sh
cat /usr/bin/backup.sh
read -sp '' promptvar
echo ''
echo Show backup service - /etc/systemd/system/my_backup.service
cat /etc/systemd/system/my_backup.service
read -sp '' promptvar
echo ''
echo Show backup timer - /etc/systemd/system/my_backup.timer
cat /etc/systemd/system/my_backup.timer
read -sp '' promptvar
echo ''
sudo systemctl daemon-reload

sudo systemctl enable --now my_backup.timer

sudo systemctl list-timers --all
