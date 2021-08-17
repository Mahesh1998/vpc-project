resource "aws_route_table" "RouteTable" {
  vpc_id     = var.Vpc_Id
  route = var.Routes  
  tags = var.Route_Table_Tags
}


