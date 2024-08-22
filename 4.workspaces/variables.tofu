variable "region" {
  description = "Default AWS Region to be used (Northern Virginia)."
  default     = "us-east-1"
  type        = string
}

variable "allowed_ingress_ports" {
  description = "Allowed ingress port numbers."
  default     = ["22", "80"]
  type        = list(any)
}