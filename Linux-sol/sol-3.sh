#!/bin/bash

# Install Nginx
sudo apt update
sudo apt install nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Edit Nginx unit file to log the start time
sudo vim /lib/systemd/system/nginx.service

# Reload systemd configuration and restart Nginx
sudo systemctl daemon-reload
sudo systemctl restart nginx

# Step 5: Extract HTTP status code 200 from logs
curl -I http://localhost
cat /var/log/nginx/access.log | grep ' 200 '


