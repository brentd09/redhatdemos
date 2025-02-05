# Using journalctl on a Red Hat Enterprise Linux (RHEL) 9 system can be very beneficial for system administrators and users for various reasons. Here are some real-world examples of scenarios where journalctl is helpful:
echo Troubleshooting Service Failures:
echo If a service fails to start or crashes
echo "journalctl -u sshd.service"
read -sp '' promptvar
journalctl -u sshd.service
echo ''

# Analyzing System Boot Issues:
echo After a system reboot, if you suspect there were issues during boot
echo "journalctl -b"
read -sp '' promptvar
journalctl -b
echo ''

echo Reviewing User Activities:
echo "journalctl _UID=1000"
read -sp '' promptvar
journalctl _UID=1000
echo ''

echo Identifying Network Issues:
echo "journalctl -t NetworkManager"
read -sp '' promptvar
journalctl -t NetworkManager
echo ''

echo Tracking Events by Severity:
echo Options are emerg,alert,crit,err,warning,notice,info,debug
echo "journalctl -p err"
read -sp '' promptvar
journalctl -p err
echo ''

curr_date=$(date "+%Y-%m-%d %H:%M:%S")
date_hour_prior=$(date -d "1 hour ago" "+%Y-%m-%d %H:%M:%S")

echo Filtering by Time Period:
echo "journalctl --since \'$date_hour_prior\' --until \'$curr_date\'"
read -sp '' promptvar
journalctl --since \'$date_hour_prior\' --until \'$curr_date\'
echo ''

echo Debugging Application Issues:
# If a custom application generates log information
echo "journalctl -t sshd"
read -sp '' promptvar
journalctl -t sshd
echo ''

echo Checking for Kernel Messages:
# Helpful in diagnosing hardware failures or kernel-related problems.
echo "journalctl -k"
read -sp '' promptvar
journalctl -k
echo ''

echo 'Monitoring (Following) Logs in Real-time:'
echo "journalctl -f"
read -sp '' promptvar
journalctl -f
echo ''
