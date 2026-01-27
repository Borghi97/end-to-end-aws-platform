# Terraform Workshop - Infrastructure as Code (IaC)

This repository contains the labs and exercises developed during my 4-session Terraform workshop. The project focuses on deploying a scalable and secure AWS infrastructure using industry best practices.

##  Project Architecture

The infrastructure is decoupled into independent stacks to ensure modularity and security:

* **`00-remote-backend-stack`**: Provisions the foundational resources (S3 Bucket) required to store the Terraform State file remotely. 
* **`01-networking-stack`**: Configures the base network layer (VPC, CIDR blocks) and utilizes the remote backend established in the previous step.
* **`02-ongoing`**: Upcoming lessons (Subnets, IGW, Routing, etc.).

##  Core Concepts Implemented

* **Remote Backend**: Transitioned from local state to S3 storage to enable team collaboration and prevent data loss.
* **State Locking**: (In progress) Using DynamoDB to prevent concurrent execution and state corruption.
* **Variable Objects**: Implemented `type = object` for variables to maintain clean, typed, and organized code.
* **IAM Assume Role**: Using `role_arn` in the provider configuration to follow the principle of least privilege.

##  Getting Started

1.  **Prerequisites**: 
    * Terraform installed.
    * AWS CLI configured with appropriate credentials.
2.  **Deployment**:
    * Navigate to the desired stack folder: `cd 01-networking-stack`.
    * Initialize the backend: `terraform init`.
    * Review changes: `terraform plan`.
    * Deploy: `terraform apply`.

##  Observations
The `.tfstate` files are explicitly ignored via `.gitignore` to prevent sensitive data exposure (secrets, IDs) and to avoid git merge conflicts.