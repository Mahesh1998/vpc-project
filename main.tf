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

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  Vpc_Id   = module.vpc.vpc_id
  Igw_Tags = var.Igw_Tags
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  VPC_EIP_Flag     = var.VPC_EIP_Flag
  Aws_Ip_Pool      = var.Aws_Ip_Pool
  Subnet_Id        = module.public_subnet[0].subnet_ids
  Nat_Gateway_Tags = var.Aws_Nat_Gateway_Tags
}

module "public_route_table" {
  source = "./modules/route_table"
  Vpc_Id = module.vpc.vpc_id
  Routes = [{
    cidr_block                 = var.Ipv4_Cidr,
    gateway_id                 = module.internet_gateway.internet_gateway_id,
    carrier_gateway_id         = "",
    destination_prefix_list_id = "",
    egress_only_gateway_id     = "",
    instance_id                = "",
    ipv6_cidr_block            = "",
    local_gateway_id           = "",
    nat_gateway_id             = "",
    network_interface_id       = "",
    transit_gateway_id         = "",
    vpc_endpoint_id            = "",
    vpc_peering_connection_id  = ""
  }]
  Route_Table_Tags = var.Aws_Public_Route_Table_Tags
}

module "private_route_table" {
  source = "./modules/route_table"
  Vpc_Id = module.vpc.vpc_id
  Routes = [{
    cidr_block                 = var.Ipv4_Cidr
    gateway_id                 = ""
    carrier_gateway_id         = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    instance_id                = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = module.nat_gateway.nat_gateway_id
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  Route_Table_Tags = var.Aws_Private_Route_Table_Tags
}

module "public_route_table_subnet_association" {
  source         = "./modules/route_table_subnet_association"
  count          = length(module.public_subnet)
  Subnet_Id      = module.public_subnet[count.index].subnet_ids
  Route_Table_Id = module.public_route_table.route_table_id
}

module "private_route_table_subnet_association" {
  source         = "./modules/route_table_subnet_association"
  count          = length(module.private_subnet)
  Subnet_Id      = module.private_subnet[count.index].subnet_ids
  Route_Table_Id = module.private_route_table.route_table_id
}
