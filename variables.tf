variable "region" {
  default     = "eu-central-1"
  description = "frankfurt region"
  type        = string
}

#********************************************************#

variable "az1a" {
  default     = "eu-central-1a"
  description = "availability zone 1a"
  type        = string
}

variable "az1b" {
  default     = "eu-central-1b"
  description = "availability zone 1b"
  type        = string
}

variable "az1c" {
  default     = "eu-central-1c"
  description = "availability zone 1c"
  type        = string
}

#********************************************************#

variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidr-block"
  type        = string
}

#********************************************************#

variable "public-subnet-1a-cidr-block" {
  default     = "10.0.0.0/24"
  description = "public subnet cidr block in AZ 1a"
  type        = string
}

#********************************************************#

variable "public-subnet-1b-cidr-block" {
  default     = "10.0.1.0/24"
  description = "public subnet cidr block in AZ 1b"
  type        = string
}

#********************************************************#

variable "public-subnet-1c-cidr-block" {
  default     = "10.0.2.0/24"
  description = "public subnet cidr block in AZ 1c"
  type        = string
}

#********************************************************#

variable "private-subnet-1a-cidr-block" {
  default     = "10.0.10.0/24"
  description = "private subnet cidr block in AZ 1a"
  type        = string
}

#********************************************************#

variable "private-subnet-1b-cidr-block" {
  default     = "10.0.11.0/24"
  description = "private subnet cidr block in AZ 1b"
  type        = string
}

#********************************************************#

variable "private-subnet-1c-cidr-block" {
  default     = "10.0.12.0/24"
  description = "private subnet cidr block in AZ 1c"
  type        = string
}
