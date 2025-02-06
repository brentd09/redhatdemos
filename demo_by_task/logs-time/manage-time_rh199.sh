#!/bin/bash

timedatectl
timedatectl --list-timezones
timedatectl --list-timezones | grep -i australia
timedatectl set-timezone Australia/Brisbane
timedatectl
timedatectl set-ntp true

# chronyd time sync service
vim /etc/chrony.conf
systemctl restart chronyd.service
# force an ntp timesync
chronyc makestep
chronyc sources -v
