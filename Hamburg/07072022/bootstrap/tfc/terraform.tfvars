owner  = "pectus"
region = "eu-central-1"

tfe_workspaces = {
  iac-baseline = {
    description         = "IaC Terraform Baseline AWS Services"
    environment         = "master"
    terraform_version   = "1.1.5"
    working_directory   = "stacks/baseline"
    trigger_prefixes    = ["envs/master"]
    tag_names           = []
    global_remote_state = false
    allow_destroy_plan  = true
    auto_apply          = false
    speculative_enabled = true
    vcs_repo = {
      identifier     = "GDN/iac-baseline"
      oauth_token_id = "ot-XXXXXXXXXXXXX" # https://app.terraform.io/app/pectus/settings/version-control
    }
    slack = {
      enabled     = true
      webhook_url = "https://hooks.slack.com/services/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" #https://api.slack.com/messaging/webhooks
    }
  },
  backend-core-dev-eu-central-1 = {
    description         = "IaC Terraform Backend Core AWS Services"
    environment         = "dev"
    terraform_version   = "1.1.5"
    working_directory   = "stacks/core"
    trigger_prefixes    = ["envs/dev"]
    tag_names           = []
    global_remote_state = false
    allow_destroy_plan  = true
    auto_apply          = false
    speculative_enabled = true
    vcs_repo = {
      identifier     = "GDN/backend-core"
      oauth_token_id = "ot-XXXXXXXXXXXXX" # https://app.terraform.io/app/pectus/settings/version-control
    }
    slack = {
      enabled     = true
      webhook_url = "https://hooks.slack.com/services/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" #https://api.slack.com/messaging/webhooks
    }
  },
  backend-core-test-eu-central-1 = {
    description         = "IaC Terraform Backend Core AWS Services"
    environment         = "test"
    terraform_version   = "1.1.5"
    working_directory   = "stacks/core"
    trigger_prefixes    = ["envs/test"]
    tag_names           = []
    global_remote_state = false
    allow_destroy_plan  = true
    auto_apply          = false
    speculative_enabled = true
    vcs_repo = {
      identifier     = "GDN/backend-core"
      oauth_token_id = "ot-XXXXXXXXXXXXX" # https://app.terraform.io/app/pectus/settings/version-control
    }
    slack = {
      enabled     = true
      webhook_url = "https://hooks.slack.com/services/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" #https://api.slack.com/messaging/webhooks
    }
  },
}
