#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
  exit 1
fi

this_machine=$(hostname)
if [[ $this_machine != servera ]];then
  echo 'Usage: Must be run as root on serverb'
  exit2
fi

echo -n  "dnf install -y nfs-utils"
read -sp '' promptvar
echo ''
dnf install -y nfs-utils
echo ''

echo -n "dnf install -y autofs"
read -sp '' promptvar
echo ''
dnf install -y autofs
echo ''


echo -n 'Edit the /etc/auto.master file to point to the indirect mount file'
read -sp '' promptvar
echo ''
echo '/projects /etc/auto.projects --timeout=60' > /etc/auto.master
vi /etc/auto.master

echo -n 'Edit the /etc/auto.projects file to include the indirect mounts'
read -sp '' promptvar
echo 'project1 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project1' > /etc/auto.projects
echo 'project2 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project2' >> /etc/auto.projects
echo 'project3 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project3' >> /etc/auto.projects
echo '# Because these three exports are sub-directories of /srv on serverb '  >> /etc/auto.projects
echo '# the three lines could be replace with the following '  >> /etc/auto.projects
echo '# * -fstype=nfs,rw,nosuid,nodev serverb:/srv/&'  >> /etc/auto.projects
echo ''
vi /etc/auto.projects

echo -n "mkdir /projects"
read -sp '' promptvar
echo ''
mkdir /projects
echo ''

echo -n "chmod 755 /projects/"
read -sp '' promptvar
echo ''
chmod 755 /projects/
echo ''

echo -n "systemctl restart autofs"
read -sp '' promptvar
echo ''
systemctl restart autofs
echo ''

echo -n "cd /projects"
read -sp '' promptvar
echo ''
cd /projects
echo ''

echo -n "ls"
read -sp '' promptvar
echo ''
ls
echo ''

echo -n "ls project1"
read -sp '' promptvar
echo ''
ls project1
echo ''

echo -n "ls project2"
read -sp '' promptvar
echo ''
ls project2
echo ''

echo -n "tree /projects"
read -sp '' promptvar
echo ''
tree /projects
echo ''

echo '------------- Direct Automount -------------------------'

echo  '/- /etc/auto.project.direct' >> /etc/auto.master
echo -n "vi /etc/auto.master"
read -sp '' promptvar
echo ''
vi /etc/auto.master
echo ''

echo '/directprojects/proj1 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project1' > /etc/auto.project.direct
echo '/directprojects/proj2 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project2' >> /etc/auto.project.direct
echo '/directprojects/proj3 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project3' >> /etc/auto.project.direct

echo -n "vi /etc/auto.project.direct"
read -sp '' promptvar
echo ''
vi /etc/auto.project.direct
echo ''

echo -n "mkdir -p /directprojects/"
read -sp '' promptvar
echo ''
mkdir -p /directprojects/
echo ''

echo -n "systemctl restart autofs"
read -sp '' promptvar
echo ''
systemctl restart autofs
echo ''

echo -n "cd /directprojects/"
read -sp '' promptvar
echo ''
cd /directprojects/
echo ''

echo -n "ls"
read -sp '' promptvar
echo ''
ls
echo ''

echo -n "cd proj1"
read -sp '' promptvar
echo ''
cd proj1
echo ''

echo -n "ls"
read -sp '' promptvar
echo ''
ls
echo ''

echo -n "touch file1"
read -sp '' promptvar
echo ''
touch file1
echo ''


