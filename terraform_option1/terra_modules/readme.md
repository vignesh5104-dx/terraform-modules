# Terraform Modular Infrastructure Setup — GCP

This repository provides a modular, environment-based **Terraform setup** for managing **Google Cloud Platform (GCP)** infrastructure.  
It is designed for scalability, consistency, and reusability across multiple environments — `dev`, `stage`, and `prod`.

---

## 📁 Project Structure

```bash
terraform-gcp/
├── provider.tf
├── variables.tf
├── main.tf
├── modules/
│   └── compute-instance/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── envs/
    ├── dev/
    │   └── terraform.tfvars
    ├── stage/
    │   └── terraform.tfvars
    └── prod/
        └── terraform.tfvars



### Folder Description

| Folder | Description |
|---------|-------------|
| **modules/** | Contains reusable Terraform modules. Each module manages a single resource or a set of related resources. |
| **envs/** | Contains environment-specific configurations such as variables and backend settings. |
| **backend.tf** | Stores remote backend configuration (GCS, S3, etc.) for Terraform state. |
| **terraform.tfvars** | Holds environment-specific input variables such as project ID, region, and zone. |

---

## ⚙️ Prerequisites

Ensure the following tools are installed and configured:

- **Terraform ≥ 1.5.0** — [Download here](https://developer.hashicorp.com/terraform/downloads)
- **Google Cloud SDK (`gcloud`)** — [Install here](https://cloud.google.com/sdk/docs/install)
- **GCP credentials** — Authenticate before using Terraform:

```bash
gcloud auth application-default login
