variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
}

variable "access_key" {
  type        = string
  description = "Access key for AWS"
}

variable "secret_key" {
  type        = string
  description = "Secret key for AWS"
}

variable "instance_type" {
  type        = string
  description = "Instance size"
}

variable "ssh_ips" {
  type        = list(string)
  description = "List of IPs for SSH access"
  default = [ "203.0.113.10/32" ]
}
