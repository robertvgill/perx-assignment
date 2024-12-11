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
2. **Install Ansible**:
   ```bash
   sudo apt update
   sudo apt install -y ansible

## Setup Instructions

### Installing Prerequisites

1. **Install KinD using Podman**:
   ```bash
   sudo curl -Lo /usr/local/bin/kind "https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64"
   sudo chmod +x /usr/local/bin/kind

