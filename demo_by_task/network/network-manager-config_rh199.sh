#!/bin/bash

DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv '\blo\b$' | awk '{print $2}' )
IPADDR=$(ip addr show $DEVICE | grep -P '\binet\b' | awk '{print $2}')
DEFGW=$(ip route | grep default | awk '{print $3}' )

NETOCT=$(echo $IPADDR | grep -Po '^(\d{1,3}\.){3}')
FTHOCT=$(echo $IPADDR | grep -Po '\d{1,3}\/' | sed 's/\///g')
NEWFTH=$(expr $FTHOCT + 10)
NTMASK=$(echo $IPADDR | grep -Po '\/\d{1,2}$')
NEXTIP=$(echo ${NETOCT}${NEWFTH}${NTMASK})

nmcli device show
nmcli device show $DEVICE 

