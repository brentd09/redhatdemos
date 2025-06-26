#!/bin/bash

# Create 3 directories in /shares
# Create 3 directories in /projects

mkdir -p /shares/public
mkdir -p /shares/it
mkdir -p /shares/admin
mkdir -p /projects/project1
mkdir -p /projects/project2
mkdir -p /projects/project3

# Create files in each NFS share with its own contents
echo 'PUBLIC'   > /shares/public/readme
echo 'IT'       > /shares/it/readme
echo 'ADMIN'    > /shares/admin/readme
echo 'PROJECT1' > /projects/project1/readme
echo 'PROJECT2' > /projects/project2/readme
echo 'PROJECT3' > /projects/project3/readme

chmod 1775 /shares/
chmod 1775 /shares/{it,admin}
chmod 1777 /shares/public
chmod 1775 /projects /projects/project{1..3}

chown :student /shares/
chown :student /shares/{it,admin}
chown :student /shares/public
chown :student /projects /projects/project{1..3}

sharefiles=$(find /shares -name readme)
projectfiles=$(find /projects -name readme)
for filename in $sharefiles; do
  chmod 664 $filename
  chown :student $filename
done
for filename in $projectfiles; do
  chmod 664 $filename
  chown :student $filename
done

dnf -y install nfs-utils

echo '/shares/public          172.25.250.0/24(rw)' > /etc/exports
echo '/shares/it              172.25.250.0/24(rw)' >> /etc/exports
echo '/shares/admin           172.25.250.0/24(rw)' >> /etc/exports
echo '/projects/project1      172.25.250.0/24(rw)' >> /etc/exports
echo '/projects/project2      172.25.250.0/24(rw)' >> /etc/exports
echo '/projects/project3      172.25.250.0/24(rw)' >> /etc/exports

systemctl enable --now nfs-server
exportfs -rav

# Configure firewall to allow nfs and mountd services
active_zone=$(firewall-cmd --get-active-zones | grep -B 1 interfaces | head -n 1 )
for svc in nfs mountd; do
  firewall-cmd  --zone=$active_zone --add-service=$svc
done  
firewall-cmd --runtime-to-permanent
