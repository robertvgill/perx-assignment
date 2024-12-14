# Perx Assignment: Kubernetes Cluster Setup and Application Deployment

This repository demonstrates the process of setting up a local Kubernetes cluster using **KinD** (Kubernetes in Docker) with **Podman**, followed by deploying **MySQL** and the **trades** application using **ArgoCD**.

The entire setup was performed in a **WSL (Windows Subsystem for Linux)** environment running **Ubuntu 22.04**.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [Step 1: Install KinD using Podman](#step-1-install-kind-using-podman)
  - [Step 2: Run the Ansible Playbook](#step-2-run-the-ansible-playbook)
  - [Step 3: Deploy with ArgoCD](#step-3-deploy-with-argocd)
- [Directory Structure](#directory-structure)
- [Additional Notes](#additional-notes)

## Prerequisites

Before you begin, ensure the following tools are installed on your system:

- **WSL** installed on your Windows machine.
- **Ubuntu 22.04** running inside WSL.
- **Ansible** installed (version >= 2.9).
- **Podman** installed (for running Docker containers).
- **kubectl** installed (for managing Kubernetes clusters).
- **ArgoCD** installed (for application deployment in Kubernetes).

### Installing Prerequisites

1. **Install Podman**:
   ```bash
   sudo apt update
   sudo apt install -y podman
   ```
2. **Install Ansible**:
   ```bash
   sudo apt update
   sudo apt install -y ansible
   ```
## Setup Instructions

### Step 1: Install KinD using Podman
   ```bash
   sudo curl -Lo /usr/local/bin/kind "https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64"
   sudo chmod +x /usr/local/bin/kind
   ```
### Step 2: Run the Ansible Playbook
   ```bash
  cd ~/perx-assignment/ansible
  ANSIBLE_CONFIG=./ansible.cfg ansible-playbook -i inventories/hosts playbook.yml --extra-vars "env=devel"
   ```
### Step 3: Perform load testing with Makefile
   ```bash
  cd ~/perx-assignment/test
  make loadtest
   ```

## Directory Structure
```
/perx-assignment/
.
├── README.md
├── ansible
│   ├── ansible.cfg
│   ├── cluster-config-devel.bak
│   ├── cluster-config-devel.yml
│   ├── inventories
│   │   ├── hosts
│   │   └── hosts.bk
│   ├── playbook.yml
│   ├── roles
│   │   ├── argocd
│   │   │   └── tasks
│   │   │       ├── main.wip
│   │   │       └── main.yml
│   │   └── kind
│   │       ├── tasks
│   │       │   └── main.yml
│   │       └── templates
│   │           └── kind-cluster-config.j2
│   └── vars
│       └── devel.yml
├── argocd
│   ├── mysql.yml
│   └── trades.yml
├── helm
│   ├── mysql
│   │   ├── Chart.yaml
│   │   ├── charts
│   │   ├── templates
│   │   │   ├── NOTES.txt
│   │   │   ├── _helpers.tpl
│   │   │   ├── configmap.yaml
│   │   │   ├── deployment.bak
│   │   │   ├── hpa.yaml
│   │   │   ├── mysql-replication-job.bak
│   │   │   ├── secret.yaml
│   │   │   ├── service.yaml
│   │   │   └── statefulset.yaml
│   │   └── values.yaml
│   └── trades
│       ├── Chart.yaml
│       ├── charts
│       ├── templates
│       │   ├── NOTES.txt
│       │   ├── _helpers.tpl
│       │   ├── configmap.yaml
│       │   ├── deployment.yaml
│       │   ├── hpa.yaml
│       │   └── service.yaml
│       └── values.yaml
└── test
    └── Makefile
```

## Additional Notes

- **Environment**: This setup was performed on **WSL** running **Ubuntu 22.04**.
- **Ansible Playbook**: Automates the configuration of a local Kubernetes cluster using KinD and Podman.
- **ArgoCD**: After applying the manifests, MySQL and the trades application are managed by ArgoCD for continuous deployment and delivery.

