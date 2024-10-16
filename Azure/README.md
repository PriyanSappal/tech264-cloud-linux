# VM, VNet and Azure

- [VM, VNet and Azure](#vm-vnet-and-azure)
  - [Diagram of VM:](#diagram-of-vm)
  - [Steps to Create a Virtual Network and a New SSH Key Pair in Azure](#steps-to-create-a-virtual-network-and-a-new-ssh-key-pair-in-azure)
  - [1. Creating a Virtual Network (VNet) in Azure](#1-creating-a-virtual-network-vnet-in-azure)
    - [What is a Virtual Network (VNet)?](#what-is-a-virtual-network-vnet)
    - [Steps to Create a Virtual Network](#steps-to-create-a-virtual-network)
    - [More condensed steps:](#more-condensed-steps)
    - [Details needed to plan/create a VNet](#details-needed-to-plancreate-a-vnet)
  - [How to create a VNet?](#how-to-create-a-vnet)
  - [Diagram for planning:](#diagram-for-planning)
  - [Creating a New SSH Key Pair for Azure Virtual Machines](#creating-a-new-ssh-key-pair-for-azure-virtual-machines)
    - [What is an SSH Key Pair?](#what-is-an-ssh-key-pair)
    - [Steps to Create an SSH Key Pair (Using Linux/macOS or Windows PowerShell):](#steps-to-create-an-ssh-key-pair-using-linuxmacos-or-windows-powershell)
  - [Plan to create a VM](#plan-to-create-a-vm)
- [How to Create a Virtual Machine (VM)](#how-to-create-a-virtual-machine-vm)
  - [Basics](#basics)
  - [--\> Disks](#---disks)
  - [--\> Networking](#---networking)
  - [--\> Tags](#---tags)
  - [--\> Review and Create](#---review-and-create)
  - [Connecting Your Virtual Machine](#connecting-your-virtual-machine)
- [Intro to Azure](#intro-to-azure)
    - [The Basics of Azure:](#the-basics-of-azure)
  - [Regions and Availability Zones](#regions-and-availability-zones)
  - [Structure of Azure:](#structure-of-azure)
  - [Services](#services)
  - [Accessing Azure](#accessing-azure)
  - [Azure vs. Azure DevOps](#azure-vs-azure-devops)
  - [Why use the Azure Pricing Calculator:](#why-use-the-azure-pricing-calculator)
  - [Difference between Azure and AWS](#difference-between-azure-and-aws)
  - [Alerting and Monitoring](#alerting-and-monitoring)
  - [Types of Scaling](#types-of-scaling)
  - [Architecture for an Azure VM Scale Set Internet](#architecture-for-an-azure-vm-scale-set-internet)
- [Azure High Availability and Scaling](#azure-high-availability-and-scaling)
  - [Availability Set](#availability-set)
  - [Availability Zone](#availability-zone)
  - [Virtual Machine Scale Set (VMSS)](#virtual-machine-scale-set-vmss)
- [Blob Storage](#blob-storage)
    - [The following steps are taken after you have created the app VM from the image you have created and SSH into. Go onto the "To create image to see how to".](#the-following-steps-are-taken-after-you-have-created-the-app-vm-from-the-image-you-have-created-and-ssh-into-go-onto-the-to-create-image-to-see-how-to)
  - [Steps to get the picture onto the website.](#steps-to-get-the-picture-onto-the-website)


## Diagram of VM:

```plaintext
  Region ---------------------------------------------+
    |                                                 |
    v                                                 |
+-------------------+                                 |   
| Resource Group    |                                 | 
+-------------------+                                 |  This provides
    |                                                 |  the structure 
    v                                                 |  which the VM
+-------------------+                                 |  would be in
|       VNet        |                                 |
+-------------------+                                 |
    |                                                 |
    v                                                 |
+-------------------+                                 |
|      Subnet       |---------------------------------+
+-------------------+
    |
    v
+----------------------------+
| Network Interface (NIC)    |
+----------------------------+
    |
    +
    |                                             
    v                                             
+------------------+                     
|     Public IP    |                     
+------------------+                     
    |
    v
+---------------------------+
|   Network Security Group   |
|           (NSG)            |
+---------------------------+
    |
    +-----------------------+------------------------+
    |                       |                        |
    v                       v                        v
+-----------------+   +-------------------+   +-------------------+
| Allow SSH Rule  |   |  Allow HTTP Rule  |   |     SSH Key       |
|                 |   |                   |   +-------------------+
+-----------------+   +-------------------+
    |
    v
   +--------------------------+      
   |      Virtual Machine     |
   +--------------------------+
+-------------------+ 
|      Disk         |                     
+-------------------+                                                                               
``` 

## Steps to Create a Virtual Network and a New SSH Key Pair in Azure

## 1. Creating a Virtual Network (VNet) in Azure

### What is a Virtual Network (VNet)?
A Virtual Network (VNet) in Azure allows resources like virtual machines (VMs), databases, and applications to securely communicate with each other, the internet, and other networks. 

### Steps to Create a Virtual Network

1. **Log in to Azure Portal:**   - Go to the [
Azure Portal](https://portal.azure.com).   - Sign in with your Azure account credentials. 
2. **Create a New Resource Group:**   - Navigate to "Resource Groups" from the left-hand menu.   - Click on `+ Create`.   - Fill in the necessary details (like subscription, resource group name, and region).   - Click `Review + Create`, then `Create`. 
3. **Create the Virtual Network:**   - Go to "Virtual Networks" in the Azure Portal.   - Click create
at the top of the page.    
4. **Configure Basic Settings:**   - **Subscription**: Choose the correct subscription.   - **Resource Group**: Select the resource group you created earlier.   - **Name**: Enter a name for your virtual network.   - **Region**: Select the region where you want to create the VNet. 
5. **Configure IP Addresses:**   - Go to the "IP Addresses" tab.   - Define the **Address Space** (default is a /16 CIDR block, e.g., `10.0.0.0/16`).   - Under **Subnets**, click `+ Add subnet` to create subnets for the VNet (e.g., a default subnet `10.0.1.0/24`). 
6. **Configure Security:**   - Go to the "Security" tab to enable any specific security features such as **DDOS Protection** or **Firewall** (optional, based on your needs). 
7. **Review and Create:**   - Click `Review + Create` to validate the configuration.   - If validation passes, click `Create`. 
8. **Deployment:**   - Wait for the VNet deployment to finish. Once deployed, you can manage the VNet through the Azure Portal.

### More condensed steps: 

**VNet(virtual Network)** -  allows to securely communicate between Azure resources, such as VMs(virtual machines), web apps and databases. 
 
 
### Details needed to plan/create a VNet
 
1. **Address Space(CIDR Block)**
- Decide the IP address range the VNet will cover (e.g. 10.0.0.0/16)
 
 
2. **Subnets:** 
- Divide the VNet into subnets            
- Each subnet should have its own IP address range
  - **public_subnet** (10.0.2.0/24(256 addresses))
  - **private_subnet** (10.0.3.0/24(256 addresses))
 
 
3. **Regions:** 
- Choose the Azure region where the Vnet will be created (e.g Europe Uk south)
 
## How to create a VNet?
1. Search for VNet
2. Click + create button
3. Set the name of subscription and resource group
4. Set the virtual networking name (e.g tech264-..)
5. Region : (Europe)Uk South
6. Check Security
7. IP addresses
- Add subsets and set their IP address range(only IPv4):
  - Name
  - Starting address
  - Size
8. Tags :
   - Name : Owner
   - Value : My name
 
9. Review + create  
10. Click create

## Diagram for planning: 

![Planning](../images/image-1.png)

##  Creating a New SSH Key Pair for Azure Virtual Machines

### What is an SSH Key Pair? 
An SSH key pair consists of a public and private key used to authenticate access to virtual machines securely. 

### Steps to Create an SSH Key Pair (Using Linux/macOS or Windows PowerShell):
1. **Open a Terminal or PowerShell:**   - On Linux/macOS, open the terminal.   - On Windows, use PowerShell or the Windows Subsystem for Linux (WSL). 
2. **Generate SSH Key Pair:**   Use the following command to generate an SSH key pair:    
```bash 
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
## Plan to create a VM
* Virtual network and subnet
* Name 
* Location and pricing (region closer to the end user)
* Size and pricing (how many vCPUs)
* Storage and pricing 
* OS and pricing 
* SSH key pair
   
# How to Create a Virtual Machine (VM)
 
## Basics
1. **Search** for Virtual Machine on the Azure Portal. Create a new VM.
2. **Assign** resource group `(tech264)`.
3. **Name** the VM (e.g tech264-name...)
4. Set **region** to `(Europe) UK South`.
5. Change **availability** to "No infrastructure redudancy required".
6. Change **image** to the OS we want on the disc (Also includes flavour and version of the OS, with stuff installed and ready to run - Basically a snapshot of a system). In our case, select `Ubuntu Pro 18.04 - x64 Gen2`. If it is not visible in the immediate recent, click "See all images" and search for it.
7. Change **security type** to standard.
8. Change **size** to `Standard_Bs1 - 1 vcpu, 1 GiB memory`. Select "see all sizes" if not seen in immediate recent.
9. Change **username** to to something more secure.
10. Change SSH public key source to `Use existing key stored in Azure`.
11. Select **your** Stored key (e.g tech264..).
12. Select `HTTP (80)` under **select inbound ports**. Both `SHH (22)` and `HTTP (80)` should be selected. You need to set up a certificate to use `HHTPS (443)`.
 
## --> Disks
Change OS Disk type to `Standard SSD (locally redundant storage)`.
 
## --> Networking
1. Change the **virtual network** to your own one, as it will default alphabetically.
2. Change **subnet** to `public-subnet`.
3. Enable **Delete public IP and NIC when VM is deleted**. Automates this just in case you forget to do it yourself.
 
## --> Tags
Select `Owner : (your name)`.
 
## --> Review and Create
Make sure all your details are correct.


## Connecting Your Virtual Machine
1. **Start** your virtual machine.
2. Navigate to "Connect" under your VM.
3. Find "Native SSH" and **select** it. A side panel should open.
4. Input `~/.ssh/` and your `private key name` into the "Copy and Execute SSH Command" line. This will output a command for us to use in our CL (We are using **GitBash**).
5. Click the copy button for the code below what was just inputted.
6. Paste this code into your **GitBash**.
7. A **warning** will come out once entered into your **GitBash**. Respond with `yes` and then it will permanently save the IP address, meaning we will not be given the warning again.
8. You can type `exit` to **logout** of the Virtual Machine.

# Intro to Azure
### The Basics of Azure:
* **Azure** is a cloud computing platform by Microsoft. It provides on-demand access to computing resources like servers, storage, and networking. Think of it as renting a computer in the cloud. You only pay for what you use.

* Key benefits:
    * **Scalability**: Easily adjust resources as needed.
    * **Flexibility**: Choose from a wide range of services to best fit your needs.
    * **Reliability**: Powered by Microsoft's global infrastructure.
    * **Cost-efficiency**: Pay-as-you-go pricing.

## Regions and Availability Zones
* Azure **regions** are geographical locations where Microsoft operates data centers. Each region is physically isolated and has multiple data centers within it. This redundancy ensures that Azure services remain available even if a data center experiences a failure.
* Azure **availability zones** are distinct physical locations within a region that are isolated from each other. Each availability zone has its own power, networking, and cooling infrastructure. This provides a higher level of fault tolerance and disaster recovery.

![AZ and Region](../images/image.png)
* ![AZ and Region](https://holori.com/list-of-all-azure-regions-and/#azure-regions)
 

## Structure of Azure:

For the below they use a different scope and at each level you can set access and policies:

- **Resource Groups**: Logical containers that hold related Azure resources, allowing for grouped management, monitoring, and lifecycle control.
- **Subscriptions**: Type of payment account. Organise resources and resource groups under a single billing account, with separate quotas, environments, and cost management. There may be limits/quotas e.g. 50x VMs (same size and same region).
- **Managment Groups**: Hierarchically organise multiple subscriptions, applying policies and controls across subscriptions for streamlined governance and compliance.
- **Root Management Group**: Azure Entra - All the user accounts and permissions are stored. 

It is dependent on what level you are and then you can manage downwards. 

![Structure-of-Azure](../images/Structure-of-azure.png)

## Services 
- **Compute**: Virtual machines, Azure Functions, App Service, Kubernetes Service, and more.
- **Storage**: Blob storage, file storage, disk storage, and database storage.
- **Networking**: Virtual networks, load balancers, DNS, and VPN.
- **Databases**: SQL Database, Cosmos DB, Redis Cache, and more.
- **Analytics**: Azure Data Factory, Azure Synapse Analytics, Power BI, and more.
- **AI and machine learning**: Azure Machine Learning, Azure Cognitive Services, and more.
- **IoT**: Azure IoT Hub, Azure IoT Central, and more.

## Accessing Azure
All the ways below interact with the ARM (Azure Resource Manager) api.

- **Azure portal**: A web-based interface that allows you to manage your Azure resources.
- **Azure CLI**: A command-line interface that provides programmatic access to Azure.
- **Azure PowerShell**: A scripting language that allows you to automate Azure tasks.
- **Azure Mobile App**: A mobile app that provides basic management capabilities.

## Azure vs. Azure DevOps

* **Azure** is a cloud computing platform that provides a wide range of services, such as virtual machines, storage, networking, and databases.

* **Azure DevOps** is a set of development tools that help teams collaborate and deliver software and runs as a separate ecosystem. It includes features such as CI/CD pipelines, version control, work item tracking, build and release management, and testing.

## Why use the Azure Pricing Calculator:

- **Cost estimation**: Determine the cost of your Azure resources before deploying them.
- **Budget planning**: Create a budget for your Azure usage.
- **Cost optimization**: Identify opportunities to reduce your Azure costs.
- **Scenario planning**: Test different scenarios and configurations to find the most cost-effective solution.

## Difference between Azure and AWS

When creating a VM...
* On Azure, by default, you get a static public IP assigned to your VM. 
* On AWS, by default, you get a dynamic IP assigned to the VM. So it will change when you stop and start your VM on AWS.

## Alerting and Monitoring 

![alt text](image-1.png)

## Types of Scaling

![alt text](image.png)

## Architecture for an Azure VM Scale Set Internet

![alt text](image-2.png)
The custom autoscale (VM scale set) is to acheive high availability and scalability 

# Azure High Availability and Scaling

## Availability Set

**What is an Availability Set?**
An Availability Set is a grouping of Virtual Machines (VMs) designed to increase availability by spreading them across multiple fault and update domains.

**How Does It Work?**
- **Fault Domains (FD)**: Distributes VMs across different hardware racks to reduce impact from hardware failures.
- **Update Domains (UD)**: Ensures that only one subset of VMs undergoes maintenance at a time.

**Advantages:**
- Provides high availability within a data center.
- Cost-effective.
- Manages planned maintenance with minimal disruption.

**Disadvantages:**
- Limited to a single data center, no protection against complete data center outages.
- No zone-level redundancy.

---

## Availability Zone

**What is an Availability Zone?**
An Availability Zone is a physical location within an Azure region that hosts VMs in separate data centers for higher availability.

**Why Superior to an Availability Set?**
- Provides geographic separation by placing VMs in different data centers.
- More resilient to data center-wide failures.

**Disadvantages:**
- Higher costs due to cross-zone data transfer.
- Potential for increased latency between zones.

---

## Virtual Machine Scale Set (VMSS)

**What is a Virtual Machine Scale Set?**
A service that allows for automatic scaling of a group of identical, load-balanced VMs.

**Type of Scaling:**
- **Horizontal Scaling**: Increases or decreases the number of VMs based on load.
- **Vertical Scaling**: This involves manually upgrading the size of the VM instances (e.g., moving from a standard to a higher-performance VM type). 

**How Does It Work?**
- Automatically scales VMs in response to rules (e.g., CPU utilization).
- Offers both uniform and flexible orchestration options.

**Limitations:**
- Provisioning time can delay scaling.
- Best suited for stateless applications.
- Limited VM customisation in uniform mode.

# Blob Storage
### The following steps are taken after you have created the app VM from the image you have created and SSH into. [Go onto the "To create image to see how to".](../README.md)

1. Insert `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash` while SSH'd into your VM. This will **download** CLI.
2. Insert `az login`. It will ask you to go to a link and **sign in** via a web browser, giving it the **code** to authenticate. The **code** will be in this same yellow line as the link.
3. **Insert** the code on the browser input and select your account.
4. Once signed in, close the window and **return** to your VM console.
5. **Enter** the number for the subscription you wish to use.

* Cannot use hyphens in the az cli
  
* Create account: `az storage account create --name tech264priyanstorage --resource-group tech264 --location uksouth --sku Standard_LRS`

* `az storage account list --resource-group tech264`: to check the list of the resource group
  
* `az storage account list --resource-group tech264 --query "[].{Name:name, Location:location, Kind:kind}" --output table`: list but in table format

* To create a storage container:
```
az storage container create \
    --account-name tech264priyanstorage \
    --name testcontainer \
    --auth-mode login
```
Add this: `--auth-mode login` to ensure you are authorised. The `\` allows you to type on a new line. 

* To delete storage container: 
```
az storage container delete \
    --account-name tech264priyanstorage \
    --name testcontainer \
    --auth-mode login

```

* To list the containers made: 
```
az storage container list \
    --account-name tech264priyanstorage \
    --output table \
    --auth-mode login

```
* To create a blob:
```  
  az storage blob upload \
    --account-name tech264priyanstorage \
    --container-name testcontainer \
    --name newname.txt \
    --file test.txt \
    --auth-mode login
```
List your blobs:
```
az storage blob list \
    --account-name tech264priyanstorage \
    --container-name testcontainer \
    --output table \
    --auth-mode login
```

* To make the blob public: Check the Blob on the Azure Portal
Go through yout storage account:
* Azure Portal > Storage Account >

To make it public: 

* Change the access level
* Go to storage account
* (on the left) Settings > Configuration > Allow Blob anonymous access (enabble) > click save
* Change access level > (left hand side) Data Storage > Containers > click on the container > change access to 'blob' > click "save".
* refresh and now copy the link into your browser.
 

 ## Steps to get the picture onto the website. 
 1) Create App VM from the image 
 2) Follow the above steps to get the AZ CLI
 3) And download the cat image using the `wget` command with the link address of the cat. `wget -O newname.jpg <url>`
 4) Store this as a blob in a container using the steps above
 5) Make Blob public on the container (Verify this by searching it up)
 6) Add the url for the Blob in the html script under the `/repo/app/views` `index.ejs` and edit it so you have `<img src="https://tech264priyanstorage.blob.core.windows.net/images/uploadedcat.jpg">`
 7) Refresh the page and you should be at the stage as below. 
  
<br>

![With cat Image](image-3.png)