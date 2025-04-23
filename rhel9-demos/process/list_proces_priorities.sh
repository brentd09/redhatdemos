#!/bin/bash

echo This command will show the ProcessID, ParentPID, Nice, Priority, Realtime Priority and the command name
echo ps -eo pid,ppid,ni,pri,rtprio,cmd
ps -eo pid,ppid,ni,pri,rtprio,cmd
