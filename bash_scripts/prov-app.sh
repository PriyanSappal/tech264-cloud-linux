#!/bin/bash


# Check for updates
echo "update sources list..."
sudo apt update -y
echo "update complete"

# Upgrades those checks
echo "upgrade any packages available..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "upgrade complete"

# Install nginx
sudo DEBIAN_FRONTEND=noninteractive apt install -y nginx
echo "nginx installed"

# Modify Nginx configuration to set up reverse proxy
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo "Nginx reverse proxy configuration updated"

# Restart Nginx
sudo systemctl restart nginx
echo "Nginx restarted with reverse proxy"

echo "install nodejs v20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

echo "check nodejs version..."
node -v
echo "nodejs v20 installed"

# Install PM2 globally
echo "Installing PM2 globally..."
sudo npm install -g pm2
echo "PM2 installed."

# Cloning Git repo
echo "Clone Git folder"
git clone https://github.com/PriyanSappal/tech264-sparta-app.git repo
echo "Cloned tech264-sparta-app"

echo "Change directory to app"
cd repo/app
echo "In app directory"
export DB_HOST="mongodb://10.0.3.4:27017/posts"

# Stop any existing pm2 processes
echo stopping any running pm2 processes...
pm2 stop all

echo "install and run"
npm install
echo npm "install done"

echo starting the app with pm2...
pm2 start app.js
echo app started!