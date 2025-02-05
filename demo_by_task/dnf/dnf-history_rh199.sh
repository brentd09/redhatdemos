echo "dnf install httpd"
read -sp '' promptvar
dnf install httpd
echo ''

echo "grep SUBDEBUG /var/log/def.rpm.log"
read -sp '' promptvar
grep SUBDEBUG /var/log/def.rpm.log
echo ''

echo "dnf history"
read -sp '' promptvar
dnf history
echo ''

echo "dnf history | grep 'install httpd'"
read -sp '' promptvar
dnf history | grep 'install httpd'
echo ''

echo "history_num=$(dnf history | grep 'install httpd' | awk '{print $1}')"
read -sp '' promptvar
history_num=$(dnf history | grep 'install httpd' | awk '{print $1}')
echo ''

echo "dnf history undo $history_num"
read -sp '' promptvar
dnf history undo $history_num
echo ''
