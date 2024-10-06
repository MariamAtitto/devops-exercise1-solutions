#!/bin/bash


# Create the devops group
sudo groupadd devops

# Create devops_user and add to the devops group
sudo useradd -m -G devops devops_user

# Set password for devops_user
sudo passwd devops_user

# Force password change on first login
sudo chage -d 0 devops_user

# Add devops_user to sudo group for superuser privileges
sudo usermod -aG sudo devops_user

# Create intern_user and add to the devops group
sudo useradd -m -G devops intern_user

# Set password for intern_user
sudo passwd intern_user

# Verify both users are in the devops group
getent group devops
