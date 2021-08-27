Aws_Region                          = "us-east-1"
remote_backend_bucket_name          = "vpc-project-remote-backend-bucket"
tfstate_file_name                   = "vpc-project.tfstate"
dynamodb_table_state_lock           = "s3-state-lock"
Aws_Vpc_Cidr                        = "10.0.0.0/16"
Aws_Enable_Dns_Hostnames            = true
Aws_Enable_Dns_Support              = true
Aws_Vpc_Tags                        = { Name = "myvpc" }
Public_Subnets_Cidr                 = ["10.0.0.0/24", "10.0.1.0/24"]
Aws_Public_Subnet_Tags              = { Name = "PublicSubnet" }
Aws_Map_Public_Ip_On_Launch_Public  = true
Private_Subnets_Cidr                = ["10.0.2.0/24", "10.0.3.0/24"]
Aws_Private_Subnet_Tags             = { Name = "PrivateSubnet" }
Aws_Map_Public_Ip_On_Launch_Private = false
Igw_Tags                            = { Name = "Internetgateway" }
Aws_Nat_Gateway_Tags                = { Name = "NatGateway" }
VPC_EIP_Flag                        = true
Aws_Ip_Pool                         = "amazon"
Ipv4_Cidr                           = "0.0.0.0/0"
Aws_Public_Route_Table_Tags         = { Name : "PublicRouteTable" }
Aws_Private_Route_Table_Tags        = { Name : "PrivateRouteTable" }
# Allocated_Storage                   = 30
# Engine_Type                         = "mysql"
# Engine_Version                      = 5.7
# Instance_Class                      = "db.t3.micro"
# db_name                             = "rdsDb"
# db_username                         = "epam"
# db_password                         = "epam1234"
# Parameter_Group_Name                = "default.mysql5.7"
# rds_sg_name                         = "rds-sg"
# multi_az                            = true
# skip_final_snapshot                 = false
alb_name                   = "ApplicationLoadBalancer"
alb_facing                 = "false"
lb_type                    = "application"
enable_deletion_protection = false
alb_tags                   = { Environment = "test" }
listener_list              = [{action_type = "forward", port = 80, protocol = "HTTP" }]
listener_rules             = [{redirect = {}, fixed_response = {}}]
target_group_data = [{
  lb_target_group_name              = "TargetGroup1",
  target_group_port                 = 80,
  target_group_protocol             = "HTTP",
  target_group_healthy_threshold    = 3,
  target_group_unhealthy_threshold  = 2,
  target_group_healthcheck_timeout  = 4,
  target_group_healthcheck_interval = 6,
target_group_healthcheck_sucesscodes = 200 }]
ingress_list = [{ from_port = 80
  to_port  = 80
  protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"] }]
egress_list = [{ from_port = 80
  to_port  = 80
  protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"] }]
alb_sg_tags = { Name = "LoadBalancerSecurityGroup" }

Launch_Template_Key_Name     = "Asg_key_pair"
ami_id_most_recent           = true
Launch_Template_AMI_Owners   = ["amazon"]
data_source_ami_filter_name  = "name"
data_source_ami_filter_value = ["amzn2-ami-hvm*"]
launch_template_ingress_list = [{ from_port = 80
  to_port  = 80
  protocol = "tcp"
cidr_blocks = ["10.0.0.0/16"] }]
launch_template_egress_list = [{ from_port = 80
  to_port  = 80
  protocol = "tcp"
cidr_blocks = ["10.0.0.0/16"] }]
launch_template_name            = "LaunchTemplate"
launch_template_ebs_device_name = "/dev/sda1"
launch_template_ebs_volume_size = 20
launch_template_instance_type   = "t2.micro"
Auto_Scaling_Group_Name         = "Asg"
Auto_Scaling_Max_Size           = 4
Auto_Scaling_Min_Size           = 2
Auto_Scaling_Desired_Capacity   = 2
Auto_Scaling_Force_Delete       = false
