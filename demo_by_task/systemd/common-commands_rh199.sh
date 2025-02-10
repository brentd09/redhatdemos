#!/bin/bash
#
#me=$(whoami)
#if [[ $me != root ]];then
#   echo 'Usage: Must be run as root on serverb'
#fi
#
#this_machine=$(hostname)
#if [[ $this_machine != serverb ]];then
#  echo 'Usage: Must be run as root on serverb'
#  exit1
#fi

systemctl install -y httpd

systemctl list-units --type=service

# List regardless of activation state
systemctl list-units --type=service --all
systemctl
systemctl list-unit-filess --type=service 
systemctl status httpd
systemctl enable --now httpd
systemctl stop httpd
systemctl start httpd
systemctl restart httpd
systemctl reload httpd
# After configuring unit files and systemd configuration you need to run daemon-reload 
systemctl daemon-reload
systemctl is-active httpd
systemctl is-enabled httpd
systemctl  httpd




