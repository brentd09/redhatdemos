echo "mkdir -p /var/log/journal"
read -sp '' promptvar
mkdir -p /var/log/journal
echo ''

echo "vim /etc/systemd/journald.conf"
read -sp '' promptvar
vim /etc/systemd/journald.conf
echo ''

echo "less /etc/systemd/journald.conf"
read -sp '' promptvar
less /etc/systemd/journald.conf
echo ''

echo "systemctl restart systemd-journald"
read -sp '' promptvar
systemctl restart systemd-journald
echo ''

echo "ls /var/log/journal"
read -sp '' promptvar
ls /var/log/journal
echo ''

echo If the persistent logs are not automatically created
echo ''
echo "grep 'Storage=' /etc/systemd/journald.conf"
read -sp '' promptvar
grep 'Storage=' /etc/systemd/journald.conf
echo ''

echo "chown root:systemd-journal /var/log/journal/"
read -sp '' promptvar
chown root:systemd-journal /var/log/journal/
echo 'Should show and uncommented Storage=Persistent'
echo ''

echo "chmod 2775 /var/log/journal"
read -sp '' promptvar
chmod 2775 /var/log/journal
echo ''

echo "systemctl restart systemd-journald"
read -sp '' promptvar
systemctl restart systemd-journald
echo ''

echo "journalctl --flush"
read -sp '' promptvar
journalctl --flush
echo ''

echo "journalctl --verify"
read -sp '' promptvar
journalctl --verify
echo ''

echo "logger Testing the persistent journal"
read -sp '' promptvar
logger Testing the persistent journal
echo ''

echo "journalctl -n 10"
read -sp '' promptvar
journalctl -n 10
echo ''

echo "ls /var/log/journal"
read -sp '' promptvar
ls /var/log/journal
echo ''
