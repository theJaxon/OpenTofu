data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/cloud_config.yaml", {
      env = terraform.workspace
    })
  }
}

resource "aws_security_group" "apache_security_group" {
  name        = "apache_security_group"
  description = "Allow HTTP and SSH traffic to the deployed apache EC2 instance."
  vpc_id      = data.aws_vpc.default_vpc.id

  tags = {
    Name = "apache"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_http_ports" {
  count             = length(var.allowed_ingress_ports)
  security_group_id = aws_security_group.apache_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ingress_ports[count.index]
  to_port           = var.allowed_ingress_ports[count.index]
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.apache_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "apache" {
  ami                                  = data.aws_ami.ubuntu.id
  instance_type                        = "t3.micro"
  instance_initiated_shutdown_behavior = "terminate"
  associate_public_ip_address          = true
  user_data                            = data.cloudinit_config.config.rendered
  vpc_security_group_ids = [aws_security_group.apache_security_group.id]
  tags = {
    Name = "apache"
  }
}

