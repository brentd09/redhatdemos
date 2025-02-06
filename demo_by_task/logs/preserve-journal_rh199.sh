echo "mkdir -p /var/log/journal"
read -sp '' promptvar
mkdir -p /var/log/journal
echo ''

echo Edit the /etc/systemd/journald.conf file to set the log to be Persistent
echo "sed -i "s/.\*Storage=.+/Storage=persistent/g" /etc/systemd/journald.conf"
read -sp '' promptvar
sed -i "s/.\*Storage=.+/Storage=persistent/g" /etc/systemd/journald.conf
echo ''

echo "less /etc/systemd/journald.conf"
read -sp '' promptvar
less /etc/systemd/journald.conf
echo ''

echo "systemctl restart systemd-journald"
read -sp '' promptvar
systemctl restart systemd-journald
echo ''
