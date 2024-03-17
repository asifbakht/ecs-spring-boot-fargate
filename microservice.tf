module "customer_microservice" {
  source                            = "./service-container"
  app_name                          = "customer-service"
  app_image_path                    = "docker.io/asifbakht/test-service:latest"
  alb_listener_microservice_path    = "/api/v1/customer/*"
  container_service_health_path     = "/api/v1/customer/health"
  app_web_port                      = 80
  web_port                          = 80
  app_container_port                = 9997
  service_instance_count            = 1
  fargate_memory                    = 512
  fargate_cpu                       = 256
  alb_listner_microservice_priority = 22
  aws_region                        = var.aws_region
  aws_vpc_network_id                = aws_vpc.main_network.id
  cluster_id                        = aws_ecs_cluster.ecs_cluster.id
  vpc_private_subnets               = aws_subnet.private_subnet.*.id
  app_common_communication_port     = 9997
  ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
  load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
  discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn

}



module "profile_microservice" {
  source                            = "./service-container"
  app_name                          = "profile-service"
  app_image_path                    = "docker.io/asifbakht/profile-service:latest"
  alb_listener_microservice_path    = "/api/v1/profile/*"
  container_service_health_path     = "/api/v1/profile/health"
  app_web_port                      = 80
  web_port                          = 80
  app_container_port                = 9997
  service_instance_count            = 1
  fargate_memory                    = 512
  fargate_cpu                       = 256
  alb_listner_microservice_priority = 88
  aws_region                        = var.aws_region
  aws_vpc_network_id                = aws_vpc.main_network.id
  cluster_id                        = aws_ecs_cluster.ecs_cluster.id
  vpc_private_subnets               = aws_subnet.private_subnet.*.id
  app_common_communication_port     = 9997
  ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
  load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
  discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn
}
