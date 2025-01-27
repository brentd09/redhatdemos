echo In the /etc/sudoers file we see different configurations
echo This is wha the configuration means
echo ''
echo User assignment
echo user1     ALL=(ALL:ALL) ALL
echo ''
echo Group assignment
echo %group1   ALL=(ALL:ALL) ALL
echo ''
echo Explaining configuration
echo ALL            =    ( ALL            : ALL              )  ALL
echo which hosts           Run as user      Run as group        Which commands are allowed to be run as sudo  
