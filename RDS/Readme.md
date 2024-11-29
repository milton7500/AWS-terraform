# Terraform: AWS RDS, Secrets Manager, and KMS

This Terraform configuration demonstrates how to create an AWS RDS instance, securely store its credentials in AWS Secrets Manager, and create a KMS key to encrypt the database at rest.  This setup emphasizes best practices for security and infrastructure as code.

## Prerequisites

* **AWS Account:** You need an active AWS account with appropriate permissions to create RDS instances, Secrets Manager secrets, and KMS keys.
* **Terraform:** Ensure Terraform is installed and configured with your AWS credentials.  You can configure this using AWS access keys or an IAM role.  See the Terraform documentation for details.
* **AWS Provider:**  Your Terraform configuration must include the AWS provider.

## Architecture

The infrastructure created by this Terraform configuration consists of:

1. **KMS Key:** A Customer Managed Key (CMK) in AWS KMS to encrypt the RDS database at rest.
2. **Secrets Manager Secret:** A secret in AWS Secrets Manager storing the RDS database credentials (username, password).
3. **RDS Instance:** An AWS RDS instance (e.g., MySQL, PostgreSQL) configured with encryption at rest using the KMS key.


## Usage

1. **Clone the repository:** Clone this repository to your local machine.
2. **Configure AWS Credentials:** Ensure your AWS credentials are properly configured for Terraform.
3. **Modify Variables (optional):** Update the `variables.tf` file with your desired configuration, such as:
    * `instance_class`: The RDS instance class (e.g., `db.t3.micro`).
    * `engine`: The database engine (e.g., `mysql`, `postgres`).
    * `db_name`: The name of the database.
    * `db_username`: The database username (this will be stored in Secrets Manager).
    * `db_password`: The database password (this will be stored in Secrets Manager).
    * `allocated_storage`: Storage size in GB.
    * `region`: AWS region.

4. **Initialize Terraform:** Run `terraform init` to initialize the Terraform providers.
5. **Plan the changes:** Run `terraform plan` to review the changes that will be made.
6. **Apply the changes:** Run `terraform apply` to create the infrastructure.
7. **Destroy the infrastructure (when finished):** Run `terraform destroy` to delete the created resources.  **Use caution with this command.**

## Directory Structure

```
├── main.tf          # Main Terraform configuration file
├── variables.tf     # Variable definitions
├── outputs.tf       # Output values
└── README.md        # This file
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.


## License

[Specify your license here, e.g., MIT License]


## Disclaimer

This is a sample Terraform configuration for demonstration purposes.  Adapt and modify it to fit your specific needs and security requirements.  Always review the Terraform plan before applying changes to your infrastructure.  Ensure you understand the implications of using KMS and Secrets Manager before deploying this code in a production environment.
```

Remember to replace the bracketed information with your actual values.  You'll also need to populate `main.tf`, `variables.tf`, and `outputs.tf` with the actual Terraform code to create the resources.  A basic example of `main.tf` is shown below.  You will need to adapt this based on your chosen database engine and requirements.


```terraform
# main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# ... (rest of your terraform code for KMS, Secrets Manager, and RDS) ...
```
