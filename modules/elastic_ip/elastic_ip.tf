resource "aws_eip" "eip" {
  vpc              = var.VPC_EIP_Flag
  public_ipv4_pool = var.Aws_Ip_Pool
}
