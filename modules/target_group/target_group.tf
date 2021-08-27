resource "aws_lb_target_group" "lb_tg" {
  name     = var.lb_target_group_name
  vpc_id   = var.vpc_id
  port     = var.target_group_port
  protocol = var.target_group_protocol
  health_check {
    healthy_threshold = var.target_group_healthy_threshold
    unhealthy_threshold = var.target_group_unhealthy_threshold
    timeout = var.target_group_healthcheck_timeout
    interval = var.target_group_healthcheck_interval
    matcher = var.target_group_healthcheck_sucesscodes
    }
}
