variable "infra_env" {
  type = string
}

variable "project" {
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block."
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zone for spinning up the VPC subnet."
  type        = list(string)
  default =  ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "public_subnets_count" {
  description = "The number of public subnets to create."
  type        = number
  default     = 2
}

variable "private_subnets_count" {
  description = "The number of private subnets to create."
  type        = number
  default     = 2
}
