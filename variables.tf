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

variable "remote_backend_bucket_name" {
  type = string
}

variable "tfstate_file_name" {
  type = string
}

variable "dynamodb_table_state_lock" {
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

variable "Igw_Tags" {
  type = map(any)
}

variable "Aws_Nat_Gateway_Tags" {
  type = map(any)
}

variable "VPC_EIP_Flag" {
  type = bool
}

variable "Aws_Ip_Pool" {
  type = string
}

variable "Aws_Public_Route_Table_Tags" {
  type = map(any)
}

variable "Ipv4_Cidr" {
  type = string
}

variable "Aws_Private_Route_Table_Tags" {
  type = map(any)
}

# variable "Allocated_Storage" {
#   type = number
# }
# variable "Engine_Type" {
#   type = string
# }
# variable "Engine_Version" {
#   type = number
# }
# variable "Instance_Class" {
#   type = string
# }
# variable "db_name" {
#   type = string
# }
# variable "db_username" {
#   type = string
# }
# variable "db_password" {
#   type = string
# }
# variable "Parameter_Group_Name" {
#   type = string
# }
# variable "rds_sg_name" {
#   type = string
# }
# variable "multi_az" {
#   type = bool
# }
# variable "skip_final_snapshot" {
#   type = bool
# }

variable "alb_name" {
  type = string
}
variable "alb_facing" {
  type = bool
}
variable "lb_type" {
  type = string
}
variable "enable_deletion_protection" {
  type = bool
}
variable "alb_tags" {
  type = map(any)
}
variable "listener_list" {
  type = list(any)
}
variable "listener_rules" {
  type = list(any)
}
variable "target_group_data" {
  type = list(any)
}
variable "ingress_list" {
  type = list(any)
}
variable "egress_list" {
  type = list(any)
}
variable "alb_sg_tags" {
  type = map(any)
}
variable "Algorithm" {
  type    = string
  default = "rsa"
}
variable "Rsa_Bits" {
  type    = number
  default = 4098
}
variable "Launch_Template_Key_Name" {
  type = string
}
variable "ami_id_most_recent" {
  type = bool
}
variable "Launch_Template_AMI_Owners" {
  type = list(any)
}
variable "data_source_ami_filter_name" {
  type = string
}
variable "data_source_ami_filter_value" {
  type = list(any)
}
variable "launch_template_ingress_list" {
  type = list(any)
}
variable "launch_template_egress_list" {
  type = list(any)
}
variable "launch_template_name" {
  type = string
}
variable "launch_template_ebs_device_name" {
  type = string
}
variable "launch_template_ebs_volume_size" {
  type = number
}
variable "launch_template_instance_type" {
  type = string
}
variable "Auto_Scaling_Group_Name" {
  type = string
}
variable "Auto_Scaling_Max_Size" {
  type = number
}
variable "Auto_Scaling_Min_Size" {
  type = number
}
variable "Auto_Scaling_Desired_Capacity" {
  type = number
}
variable "Auto_Scaling_Force_Delete" {
  type = bool
}
