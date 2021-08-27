# resource "aws_db_subnet_group" "db_subnet_group" {
#   name       = "main"
#   subnet_ids = var.db_subnet_group

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# resource "aws_db_instance" "rds_instance" {
#   allocated_storage    = var.Allocated_Storage
#   engine               = var.Engine_Type
#   engine_version       = var.Engine_Version
#   instance_class       = var.Instance_Class
#   name                 = var.db_name
#   username             = var.db_username
#   password             = var.db_password
#   db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
#   multi_az = var.multi_az
#   vpc_security_group_ids = [aws_security_group.db_sg.id]
#   parameter_group_name = var.Parameter_Group_Name
#   skip_final_snapshot = var.skip_final_snapshot
# }

# /*resource "aws_db_security_group" "rds_sg" {
#   name = var.db_sg_name

#   ingress {
#     cidr = var.accepted_cidr
#   }
# }*/

# resource "aws_security_group" "db_sg" {
#   name        = var.rds_sg_name
#   vpc_id      = var.vpc_id

#   ingress {
#       description      = "Traffic from VPC"
#       from_port        = 3306
#       to_port          = 3306
#       protocol         = "tcp"
#       cidr_blocks      = var.vpc_cidr_list
#     }
# }