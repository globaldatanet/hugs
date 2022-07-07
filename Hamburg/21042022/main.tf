resource "aws_s3_bucket" "hugs" {
  bucket_prefix = "hugs"
  tags = {
    "cost" = "something"
  }
}

# resource "aws_instance" "test" {
#   ami           = "ami-0ff8a91507f77f867"
#   instance_type = "t1.2xlarge" # invalid type!
# }


