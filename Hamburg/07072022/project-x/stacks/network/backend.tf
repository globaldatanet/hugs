terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "test-mgmt-terraform-state"
    key            = "dev/eu-centra-1/app/terraform.tfstate"
    dynamodb_table = "test-mgmt-terraform-state-lock"
    profile        = "mgmt"
    encrypt        = "true"
  }
}
