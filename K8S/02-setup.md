# Initial Setup
We first need to create our VMs: a VM for our Control Plane Node and one (or more) for our Worker Nodes. Each machine should be provisionned with:

Ubuntu 22.04LTS OS (any preferred OS)
At least 2GB of RAM
At least 2CPUs.
At least 25GB of disk space.

Else you can follow https://github.com/KRISHNASAFE/dops/blob/main/Docker/01-setup.md or https://github.com/KRISHNASAFE/dops/blob/main/Docker/02-VagrantSetup.md 

# Network on Virtualbox for VM 

You can set value as Bridged Adapter 

<img width="913" height="486" alt="image" src="https://github.com/user-attachments/assets/4f4a6c27-397b-497f-b084-8f876f835ccc" />

OR 
 
Host-Only Adapter


OR 
Create NAT network and Bridged adapter using 2 network adapters. 

I have created cluster using both mention method but I am using Bridged adapter here. 
Also I will provide links for this different setups at the end of this article, you can go through it if you wish. 

# Ubuntu Setup 
Turn on VM and switch 
```
su
usermod -aG sudo $username
reboot
```
# Update & Upgrade Ubuntu 
```
sudo apt-get update
sudo apt-get upgrade

```

# Install required tools 
```
sudo apt install curl apt-transport-https -y
sudo apt install net-tools

```

# Disable swap 
```
sudo swapoff -a 
```
Make permanent swap off
```
sudo sed -i.bak -r 's/(.+ swap .+)/#\1/' /etc/fstab
```






















 
