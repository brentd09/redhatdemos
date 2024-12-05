#!/bin/bash

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then
  # Define the disk (e.g., /dev/sda)
  DISK="/dev/vdb"

  # Start parted and input commands automatically
  parted $DISK --script << EOF
  mklabel gpt               # Create a new GPT partition table
  mkpart primary ext4 1MiB 100MiB   # Create a primary partition
  mkpart primary ext4 100MiB 100%    # Create another primary partition
  quit                       # Exit parted
  EOF
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
