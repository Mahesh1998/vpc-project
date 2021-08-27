variable "alb_name" {
  type = string
}
variable "alb_facing" {
  type = bool
}
variable "lb_type" {
  type = string
}
variable "subnets_ids" {
  type = list(any)
}
variable "enable_deletion_protection" {
  type = bool
}
variable "alb_tags" {
  type = map(any)
}
variable "listener_list" {
  type = list(any)
}
variable "vpc_id" {
  type = string
}
variable "listener_rules" {
  type = list(any)
}
variable "target_group_arn" {
  type = list(any)
}
variable "ingress_list" {
  type = list(any)
}
variable "egress_list" {
  type = list(any)
}
variable "alb_sg_tags" {
  type = map(any)
}

