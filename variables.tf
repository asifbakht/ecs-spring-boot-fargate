
variable "name_prefix" {
  default = "banking"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "az_count" {
  default = "2"
}

variable "healthcheck_path" {
  default = "/"
}

variable "alb_protocol" {
  default = "HTTP"
}

variable "web_port" {
  default = "80"
}

# variable "common_port_between_service" {
#   type    = number
#   default = 9997
# }

variable "db_identifier" {
  default = "mysql-db"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0.36"
}

variable "db_cpu_class" {
  default = "db.t2.micro"
}

variable "db_user_name" {
  default = "social_user"
}


variable "db_port" {
  default = 3306
}

variable "redis_identifier" {
  default = "redis-db"
}
variable "redis_engine" {
  default = "redis"
}

variable "redis_engine_version" {
  default = "6.2"
}

variable "redis_node_type" {
  default = "cache.t2.micro"
}

variable "redis_num_cache_nodes" {
  default = 1
}


variable "redis_parameter_group_name" {
  default = "default.redis6.x"
}

variable "redis_port" {
  default = 6379
}
