sudo mkdir -p /demo/devops-dir
sudo chmod -R o=rwx /demo/ 

echo touch /demo/devops-dir/demofile
sudo -u devops touch /demo/devops-dir/demofile

echo ls -ld /demo/devops-dir
ls -ld /demo/devops-dir

echo ls -l /demo/devops-dir
ls -l /demo/devops-dir
