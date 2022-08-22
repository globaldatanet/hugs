terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.28.0"
    }
  }
}

provider "tfe" {}

data "tfe_organization" "this" {
  name = "pectus"
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
  value        = "-var-file=../../envs/${each.value.environment}/backend.tfvars"
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "TF CLI ARGS INIT ENV"
  sensitive    = false
}

resource "tfe_variable" "plan" {
  for_each     = var.tfe_workspaces
  key          = "TF_CLI_ARGS_plan"
  value        = "-var-file=../../envs/${each.value.environment}/${var.region}.tfvars"
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "TF CLI ARGS PLAN ENV"
  sensitive    = false
}

# The -var and -var-file options cannot be used when applying a saved plan file, because a saved plan includes the variable values that were set when it was created.
# resource "tfe_variable" "apply" {
#   for_each     = var.tfe_workspaces
#   key          = "TF_CLI_ARGS_apply"
#   value        = "-var-file=../../envs/${each.value.environment}/${var.region}.tfvars"
#   category     = "env"
#   workspace_id = tfe_workspace.this[each.key].id
#   description  = "TF CLI ARGS APPLY ENV"
#   sensitive    = false
# }

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  for_each     = var.tfe_workspaces
  key          = "AWS_ACCESS_KEY_ID"
  value        = ""
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "AWS_ACCESS_KEY_ID"
  sensitive    = true

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  for_each     = var.tfe_workspaces
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = ""
  category     = "env"
  workspace_id = tfe_workspace.this[each.key].id
  description  = "AWS_SECRET_ACCESS_KEY"
  sensitive    = true

  lifecycle {
    ignore_changes = [
      value
    ]
  }
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
