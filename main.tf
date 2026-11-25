terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_ssm_parameter" "gitops_demo" {
  name  = "/project18/ovais/gitops/run-final"
  type  = "String"
  value = "deployed-via-gitops-v1"

  tags = {
    Project = "Project18-GitOps"
    Managed = "Terraform"
  }
}

output "parameter_name" {
  value = aws_ssm_parameter.gitops_demo.name
}
