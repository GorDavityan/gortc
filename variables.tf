variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC cidr-block"
  type = string
}

#********************************************************#

variable "PUBLIC-SUBNET-1a-cidr-block" {
  default = "10.0.0.0/24"
  description = "PUBLIC SUBNET cidr block in AZ 1a"
  type = string
}

#********************************************************#

variable "PUBLIC-SUBNET-1b-cidr-block" {
  default = "10.0.1.0/24"
  description = "PUBLIC SUBNET cidr block in AZ 1b"
  type = string
}

#********************************************************#

variable "PUBLIC-SUBNET-1c-cidr-block" {
  default = "10.0.2.0/24"
  description = "PUBLIC SUBNET cidr block in AZ 1c"
  type = string
}