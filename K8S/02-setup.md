# Initial Setup
We first need to create our VMs: a VM for our Control Plane Node and one (or more) for our Worker Nodes. Each machine should be provisionned with:

Ubuntu 22.04LTS OS (any preferred OS)
At least 2GB of RAM
At least 2CPUs.
At least 25GB of disk space.

Else you can follow https://github.com/KRISHNASAFE/dops/blob/main/Docker/01-setup.md or https://github.com/KRISHNASAFE/dops/blob/main/Docker/02-VagrantSetup.md 

# Network on Virtualbox for VM 

You can set value as Bridged Adapter 
<img width="942" height="493" alt="image" src="https://github.com/user-attachments/assets/316c2720-5ea3-486a-9a19-e1f7cdc0d7f3" /> 
 OR 
 Host-Only Adapter
 <img width="941" height="467" alt="image" src="https://github.com/user-attachments/assets/71dc1c84-4c58-4bad-9261-8efe81e57211" />
OR 
Create NAT network and Bridged adapter using 2 network adapters. 

I have created cluster using both mention method but I am using Bridged adapter here. 
Also I will provide links for this different setups at the end of this article, you can go through it if you wish. 

# Ubuntu Setup 
Turn on VM and switch 
```
function test(){
console.log("This block of code will have copy button at right of it");
su 
}
```
