resource "aws_cloudwatch_log_group" "log_group" {
  name = "ecs/service/${var.app_name}-log"

}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "ecs/${var.app_name}-logstream"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}
