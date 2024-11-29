# Terraform: AWS EC2 Instance with VPC, Security Group, and Network Interface

This Terraform configuration deploys an AWS EC2 instance within a Virtual Private Cloud (VPC), including a security group and network interface.  It's designed for ease of use and understanding.

## Prerequisites

* An AWS account with appropriate permissions.
* Terraform installed on your local machine.
* AWS credentials configured using the AWS CLI or environment variables.  Terraform will use these credentials to interact with your AWS account.

## Architecture

This setup creates the following AWS resources:

* **VPC:** A virtual private cloud to isolate your resources.
* **Subnet:** A subnet within the VPC, where the EC2 instance will reside.  (This example uses a single public subnet for simplicity; consider multiple AZs and private subnets for production deployments.)
* **Security Group:** A security group that controls inbound and outbound traffic to the EC2 instance.  (Configure rules based on your needs.  The example includes SSH access.)
* **Network Interface:** A network interface attached to the EC2 instance, allowing it to communicate within the VPC.
* **EC2 Instance:**  An Amazon EC2 instance launched in the specified subnet.

## Usage

1. **Clone this repository:**  (Or copy the Terraform files)
2. **Initialize Terraform:**
   ```bash
   terraform init
   ```
3. **Plan the deployment:**
   ```bash
   terraform plan
   ```
4. **Apply the changes:**
   ```bash
   terraform apply
   ```
   This will create the resources in your AWS account.  Review the plan carefully before applying.
5. **Output:** After a successful `terraform apply`, Terraform will output the public IP address of your EC2 instance.

6. **Destroy the resources:** When you're finished, use the following command to delete all created resources:
   ```bash
   terraform destroy
   ```

## Customization

* **`main.tf`:** Modify this file to customize the instance type (`instance_type`), AMI ID (`ami`), key pair name (`key_name`), security group rules, VPC CIDR, subnet CIDR, etc., based on your requirements.  Refer to the AWS documentation for available options.
* **AMI ID:** Ensure you specify a correct AMI ID for your region.  Using the wrong AMI will lead to deployment failures.
* **Security Group Rules:**  Adjust the security group rules to allow only necessary traffic.  Restricting access is crucial for security.


## Important Notes

* This example uses a single availability zone.  For high availability, consider multiple availability zones and appropriate subnet configurations.
* Properly manage your AWS credentials.  Avoid hardcoding them directly into the Terraform configuration.
* This is a basic example.  For production deployments, consider adding more advanced features like:
    * Auto-scaling
    * Load balancing
    * Elastic IP addresses
    * More robust security configurations
    * Data backup and recovery


This README provides a starting point.  Refer to the official Terraform and AWS documentation for detailed information.
```

Remember to actually create the `main.tf` file with the necessary Terraform code to deploy the resources described in the README.  A sample `main.tf` is provided below:

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
  region = "us-west-2" # Replace with your desired region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a" # Replace with your desired AZ
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Consider restricting this in production
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b31ad2299a701" # Replace with a suitable AMI ID for your region
  instance_type = "t2.micro"
  key_name      = "your_key_pair_name" # Replace with your key pair name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  network_interface {
    subnet_id = aws_subnet.main.id
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
```

Remember to replace placeholders like `"ami-0c55b31ad2299a701"` and `"your_key_pair_name"` with your actual values.  Also adjust the region and AZ as needed.  This expanded response provides a functional example alongside the README.md.
