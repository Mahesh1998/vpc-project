variable "lb_target_group_name" {
  type = string
}
variable "target_group_port" {
  type = number
}
variable "target_group_protocol" {
  type = string
}
variable "target_group_healthy_threshold" {
  type = number
}
variable "target_group_unhealthy_threshold" {
  type = number
}
variable "target_group_healthcheck_timeout" {
  type = number
}
variable "target_group_healthcheck_interval" {
  type = number
}
variable "target_group_healthcheck_sucesscodes" {
  type = number
}

variable "vpc_id" {
  type = string
}
