#!/bin/bash
set -e

# Update system
sudo apt update -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install Nginx
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install MySQL client
sudo apt install -y mysql-client

# Create app directory
sudo mkdir -p /var/www/nova-tech
sudo chown -R ubuntu:ubuntu /var/www/nova-tech
