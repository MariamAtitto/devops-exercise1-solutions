#!/bin/bash

# This will display the IP address of all network interfaces
ip addr show

# This will update /etc/resolv.conf to use 1.1.1.1 as the DNS server
sudo bash -c 'echo "nameserver 1.1.1.1" > /etc/resolv.conf'

# The ping command sends ICMP echo requests to www.google.com
ping www.google.com

# The traceroute command shows the path that packets take to www.google.com
traceroute www.google.com

 #Allowing only incoming HTTP, HTTPS, and SSH traffic using UFW...
sudo ufw allow http
sudo ufw allow https
sudo ufw allow ssh
sudo ufw enable
sudo ufw status

echo "Network configuration and troubleshooting completed."