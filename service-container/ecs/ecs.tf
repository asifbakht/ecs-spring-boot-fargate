
resource "aws_ecs_service" "ecs_service" {
  name            = "${var.app_name}-container"
  cluster         = var.cluster_id
  task_definition = var.ecs_task_arn
  desired_count   = var.min_capacity
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [var.task_definition_sg_group_id]
    subnets          = flatten([var.vpc_private_subnets])
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.app_target_group
    container_name   = "${var.app_name}-container"
    container_port   = var.app_container_port
  }

  service_connect_configuration {
    enabled   = true
    namespace = var.discovery_namespace_arn
    service {
      discovery_name = "${var.app_name}-container"
      port_name      = "${var.app_name}-container"
      client_alias {
        dns_name = "${var.app_name}-container"
        port     = var.app_common_port
      }
    }
  }
}
