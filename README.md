# Cloud Computing and Linux
- [Cloud Computing and Linux](#cloud-computing-and-linux)
  - [1. How do we know if something is in the cloud?](#1-how-do-we-know-if-something-is-in-the-cloud)
  - [2. Differences between On-Prem and the Cloud?](#2-differences-between-on-prem-and-the-cloud)
  - [3. The 4 Deployment Models of Cloud:](#3-the-4-deployment-models-of-cloud)
  - [4. Types of Cloud Services:](#4-types-of-cloud-services)
  - [5. Advantages/Disadvantages of the Cloud for Businesses:](#5-advantagesdisadvantages-of-the-cloud-for-businesses)
    - [Advantages:](#advantages)
    - [Disadvantages:](#disadvantages)
  - [6. Difference Between OpEx vs CapEx:](#6-difference-between-opex-vs-capex)
  - [7. Is migrating to the cloud always cheaper?](#7-is-migrating-to-the-cloud-always-cheaper)
  - [8. Market Share - Cloud:](#8-market-share---cloud)
  - [9. What are the 3 largest Cloud providers known for?](#9-what-are-the-3-largest-cloud-providers-known-for)
  - [10. Which cloud provider might be the best? Why?](#10-which-cloud-provider-might-be-the-best-why)
  - [11. What do you usually pay for in the cloud?](#11-what-do-you-usually-pay-for-in-the-cloud)
  - [12. What are the 4 Pillars of DevOps, and how do they link into the Cloud?](#12-what-are-the-4-pillars-of-devops-and-how-do-they-link-into-the-cloud)
- [Linux](#linux)
  - [**Commands:**](#commands)
  - [What is Linux?](#what-is-linux)
  - [Task 1: Linux - Research managing file ownership with Linux](#task-1-linux---research-managing-file-ownership-with-linux)
  - [Task 2: Research Managing File Permissions](#task-2-research-managing-file-permissions)
  - [Task 3: Numeric Values Assigned to File Permissions](#task-3-numeric-values-assigned-to-file-permissions)
    - [What numeric values are assigned to each permission?](#what-numeric-values-are-assigned-to-each-permission)
    - [What value would assign read + write permissions?](#what-value-would-assign-read--write-permissions)
    - [What value would assign read, write, and execute permissions?](#what-value-would-assign-read-write-and-execute-permissions)
    - [What value would assign read and execute permissions?](#what-value-would-assign-read-and-execute-permissions)
    - [What do you think 644 would mean?](#what-do-you-think-644-would-mean)
    - [Summary of Numeric Permissions](#summary-of-numeric-permissions)
  - [Task 4: Research changing file permissions](#task-4-research-changing-file-permissions)
- [Making a bash script](#making-a-bash-script)
  - [How to make ta script and run it](#how-to-make-ta-script-and-run-it)
  - [Environment Variables](#environment-variables)
    - [Setting up an Environment variables](#setting-up-an-environment-variables)
- [Deleting Your Virtual Machine](#deleting-your-virtual-machine)
- [Virtual machine - Deploy Sparta App](#virtual-machine---deploy-sparta-app)
  - [How to get a folder into your VM](#how-to-get-a-folder-into-your-vm)
  - [Install MongoDB on Ubuntu 22.04](#install-mongodb-on-ubuntu-2204)
- [Making a Database in Azure - MongoDB](#making-a-database-in-azure---mongodb)
  - [Task: Get the 'app' folder onto the Azure VM using "git"](#task-get-the-app-folder-onto-the-azure-vm-using-git)
  - [Nginx Reverse Proxy Setup](#nginx-reverse-proxy-setup)
    - [1. Install Nginx](#1-install-nginx)
    - [For Ubuntu/Debian:](#for-ubuntudebian)
    - [2. Configure Nginx as a Reverse Proxy](#2-configure-nginx-as-a-reverse-proxy)
    - [Open the Nginx configuration file:](#open-the-nginx-configuration-file)
    - [Add Reverse Proxy Configuration:](#add-reverse-proxy-configuration)
    - [Save and exit the file.](#save-and-exit-the-file)
    - [3. Test the Nginx Configuration](#3-test-the-nginx-configuration)
    - [5. Restart Nginx](#5-restart-nginx)
    - [6. Check](#6-check)
  - [Task: How many services can use a port?](#task-how-many-services-can-use-a-port)
    - [Objective](#objective)
    - [Step 1: Run the Sparta App](#step-1-run-the-sparta-app)
    - [Step 2: Open a Second Terminal and Run the App](#step-2-open-a-second-terminal-and-run-the-app)
      - [Expected Error](#expected-error)
    - [Explanation of the Error](#explanation-of-the-error)
    - [Step 3: Fixing the Error](#step-3-fixing-the-error)
    - [Option 1: Change the Port Number](#option-1-change-the-port-number)
    - [Option 2: Kill the Existing Process Using Port 3000](#option-2-kill-the-existing-process-using-port-3000)
    - [Step 4: Finding the Process Using Port 3000](#step-4-finding-the-process-using-port-3000)
    - [Linux Command:](#linux-command)
    - [Example Output](#example-output)
    - [Step 5: Killing the Process](#step-5-killing-the-process)
  - [Task: Run Sparta app in the background](#task-run-sparta-app-in-the-background)
  - [Work out ways to both run, stop and re-start the app in the background (besides using the "\&" at the end of the command):](#work-out-ways-to-both-run-stop-and-re-start-the-app-in-the-background-besides-using-the--at-the-end-of-the-command)
    - [One way should use pm2](#one-way-should-use-pm2)
  - [Final app and db scripts:](#final-app-and-db-scripts)
    - [Testing process](#testing-process)
  - [Images - plan for creating using an app + db image:](#images---plan-for-creating-using-an-app--db-image)
    - [Possible blockers](#possible-blockers)

## 1. How do we know if something is in the cloud? 
Cloud services are typically accessed over the internet, meaning the data or application isn't hosted locally. If you're accessing resources or apps without needing specific local hardware, it's likely cloud-based.

## 2. Differences between On-Prem and the Cloud?
- **On-Prem**: Resources are hosted and managed on the company's own servers.
- **Cloud**: Resources are hosted on external servers, managed by cloud providers, and accessed via the internet.

| On-Prem | Cloud |
| ------- | ----- |
| Requires internal management of hardware and software. | Managed by the cloud provider. |
| High upfront costs. | Lower initial costs, often subscription-based. |
| Physical proximity to resources. | Accessible from anywhere with internet access. |

## 3. The 4 Deployment Models of Cloud: 
- **Private Cloud**: Dedicated to a single organization, offering enhanced control and security. Can be run without internet (on a cruise ship). 
- **Public Cloud**: Services provided over the internet and shared across multiple users.
- **Hybrid Cloud**: A mix of private and public clouds, offering flexibility. This allows businesses to maintain private data on-prem while leveraging cloud for scalability. Some data needs to stay on-prem because of compliance reasons (private user data). 
- **Multi-Cloud**: Use of multiple cloud services from different providers. May use this because of redundancy (having backups - this is common in the finance sector). 

| Deployment Model | Description |
| ---------------- | ----------- |
| Private Cloud | More secure, but expensive and complex. |
| Public Cloud | Cost-effective but less control over security. |
| Hybrid Cloud | Combines the best of both worlds. |
| Multi-Cloud | Increased redundancy and flexibility. |

## 4. Types of Cloud Services:
- **IaaS (Infrastructure as a Service)**: Provides virtualized computing resources over the internet.
- **PaaS (Platform as a Service)**: Offers hardware and software tools over the internet, typically for app development.
- **SaaS (Software as a Service)**: Delivers software applications via the internet, accessible through a browser. **Data is managed by you.**
  

![alt text](image.png)

| Service Type | Example | Description |
| ------------ | ------- | ----------- |
| IaaS | AWS EC2 | Provides virtual machines and storage. |
| PaaS | Google App Engine | Platform to develop and deploy apps. |
| SaaS | Dropbox | Ready-to-use applications accessible online. |

## 5. Advantages/Disadvantages of the Cloud for Businesses:

### Advantages:
- Scalability
- Could be cost-effective
- Access to advanced technologies
- Less maintenance of hardware
- Disaster recovery
- Automatic updates 
- Guaranteed level of service

### Disadvantages:
- Security risk becaues you do not have physical control of the security
- Limited control
- Ongoing costs
- Downtime (can go either way)

## 6. Difference Between OpEx vs CapEx:
- **OpEx (Operational Expenditure)**: Ongoing costs for running services (e.g., cloud subscription).
- **CapEx (Capital Expenditure)**: Upfront investment in physical infrastructure (e.g., data centers).
- **Cloud**: Shifts costs from CapEx to OpEx, making costs more predictable but continuous.

## 7. Is migrating to the cloud always cheaper?
* While the cloud offers lower upfront costs, long-term costs can be higher due to recurring subscription fees, especially for large-scale operations.
* For cloud services there are cost optimisation tools that can keep costs down. AWS has Trusted Advisor and other tools to help with this. 
* AWS has a pay as you go model. 


## 8. Market Share - Cloud:

**Cloud Market:**
1. AWS
2. Microsoft Azure
3. Google Cloud Platform

Market share breakdown:
![Market Share](images/AWS-s-Azure-vs-Google-Market-sale-1-1024x498.png)


## 9. What are the 3 largest Cloud providers known for?

- **AWS**: Known for its extensive service offerings and scalability.
- **Microsoft Azure**: Strong in hybrid cloud solutions and integrations with enterprise tools.
- **Google Cloud Platform**: Popular for AI and data analytics.

## 10. Which cloud provider might be the best? Why?
The best cloud provider depends on your needs:
- **AWS** for versatility and global reach.
- **Azure** for seamless enterprise integrations.
- **Google Cloud** for cutting-edge AI/ML services.

## 11. What do you usually pay for in the cloud?
- Storage
- Compute power
- Data transfer (Egress - transfer out)
- Additional services like security, databases, and networking

## 12. What are the 4 Pillars of DevOps, and how do they link into the Cloud?
1. **Collaboration**: Cloud enables team collaboration through shared resources.
2. **Automation**: Cloud platforms allow for automated scaling and deployment.
3. **Continuous Integration/Delivery**: Cloud environments facilitate seamless CI/CD pipelines.
4. **Monitoring and Feedback**: Cloud providers offer integrated monitoring tools for proactive issue detection.


# Linux
## **Commands:** 
* `pwd`: Print working directory
* `cd`: Change directory 
* `ls`: List files and directories
* `mkdir`: Create/make new directory
* `rmdir`: Remove an empty directory 
* `rm`: Remove files or directories 
* `cp`: Copy files or directories 
* `mv`: Move or rename files or directories
* `touch`: Create a new, empty file 
* `cat`: View contents of a file
* `exit`: To exit 
* `uname`: Name of OS
* `whoami`: The admin
* `history`: Shows a history of commands used
* `curl`: Fetches web content, downloading files, sending data to servers etc.
* `wget`: Downloading files
* `file`: Outputs the file type
* `nano`: Edits file. 
* `head`: Shows the top of the file and you can specify how many lines
* `tail`: Shows the bottowm of the file and you can specify how many lines
* `nl`: Displays the number of each line in a file
* `sudo`: Superuser do - which is to perform administative tasks
* `apt`: It simplifies the process of installing, updating, and removing software packages
* `su`: Superuser - to become the root user

## What is Linux?
* Clone of Unix (OS before Linux)
* Can be run on any computer
  
## Task 1: Linux - Research managing file ownership with Linux
* **Managing file ownership** is important because of system security and proper functioning in a multi-user environment. 
* Ownership is important as it determines who can access, modify, or execute files, ensuring that sensitive files are only accessible by authorized users. 
* Proper ownership management prevents accidental or malicious actions from unauthorized users and allows system administrators to maintain control over system resources.
* Command to view file ownership is:
`ls -l`. 
* File and directories have default permissions when they are created.
  * **Files**: Read and write for owner and group. Read-only for others. 
  * **Groups**: Read, write and execute for owners and groups. Read and write for others.  
* The created file belongs to 
  1. The user who created it  
  2. The group associated with that user. 
* The owner does not receive execute (X) permissions when creating files because, for security reasons, executable permissions are not typically granted automatically for newly created files. This prevents potentially harmful scripts or binaries from being executed unintentionally.
* Command to change the owner of a file/directory is: `chown`

## Task 2: Research Managing File Permissions
* **Being the owner of the file does not give you full permissions (read, write and execute)**. The owner can have any combination of these permissions, which means they might not have full permissions (read, write, execute) if those permissions were not set appropriately. For example, an owner could have only read and write permissions but not execute permission.
  
* Giving permissions to the **User** entity means that those permissions apply specifically to the owner of the file. The User entity is the individual who created the file (or the one who has been assigned ownership). Permissions set for the User will determine what the owner can do with the file:
  - **Read (r)**: The owner can view the contents of the file.
  - **Write (w)**: The owner can modify the contents of the file.
  - **Execute (x)**: The owner can execute the file if it is a script or program.
  
* Giving permissions to the **Group** entity means that those permissions apply to all users who are members of the file's group. This allows multiple users to share access to the file without making it publicly available to everyone. Usually it is the Group that the owner belongs to. Permissions for the **Group** can include:
  - **Read (r)**: Group members can view the contents of the file.
  - **Write (w)**: Group members can modify the contents of the file.
  - **Execute (x)**: Group members can execute the file if it is a script or program.
  
* Giving permissions to the **Other** entity means that those permissions apply to all users who are not the owner and are not part of the file's group. This is essentially the public access level. Permissions for Other can include:
  - **Read (r)**: Any user can view the contents of the file.
  - **Write (w)**: Any user can modify the contents of the file.
  - **Execute (x)**: Any user can execute the file if it is a script or program.
* If the User (**Owner**) permissions: Read-only (r--), **Group** permissions: Read and write (rw-), and **Other** permissions: Read, write, and execute (rwx)
As the owner of the file, you will have the following permissions:

Read-only: You can read the contents of the file but cannot modify it or execute it since execute permissions are not set.

* `-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh`:
    - `-` : Indicates that this is a regular file (not a directory).
    - `rwx` : The owner (tcboony) has read, write, and execute permissions.
    - `r-x` : The group (staff) has read and execute permissions but no write permission.
    - `r--` : Others have read permission only.


## Task 3: Numeric Values Assigned to File Permissions

### What numeric values are assigned to each permission?
The numeric values assigned to each permission are as follows:
- **Read (r)**: 4
- **Write (w)**: 2
- **Execute (x)**: 1

### What value would assign read + write permissions?
To assign **read + write** permissions, you would add the numeric values for read and write:
- Read (4) + Write (2) = **6**

### What value would assign read, write, and execute permissions?
To assign **read, write, and execute** permissions, you would add the numeric values for all three permissions:
- Read (4) + Write (2) + Execute (1) = **7**

### What value would assign read and execute permissions?
To assign **read and execute** permissions, you would add the numeric values for read and execute:
- Read (4) + Execute (1) = **5**

### What do you think 644 would mean?
In the permission representation `644`, the three digits represent the permissions for:
- **User (Owner)**: 6 (Read + Write) - The owner has read and write permissions.
- **Group**: 4 (Read) - The group has read permissions only.
- **Other**: 4 (Read) - Others have read permissions only.

Thus, `644` means:
- The owner can read and write the file.
- Group members can only read the file.
- Other users can only read the file.

### Summary of Numeric Permissions

| Permission | Numeric Value |
|------------|---------------|
| Read       | 4             |
| Write      | 2             |
| Execute    | 1             |

| Combined Permissions | Numeric Value |
|---------------------|---------------|
| Read + Write        | 6             |
| Read + Write + Execute | 7          |
| Read + Execute      | 5             |

| Mode/Permissions | Meaning                    |
|------------------|---------------------------|
| 644              | Owner: rw- (read/write), Group: r-- (read), Other: r-- (read) |

## Task 4: Research changing file permissions
* `chmod`: This command changes file permissions. 
* To change the permissions on a file, the end user must be: 
    1. The owner
    2. A user with su privileges (su - super user) 

a. Set User to read, Group to read + write + execute, and Other to read and write only
- Using symbolic notation:
```bash
chmod u=r,g=rwX,o=rw testfile.txt
```
- Using numeric values:
```bash
chmod 664 testfile.txt
```

b. Add execute permissions (to all entities)
- Using symbolic notation:
```bash
chmod +x testfile.txt
```
- Using numeric values (if starting from `775`):
```bash
chmod 775 testfile.txt
```

c. Take write permissions away from Group
- Using symbolic notation:
```bash
chmod g-w testfile.txt
```
- Using numeric values (if starting from `755`):
```bash
chmod 755 testfile.txt
```

Use numeric values to give read + write access to User, read access to Group, and no access to Other
```bash
chmod 640 testfile.txt
```
# Making a bash script
## How to make ta script and run it
* Need to make a `.sh` file and add the following (you can do this by simply running `nano <file-name>` - use `Ctrl + S` and `Ctrl + X` to save and exit). 
* The `#!/bin/bash` needs to be included for every bash script. 
```bash
#!/bin/bash 

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx - to automatically start when we startup VM
sudo systemctl enable nginx
```
* To check the status: `sudo systemctl status nginx`
* In order to run this script you would need to change the permissions of the file that has that bash script: `chmod +x <file-name>` this would add the execute. 
* If you follow those steps above, it should allow you to run the script: `./<file-name>`

## Environment Variables 
* A value in memory that is available to any tool that wants to look up those values.
* An **environment variable** is a dynamic **variable** stored in a process environment. It is used to **pass** configuration information and settings to processes running in the system. These **variables** can influence the behavior of software and system components by providing information such as paths, user preferences, and system settings. We want a certain value returned. 
  
### Setting up an Environment variables

* `printenv` to output the environment variables (you can specify in CAPS what environment variable)
* To set a **variable**, we can use `VARIABLENAME=data`. This is a **shell variable**. To ensure this worked, we could use `echo $VARIABLENAME`, which would then output the `data` value. **Note** that this is
**NOT** the same as an **enviornment variable**.
* To set an environment variable: 
    * `export` to set an environment value (e.g. `export MYNAME=priyan`)
    * If we were to set our **environment variable** inside of the hidden `.bashrc`, it would be visible to the user (admin) across sessions, making it **persistent**. **Note** that `.bashrc` is unique to the user. We can do this by using `nano .bashrc` and writing `export VARIABLENAME=data` in the file.
    * `echo "export MYNAME=priyan_is_persistent" >> .bashrc` adding this to the .bashrc file will set it as an environment variable. 
* `ps` - to check user processes, `ps aux` - to check a lot of processes. 
* `top` - to check CPU usage, `Ctrl + M` for memory, `Ctrl + N` for descending order of PID, `Ctrl + P` to go back to the CPU usage.
* `sleep 3` to sleep for 3 seconds in the foreground - To stop this `Ctrl + Z` or `Ctrl + C`. 
* `sleep 5000 &` (this will give you an Process ID output) to tick in the background and not engage the terminal - To stop this `kill -1 <PID>` (`PID`: Process ID) (64 kill signals and -1 is the lightest). 
* `kill <PID>` can be used on its own and is the same as `-15` (default - terminate).
* `kill -9 <PID>` is for brute force kill but this can leave zombie instances (instances still running in the memory with no parent process that can manage it and then needs to be manually killed). 
 
 # Deleting Your Virtual Machine
1. Navigate to overview.
2. Find your resource group.
3. Filter your name. You will see multiple items appear.
4. Tick `resourcegroupname-name-vmname`
5. Tick `resourcegroupname-vmname-ip`
6. Tick `resourcegroupname-vmname-nsg`
7. Tick `resourcegroupname-name-networkinterface`
8. Tick `resourcegroupname-name-Disk`
9. Locate **delete**. Avoid deleting the **resource group**.
10. Tick "Apply force delete" just to be safe.
11. Enter "delete" in the input box and click **delete**.
12. Select **delete** once more to confirm **deletion**.
 
We leave the Virtual Network and SSH Key as they can be reused.

# Virtual machine - Deploy Sparta App 
* Once you have used the ssh key to log in on Git bash. Run the following: `sudo apt-get update -y` and `sudo apt-get upgrade -y`. 
* BE CAREFUL! On 22.04 Ubuntu, it will still ask for user input. Use `sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y` instead. 
* `sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y` to install nginx. 
* `curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs` to install nodejs.
* The `DEBIAN_FRONTEND=noninteractive` before the `apt-get` because it removes the need for user input. 

* Use `nano prov-app.sh` and input the below. 
``` bash
#!/bin/bash

echo update sources list...
sudo apt-get update -y
echo DONE!

echo upgrade any packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo DONE!

echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo DONE!

echo install nodejs vs20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!

echo check nodejs version...
node -v
echo Done!
```
* To run this you would need to run this `./prov-app.sh`

## How to get a folder into your VM 
1. Run `scp -i ~/.ssh/tech264-priyan-az-key -r "C:\Users\Priyan\Downloads\app" adminuser@<public-ip>:~/` in your git bash terminal. 
2. SSH back into the VM `ssh -i ~/.ssh/tech264-priyan-az-key adminuser@20.162.221.60`.
3. Check if the `app` folder is there and `cd` into that folder
4. Run `npm install` and `npm start`
5. How to add a port:
   1. Navigate to your VM's **network settings**.
   2. Open up **Settings** and click **inbound security rules**.
   3. Change the **destination port** to `3000`.
   4. Change protocol to **TCP**.
   5. Change the priority. The **lower** the priority, the **higher** the priority.
6. Search your public-ip and add `:3000`.


## Install MongoDB on Ubuntu 22.04
Steps: 
# Making a Database in Azure - MongoDB

`sudo apt-get install gnupg curl` :
- `gnupg` : This is the GNU Privacy Guard, a tool for encrypting files and managing keys. It's often used for securely managing software repositories, verifying signatures, and other cryptographic functions.

1. Download PGP:
``` bash
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
```
This command downloads the PGP (Pretty Good Privacy) public key for MongoDB version 7.0 and converts it to a .gpg file format using gpg. The resulting key is then stored in /usr/share/keyrings/ for use in authenticating MongoDB packages during installation. It ensures the packages are coming from a trusted source.
 
2. Register MongoDB to the system:
``` bash
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list`
```
This command registers the MongoDB 7.0 repository to your system, ensuring that MongoDB packages will be fetched from the official source and verified with the correct GPG key during installation.
 
3. Run update:
``` bash
sudo DEBIAN_FRONTEND=noninteractive apt update -y
```
Running sudo apt update is necessary to update the package lists from all configured repositories.
 
4. Install MongoDB components:
``` bash
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
```
This command installs specific versions of MongoDB components (version 7.0.6 for MongoDB and 2.1.5 for the MongoDB shell) in a non-interactive mode.
 
5. Status check:
``` bash
sudo systemctl status mongod
```
Check the status of mongod. It will not be active.
 
6. Start up:
``` bash
sudo systemctl start mongod
```
Starts mongod. If you then re-run status, it will read as active.
 
7. Change bindIp:
``` bash
sudo nano /etc/mongo.conf
```
Nanos into the mongo configuration file and locate `bindIp`. Replace whatever is there with `0.0.0.0`. Allows connections from any IP.
 
8. Restart:
``` bash
sudo systemctl restart mongod
```
This applies the changes we made in the config file.
 
9. Check if it's enabled:
``` bash
sudo systemctl is-enabled mongod
```
It should read as disabled, so we will enable it.
 
10.  Enable it:
``` bash
sudo systemctl enable mongod
```
This will enable MongoDB, which then should be enabled on our VMs whenever we boot it up.
These are the above commands:

* `sudo apt-get install gnupg curl`
* `curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor`
* Create a sources list file: `echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list`
* Then run `sudo apt-get update -y`.
* `sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6`
* `sudo systemctcl start mongod`: to start mongoDB and use `sudo systemctcl status mongod` to check if it is running. 
* `sudo nano /etc/mongod.conf`: editing the mongo file configuration. Change the bindIP to `0.0.0.0` (this accepts any IP address): 
``` bash
# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0
```
* `sudo systemctl enable mongod` to enable mongo. 
* `sudo systemctl is-enabled mongod` to check. 

Now we need to make an environment variable to link the database to the app - this needs to be on the app VM. 
* `export DB_HOST=mongodb://10.0.3.4:27017/posts`: put this into the VM for the app. This will make the env variable. 
* print it to the screen `printenv DB_HOST`
* Then use the `npm install` and `npm start`. Then input the ip address with the port and /posts. e.g. `http://20.162.221.60:3000/posts`
* JUST IN CASE: If it is not populated with data then use `seeds.js`

## Task: Get the 'app' folder onto the Azure VM using "git"

* `git clone <url>`

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

echo "install nodejs v20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

echo "check nodejs version..."
node -v
echo "nodejs v20 installed"

# Cloning Git repo and calling it repo
echo "Clone Git folder"
git clone https://github.com/PriyanSappal/tech264-sparta-app.git repo
echo "Cloned tech264-sparta-app"

echo "Change directory to app"
cd repo/app
echo "In app directory"

echo "install and run"
npm install
npm start &
```

This is the DB script:

``` bash 
#!/bin/bash

# Check for updates
echo "update sources list..."
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
echo "update complete"

# Upgrade available packages
echo "upgrade any packages available..."
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo "upgrade complete"

# Install gnupg and curl
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg curl

# Add MongoDB GPG key for version 7.0
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

# Add MongoDB repository (fixed path issue)
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update package list again after adding the MongoDB repo
sudo DEBIAN_FRONTEND=noninteractive apt update -y

# Install MongoDB version 7.0.6 with its components
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

# Start MongoDB
sudo systemctl start mongod

# Modify the bind IP in the MongoDB config (fixed sed command)
sudo sed -i "s/bindIP: 127.0.0.1/bindIP: 0.0.0.0/" /etc/mongod.conf

# Restart MongoDB service to apply the config changes
sudo systemctl restart mongod

# Enable MongoDB to start at boot
sudo systemctl enable mongod

# Check MongoDB service status (optional, but good for debugging)
sudo systemctl status mongod

```

Revised:

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
 
echo Installing gnupg and curl...
sudo apt-get install gnupg curl -y
echo Done!
 
# Download and add MongoDB GPG key for package verification
echo Adding MongoDB GPG key...
sudo rm -f /usr/share/keyrings/mongodb-server-7.0.gpg # Remove key if one exists
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg --yes -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo Done!
 
# Add MongoDB repository to the sources list
echo Adding MongoDB repository to sources list...
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo Done!
 
# Update package list again to include the newly added MongoDB repository
echo Updating package list with MongoDB repository...
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
echo Done!
 
# Install MongoDB version 7.0.6 and specific associated packages non-interactively
echo Installing MongoDB and related packages...
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mongodb-org=7.0.6 \
    mongodb-org-database=7.0.6 \
    mongodb-org-server=7.0.6 \
    mongodb-org-shell=7.0.6 \
    mongodb-org-mongos=7.0.6
echo Done!
 
# Start MongoDB service immediately
echo Starting MongoDB service...
sudo systemctl start mongod
echo Done!
 
# Enable MongoDB service to start on boot
echo Enabling MongoDB service to start on boot...
sudo systemctl enable mongod
echo Done!
 
# Modify MongoDB configuration to allow remote connections
echo Configuring MongoDB to allow remote connections...
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
echo Done!
 
# Restart MongoDB service to apply configurations
echo Restarting MongoDB service...
sudo systemctl start mongod
echo Done!
```

**We need to set a DB_HOST on the app VM to connect this:**

`export DB_HOST=mongodb://10.0.3.5:27017/posts`

## Nginx Reverse Proxy Setup

### 1. Install Nginx
If Nginx is not installed, use the following commands based on your OS:

### For Ubuntu/Debian:
```bash
sudo apt update
sudo apt install nginx
```
---

### 2. Configure Nginx as a Reverse Proxy

### Open the Nginx configuration file:
- On **Ubuntu/Debian**, the default file is located at `/etc/nginx/sites-available/default`.

You can also create a new config file for a custom setup, e.g., `/etc/nginx/sites-available/my-reverse-proxy`.

### Add Reverse Proxy Configuration:
Below is an example configuration to proxy traffic to a backend service running at `http://localhost:3000`.

```nginx
server {
    listen 80;  # The port on which Nginx listens for incoming traffic (HTTP)
    server_name your-domain.com;  # Replace with your domain

    location / {
        proxy_pass http://localhost:3000;  # The backend server to forward requests to
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

- **`proxy_pass`**: Forwards traffic to the service running on `http://localhost:3000`.
- **`proxy_set_header`**: Preserves client information like the original IP address.

### Save and exit the file.

---


### 3. Test the Nginx Configuration
To verify that your configuration has no syntax errors:

```bash
sudo nginx -t
```

If the output shows "syntax is ok", you’re good to go!

---

### 5. Restart Nginx
After saving your configuration, restart Nginx to apply the changes:

```bash
sudo systemctl restart nginx
```

---
### 6. Check 
Search the IP address without the ":3000" and it should work. 

## Task: How many services can use a port?
### Objective
To demonstrate the behavior of running the Sparta application in two different Git Bash terminals on the same virtual machine (VM) and resolve the resulting error due to port conflicts.

### Step 1: Run the Sparta App
1. Open the first **Git Bash** terminal.
2. Navigate to the directory where the Sparta app is located.
3. Run the app using the command:
   ```bash
   npm start
   ```

### Step 2: Open a Second Terminal and Run the App
1. Open a second **Git Bash** terminal.
2. Again, navigate to the directory where the Sparta app is located.
3. Attempt to run the app using the same command:
   ```bash
   npm start
   ```

#### Expected Error
When you try to run the Sparta app in the second terminal, you will receive an error indicating that port 3000 is already in use. The error message will look something like this:

```
Error: listen EADDRINUSE: address already in use ::1:3000
```
![alt text](image-1.png)

### Explanation of the Error
This error occurs because both instances of the Sparta app are trying to bind to the same port (3000). When the first instance is already running and listening on that port, the second instance cannot start.

### Step 3: Fixing the Error
To resolve this issue, you have two options:

### Option 1: Change the Port Number
1. Open the `server.js` or relevant configuration file of the Sparta app.
2. Change the port number from `3000` to another unused port (e.g., `3001`).
3. Save the changes.
4. Re-run the app in the second terminal using:
   ```bash
   npm start
   ```

### Option 2: Kill the Existing Process Using Port 3000
If you want to run the app on port 3000, you can terminate the process currently using that port.

### Step 4: Finding the Process Using Port 3000
To find out which process is using port 3000, you can use the following command:

### Linux Command:
```bash
lsof -i :3000
```

**Explanation:**
- `lsof` lists open files and the corresponding processes.
- `-i :3000` filters the list to show only processes using port 3000.

### Example Output
You might see output like this:
```
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
node    12345 user   23u  IPv6 0x1234      0t0  TCP *:3000 (LISTEN)
```
In this case, the `PID` (Process ID) is `12345`, which you can use to terminate the process.

### Step 5: Killing the Process
To terminate the process using port 3000, use the `kill` command followed by the PID:

```bash
kill 12345
```

**Note:** If the process does not terminate, you can use `kill -9` to forcefully kill it:
```bash
kill -9 12345
```

## Task: Run Sparta app in the background
 
## Work out ways to both run, stop and re-start the app in the background (besides using the "&" at the end of the command):
 
### One way should use pm2
`pm2` : A production process manager that allows you to run your apps in the background, keep them alive (restart automatically if they crash), monitor performance, and handle logs.
 
`pm2 start npm -- start` : Tells PM2 to start a new process using the npm command to execute the start script defined in your package.json. It launches your Node.js application in the background
 
`pm2 stop npm` :  If you have multiple processes managed by PM2 that were started with the npm -- start, you can stop them all using this command. This effectively halts the application, but does not remove it from PM2's process list.
 
`pm2 restart npm` : This command restarts the running process associated with the npm command. PM2 will first stop the current instance and then start it again, ensuring any updates or changes are applied.
 
Don't forget to install PM2 in your script using `sudo npm install -g pm2`. The `-g` installs this globally, meaning we can access PM2 from any terminal window without needing to be in a specific project directory.

**When using the & operator (e.g., npm start &), the app runs in the background, but there are key issues:**

* No Process Management: There's no built-in way to monitor, restart, or stop the process. You would have to manually kill the process by finding its PID.
* No Restart on Crash: If the app crashes, it won’t automatically restart.
* No Logging: & does not provide logging out of the box, whereas tools like pm2 provide easy access to logs.
 
## Final app and db scripts:
 * [App Script](bash_scripts/prov-app.sh)
 * [DB Script](bash_scripts/prov-db.sh)

### Testing process

It is essential to start the DB script first so that the app has something to connect to, when starting the db script you may need to troubleshoot and look out for some things:
  - SSH into your DB VM and check the status of your mongodb (`sudo systemctl status mongod`).
  - When you create a new app VM make sure you use the private IP that is displayed on your DB VM so that it connects. 
  - `cat /etc/mongod.conf | grep bindIp` to check the bindIp is 0.0.0.0
  - `sudo systemctl is-enabled mongod`

## Images - plan for creating using an app + db image:
1. Create DB VM using custom image and user data to run entire DB script. 
2. Tested user data did it's job. 
3. Create app VM using custom image and user data to run entire app script
   - make sure the DB_HOST variable has the correct IP
4. Test by:
   - check public IP to bring up app homepage 
   - check /posts page
5. Create DB VM image from DB VM
   - delete the DB VM
6. Create DB VM from this image
7. Create app VM image from app VM
   - delete the app VM
8. Create app VM from the app image just created 
   - special script - run-app-only.sh
      - start with the she-bang
      - export DB_HOST env variable
      - cd into app folder
      - (probably don't need it) npm install
      - pm2 stop all
      - pm2 start app.js
   - posts page to work connecting to DB VM made from image

To create image:
1. Select **Capture Image** on the VM of choice's **Overview**.
2. Under **Instance details**, Select **No, capture only a managed image**.
3. Enable **Automatically delete this virtual machine after creating the image**.
4. Name image appropriately.
5. Run `sudo waagent -deprovision+user` inside our DB SSH to remove delete information we no longer need, then return to Azure window.
6. Add tags.
7. Review, then create.

### Possible blockers
* Check DEBIAN_FRONTEND=noninteractive.
* Check on different browser or clear cache on current browser.
* Create separate files to copy the script from. 
* Check to see the order of your script, for example make sure after nginx is installed you configure it. 
* Ensure that if you have started a service that it is enabled too. 
