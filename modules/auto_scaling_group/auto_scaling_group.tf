resource "tls_private_key" "privkey" {
  algorithm = var.Algorithm
  rsa_bits  = var.Rsa_Bits
}

resource "aws_key_pair" "keypair" {
  key_name   = var.Key_Name
  public_key = tls_private_key.privkey.public_key_openssh
}

data "aws_ami" "ami_id" {
    most_recent = var.ami_id_most_recent
    owners = var.owners
    filter {
      name = var.data_source_ami_filter_name
      values = var.data_source_ami_filter_value
    }
}

resource "aws_security_group" "launch_template_security_group" {
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = var.launch_template_ingress_list
        content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
        }
    }
    dynamic "egress" {
        for_each = var.launch_template_egress_list
        content {
        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
        }
    }
}

resource "aws_launch_template" "launchtemplate" {
  name = var.launch_template_name

  block_device_mappings {
    device_name = var.ebs_device_name

    ebs {
      volume_size = var.ebs_volume_size
    }
  }
  image_id = data.aws_ami.ami_id.id
  instance_type = var.launch_template_instance_type
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = [aws_security_group.launch_template_security_group.id]
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  name                      = var.Auto_Scaling_Group_Name
  vpc_zone_identifier       = var.Auto_Scaling_Subnets
  max_size                  = var.Auto_Scaling_Max_Size
  min_size                  = var.Auto_Scaling_Min_Size
  desired_capacity          = var.Auto_Scaling_Desired_Capacity
  force_delete              = var.Auto_Scaling_Force_Delete
  target_group_arns         = var.Target_Group_Arns
  launch_template {
    id      = aws_launch_template.launchtemplate.id
  }
}
