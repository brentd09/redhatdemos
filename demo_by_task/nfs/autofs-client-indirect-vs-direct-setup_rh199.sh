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
echo '# Because these three exports are sub-directories of /srv on serverb '  >> /etc/auto.projects
echo '# the three lines could be replace with the following '  >> /etc/auto.projects
echo '# * -fstype=nfs,rw,nosuid,nodev serverb:/srv/&'  >> /etc/auto.projects
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

echo "ls project2"
read -sp '' promptvar
ls project2
echo ''

echo "tree /projects"
read -sp '' promptvar
tree /projects
echo ''

echo '------------- Direct Automount -------------------------'

echo '/- /etc/auto.project.direct' >> /etc/auto.master
echo "vi /etc/auto.master"
read -sp '' promptvar
vi /etc/auto.master
echo ''

echo '/directprojects/proj1 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project1' > /etc/auto.project.direct
echo '/directprojects/proj2 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project2' >> /etc/auto.project.direct
echo '/directprojects/proj3 -fstype=nfs,rw,nosuid,nodev serverb:/srv/project3' >> /etc/auto.project.direct

echo "vi /etc/auto.project.direct"
read -sp '' promptvar
vi /etc/auto.project.direct
echo ''

echo "mkdir -p /directprojects/"
read -sp '' promptvar
mkdir -p /directprojects/
echo ''

echo "systemctl restart autofs"
read -sp '' promptvar
systemctl restart autofs
echo ''

echo "cd /directprojects/"
read -sp '' promptvar
cd /directprojects/
echo ''

echo "ls"
read -sp '' promptvar
ls
echo ''

echo "cd proj1"
read -sp '' promptvar
cd proj1
echo ''

echo "ls"
read -sp '' promptvar
ls
echo ''

echo "touch file1"
read -sp '' promptvar
touch file1
echo ''


