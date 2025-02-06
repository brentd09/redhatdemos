mkdir -p /var/log/journal
echo Edit the /etc/systemd/journald.conf file to set the log to be Persistent
sed -i "/s/Storage=.\+/Storage=persistent/g" /etc/systemd/journald.conf
less /etc/systemd/journald.conf
systemctl restart systemd-journald
