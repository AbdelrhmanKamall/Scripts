#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1> Hello from Apache !</h1>" | sudo tee /var/www/html/index.html

# Open HTTP port in firewall (optional, if using firewalld)
if systemctl is-active --quiet firewalld; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload
fi

echo "Apache installation complete. Visit the server's public IP to verify."
