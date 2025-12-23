
# 🚀 End-to-End CI/CD Pipeline on AWS EKS (Cost Optimized)

## 📌 Project Overview
This project demonstrates a **real-world, end-to-end CI/CD pipeline** built using **Jenkins, Ansible, Terraform, Docker, and AWS EKS**.
The pipeline automatically provisions infrastructure, builds container images, and deploys an application to Kubernetes in a **cost-optimized (free-tier friendly) setup**.

---

## 🧱 Architecture Diagram

> 📌 Upload the architecture image in `docs/architecture.png` and GitHub will render it automatically.

![Architecture Diagram](docs/architecture.png)

---

## 🔧 Tech Stack

| Category | Tools |
|--------|------|
| Cloud | AWS (EC2, EKS, ECR, ALB, IAM, VPC) |
| CI/CD | Jenkins |
| Configuration | Ansible |
| IaC | Terraform |
| Containers | Docker |
| Orchestration | Kubernetes (EKS) |
| OS | Ubuntu 24.04 |
| Instance Type | t2.micro (cost optimized) |

---

## 📂 Repository Structure

```
.
├── Jenkinsfile
├── Dockerfile
├── README.md
├── ansible/
│   ├── inventory
│   ├── install_jenkins.yaml
│   ├── install_dependencies.yaml
│   └── install_helm.yaml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── eks/
│       └── node-group.tf
├── app/
│   ├── server.js
│   ├── package.json
│   └── public/index.html
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── docs/
    └── architecture.png
```

---

## 🔁 CI/CD Flow (Simple Explanation)

1. Developer pushes code to GitHub
2. Jenkins pipeline is triggered
3. Jenkins uses Ansible to configure tools
4. Docker image is built and pushed to Amazon ECR
5. Terraform provisions AWS infrastructure (VPC + EKS)
6. Application is deployed to EKS
7. Application is exposed using AWS Application Load Balancer

---

## 🪜 Step-by-Step Execution (High Level)

1. Launch Jenkins EC2 (Ubuntu 24.04, t2.micro)
2. Configure Ansible inventory with EC2 IP
3. Run Ansible playbooks to install tools
4. Push code to GitHub
5. Create Jenkins pipeline using Jenkinsfile
6. Run pipeline
7. Access application via ALB DNS

---

## 💰 Cost Optimization Notes

- t2.micro used for EC2 & EKS worker node
- Single node EKS cluster
- Minimal Kubernetes resources
- Monitoring limited to `kubectl top`
- Storage increased instead of compute

⚠️ **Note:** EKS control plane has a fixed cost (~$0.10/hour).

---

## ✅ Verification Commands

```bash
kubectl get nodes
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

## 🧹 Cleanup (Important)

To avoid AWS billing:

```bash
terraform destroy -auto-approve
```

Also delete unused ECR images manually.

---

## 👤 Author

**Rahul Kumar**  
GitHub: https://github.com/DevRahul16  

---

## ⭐ If you found this project useful
Please give it a ⭐ on GitHub!
