# define ALB
resource "aws_alb" "alb" {
  name            = "${var.name_prefix}-alb"
  subnets         = flatten(["${aws_subnet.public_subnet.*.id}"])
  security_groups = ["${aws_security_group.load_balancer_sg.id}"]
}

resource "aws_alb_target_group" "alb_target_group" {
  name        = "${var.name_prefix}-alb-tg"
  port        = var.web_port
  protocol    = var.alb_protocol
  vpc_id      = aws_vpc.main_network.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "4"
    unhealthy_threshold = "4"
    timeout             = "4"
    interval            = "7"
    protocol            = var.alb_protocol
    matcher             = "200"
    path                = var.healthcheck_path
  }
}

resource "aws_alb_listener" "load_balancer_listener" {
  load_balancer_arn = aws_alb.alb.id
  port              = var.web_port
  protocol          = var.alb_protocol

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      message_body = "{ 'ECS FARGATE':'ok' }"
      status_code  = 200
    }
  }
}

