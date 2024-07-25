variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tag" {
  description = "vpc tag"
  type        = string
  default     = "myvpc"
}

variable "env" {
  description = "vpc cidr"
  type        = map(any)
  default = {
    prod  = "123"
    dev   = "123abc"
    stage = "abc"
  }
}

variable "public_sub_cidr" {
  description = "public subnets cidr"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_sub_cidr" {
  description = "private subnets cidr"
  type        = string
  default     = "10.0.1.0/24"
}
variable "availability_zone_pub" {
  description = "public subnet cidr"
  type        = string
  default     = "us-east-1b"
}

variable "availability_zone_priv" {
  description = "private subnet cidr"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "provider_region" {
  description = "region for provider"
  default     = "us-east-1"
}