data "aws_default_tags" "current" {}

# The attribute `${data.aws_caller_identity.current.account_id}` will be current account number.
data "aws_caller_identity" "current" {}

# The attribue `${data.aws_iam_account_alias.current.account_alias}` will be current account alias
# data "aws_iam_account_alias" "current" {}

# The attribute `${data.aws_region.current.name}` will be current region
data "aws_region" "current" {}

# The attribute `${data.aws_partition.current.partition}` will be current partition
data "aws_partition" "current" {}
