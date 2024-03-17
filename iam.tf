resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "${var.name_prefix}_ecsTaskExeRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# resource "aws_iam_role_policy_attachment" "ecsFargateAllowCommandPolicy" {
#   role       = aws_iam_role.ecsTaskExecutionRole.name
#   policy_arn = aws_iam_policy.ecsAllowCommandExecutePolicy.arn
# }


# resource "aws_iam_policy" "ecsAllowCommandExecutePolicy" {
#   name        = "ECSFargateAllowExecuteCommand"
#   description = "Allow to execute shell command iwthin ecs fargate"
#   policy = jsonencode(
#     {
#       Version = "2012-10-17"
#       Statement = [
#         {
#           Effect = "Allow",
#           Action = [
#             "ssmmessages:CreateControlChannel",
#             "ssmmessages:CreateDataChannel",
#             "ssmmessages:OpenControlChannel",
#             "ssmmessages:OpenDataChannel"
#           ],
#           Resource = "*"
#         }
#       ]
#     }
#   )
# }
