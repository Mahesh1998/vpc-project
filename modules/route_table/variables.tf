variable "Vpc_Id" {
    type = string
}

variable "Route_Table_Tags" {
    type = map
}
variable Routes {
    type = list(any)
}

