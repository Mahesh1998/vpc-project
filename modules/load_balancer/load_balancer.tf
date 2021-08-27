resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = var.alb_facing
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.subnets_ids
  enable_deletion_protection = var.enable_deletion_protection
  tags = var.alb_tags
}

resource "aws_lb_listener" "alb_listeners" {
  load_balancer_arn = aws_lb.app_lb.arn
  count = length(var.listener_list)
  default_action {
    type             = var.listener_list[count.index].action_type
    target_group_arn = var.listener_list[count.index].action_type == "forward" ? var.target_group_arn[count.index] : ""
    dynamic "redirect" {
            for_each = length(keys(lookup(var.listener_rules[count.index], "redirect", {}))) == 0 ? [] : [lookup(var.listener_rules[count.index], "redirect", {})]

            content {
            path        = lookup(redirect.value, "path", null)
            host        = lookup(redirect.value, "host", null)
            port        = lookup(redirect.value, "port", null)
            protocol    = lookup(redirect.value, "protocol", null)
            query       = lookup(redirect.value, "query", null)
            status_code = redirect.value["status_code"]
            }
        }
        dynamic "fixed_response" {
        for_each = length(keys(lookup(var.listener_rules[count.index], "fixed_response", {}))) == 0 ? [] : [lookup(var.listener_rules[count.index], "fixed_response", {})]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
  }
  port              = var.listener_list[count.index].port
  protocol          = var.listener_list[count.index].protocol

}

resource "aws_security_group" "lb_sg" {
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = var.ingress_list
        content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
        }
    }
    dynamic "egress" {
        for_each = var.egress_list
        content {
        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
        }
    }
    tags = var.alb_sg_tags
}
