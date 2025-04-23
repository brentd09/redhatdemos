#!/bin/bash

echo This command will show the ProcessID, ParentPID, Nice, Priority, Realtime Priority and the command name
echo ps -eo PID,PPID,NI,PRI,RTPRIO,CMD
ps -eo PID,PPID,NI,PRI,RTPRIO,CMD
