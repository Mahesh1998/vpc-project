variable "Aws_Vpc_Cidr" {
  type = string
}

variable "Aws_Enable_Dns_Hostnames" {
  type = bool
}

variable "Aws_Enable_Dns_Support" {
  type = bool
}

variable "Aws_Vpc_Tags" {
  type = map(any)
}

variable "Aws_Region" {
  type = string
}

variable "Public_Subnets_Cidr" {
  type = list(any)
}

variable "Aws_Public_Subnet_Tags" {
  type = map(any)
}

variable "Aws_Map_Public_Ip_On_Launch_Public" {
  type = bool
}

variable "Private_Subnets_Cidr" {
  type = list(any)
}

variable "Aws_Private_Subnet_Tags" {
  type = map(any)
}

variable "Aws_Map_Public_Ip_On_Launch_Private" {
  type = bool
}
