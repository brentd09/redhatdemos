#!/bin.bash

cat /etc/crontab
echo ''

echo Run a command at 1:30pm on Tuesday and Thursday
# Define the cron job
CRON_JOB="30 13 * * 2,4 sleep 10"

# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -
