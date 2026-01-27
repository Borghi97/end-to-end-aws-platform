variable "default_tags" {
  type = object({
    Project     = string
    Environment = string
  })
  default = {
    Project     = "New-Project"
    Environment = "Production"
  }
}


variable "assume_role" {
  type = object({
    arn = string
  region = string })

  default = {
    arn    = "arn:aws:iam::905343638195:role/account-role"
    region = "us-east-1"
  }
}

variable "vpc" {
  type = object({
    name       = string
    cidr_block = string
  })

  default = {
    name       = "vpc"
    cidr_block = "10.0.0.0/24"
  }
}