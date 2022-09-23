terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.1.0"
    }
  }
}

provider "github" {
  owner = "globaldatanet"
}
