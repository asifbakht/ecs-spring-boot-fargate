# ALB security group
resource "aws_security_group" "load_balancer_sg" {
  name   = "${var.name_prefix}-alb-sg"
  vpc_id = aws_vpc.main_network.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_lb_target_group" "target_group" {
  name        = "${var.name_prefix}-lb-group"
  port        = var.web_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main_network.id
}


resource "aws_security_group" "db_access_sg" {
  name   = "${var.name_prefix}-database-sg"
  vpc_id = aws_vpc.main_network.id

  # ingress { if db connection error then check if this could be the problem
  #   from_port   = 0
  #   to_port     = 65535
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.redis_port
    to_port     = var.redis_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "mysql_access_sg" {
  name   = "${var.name_prefix}-rds-sg"
  vpc_id = aws_vpc.main_network.id

  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.db_access_sg.id]
  }
}

resource "aws_security_group" "redis_access_sg" {
  name   = "${var.name_prefix}-redis-sg"
  vpc_id = aws_vpc.main_network.id

  ingress {
    from_port       = var.redis_port
    to_port         = var.redis_port
    protocol        = "tcp"
    security_groups = [aws_security_group.db_access_sg.id]
  }
}
