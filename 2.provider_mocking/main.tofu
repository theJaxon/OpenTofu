data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-24.04-amd64-server-*"]
    }
    owners = ["099720109477"]
}

resource "aws_instance" "web_instance" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "m6i.2xlarge"
}
