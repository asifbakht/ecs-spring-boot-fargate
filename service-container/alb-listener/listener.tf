
resource "aws_lb_listener_rule" "micoservice_listener" {
  listener_arn = var.load_balancer_listener_arn
  priority     = var.alb_listner_microservice_priority
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.microservice.arn
  }

  condition {
    path_pattern {
      values = [var.alb_listener_microservice_path]
    }
  }
}

resource "aws_lb_target_group" "microservice" {
  name        = "${var.microservice_name}-tg"
  port        = var.web_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.aws_vpc_network_id
  health_check {
    matcher             = "200,301,302"
    path                = var.container_service_health_path
    healthy_threshold   = var.targetgroup_healthy_threshold
    unhealthy_threshold = var.targetgroup_unhealthy_threshold
    timeout             = var.targetgroup_unhealthy_timeout
    interval            = var.targetgroup_each_health_interval_check
    protocol            = "HTTP"
    port                = "traffic-port"
  }
}

