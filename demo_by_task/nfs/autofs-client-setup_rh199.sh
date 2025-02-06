#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
fi

this_machine=$(hostname)
if [[ $this_machine != servera ]];then
  echo 'Usage: Must be run as root on serverb'
  exit1
fi

echo "dnf install -y nfs-utils"
read -sp '' promptvar
dnf install -y nfs-utils
echo ''

echo "dnf install -y autofs"
read -sp '' promptvar
dnf install -y autofs
echo ''


echo 'Edit the /etc/auto.master file to point to the indirect mount file'
read -sp '' promptvar
echo '/projects /etc/auto.projects --timeout=60' > /etc/auto.master
vi /etc/auto.master

echo 'Edit the /etc/auto.projects file to include the indirect mounts'
read -sp '' promptvar
echo 'project1 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project1' > /etc/auto.projects
echo 'project2 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project2' >> /etc/auto.projects
echo 'project3 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project3' >> /etc/auto.projects
vi /etc/auto.projects

echo "mkdir /projects"
read -sp '' promptvar
mkdir /projects
echo ''

echo "chmod 755 /projects/"
read -sp '' promptvar
chmod 755 /projects/
echo ''

echo "systemctl restart autofs"
read -sp '' promptvar
systemctl restart autofs
echo ''

echo "cd /projects"
read -sp '' promptvar
cd /projects
echo ''

echo "ls"
read -sp '' promptvar
ls
echo ''

echo "ls project1"
read -sp '' promptvar
ls project1
echo ''





[root@rhelhost nfs]# 

