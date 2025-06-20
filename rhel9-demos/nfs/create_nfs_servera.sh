#!/bin/bash

# set up servera as an NFS server with two NFS shares
sudo -i
ssh servera systemctl enable --now nfs-server
ssh servera mkdir -p /new_projects/proj{1,2}
ssh servera chmod -R 775 /new_projects
ssh servera chown -R student:student /new_projects 
ssh servera 'echo "/new_projects/proj1 172.25.250.0/24(rw,sync)" >> /etc/exports.d/project_shares.exports'
ssh servera 'echo "/new_projects/proj2 172.25.250.0/24(rw,sync)" >> /etc/exports.d/project_shares.exports'
ssh servera exportfs -ra
ssh servera exportfs

dnf install -y autofs
systemctl enable --now autofs
echo 'my_projects    /etc/auto_projects_.autofs'
# not finished yet
