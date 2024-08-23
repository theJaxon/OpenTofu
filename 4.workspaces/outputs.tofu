output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.apache.public_ip
}

output "index_html_page" {
  value = data.cloudinit_config.config.rendered
}