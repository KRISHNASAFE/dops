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

<img width="923" height="421" alt="image" src="https://github.com/user-attachments/assets/51de1194-5ae1-461b-b07e-2d388abbaa00" />

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

On each VM get your static IP: -
```
ifconfig
ip a 
```
Note down ip address for enp0s3 for bridged adapter. 

Alternatively you can run 
```
ip addr show | grep enp0s3
```
Note down IP and take out ' /24 ' range from address.

Get hostname on each VM 
```
hostname
```

Edit each VMs hosts file (Be careful) 
```
sudo vi /etc/hosts
```
OR 
```
sudo nano /etc/hosts
```

For every VM, add the IP and  Hostname of other VMs it will communicate with .

```
192.168.xxx.xxx worker1 # For every node, add IP and HOSTNAME
``` 
# Enable kernel module & Configure systemctl
Enable kernel modules
```
sudo modprobe overlay
sudo modprobe br_netfiletr
```

Configure systemctl
```
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
```
Reload sysctl
```sudo sysctl --version```

# Install a container runtime
Configure persistent loading of modules
```
sudo tee /etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF
```

Ensure you load modules 
```
sudo modprobe overlay
sudo modprobe br_netfiletr
```

Set up required sysctl params

```
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
```

Reload sysctl
```
sudo sysctl --version
```

Install CRI-O
```
sudo apt update
sudo apt install cri-o cri-o-runc
```

Start, enable & check service
```
sudo systemctl daemon-reload
sudo systemctl restart crio
sudo systemctl enable crio
systemctl status crio
```

# Install Kubelet, Kubeadm, Kubectl
```
curl -fsSL  https://packages.cloud.google.com/apt/doc/apt-key.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/k8s.gpg
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install wget git kubelet kubeadm kubectl -y
sudo apt-mark hold kubelet kubeadm kubectl
```

# Initiate Control Plane Only
Enable kubelet service 
```
sudo systemctl enable kubelet
```

```
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```

setup kube config file
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Check cluster status
```
kubectl cluster-info
```

# Use CNI 
I have used calico as network interface. 
***************************************************
Why --pod-network-cidr=192.168.0.0/16?
This sets the CIDR for the pod network.
Calico requires this to route traffic between pods.
***************************************************

# Apply Calico manifest 

```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml
```

# Join worker nodes
```
kubeadm join 192.168.XXX.XXX:6443 --token  $your_token\
  --discovery-token-ca-cert-hash $your_hash
```
You can join any number of worker nodes by executing command as root.

Check below image :

<img width="940" height="364" alt="image" src="https://github.com/user-attachments/assets/bbb9faa8-ed61-4322-a75d-4080c9981d0b" />

# Additional Notes
If want take snapshot of initial nodes. This will allow you to restore your initial cluster state all time.

# References & Additional Links

<a href="https://www.virtualbox.org/manual/ch06.html">Networking</a>
<a href="https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/">Installing Kubeadm</a>
<a href="https://cri-o.io/">CRI-O</a>
<a href="https://medium.com/@gunjangarge/create-kubernetes-cluster-using-kubeadm-on-ubuntu-virtualbox-step-by-step-68a3eeb1f74c"></a>
<a href="https://github.com/hereishd/K8S-Cluster-From-Scratch/tree/main"></a>
<a href="https://hacksheets.in/kubernetes-cluster-setup-in-laptop-using-virtualbox/"></a>

This link also involves setups done by other people which help me to understand some topics, necessary settings. You also can refer them and setup your cluster.




























 
