terraform { 
  cloud { 
    
    organization = "nishu7500" 

    workspaces { 
      name = "For-Database-Backend" 
    } 
  } 
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}
