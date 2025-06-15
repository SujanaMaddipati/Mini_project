# 🚀 Mini Project: Deploy Dockerized App on AWS EKS using Terraform

This project demonstrates how to build and deploy a Dockerized application to an AWS EKS cluster using infrastructure-as-code with Terraform.

---

## 🧰 Tech Stack

- **AWS EKS** – Elastic Kubernetes Service
- **Terraform** – Infrastructure as Code
- **Docker** – Containerization
- **Kubernetes** – Container Orchestration
- **GitHub** – Version Control

---

## 🛠️ Infrastructure Setup

Infrastructure is managed using Terraform and includes:

- **VPC** with public and private subnets
- **IAM Roles** for EKS and Worker Nodes
- **Security Groups**
- **EKS Cluster** and Node Group
- **S3 + DynamoDB** for Terraform backend

---

## 📦 Docker Setup

1. Docker image built for the application
2. Pushed to [Docker Hub](https://hub.docker.com/) or Amazon ECR

---

## ☸️ Kubernetes Deployment

- Kubernetes manifests (`deployment.yaml`, `service.yaml`) created for:
  - Deploying pods
  - Exposing the service

---

## 📂 Project Structure

```bash
Mini_Project/
├── Modules/
│   ├── VPC/
│   ├── IAM/
│   ├── EKS/
│   └── security_group/
|   |__ k8s-manifests/
├── deployment.yaml
├── service.yaml
├── Dockerfile
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
How to Run
# 1. Initialize Terraform
terraform init

# 2. Plan the resources
terraform plan

# 3. Apply the infrastructure
terraform apply

# 4. Build Docker image
docker build -t <your-image-name> .

# 5. Push to Docker Hub / ECR
docker push <your-image-name>

# 6. Deploy to EKS
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

