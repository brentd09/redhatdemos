#!/bin.bash

crontab -r

echo Set up three scheduled commands
echo ''
echo Run a command at 1:30pm on Tuesday and Thursday
# Define the cron job
CRON_JOB="30 13 * * 2,4 sleep 10"
# Add the cron job to the crontab
( crontab -l 2> /dev/null; echo "$CRON_JOB" ) | crontab -

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


echo  ''
echo  '.---------------- minute (0 - 59)'
echo  '|  .------------- hour (0 - 23)'
echo  '|  |  .---------- day of month (1 - 31)'
echo  '|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...'
echo  '|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat'
echo  '|  |  |  |  |'
echo  '*  *  *  *  * user-name command to be executed'
echo ''
crontab -l
