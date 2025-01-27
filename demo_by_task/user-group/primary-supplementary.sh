mkdir -p ~/demo/devops-dir
chmod -R o=rwx ~/demo/
sudo -u devops touch ~/demo/devops-dir/demofile

ls -l ~/demo/devops-dir
