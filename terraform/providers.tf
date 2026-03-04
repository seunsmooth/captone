provider "aws" {
  region = var.region
}

data "aws_region" "current" {}

output "region" {
  value = data.aws_region.current.region
}

