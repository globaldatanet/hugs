variable "profile" {
  description = "AWS Profile"
  type        = string
}
variable "region" {
  type = string
}
variable "tags" {
  type = map(string)
}
