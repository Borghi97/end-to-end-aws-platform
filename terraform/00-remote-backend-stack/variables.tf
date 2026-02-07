variable "default_tags" {
    type = object({
      Project = string
      Environment = string 
    })
    default = {
      Project     = "New-Project"
      Environment = "Production"
    }
}


variable "assume_role"{
type = object ({
     arn = string
    region = string})

    default = {
        arn    = "arn:aws:iam::905343638195:role/account-role"
        region = "us-east-1"
    }
}

variable "remote_backend" {
  type = object({
    bucket_name = string
  })

  default = {
    bucket_name = "remote-backend-bucket-s3"   
  }
}