# Specify the provider and access details
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220912"]
  }
}

resource "aws_instance" "example_vm" {

  instance_type = var.instance_type

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name        = "demo-vm"
    deployed_by = "Cloudify"
  }

  ami = data.aws_ami.centos.id

  # # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = [
    aws_security_group.example_security_group.id
  ]

  root_block_device {
    encrypted = true
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.example_vm.id
  vpc      = true
}

resource "aws_security_group" "example_security_group" {
  name = "example_security_group"

  description = "Example SG"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ips
  }

  egress {
    description = "Allow Egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
