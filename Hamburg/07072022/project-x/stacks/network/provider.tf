provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn = "account1"
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn = "account1"
  }
}
