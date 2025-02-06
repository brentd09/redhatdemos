#!/bin/bash
#
#me=$(whoami)
#if [[ $me != root ]];then
#  echo 'Usage: Must be run as root on serverb'
#fi
#
#this_machine=$(hostname)
#if [[ $this_machine != servera ]];then
#  echo 'Usage: Must be run as root on serverb'
#  exit1
#fi


dnf install -y nfs-utils

dnf install -y autofs
echo '/projects /etc/auato.projects --timeout=60' > /etc/auto.master
echo 'project1 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project1'  >  /etc/auto.projects
echo 'project2 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project2'  >> /etc/auto.projects
echo 'project3 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project3'  >> /etc/auto.projects
mkdir /projects
chmod 755 /projects/
systemctl restart autofs
