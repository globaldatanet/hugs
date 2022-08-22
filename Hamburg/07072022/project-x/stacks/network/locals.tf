locals {
  account_id   = data.aws_caller_identity.current.account_id
  region       = data.aws_region.current.name
  partition    = data.aws_partition.current.partition
  default_tags = data.aws_default_tags.current.tags
  # account_alias = data.aws_iam_account_alias.current.account_alias

  name = format("%s-%s-%s", var.name, var.environment, var.stack)
}
