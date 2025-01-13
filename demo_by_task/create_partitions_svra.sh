#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then
  # Define the disk (e.g., /dev/sda)
  DISK="/dev/vdb"

  # Start parted and input commands automatically
  #!/bin/bash
  # Automate partitioning of using parted
  # Create a GPT partition table
  parted $DISK --script mklabel gpt
  # Create the first partition of 500 MB
  parted $DISK --script mkpart primary ext4 0% 500MB
  # Create the second partition with the remaining space
  parted $DISK --script mkpart primary ext4 500MB 100%
  # Print the partition table to verify
  parted $DISK --script print
  echo "Partitions created on $DISK."
  mkfs.ext4 ${DISK}1
  mkfs.ext4 ${DISK}2
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
