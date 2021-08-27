output "security_group_id" {
    value = aws_security_group.lb_sg.id
}
output "load_balancer_listener_arn" {
    value = aws_lb_listener.alb_listeners[*].arn
}
