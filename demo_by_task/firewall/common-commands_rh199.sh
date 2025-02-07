# Check the Status of firewalld:
sudo systemctl status firewalld

# Start/Stop/Restart firewalld:
sudo systemctl start firewalld
sudo systemctl stop firewalld
sudo systemctl restart firewalld

# Get Active Zones:
sudo firewall-cmd --get-active-zones

# Get Default Zone:
sudo firewall-cmd --get-default-zone

# List All Zones:
sudo firewall-cmd --get-zones

# List All Rules in a Specific Zone:
sudo firewall-cmd --zone=public --list-all

# Change the Zone of an Interface:
sudo firewall-cmd --zone=public --change-interface=eth0

# Set Default Zone:
sudo firewall-cmd --set-default-zone=public

# Add a Service to a Zone:
sudo firewall-cmd --zone=public --add-service=http

# Remove a Service from a Zone:
sudo firewall-cmd --zone=public --remove-service=http

# Add a Port to a Zone:
sudo firewall-cmd --zone=public --add-port=389/tcp

# Remove a Port from a Zone:
sudo firewall-cmd --zone=public --add-port=389/tcp

# Make Rules Permanent:
sudo firewall-cmd --zone=public --remove-service=http --permanent

# Reload Firewall Rules:
sudo firewall-cmd --reload

# Add Rich Rules:
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'

# List All Rich Rules:
sudo firewall-cmd --zone=public --list-rich-rules

# Remove a Rich Rule:
sudo firewall-cmd --zone=public --remove-rich-rule='your_rule_here'

# Check Firewall Logs:
sudo journalctl -f

# Enable Logging for a Zone:
sudo firewall-cmd --zone=public --add-rich-rule='rule logging prefix="Firewall: " level="info" accept'
