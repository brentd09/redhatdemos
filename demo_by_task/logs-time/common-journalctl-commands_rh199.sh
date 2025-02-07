# Using journalctl on a Red Hat Enterprise Linux (RHEL) 9 system can be very beneficial for system administrators and users for various reasons. Here are some real-world examples of scenarios where journalctl is helpful:
echo Troubleshooting Service Failures:
echo If a service fails to start or crashes
echo -n "journalctl -u sshd.service"
read -sp '' promptvar
echo ''
journalctl -u sshd.service
echo ''

# Analyzing System Boot Issues:
echo After a system reboot, if you suspect there were issues during boot
echo -n "journalctl -b"
read -sp '' promptvar
echo ''
journalctl -b
echo ''

echo Reviewing User Activities:
echo -n "journalctl _UID=1000"
read -sp '' promptvar
journalctl _UID=1000
echo ''

echo Identifying Network Issues:
echo -n "journalctl -t NetworkManager"
read -sp '' promptvar
echo ''
journalctl -t NetworkManager
echo ''

echo Tracking Events by Severity:
echo Options are emerg,alert,crit,err,warning,notice,info,debug
echo -n "journalctl -p err"
read -sp '' promptvar
echo ''
journalctl -p err
echo ''

curr_date=$(date "+%Y-%m-%d")
yesterday=$(date -d "1 day ago" "+%Y-%m-%d")

echo Filtering by Time Period:
echo -n "journalctl --since $yesterday --until $curr_date "
read -sp '' promptvar
echo ''
journalctl --since  $yesterday  --until  $curr_date 
echo ''

echo Debugging Application Issues:
# If a custom application generates log information
echo -n "journalctl -t sshd"
read -sp '' promptvar
echo ''
journalctl -t sshd
echo ''

echo Checking for Kernel Messages:
# Helpful in diagnosing hardware failures or kernel-related problems.
echo -n "journalctl -k"
read -sp '' promptvar
echo ''
journalctl -k
echo ''

echo 'Monitoring (Following) Logs in Real-time:'
echo -n "journalctl -f"
read -sp '' promptvar
echo ''
journalctl -f
echo ''
