#!/bin/sh

ls -l /etc/NetworkManager/system-connections
nmcli conn add con-name demo2 ipv4.addresses 192.168.122.99 ipv4.dns 192.168.122.1 connection.interface-name  type ethernet 
