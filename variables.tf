variable "env" {
  description = "Target environemnet name for name tagging"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR range for existing target private subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR range for existing target public subnet"
  type        = string
}

variable "region" {
  description = "Target AWS region for deployment"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR range for existing target VPC"
  type        = string
}