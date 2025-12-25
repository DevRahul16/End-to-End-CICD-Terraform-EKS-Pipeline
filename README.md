# End‑to‑End CICD Pipeline with Terraform, Jenkins & AWS EKS

🚀 This repository demonstrates a complete **end‑to‑end CI/CD pipeline** where application code changes automatically trigger build, containerization, infrastructure provisioning, and deployment to **Amazon EKS**.

This project closely reflects **real‑world DevOps production workflows** using Infrastructure as Code and Kubernetes‑based deployments.

---

## 🧩 Architecture Overview

**CI/CD Flow**
1. Developer pushes code to GitHub  
2. GitHub Webhook triggers Jenkins  
3. Jenkins builds Docker image  
4. Image is pushed to Docker Hub / ECR  
5. Terraform provisions AWS infrastructure  
6. Application is deployed to Amazon EKS  
7. AWS Load Balancer exposes the application  

📌 Architecture diagram should be placed at:
```
docs/architecture.png
```

---

## 🛠️ Tech Stack

| Category | Tools |
|--------|------|
| Cloud | AWS (EC2, EKS, VPC, IAM, ELB) |
| CI/CD | Jenkins |
| IaC | Terraform |
| Containers | Docker |
| Orchestration | Kubernetes |
| Configuration Mgmt | Ansible |
| SCM | GitHub |

---

## 📂 Repository Structure

```
├── ansible/            # Jenkins & dependency installation
├── app/                # Sample Node.js application
├── k8s/                # Kubernetes manifests
├── terraform/          # Terraform infrastructure code
├── Dockerfile          # Docker image definition
├── Jenkinsfile         # CI/CD pipeline
├── docs/               # Architecture diagram
├── README.md           # Documentation
```

---

## ⚙️ Prerequisites

- AWS account
- Terraform >= 1.x
- AWS CLI configured
- kubectl installed
- Jenkins server (EC2 recommended)
- Docker installed
- Jenkins plugins:
  - Git
  - Docker Pipeline
  - AWS Credentials

---

## 🚀 Setup Guide

### 1️⃣ Jenkins Server Setup
- Instance: t2.medium
- OS: Ubuntu
- Open ports: 22, 8080, 80, 443

---

### 2️⃣ Install Jenkins & Tools (Ansible)

```bash
ansible-playbook ansible/install_jenkins.yaml -i ansible/inventory
ansible-playbook ansible/install_dependencies.yaml -i ansible/inventory
ansible-playbook ansible/install_helm.yaml -i ansible/inventory
```

---

### 3️⃣ Jenkins Configuration

1. Add AWS credentials in Jenkins  
2. Create pipeline job  
3. Select SCM → Git  
4. Repository URL → this GitHub repo  
5. Script Path → `Jenkinsfile`  

---

### 4️⃣ CI/CD Pipeline Stages

- Git Checkout
- Docker Build
- Docker Push
- Terraform Init & Apply
- Kubernetes Deployment
- Rolling Update on EKS

---

## ✅ Verification

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>
kubectl get nodes
kubectl get pods
kubectl get svc
```

Access the application using the **Load Balancer DNS**.

---

## 🧹 Cleanup

```bash
cd terraform
terraform destroy -auto-approve
```

---

## 🔐 Best Practices Followed

- Infrastructure as Code
- Automated CI/CD
- Rolling deployments
- Scalable Kubernetes architecture
- Separation of concerns

---

## 👤 Author

**Rahul Hari Kumar**  
GitHub: https://github.com/DevRahul16

---

⭐ If you found this project useful, give it a star!
