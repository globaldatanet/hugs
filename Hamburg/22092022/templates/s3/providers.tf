terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "{{ (datasource "config").terraform.required_providers.aws.version }}"
    }
  }
}

provider "aws" {
  region = var.region
}
