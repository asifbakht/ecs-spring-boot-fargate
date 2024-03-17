variable "app_name" {
  description = "Your application name"
}

variable "vpc_id" {
  description = "VPC  id"
}

variable "app_container_port" {
  description = "container port of your app"
}

variable "aws_loadbalancer_sg_id" {
  description = "Main load balancer security group id"
}

variable "service_communication_common_port" {
  description = "All microservice communicate through same port to avoid hectic of mapping different ports to different microservice"
}

