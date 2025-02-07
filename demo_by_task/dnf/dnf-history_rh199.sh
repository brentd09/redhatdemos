echo -n "dnf install httpd"
read -sp '' promptvar
echo ''
dnf install httpd
echo ''

echo -n "grep SUBDEBUG /var/log/def.rpm.log"
read -sp '' promptvar
echo ''
grep SUBDEBUG /var/log/def.rpm.log
echo ''

echo -n "dnf history"
read -sp '' promptvar
echo ''
dnf history
echo ''

echo -n "dnf history | grep 'install httpd'"
read -sp '' promptvar
echo ''
dnf history | grep 'install httpd'
echo ''

echo -n "history_num=$(dnf history | grep 'install httpd' | awk '{print $1}')"
read -sp '' promptvar
echo ''
history_num=$(dnf history | grep 'install httpd' | awk '{print $1}')
echo ''

echo -n "dnf history undo $history_num"
read -sp '' promptvar
echo ''
dnf history undo $history_num
echo ''
