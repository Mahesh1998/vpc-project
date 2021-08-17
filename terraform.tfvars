Aws_Region                          = "us-east-1"
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
