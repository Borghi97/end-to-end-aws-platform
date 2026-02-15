# Full-Stack AWS Platform & GitOps Implementation

This repository contains a complete end-to-end cloud platform, integrating a .NET backend and a Next.js frontend with a robust CI/CD pipeline and GitOps deployment strategy.

##  Project Architecture

The project is organized into two primary repositories to separate application logic from infrastructure state:

* **`end-to-end-aws-platform`**: The application source code repository.
* **`backend`**: A .NET 8.0 Web API designed for scalability.
* **`frontend`**: A Next.js 14 application providing the user interface.
* **`github/workflows`**: GitHub Actions definitions for Continuous Integration.
* **`gitops`**: The source of truth for the cluster state.
* **`kubernetes`**: Contains Kubernetes manifests (Deployments, Services, Ingress).
* **`kustomize`**: Configuration for environment-specific overlays and image tag management.

##  Core Technical Updates

* **Next.js 14 Docker Optimization**: Implementation of a multi-stage Dockerfile tailored for Next.js. It handles the specific build output of the .next directory and ensures all production dependencies are correctly mapped within a monorepo context.
* **Monorepo Context Management**: Docker builds are now executed from the repository root. This allows the .NET compiler to resolve project references across different directories while maintaining a clean build environment.
* **Automated Image Tagging**: The CI pipeline automatically builds, tags, and pushes images to Amazon ECR. It then programmatically updates the GitOps repository with the new image SHA, ensuring the cluster stays in sync with the latest code.
* **Secret Management**: Secure integration with GitHub Secrets and Personal Access Tokens (PAT) to allow cross-repository communication between the application and GitOps repositories.

##  Network and Deployment Features

- **Amazon ECR Integration**: Private container registries for secure image storage.
- **Amazon EKS Orchestration**: Deployment targets a managed Kubernetes environment.
- **GitOps Workflow**: Utilizes the "Push-to-Deploy" model where the GitHub Action acts as the bridge between the application build and the declarative infrastructure state.
- **Environment Consistency**: Use of Docker environment variables to ensure the ASPNETCORE_ENVIRONMENT and NODE_ENV are optimized for production.

##  Getting Started

1.  **Prerequisites**: 
    * Docker Desktop or Docker Engine installed.
    * Access to an AWS Environment with ECR and EKS configured.
    * GitHub Personal Access Token (PAT) with repo scope configured as a secret.
2.  **Local Development**:
    * Backend: Navigate to backend/YoutubeLiveApp and run dotnet run.
    * Frontend: Navigate to frontend/youtube-live-app, run npm install followed by npm run dev.

3.  **CI/CD Execution**:
    * Pushing to the main branch triggers the continuous-deployment.yml workflow.
    * Monitor the "Actions" tab to verify the build, push, and GitOps update steps.

##  Observations

The Dockerfiles have been updated to utilize specific working directories (/app/dvn-workshop-apps/...) to prevent path resolution errors during the npm ci and dotnet publish phases.

---
 **Author:** [Borghi97](https://github.com/Borghi97)