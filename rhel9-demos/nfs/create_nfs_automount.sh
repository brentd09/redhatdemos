#!/bin/bash

# set up servera as an NFS server with two NFS shares
sudo -i
ssh servera firewall-cmd --zone=public --add-service=mountd
ssh servera firewall-cmd --zone=public --add-service=nfs
ssh servera firewall-cmd --runtime-to-permanent
ssh servera systemctl enable --now nfs-server
ssh servera mkdir -p /new_projects/proj{1,2}
ssh servera chmod -R 775 /new_projects
ssh servera chown -R student:student /new_projects 
ssh servera 'echo "/new_projects/proj1 172.25.250.0/24(rw,sync)" >> /etc/exports.d/project_shares.exports'
ssh servera 'echo "/new_projects/proj2 172.25.250.0/24(rw,sync)" >> /etc/exports.d/project_shares.exports'
ssh servera exportfs -ra
ssh servera exportfs

# setup the nfs client to do indirect wildcard
dnf install -y autofs
systemctl enable autofs
echo 'my_projects    /etc/auto_projects_.autofs' > /etc/auto.master.d/auto_master_projects.autofs
echo '*    -fstype=nfs,rw    servera:/new_projects/&' > /etc/auto_projects_.autofs
systemctl start autofs
