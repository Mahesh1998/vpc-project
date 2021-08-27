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
  source           = "./modules/route_table"
  Vpc_Id           = module.vpc.vpc_id
  Cidr_Block       = var.Ipv4_Cidr
  Gateway_Id       = module.internet_gateway.internet_gateway_id
  Route_Table_Tags = var.Aws_Public_Route_Table_Tags
}

module "private_route_table" {
  source           = "./modules/route_table"
  Vpc_Id           = module.vpc.vpc_id
  Cidr_Block       = var.Ipv4_Cidr
  Nat_Gateway_Id   = module.nat_gateway.nat_gateway_id
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

# module "rds_instance" {
#   source               = "./modules/rds"
#   Allocated_Storage    = var.Allocated_Storage
#   Engine_Type          = var.Engine_Type
#   Engine_Version       = var.Engine_Version
#   Instance_Class       = var.Instance_Class
#   db_name              = var.db_name
#   db_username          = var.db_username
#   db_password          = var.db_password
#   db_subnet_group      = [module.private_subnet[0].subnet_ids, module.private_subnet[1].subnet_ids]
#   Parameter_Group_Name = var.Parameter_Group_Name
#   vpc_id               = module.vpc.vpc_id
#   vpc_cidr_list        = [var.Aws_Vpc_Cidr]
#   rds_sg_name          = var.rds_sg_name
#   multi_az             = var.multi_az
#   skip_final_snapshot  = var.skip_final_snapshot
# }

output "public_subnet_ids" {
  value = module.public_subnet
}
output "public_subnet_id_list" {
  value = [for s in module.public_subnet : s.subnet_ids]
}

module "load_balancer_listener_default_target_group" {
  source                               = "./modules/target_group"
  count                                = length(var.target_group_data)
  lb_target_group_name                 = var.target_group_data[count.index].lb_target_group_name
  vpc_id                               = module.vpc.vpc_id
  target_group_port                    = var.target_group_data[count.index].target_group_port
  target_group_protocol                = var.target_group_data[count.index].target_group_protocol
  target_group_healthy_threshold       = var.target_group_data[count.index].target_group_healthy_threshold
  target_group_unhealthy_threshold     = var.target_group_data[count.index].target_group_unhealthy_threshold
  target_group_healthcheck_timeout     = var.target_group_data[count.index].target_group_healthcheck_timeout
  target_group_healthcheck_interval    = var.target_group_data[count.index].target_group_healthcheck_interval
  target_group_healthcheck_sucesscodes = var.target_group_data[count.index].target_group_healthcheck_sucesscodes
}
output "TG_arn" {
  value = module.load_balancer_listener_default_target_group
}
module "application_load_balancer" {
  source                     = "./modules/load_balancer"
  alb_name                   = var.alb_name
  alb_facing                 = var.alb_facing
  lb_type                    = var.lb_type
  subnets_ids                = [for s in module.public_subnet : s.subnet_ids]
  enable_deletion_protection = var.enable_deletion_protection
  alb_tags                   = var.alb_tags
  listener_list              = var.listener_list
  listener_rules = var.listener_rules
  vpc_id                     = module.vpc.vpc_id
  target_group_arn           = [for tg in module.load_balancer_listener_default_target_group : tg.target_group_arn]
  ingress_list               = var.ingress_list
  egress_list                = var.egress_list
  alb_sg_tags                = var.alb_sg_tags
}



module "auto_scaling_group" {
  source                        = "./modules/auto_scaling_group"
  Key_Name                      = var.Launch_Template_Key_Name
  ami_id_most_recent            = var.ami_id_most_recent
  owners                        = var.Launch_Template_AMI_Owners
  data_source_ami_filter_name   = var.data_source_ami_filter_name
  data_source_ami_filter_value  = var.data_source_ami_filter_value
  vpc_id                        = module.vpc.vpc_id
  launch_template_ingress_list  = var.launch_template_ingress_list
  launch_template_egress_list   = var.launch_template_egress_list
  launch_template_name          = var.launch_template_name
  ebs_device_name               = var.launch_template_ebs_device_name
  ebs_volume_size               = var.launch_template_ebs_volume_size
  launch_template_instance_type = var.launch_template_instance_type
  Auto_Scaling_Group_Name       = var.Auto_Scaling_Group_Name
  Auto_Scaling_Subnets          = [for s in module.private_subnet : s.subnet_ids]
  Auto_Scaling_Max_Size         = var.Auto_Scaling_Max_Size
  Auto_Scaling_Min_Size         = var.Auto_Scaling_Min_Size
  Auto_Scaling_Desired_Capacity = var.Auto_Scaling_Desired_Capacity
  Auto_Scaling_Force_Delete     = var.Auto_Scaling_Force_Delete
  Target_Group_Arns             = [for tg in module.load_balancer_listener_default_target_group : tg.target_group_arn]
}
