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
