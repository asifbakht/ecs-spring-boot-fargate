module "service_listener" {
  source                                 = "./alb-listener"
  load_balancer_listener_arn             = var.load_balancer_listener_arn
  aws_vpc_network_id                     = var.aws_vpc_network_id
  microservice_name                      = var.app_name
  container_service_health_path          = var.container_service_health_path
  alb_listener_microservice_path         = var.alb_listener_microservice_path
  alb_listner_microservice_priority      = var.alb_listner_microservice_priority
  web_port                               = var.web_port
  targetgroup_healthy_threshold          = 4
  targetgroup_unhealthy_threshold        = 3
  targetgroup_unhealthy_timeout          = 6
  targetgroup_each_health_interval_check = 120
}

module "service_ecs" {
  source                      = "./ecs"
  app_name                    = var.app_name
  min_capacity                = var.service_instance_count
  cluster_id                  = var.cluster_id
  app_container_port          = var.app_container_port
  vpc_private_subnets         = var.vpc_private_subnets
  discovery_namespace_arn     = var.discovery_namespace_arn
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  app_target_group            = module.service_listener.listener_targetgroup_arn
  ecs_task_arn                = module.service_task_definition.task_definition_arn
  task_definition_sg_group_id = module.service_security_group.ecs_task_def_secruity_group_id
  app_common_port             = var.app_common_communication_port
  db_access_sg_id             = var.db_access_sg_id
}

module "service_logs" {
  source   = "./logs"
  app_name = var.app_name
}


module "service_security_group" {
  source                            = "./securitygroup"
  app_name                          = var.app_name
  vpc_id                            = var.aws_vpc_network_id
  app_container_port                = var.app_container_port
  aws_loadbalancer_sg_id            = var.load_balancer_securitygroup_arn
  service_communication_common_port = var.app_common_communication_port
}

module "service_task_definition" {
  source                      = "./task-definition"
  app_name                    = var.app_name
  app_web_port                = var.web_port
  app_container_port          = var.app_container_port
  aws_region                  = var.aws_region
  app_image_path              = var.app_image_path
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  app_log_group_arn           = module.service_logs.aws_group_name
  fargate_cpu                 = var.fargate_cpu
  fargate_memory              = var.fargate_memory
  app_common_port             = var.app_common_communication_port
  environment_variables       = var.environment_variables
}
