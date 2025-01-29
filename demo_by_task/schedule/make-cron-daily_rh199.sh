#!/bin/bash

echo Create a script in /etc/cron.daily/log-datetime.sh
sudo echo '#!/bin/bash' > /etc/cron.daily/log-datetime.sh
sudo echo '' >> /etc/cron.daily/log-datetime.sh
sudo echo 'for a in 1 2 3 4 5; do' >> /etc/cron.daily/log-datetime.sh
sudo echo '  date >> /usr/tmp/my_date.log' >> /etc/cron.daily/log-datetime.sh
sudo echo '  sleep 2' >> /etc/cron.daily/log-datetime.sh
sudo echo 'done' >> /etc/cron.daily/log-datetime.sh

chmod 777 /etc/cron.daily/log-datetime.sh

echo Forcing anacron to run now
anacron -fnd
