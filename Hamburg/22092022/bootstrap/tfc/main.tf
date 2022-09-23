terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.36.1"
    }
  }
}

provider "tfe" {}

data "tfe_organization" "this" {
  name = "globaldatanet"
}

resource "tfe_variable_set" "aws_access" {
  name         = "aws_access"
  description  = "AWS Access Keys"
  global       = true
  organization = data.tfe_organization.this.name
}

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = ""
  category        = "env"
  description     = "AWS_ACCESS_KEY_ID"
  sensitive       = true
  variable_set_id = tfe_variable_set.aws_access.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = ""
  category        = "env"
  description     = "AWS_SECRET_ACCESS_KEY"
  sensitive       = true
  variable_set_id = tfe_variable_set.aws_access.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "tfe_variable" "AWS_SESSION_TOKEN" {
  key             = "AWS_SESSION_TOKEN"
  value           = ""
  category        = "env"
  description     = "AWS_SESSION_TOKEN"
  sensitive       = true
  variable_set_id = tfe_variable_set.aws_access.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "tfe_workspace" "this" {
  for_each            = var.tfe_workspaces
  name                = each.key
  organization        = data.tfe_organization.this.name
  description         = each.value.description
  terraform_version   = each.value.terraform_version
  working_directory   = each.value.working_directory
  trigger_prefixes    = each.value.trigger_prefixes
  tag_names           = each.value.tag_names
  global_remote_state = each.value.global_remote_state
  allow_destroy_plan  = each.value.allow_destroy_plan
  auto_apply          = each.value.auto_apply
  speculative_enabled = each.value.speculative_enabled

  vcs_repo {
    identifier     = each.value.vcs_repo.identifier
    oauth_token_id = each.value.vcs_repo.oauth_token_id
  }

  lifecycle {
    ignore_changes = [
      vcs_repo
    ]
  }
}

resource "tfe_variable" "init" {
  for_each     = var.tfe_workspaces
  key          = "TF_CLI_ARGS_init"
  value        = "-var-file=env/${each.value.environment}/remote.tfbackend"
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "TF CLI ARGS INIT ENV"
  sensitive    = false
}

resource "tfe_variable" "plan" {
  for_each     = var.tfe_workspaces
  key          = "TF_CLI_ARGS_plan"
  value        = "-var-file=env/${each.value.environment}/terraform.tfvars"
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "TF CLI ARGS PLAN ENV"
  sensitive    = false
}

resource "tfe_notification_configuration" "slack" {
  for_each         = var.tfe_workspaces
  name             = format("%s-%s", each.key, tfe_workspace.this[each.key].id)
  enabled          = true
  destination_type = "slack"
  url              = each.value.slack.webhook_url
  triggers         = ["run:needs_attention", "run:completed", "run:errored"]
  workspace_id     = tfe_workspace.this[each.key].id
}
