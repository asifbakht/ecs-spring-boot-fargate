
resource "aws_service_discovery_http_namespace" "namespace" {
  name = "${var.name_prefix}-namespace.local"
}

