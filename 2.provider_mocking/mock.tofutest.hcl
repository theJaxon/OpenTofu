// This block will prevent OpenTofu from configuring aws provider.
// All provider's resources and data sources will be mocked.
mock_provider "aws" {
  mock_data "aws_ami" {
    defaults = {
      id = "ami-12345"
    }
  }
}

run "test" {
  assert {
    condition     = aws_instance.web_instance.ami == "ami-12345"
    error_message = "Incorrect AMI ID passed to aws_instance.web: ${aws_instance.web_instance.ami}"
  }
}