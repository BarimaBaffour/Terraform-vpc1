variable "region" {
  description = "VPC Region"
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "public subnet 1 cidr block"
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "public subnet 1 cidr block"
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "private subnet 1 cidr block"
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "private subnet 1 cidr block"
  default     = "10.0.4.0/24"
}