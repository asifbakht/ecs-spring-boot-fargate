variable "microservice_name" {
  description = "Your microservice name"
}

variable "load_balancer_listener_arn" {
  description = "alb load balancer listner arn to register microservice target group"
}

variable "aws_vpc_network_id" {
  description = "VPC network id"
}

variable "container_service_health_path" {
  description = "Path to health api path for populate in target group"
}

variable "targetgroup_healthy_threshold" {
  description = "Target group failure threshold count"
}

variable "targetgroup_unhealthy_threshold" {
  description = "Target group unhealthy threshold count"
}

variable "targetgroup_unhealthy_timeout" {
  description = "Target group unhealthy timout count"
}

variable "targetgroup_each_health_interval_check" {
  description = "Target group unhealthy timout count"
}

variable "alb_listner_microservice_priority" {
  description = "Microservice path listener priority"
}

variable "web_port" {
}

variable "alb_listener_microservice_path" {
  description = "Assign microservice api path"
}
