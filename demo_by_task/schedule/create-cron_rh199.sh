#!/bin.bash

cat /etc/crontab
echo ''

echo Run a command at 1:30pm on Tuesday and Thursday
# Define the cron job
CRON_JOB="30 13 * * 2,4 sleep 10"
# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -

echo Run a command every minute stating at 3:00am until 3:59am 
# Define the cron job
CRON_JOB="*/1 3 * * * sleep 20"
# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -

echo Run a command every minute stating at 1:00am until 7:59am and then 9:00pm until 9:59pm  
# Define the cron job
CRON_JOB="*/1 1-7,21 * * * sleep 30"
# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -
