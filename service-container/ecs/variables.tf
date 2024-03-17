variable "app_name" {
  description = "Your application name"
}

variable "cluster_id" {
  description = "ECS cluster id"
}

variable "app_container_port" {
  description = "container port of your app"
}


variable "min_capacity" {
}

variable "ecs_task_arn" {
  description = "app ecs task definition"
}
variable "ecs_task_execution_role_arn" {
  description = "AWS ecs role arn"
}


variable "task_definition_sg_group_id" {
  description = "Task definition security group id"
}

variable "vpc_private_subnets" {
  description = "VPC private subnets ip range"
}

variable "app_target_group" {
  description = "App target group id"
}

variable "discovery_namespace_arn" {
  description = "Discovery namespace arn"
}
variable "app_common_port" {
  description = "common port of microservice in order to communicate with each other"
}

variable "db_access_sg_id" {

}
