#!/bin/bash

THIS_MACHINE=$(hostname)

hostname
hostname -I
hostnamectl hostname host.example.com
hostnamectl status
cat /etc/hosts
cat resolv.conf
dig serverb


hostnamectl hostname $THIS_MACHINE


