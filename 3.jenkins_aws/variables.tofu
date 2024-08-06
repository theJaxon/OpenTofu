variable "region" {
  description = "Default AWS Region to be used (Northern Virginia)."
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "VPC CIDR Block."
  default     = "10.0.0.0/16"
}

variable "aws_profile" {
  description = "AWS profile to be used for provisioning resources (Should map to the profile in the shared credentials file)."
}

variable "shared_credentials_files" {
  description = "The path to the shared credentials file. If this is not set and a profile is specified, ~/.aws/credentials will be used."
  type        = list(string)
}

variable "vpc_name" {
  description = "VPC is where our AWS resources will be launched."
  default     = "jenkins_vpc"
}

variable "owner" {
  description = "Can be used to track monthly costs be user."
}