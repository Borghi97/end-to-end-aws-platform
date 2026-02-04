# Terraform Workshop - Infrastructure as Code (IaC) 🚀

This repository contains the infrastructure developed during a comprehensive Terraform workshop. The project focuses on deploying a scalable, secure, and modularized AWS platform using industry best practices.

##  Project Architecture

The infrastructure is decoupled into independent stacks and reusable modules to ensure modularity and scalability:

* **`00-remote-backend-stack`**: Provisions the foundational resources (S3 Bucket) required to store the Terraform State file remotely.
* **`01-networking-stack`**: Configures the core network layer (VPC, CIDR blocks) utilizing the remote backend and modularized structures.
* **`modules/vpc`**: A custom, reusable module for VPC creation, designed to handle subnets, routing, and internet gateways efficiently.

##  Core Concepts Implemented

* **Modular Infrastructure**: Transitioned to a module-based approach (VPC Module) to promote code reusability and cleaner root configurations.
* **Remote Backend**: State management using S3 storage to enable team collaboration and ensure state persistence.
* **State Locking**: (In progress) Integration with DynamoDB to prevent concurrent executions and state corruption.
* **Advanced Variables**: Extensive use of `type = object` for variables to maintain a strictly typed and organized codebase.
* **Security (IAM Assume Role)**: Leveraging `role_arn` in provider configurations to follow the principle of least privilege.

##  Network Features (New)
The latest updates include:
- **VPC Segmentation**: Logic for public and private subnet distribution.
- **Multi-AZ Deployment**: Preparation for high availability across different Availability Zones.
- **Resource Tagging**: Standardized tagging for better resource management in the AWS Console.

##  Getting Started

1.  **Prerequisites**: 
    * Terraform CLI installed.
    * AWS CLI configured with appropriate credentials.
2.  **Deployment**:
    * Navigate to the desired stack folder (e.g., `cd 01-networking-stack`).
    * Initialize the backend: `terraform init`.
    * Review the execution plan: `terraform plan`.
    * Apply changes: `terraform apply`.

##  Observations
The `.tfstate` and `.tfvars` files containing sensitive information are explicitly ignored via `.gitignore` to prevent security leaks and merge conflicts.

---
 **Author:** [Borghi97](https://github.com/Borghi97)