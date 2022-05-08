provider "aws" {
  region = var.region
}

#********************************************************#

terraform {
  backend "s3" {
    bucket = "trazler-remote-backend"
    key    = "state-files"
    region = var.region
  }
}