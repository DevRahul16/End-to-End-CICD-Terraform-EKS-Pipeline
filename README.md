
# 🚀 End-to-End CI/CD Pipeline on AWS EKS (Step-by-Step Guide)

This repository contains a **complete beginner-friendly, step-by-step DevOps project** that you can **copy, paste, and practice**.
All commands are written in **code blocks**, so GitHub automatically shows a **copy button** for easy execution.

---

## 🧱 Project Architecture

Upload the architecture image to the path below so GitHub renders it automatically:

```
docs/architecture.png
```

![Architecture Diagram](docs/architecture.png)

---

## 🛠️ Tech Stack Used

- AWS EC2 (Jenkins Server)
- AWS EKS (Kubernetes)
- AWS ECR (Docker Images)
- AWS Application Load Balancer
- Jenkins (CI/CD)
- Ansible (Automation)
- Terraform (Infrastructure as Code)
- Docker
- Kubernetes
- Ubuntu 24.04
- Instance type: **t2.medium (4 GiB RAM)**

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

# 🪜 STEP-BY-STEP EXECUTION GUIDE
Follow **each step in order**.

---

## STEP 1️⃣ — Launch Jenkins EC2

- OS: Ubuntu 24.04
- Instance type: **t2.medium**
- Storage: 30–40 GB
- Open ports: 22, 8080, 80, 443

---

## STEP 2️⃣ — SSH into EC2

```bash
ssh -i linux1.pem ubuntu@<EC2_PUBLIC_IP>
```

---

## STEP 3️⃣ — Install Ansible

```bash
sudo apt update
sudo apt install ansible -y
```

---

## STEP 4️⃣ — Clone the GitHub Repository

```bash
git clone https://github.com/DevRahul16/end-to-end-cicd-terraform-eks-pipeline.git
cd end-to-end-cicd-terraform-eks-pipeline
```

---

## STEP 5️⃣ — Update Ansible Inventory

📄 File: `ansible/inventory`

```ini
[jenkins]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/linux1.pem
```

---

## STEP 6️⃣ — Verify Ansible Connectivity

```bash
ansible jenkins -i ansible/inventory -m ping
```

Expected output:
```
pong
```

---

## STEP 7️⃣ — Run Ansible Playbooks

```bash
ansible-playbook ansible/install_jenkins.yaml -i ansible/inventory
ansible-playbook ansible/install_dependencies.yaml -i ansible/inventory
ansible-playbook ansible/install_helm.yaml -i ansible/inventory
```

---

## STEP 8️⃣ — Open Jenkins UI

```
http://<EC2_PUBLIC_IP>:8080
```

Unlock Jenkins:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## STEP 9️⃣ — Add AWS Credentials in Jenkins

Path:
```
Manage Jenkins → Credentials → Global → Add Credentials
```

Add:
- AWS Access Key
- AWS Secret Key

---

## STEP 🔟 — Create Jenkins Pipeline Job

- New Item → Pipeline
- Name: `eks-cicd-pipeline`
- SCM: Git
- Repo URL:
```text
https://github.com/DevRahul16/end-to-end-cicd-terraform-eks-pipeline.git
```
- Branch: `main`
- Script Path: `Jenkinsfile`

---

## STEP 1️⃣1️⃣ — Run Pipeline

Click **Build Now**

⏳ First run may take **10–15 minutes** (EKS creation).

---

## STEP 1️⃣2️⃣ — Configure kubectl for EKS

```bash
aws eks update-kubeconfig --region ap-south-1 --name my-eks-cluster
```

---

## STEP 1️⃣3️⃣ — Verify Kubernetes Resources

```bash
kubectl get nodes
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

## STEP 1️⃣4️⃣ — Access Application

```bash
kubectl get ingress
```

Open the **ALB DNS** in browser.

---

## STEP 1️⃣5️⃣ — Monitoring

```bash
kubectl top nodes
kubectl top pods
```

---

## STEP 1️⃣6️⃣ — Cleanup (Important)

```bash
cd terraform
terraform destroy -auto-approve
```

---

## 👤 Author

**Rahul Hari Kumar**  
GitHub: https://github.com/DevRahul16  

---


