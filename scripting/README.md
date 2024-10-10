# Scripting vs Programming

- [Scripting vs Programming](#scripting-vs-programming)
  - [Scripting](#scripting)
  - [Programming](#programming)
  - [App script:](#app-script)
  

## Scripting
- **Complexity:** usually simpler
- **Purpose:** usually to automate simple or routine tasks
- **Execution:** usually by an interpreter
- **Development cycle:** usually shorter
- **Learning curve:** usually easier to learn

To run a python script you will need to run it on the command line and you need to start with `python` -> interpret. e.g. `python .\test_for_arg.py hello`:
* `\test_for_arg.py` -> sys.argv[0] (name of the python script)
* `hello` -> [1] (arguments from the user)
  
## Programming
- **Complexity:** usually more complex, often includes more complex logic, data structures, and algorithms
- **Purpose:** much wider purpose, including large applications and games
- **Execution:** either interpreted or needs to be compiled before being run
- **Development cycle:** usually longer and more involved in SDLC phases
- **Learning curve:** usually more involved to learn, including software design patterns
  
## App script:
``` bash
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
sudo apt install -y nginx
echo "nginx installed"

# nginx default configuration
echo "configure nginx"
sudo sed -i 's|try_files $uri $uri/_404;|    proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo "configured"

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
git clone https://github.com/PriyanSappal/tech264-sparta-app.git
echo "Cloned tech264-sparta-app"

echo "Change directory to app"
cd tech264-sparta-app
cd app
echo "In app directory"
export DB_HOST=mongodb://10.0.3.5:27017/posts


echo "Start using pm2"
pm2 start app.js --name "app"


echo "Setting up PM2 to auto-restart on system reboot..."
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u $USER --hp /home/$USER
pm2 save
echo "PM2 is configured to start on boot and auto-restart the app."
```

revised:
``` bash
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
sudo apt install -y nginx
echo "nginx installed"

# Modify Nginx configuration to set up reverse proxy
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' />
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
git clone https://github.com/PriyanSappal/tech264-sparta-app.git
echo "Cloned tech264-sparta-app"

echo "Change directory to app"
cd tech264-sparta-app
cd app
echo "In app directory"
export DB_HOST=mongodb://10.0.3.5:27017/posts


echo "Start using pm2"
pm2 start app.js --name "app"


echo "Setting up PM2 to auto-restart on system reboot..."
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u $USER --hp /home/$USER
pm2 save
echo "PM2 is configured to start on boot and auto-restart the app."
```


DB script:

``` bash 
#!/bin/bash

# Update the system package list
echo Updating package list...
sudo apt-get update -y
echo Done!

# Upgrade all installed packages to their latest versions
echo Upgrading installed packages...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!

# Install necessary dependencies
echo "Installing dependencies..."
sudo apt-get install -y gnupg curl
echo "Done!"

# Download and add MongoDB GPG key for package verification
echo "Adding MongoDB GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg --yes -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "Done!"

# Add MongoDB repository to the sources list
echo "Adding MongoDB repository to sources list..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "Done!"

# Update package list again to include the newly added MongoDB repository
echo "Updating package list with MongoDB repository..."
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
echo "Done!"

# Install MongoDB version 7.0.6 and specific associated packages non-interactively
echo "Installing MongoDB and related packages..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6
echo "Done!"

# Start MongoDB service immediately
echo "Starting MongoDB service..."
sudo systemctl start mongod
echo "Done!"
# Modify MongoDB configuration to allow remote connections
echo "Configuring MongoDB to allow remote connections..."
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
echo "Done!"

echo "Restarting MongoDB service..."
sudo systemctl restart mongod
echo "Done!"

# Enable MongoDB service to start on boot
echo "Enabling MongoDB service to start on boot..."
sudo systemctl enable mongod
echo "Done!"
```