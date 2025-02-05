#!/bin/bash

dnf list --installed
dnf list --available
dnf info zip
dnf provides zip
# Search for a keyword 
dnf search zip
dnf update
# List the files installed with from this rpm
dnf repoquery zip --list
dnf repoquery zip --location
