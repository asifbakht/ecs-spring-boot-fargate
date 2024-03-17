
variable "name_prefix" {
  default = "banking"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "az_count" {
  default = "2"
}

variable "healthcheck_path" {
  default = "/"
}

variable "alb_protocol" {
  default = "HTTP"
}

variable "web_port" {
  default = "80"
}

# variable "common_port_between_service" {
#   type    = number
#   default = 9997
# }
