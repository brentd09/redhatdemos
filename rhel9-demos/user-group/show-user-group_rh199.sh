
echo -n "id"
read -sp '' promptvar
echo ''
id
echo ''

useradd demouser

echo -n "id demouser"
read -sp '' promptvar
echo ''
id demouser
echo ''

echo -n "ls -ld ~demouser"
read -sp '' promptvar
echo ''
ls -ld ~demouser
echo ''


echo -n "ps -ef"
read -sp '' promptvar
echo ''
ps -ef
echo ''

echo -n "cat /etc/passwd"
read -sp '' promptvar
echo ''
cat /etc/passwd
echo ''


echo -n "cat /etc/group"
read -sp '' promptvar
echo ''
cat /etc/group
echo ''

echo -n "cat /etc/shadow"
read -sp '' promptvar
echo ''
cat /etc/shadow
echo ''


echo -n "getent passwd"
read -sp '' promptvar
echo ''
getent passwd
echo ''


echo -n "getent group"
read -sp '' promptvar
echo ''
getent group
echo ''
