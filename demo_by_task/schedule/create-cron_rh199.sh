#!/bin.bash

echo crontab files are in this format
echo Minutes Hours Day-of-Month Month Day-of-Week Command
echo ------- ----- ------------ ----- ----------- -------
echo ''

echo Run a command at 1:30pm on Tuesday and Thursday
# Define the cron job
CRON_JOB="30 13 * * 2,4 sleep 10"

# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -
