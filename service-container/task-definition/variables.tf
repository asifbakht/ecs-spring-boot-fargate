variable "app_name" {
  description = "Your application name"
}

variable "app_image_path" {
}

variable "app_container_port" {
  description = "container port of your app"
}

variable "app_common_port" {
  description = "common port of microservice in order to communicate with each other"
}

variable "app_web_port" {
}

variable "fargate_cpu" {
}

variable "fargate_memory" {
}

variable "ecs_task_execution_role_arn" {
  description = "AWS ecs role arn"
}

variable "environment_variables" {
  description = "environment variables for ecs container of app"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "aws_region" {
  description = "aws region"
}

variable "app_log_group_arn" {
  description = "Log group name of ecs task definition"
}
