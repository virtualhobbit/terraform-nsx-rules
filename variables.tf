variable "display_name" {
	type = string
}
variable "description" {
	type    = string
	default = "Created by Terraform"
}
variable "protocol" {
	type = string
}
variable "sources" {
	type = list(string)
}
variable "destination_ports" {
	type = list(number)
}
variable "destinations" {
	type = list(string)
}
variable "action" {
	type = string
}
variable "t1_paths" {
	type = list(string)
}