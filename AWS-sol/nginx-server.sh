#!/bin/bash

# Variables
VIDEO_LOCAL_PATH="C:/Users/lenovo/Downloads/Devops.mp4"
VIDEO_NAME="Devops.mp4"
PEM_KEY="C:/Users/lenovo/Documents/pem/Nginx-server.pem"
EC2_USER="ec2-user"
EC2_IP="18.184.230.110"
NGINX_HTML_DIR="/usr/share/nginx/html"

# SCP: Transfer the video file to the EC2 instance
scp -i "$PEM_KEY" "$VIDEO_LOCAL_PATH" "$EC2_USER@$EC2_IP:/tmp/"

# SSH into the EC2 instance to install Nginx and configure it
ssh -i "$PEM_KEY" "$EC2_USER@$EC2_IP" << EOF
  sudo yum update -y
  sudo yum install nginx -y
  sudo systemctl start nginx
  sudo systemctl enable nginx

  # Move the video to Nginx's HTML directory
  sudo mv /tmp/$VIDEO_NAME $NGINX_HTML_DIR/

  # Configure Nginx for video streaming
  sudo bash -c 'echo "types { video/mp4 mp4; }" > /etc/nginx/conf.d/video.conf'

  # Restart Nginx
  sudo systemctl restart nginx
EOF

