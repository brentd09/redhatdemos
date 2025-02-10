#!/bin/bash

DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv '\blo\b$')
IPADDR=$(ip addr show $DEVICE | grep inet | awk '{print $2}')
DEFGW=$(ip route | grep default | awk '{print $3}' )

nmcli device show
nmcli device show $DEVICE 

