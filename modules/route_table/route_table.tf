resource "aws_route_table" "RouteTable" {
  vpc_id     = var.Vpc_Id
  route {
    cidr_block                 = var.Cidr_Block != "" ? var.Cidr_Block: ""
    gateway_id                 = var.Gateway_Id != "" ? var.Gateway_Id: ""
    carrier_gateway_id         = var.Carrier_Gateway_Id != "" ? var.Carrier_Gateway_Id: ""
    destination_prefix_list_id = var.Destination_Prefix_List_Id != "" ? var.Destination_Prefix_List_Id: ""
    egress_only_gateway_id     = var.Egress_Only_Gateway_Id != "" ? var.Egress_Only_Gateway_Id: ""
    instance_id                = var.Instance_Id != "" ? var.Instance_Id: ""
    ipv6_cidr_block            = var.Ipv6_Cidr_Block != "" ? var.Ipv6_Cidr_Block: ""
    local_gateway_id           = var.Local_Gateway_Id != "" ? var.Local_Gateway_Id: ""
    nat_gateway_id             = var.Nat_Gateway_Id != "" ? var.Nat_Gateway_Id: ""
    network_interface_id       = var.Network_Interface_Id != "" ? var.Network_Interface_Id: ""
    transit_gateway_id         = var.Transit_Gateway_Id != "" ? var.Transit_Gateway_Id: ""
    vpc_endpoint_id            = var.Vpc_Endpoint_Id != "" ? var.Vpc_Endpoint_Id: ""
    vpc_peering_connection_id  = var.Vpc_Peering_Connection_Id != "" ? var.Vpc_Peering_Connection_Id: ""
  }  
  tags = var.Route_Table_Tags
}


