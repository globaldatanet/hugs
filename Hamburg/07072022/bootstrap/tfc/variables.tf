variable "owner" {
  type        = string
  description = "TFC organization name"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "tfe_workspaces" {
  type = map(object({
    description         = string
    environment         = string
    working_directory   = string
    terraform_version   = string
    trigger_prefixes    = list(string)
    tag_names           = list(string)
    global_remote_state = bool
    allow_destroy_plan  = bool
    auto_apply          = bool
    speculative_enabled = bool
    vcs_repo            = map(string)
    slack               = map(string)
  }))
}
