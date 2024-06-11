# Setting Up a Non-High Availability K3s Cluster with Ansible

This repository contains an Ansible playbook for setting up a non-high availability (HA) K3s cluster with one master node and one or several worker nodes.
Additionally, it includes security improvements for the underlying Linux system.

## Requirements

* Ansible installed on the control node
* Remote hosts with Ubuntu or CentOS installed

## Usage

Clone this repository to your local machine:

```bash
git clone git@github.com:moejitow/k3s-ansible-setup.git
```

Navigate to the cloned directory:

```bash
cd k3s-ansible
```

Update the hosts file with the IP addresses or hostnames of your master and worker nodes:

```ini
[master]
master ansible_host=master_ip

[worker]
worker1 ansible_host=worker1_ip
worker2 ansible_host=worker2_ip
```

Run the playbook:

```bash
ANSIBLE_REMOTE_USER=some_remote_user ansible-playbook -i hosts site.yaml
```

## What Does the Playbook Do?

* Installs K3s on the master and worker nodes
* Initializes the K3s cluster with the provided token
* Sets up the master node as the server and worker nodes as agents
* Applies security improvements to the underlying Linux system:
  * Configures SSH hardening
  * Installs and configures unattended-upgrades and ntp

## Additional Notes

* This playbook assumes you have SSH access to the target hosts using key-based authentication.
* Ensure that your target hosts have sufficient resources to run K3s and the desired workloads.
* Customize the playbook further based on your specific requirements and environment.
