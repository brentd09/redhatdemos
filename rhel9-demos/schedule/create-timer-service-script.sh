#!/bin/bash

echo '#!/bin/bash' >  /usr/local/bin/log-time.sh
echo 'echo "Current time: $(date)" >> /tmp/systemd-timer-demo.log' >>  /usr/local/bin/log-time.sh 

chmod +x /usr/local/bin/log-time.sh


echo '[Unit]' > /etc/systemd/system/log-time.service
echo 'Description=Log current time to a file' >> /etc/systemd/system/log-time.service
echo '' >> /etc/systemd/system/log-time.service
echo '[Service]' >> /etc/systemd/system/log-time.service
echo 'Type=oneshot' >> /etc/systemd/system/log-time.service
echo 'ExecStart=/usr/local/bin/log-time.sh' >> /etc/systemd/system/log-time.service



echo '[Unit]' > /etc/systemd/system/log-time.timer
echo 'Description=Run log-time.service every minute' >> /etc/systemd/system/log-time.timer
echo '' >> /etc/systemd/system/log-time.timer
echo '[Timer]' >> /etc/systemd/system/log-time.timer
echo 'OnBootSec=1min' >> /etc/systemd/system/log-time.timer
echo 'OnUnitActiveSec=1min' >> /etc/systemd/system/log-time.timer
echo 'Unit=log-time.service' >> /etc/systemd/system/log-time.timer
echo '' >> /etc/systemd/system/log-time.timer
echo '[Install]' >> /etc/systemd/system/log-time.timer
echo 'WantedBy=timers.target' >> /etc/systemd/system/log-time.timer

systemctl daemon-reexec
systemctl daemon-reload
systemctl enable --now log-time.timer

tail /tmp/systemd-timer-demo.log
