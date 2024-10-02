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
  - [8. Market Share - Cloud Trends:](#8-market-share---cloud-trends)
  - [9. What are the 3 largest Cloud providers known for?](#9-what-are-the-3-largest-cloud-providers-known-for)
  - [10. Which cloud provider might be the best? Why?](#10-which-cloud-provider-might-be-the-best-why)
  - [11. What do you usually pay for in the cloud?](#11-what-do-you-usually-pay-for-in-the-cloud)
  - [12. What are the 4 Pillars of DevOps, and how do they link into the Cloud?](#12-what-are-the-4-pillars-of-devops-and-how-do-they-link-into-the-cloud)
- [Linux](#linux)
  - [**Common Commands:**](#common-commands)

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
- **SaaS (Software as a Service)**: Delivers software applications via the internet, accessible through a browser.
  

![alt text](image.png)

| Service Type | Example | Description |
| ------------ | ------- | ----------- |
| IaaS | AWS EC2 | Provides virtual machines and storage. |
| PaaS | Google App Engine | Platform to develop and deploy apps. |
| SaaS | Dropbox | Ready-to-use applications accessible online. |

## 5. Advantages/Disadvantages of the Cloud for Businesses:

### Advantages:
- Scalability
- Cost-effective
- Access to advanced technologies
- Less maintenance
- Disaster recovery
- Automatic updates 

### Disadvantages:
- Security risks
- Limited control
- Ongoing costs
- Limited control 
- Downtime

## 6. Difference Between OpEx vs CapEx:
- **OpEx (Operational Expenditure)**: Ongoing costs for running services (e.g., cloud subscription).
- **CapEx (Capital Expenditure)**: Upfront investment in physical infrastructure (e.g., data centers).
- **Cloud**: Shifts costs from CapEx to OpEx, making costs more predictable but continuous.

## 7. Is migrating to the cloud always cheaper?
* While the cloud offers lower upfront costs, long-term costs can be higher due to recurring subscription fees, especially for large-scale operations.
* For cloud services there are cost optimisation tools that can keep costs down. AWS has Trusted Advisor and other tools to help with this. 
* AWS has a pay as you go model. 


## 8. Market Share - Cloud Trends:

**Market Breakdown:**
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
- Data transfer
- Additional services like security, databases, and networking

## 12. What are the 4 Pillars of DevOps, and how do they link into the Cloud?
1. **Collaboration**: Cloud enables team collaboration through shared resources.
2. **Automation**: Cloud platforms allow for automated scaling and deployment.
3. **Continuous Integration/Delivery**: Cloud environments facilitate seamless CI/CD pipelines.
4. **Monitoring**: Cloud providers offer integrated monitoring tools for proactive issue detection.


# Linux
## **Common Commands:** 
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

