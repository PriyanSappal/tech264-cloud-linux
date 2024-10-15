#!/bin/bash

# configure iptables

echo "Configuring iptables..."

# Allow all incoming and outgoing traffic on the loopback interface (lo).
# The loopback interface is used for internal communications on the machine.
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Allow incoming traffic for connections that are already established or related to an existing connection.
# This ensures ongoing communications can continue, without being blocked.
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing traffic for connections that are already established.
# This ensures outgoing traffic for ongoing connections is not blocked.
sudo iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT

# Drop invalid packets, which could be potentially harmful or part of a malformed connection.
# This helps with basic security to avoid malicious traffic.
sudo iptables -A INPUT -m state --state INVALID -j DROP

# Allow incoming SSH traffic on port 22 for new and established connections.
# Only allows connections that start a new SSH session or are part of an ongoing SSH session.
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow outgoing traffic on port 22 for established SSH sessions.
# Ensures that established SSH connections can continue outgoing communication.
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# uncomment the following lines if you want to allow SSH into NVA only through the public subnet (app VM as a jumpbox)
# This will allow SSH connections from the public subnet (e.g., app VM as a jumpbox).
# It's useful once the NVA's public IP is removed for better security.
# sudo iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
# sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# uncomment the following lines if you want to allow SSH to other servers using the NVA as a jumpbox
# If you want to make outgoing SSH connections from NVA to other servers (SSH forwarding).
# sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Allow forwarding of traffic from the public subnet (10.0.2.0/24) to the private subnet (10.0.4.0/24) 
# on port 27017, which is typically used for MongoDB.
sudo iptables -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.4.0/24 --destination-port 27017 -m tcp -j ACCEPT

# Allow ICMP (ping) traffic between the public subnet (10.0.2.0/24) and the private subnet (10.0.4.0/24).
# This is used to verify communication between the two subnets.
sudo iptables -A FORWARD -p icmp -s 10.0.2.0/24 -d 10.0.4.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT

# Set the default policy for the INPUT chain to DROP.
# This means any incoming traffic that hasn't been explicitly allowed will be dropped.
sudo iptables -P INPUT DROP

# Set the default policy for the FORWARD chain to DROP.
# This means any forwarded traffic that isn't explicitly allowed will be dropped.
sudo iptables -P FORWARD DROP

echo "Done!"
echo ""

# Make iptables rules persistent
# This ensures that the iptables rules are saved and will persist after a reboot.
echo "Make iptables rules persistent..."
sudo DEBIAN_FRONTEND=noninteractive apt install iptables-persistent -y
echo "Done!"
echo ""