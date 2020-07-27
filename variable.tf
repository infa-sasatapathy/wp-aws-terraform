variable "region" {
  default     = "ap-south-1"
  description = "AWS Region"
}
variable "vpc_id" {
  default = "vpc-0feaa21ebf38d2ae6"
}
variable "public_subnet_1_id" {
  default     = "subnet-051834cfc5d3a418c"
  description = "Public Subnet 1 ID"
}
variable "public_subnet_2_id" {
  default     = "subnet-0ba7500feadae8dfd"
  description = "Public Subnet 2 ID"
}
variable "public_subnet_3_id" {
  default     = "subnet-0c584f40c260d270a"
  description = "Public Subnet 3 ID"
}
variable "private_subnet_1_id" {
  default     = "subnet-08feb8b7fa670a5db"
  description = "Private Subnet 1 ID"
}
variable "private_subnet_2_id" {
  default     = "subnet-00303f87b29feeebd"
  description = "Private Subnet 2 ID"
}
variable "private_subnet_3_id" {
  default     = "subnet-06cc1daab419a03f7"
  description = "Private Subnet 3 ID"
}