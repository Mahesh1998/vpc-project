variable "Algorithm" {
  type = string
  default = "RSA"
}
variable "Rsa_Bits" {
  type = number
  default = 4098
}
variable "Key_Name" {
  type = string
}
variable "ami_id_most_recent" {
  type = bool
}
variable "owners" {
  type = list
}
variable "vpc_id" {
  type = string
}
variable "data_source_ami_filter_name" {
  type = string
}
variable "data_source_ami_filter_value" {
  type = list
}
variable "launch_template_ingress_list" {
  type = list
}
variable "launch_template_egress_list" {
  type = list
}
variable "launch_template_name" {
  type = string
}
variable "ebs_device_name" {
  type = string
}
variable "ebs_volume_size" {
  type = number
}
variable "launch_template_instance_type" {
  type = string
}
variable "Auto_Scaling_Group_Name" {
  type = string
}
variable "Auto_Scaling_Subnets" {
  type = list
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

variable "Target_Group_Arns" {
  type = list
}
