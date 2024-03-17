# module "customer_microservice" {
#   source                            = "./service-container"
#   app_name                          = "customer-service"
#   app_image_path                    = "docker.io/asifbakht/test-service:latest"
#   alb_listener_microservice_path    = "/api/v1/customer/*"
#   container_service_health_path     = "/api/v1/customer/health"
#   app_web_port                      = 80
#   web_port                          = 80
#   app_container_port                = 9997
#   service_instance_count            = 1
#   fargate_memory                    = 512
#   fargate_cpu                       = 256
#   alb_listner_microservice_priority = 22
#   aws_region                        = var.aws_region
#   aws_vpc_network_id                = aws_vpc.main_network.id
#   cluster_id                        = aws_ecs_cluster.ecs_cluster.id
#   vpc_private_subnets               = aws_subnet.private_subnet.*.id
#   app_common_communication_port     = 9997
#   ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
#   load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
#   load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
#   discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn
#   db_access_sg_id                   = aws_security_group.db_access_sg.id
#   environment_variables = [
#     {
#       "name" : "CONTAINER_PORT"
#       "value" : "9997"
#     }
#   ]

# }



# module "profile_microservice" {
#   source                            = "./service-container"
#   app_name                          = "profile-service"
#   app_image_path                    = "docker.io/asifbakht/profile-service:latest"
#   alb_listener_microservice_path    = "/api/v1/profile/*"
#   container_service_health_path     = "/api/v1/profile/health"
#   app_web_port                      = 80
#   web_port                          = 80
#   app_container_port                = 9997
#   service_instance_count            = 1
#   fargate_memory                    = 512
#   fargate_cpu                       = 256
#   alb_listner_microservice_priority = 88
#   aws_region                        = var.aws_region
#   aws_vpc_network_id                = aws_vpc.main_network.id
#   cluster_id                        = aws_ecs_cluster.ecs_cluster.id
#   vpc_private_subnets               = aws_subnet.private_subnet.*.id
#   app_common_communication_port     = 9997
#   ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
#   load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
#   load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
#   discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn
#   db_access_sg_id                   = aws_security_group.db_access_sg.id
#   environment_variables = [
#     {
#       "name" : "CONTAINER_PORT"
#       "value" : "9997"
#     }
#   ]
# }



# module "book_microservice" {
#   source                            = "./service-container"
#   app_name                          = "book-service"
#   app_image_path                    = "docker.io/asifbakht/book-service:latest"
#   alb_listener_microservice_path    = "/api/v1/books*"
#   container_service_health_path     = "/api/v1/books/health"
#   app_web_port                      = 80
#   web_port                          = 80
#   app_container_port                = 9991
#   service_instance_count            = 1
#   fargate_memory                    = 512
#   fargate_cpu                       = 256
#   alb_listner_microservice_priority = 35
#   aws_region                        = var.aws_region
#   aws_vpc_network_id                = aws_vpc.main_network.id
#   cluster_id                        = aws_ecs_cluster.ecs_cluster.id
#   vpc_private_subnets               = aws_subnet.private_subnet.*.id
#   app_common_communication_port     = 9991
#   ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
#   load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
#   load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
#   discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn
#   db_access_sg_id                   = aws_security_group.db_access_sg.id
#   environment_variables = [
#     { "name" : "CONTAINER_PORT", "value" : "9991" },
#     { "name" : "DB_HOST", "value" : "${aws_db_instance.mysql_db.address}" },
#     { "name" : "DB_PORT", "value" : var.db_port },
#     { "name" : "DB_USERNAME", "value" : "${var.db_user_name}" },
#     { "name" : "DB_PASSWORD", "value" : "${aws_db_instance.mysql_db.password}" }
#   ]
# }


################## CUSTOMER SERVICE



module "customer_microservice" {
  source                            = "./service-container"
  app_name                          = "customer"
  app_image_path                    = "docker.io/asifbakht/customer-service:latest"
  alb_listener_microservice_path    = "/api/v1/customer*"
  container_service_health_path     = "/api/v1/customer/actuator/health"
  app_web_port                      = 80
  web_port                          = 80
  app_container_port                = 9999
  service_instance_count            = 4
  fargate_memory                    = 512
  fargate_cpu                       = 256
  alb_listner_microservice_priority = 22
  aws_region                        = var.aws_region
  aws_vpc_network_id                = aws_vpc.main_network.id
  cluster_id                        = aws_ecs_cluster.ecs_cluster.id
  vpc_private_subnets               = aws_subnet.private_subnet.*.id
  app_common_communication_port     = 9999
  ecs_task_execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  load_balancer_securitygroup_arn   = aws_security_group.load_balancer_sg.id
  load_balancer_listener_arn        = aws_alb_listener.load_balancer_listener.arn
  discovery_namespace_arn           = aws_service_discovery_http_namespace.namespace.arn
  db_access_sg_id                   = aws_security_group.db_access_sg.id
  environment_variables = [
    { "name" : "CONTAINER_PORT", "value" : "9999" },
    { "name" : "CONTAINER_BASE_PATH", value : "/api/v1" },
    { "name" : "DB_HOST", "value" : "${aws_db_instance.mysql_db.address}" },
    { "name" : "DB_PORT", "value" : var.db_port },
    { "name" : "DB_NAME", "value" : "customer" },
    { "name" : "DB_USERNAME", "value" : "${var.db_user_name}" },
    { "name" : "DB_PASSWORD", "value" : "${aws_db_instance.mysql_db.password}" },
    { "name" : "DB_CONNECTION_TIME_OUT", "value" : "100000" },
    { "name" : "DB_IDLE_TIME_OUT", "value" : "600000" },
    { "name" : "DB_MAX_LIFE_TIME_OUT", "value" : "1800000" },
    { "name" : "REDIS_HOST", "value" : "${aws_elasticache_cluster.redis_db.cache_nodes[0].address}" },
    { "name" : "REDIS_PORT", "value" : "${aws_elasticache_cluster.redis_db.cache_nodes[0].port}" },
    { "name" : "LOG_ROOT_LEVEL", "value" : "INFO" },
    { "name" : "LOG_APP_LEVEL", "value" : "DEBUG" },
    { "name" : "CB_FAILURE_THRESHOLD", "value" : "25" },
    { "name" : "CB_FAILURE_MIN_NO_CALL", "value" : "10" },
    { "name" : "CB_FAILURE_PERMITTED_NO_CALLS_IN_HALF_OPEN_STATE", "value" : "10" },
    { "name" : "CB_FAILURE_SLIDING_WINDOW", "value" : "55" },
    { "name" : "CB_FAILURE_WAIT_DURATION_IN_OPEN_STATE", "value" : "10s" },
    { "name" : "DEFAULT_CACHE_TTL", "value" : "5" },
    { "name" : "APP_CACHE_TTL", "value" : "2" },
    { "name" : "SWAGGER_PATH", "value" : "/customer/actuator" }

  ]
}
