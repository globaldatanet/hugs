resource "github_repository" "demo" {
  name        = "tf-cloud-demo"
  description = "My awesome terraform codebase"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "main" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/../../stacks/s3/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "providers" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "providers.tf"
  content             = file("${path.module}/../../stacks/s3/providers.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "variables" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("${path.module}/../../stacks/s3/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "outputs" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "outputs.tf"
  content             = file("${path.module}/../../stacks/s3/outputs.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "dev" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "env/dev/terraform.tfvars"
  content             = file("${path.module}/../../stacks/s3/terraform.tfvars")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "prod" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "env/prod/terraform.tfvars"
  content             = ""
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "dev_backend" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "env/dev/remote.tfbackend"
  content             = file("${path.module}/../../stacks/s3/remote.tfbackend")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}

resource "github_repository_file" "prod_backend" {
  repository          = github_repository.demo.name
  branch              = "main"
  file                = "env/prod/remote.tfbackend"
  content             = ""
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@globaldatanet.com"
  overwrite_on_create = true
}
