
resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.app_name}-task"
  execution_role_arn       = var.ecs_task_execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions = jsonencode([
    {
      name      = "${var.app_name}-container"
      image     = var.app_image_path
      essential = true
      portMappings = [
        # {
        #   containerPort = var.app_container_port,
        #   hostPort      = var.app_container_port
        # },
        {
          containerPort = var.app_container_port,
          hostPort      = var.app_container_port,
          name          = "${var.app_name}-container"
          appProtocol   = "http"
        }
      ]
      environment = var.environment_variables
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.app_log_group_arn
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
      # memory = var.fargate_cpu
      # cpu    = var.fargate_memory
    }
  ])
}
