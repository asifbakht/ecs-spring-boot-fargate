resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "mysql_db" {
  identifier             = "${var.name_prefix}-${var.db_identifier}"
  allocated_storage      = 20
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_cpu_class
  username               = var.db_user_name
  password               = random_password.password.result
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.mysql_access_sg.id]
  skip_final_snapshot    = true
  multi_az               = true
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.name_prefix}-redis-subnet-group"
  subnet_ids = flatten(["${aws_subnet.private_subnet.*.id}"])
}


resource "aws_elasticache_cluster" "redis_db" {
  cluster_id           = "${var.name_prefix}-${var.redis_identifier}"
  engine               = var.redis_engine
  engine_version       = var.redis_engine_version
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_num_cache_nodes
  parameter_group_name = var.redis_parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [aws_security_group.redis_access_sg.id]
  apply_immediately    = true
}


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = flatten([aws_subnet.private_subnet.*.id])
}
