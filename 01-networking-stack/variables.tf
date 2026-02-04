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
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
    private_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
  })

  default = {
    name                     = "vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "igw"
    nat_gateway_name         = "nat-gateway"
    public_route_table_name  = "public-route-table"
    private_route_table_name = "private-route-table"
    public_subnets = [{
      name              = "vpc-public-subnet-us-east-1a"
      cidr_block        = "10.0.0.0/26"
      availability_zone = "us-east-1a"
      },
      {
        name              = "vpc-public-subnet-us-east-1b"
        cidr_block        = "10.0.0.64/26"
        availability_zone = "us-east-1b"
    }]

    private_subnets = [{
      name              = "vpc-private-subnet-us-east-1a"
      cidr_block        = "10.0.0.128/26"
      availability_zone = "us-east-1a"
      },
      {
        name              = "vpc-private-subnet-us-east-1b"
        cidr_block        = "10.0.0.192/26"
        availability_zone = "us-east-1b"
    }]

  }
}