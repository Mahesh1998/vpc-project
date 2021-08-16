module "vpc" {
  source               = "./modules/vpc"
  Vpc_Cidr             = var.Aws_Vpc_Cidr
  Enable_Dns_Hostnames = var.Aws_Enable_Dns_Hostnames
  Enable_Dns_Support   = var.Aws_Enable_Dns_Support
  Vpc_Tags             = var.Aws_Vpc_Tags
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "public_subnet" {
  source                  = "./modules/subnet"
  Vpc_Id                  = module.vpc.vpc_id
  count                   = length(var.Public_Subnets_Cidr)
  Cidr_Block              = element(var.Public_Subnets_Cidr, count.index)
  Availability_Zone       = element(data.aws_availability_zones.available.names, count.index)
  Map_Public_Ip_On_Launch = var.Aws_Map_Public_Ip_On_Launch_Public
  Tags                    = { for k, v in var.Aws_Public_Subnet_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}

module "private_subnet" {
  source                  = "./modules/subnet"
  Vpc_Id                  = module.vpc.vpc_id
  count                   = length(var.Private_Subnets_Cidr)
  Cidr_Block              = element(var.Private_Subnets_Cidr, count.index)
  Availability_Zone       = element(data.aws_availability_zones.available.names, count.index)
  Map_Public_Ip_On_Launch = var.Aws_Map_Public_Ip_On_Launch_Private
  Tags                    = { for k, v in var.Aws_Private_Subnet_Tags : k => format("%s%s", v, tostring(count.index + 1)) }
}
