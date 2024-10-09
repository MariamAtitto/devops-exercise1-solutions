#!/bin/bash

# Install Nginx
sudo apt update
sudo apt install nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx


