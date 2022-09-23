owner  = "globaldatanet"
region = "eu-central-1"

tfe_workspaces = {
  tf-cloud-demo-dev = {
    description         = "DEV ENV"
    environment         = "dev"
    terraform_version   = "1.2.9"
    working_directory   = "."
    trigger_prefixes    = ["env/dev"]
    tag_names           = []
    global_remote_state = true
    allow_destroy_plan  = true
    auto_apply          = false
    speculative_enabled = true
    vcs_repo = {
      identifier     = "globaldatanet/tf-cloud-demo"
      oauth_token_id = "ot-xxxxxxxx"
    }
    slack = {
      enabled     = true
      webhook_url = "https://hooks.slack.com/services/xxxxx/xxxxx/xxxxxx"
    }
  },
  tf-cloud-demo-prod = {
    description         = "PROD ENV"
    environment         = "prod"
    terraform_version   = "1.2.9"
    working_directory   = "."
    trigger_prefixes    = ["env/prod"]
    tag_names           = []
    global_remote_state = true
    allow_destroy_plan  = true
    auto_apply          = false
    speculative_enabled = true
    vcs_repo = {
      identifier     = "globaldatanet/tf-cloud-demo"
      oauth_token_id = "ot-xxxxxxx"
    }
    slack = {
      enabled     = true
      webhook_url = "https://hooks.slack.com/services/xxxxx/xxxxx/xxxxxxx" #https://api.slack.com/messaging/webhooks
    }
  },
}
