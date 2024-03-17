variable "app_name" {
}

variable "alb_listener_microservice_path" {
}

variable "container_service_health_path" {
}

variable "app_container_port" {
}

variable "alb_listner_microservice_priority" {

}

variable "service_instance_count" {

}
variable "fargate_cpu" {

}

variable "fargate_memory" {

}
variable "web_port" {
  type = number
}
variable "app_web_port" {
}
variable "aws_region" {
}

variable "app_image_path" {
}

variable "load_balancer_listener_arn" {
}

variable "load_balancer_securitygroup_arn" {
}

variable "aws_vpc_network_id" {
}

variable "app_common_communication_port" {
}
variable "cluster_id" {
  description = "ECS cluster id"
}

variable "vpc_private_subnets" {
  description = "VPC private subnets ip range"
}

variable "discovery_namespace_arn" {
  description = "Discovery namespace arn"
}

variable "ecs_task_execution_role_arn" {
  description = "Ecs task execution role"
}
