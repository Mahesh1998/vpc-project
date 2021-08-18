variable "Vpc_Id" {
    type = string
}

variable "Route_Table_Tags" {
    type = map
}

variable "Cidr_Block" {
    type = string
    default = ""
}

variable "Gateway_Id" {
    type = string
    default = ""
}

variable "Carrier_Gateway_Id" {
    type = string
    default = ""
}

variable "Destination_Prefix_List_Id" {
    type = string
    default = ""
}

variable "Egress_Only_Gateway_Id" {
    type = string
    default = ""
}

variable "Instance_Id" {
    type = string
    default = ""
}

variable "Ipv6_Cidr_Block" {
    type = string
    default = ""
}

variable "Local_Gateway_Id" {
    type = string
    default = ""
}

variable "Nat_Gateway_Id" {
    type = string
    default = ""
}

variable "Network_Interface_Id" {
    type = string
    default = ""
}

variable "Transit_Gateway_Id" {
    type = string
    default = ""
}

variable "Vpc_Endpoint_Id" {
    type = string
    default = ""
}

variable "Vpc_Peering_Connection_Id" {
    type = string
    default = ""
}
