#!/bin/bash
#
#me=$(whoami)
#if [[ $me != root ]];then
#  echo 'Usage: Must be run as root on serverb'
#fi
#
#this_machine=$(hostname)
#if [[ $this_machine != servera ]];then
#  echo 'Usage: Must be run as root on servera'
#exit1
#fi

systemctl get-default
systemctl set-default graphical.target
systemctl set-default multi-user.target
systemctl isolate multi-user.target
cat /usr/lib/systemd/system/graphical.target
