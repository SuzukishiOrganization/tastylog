# ---------------------------------------------
# Elastic Container Registry
# ---------------------------------------------
resource "aws_ecr_repository" "webapp" {
  name                 = "${var.project}-webapp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = {
    Name    = "${var.project}-webapp"
    Project = var.project
  }

  # force_delete = true
}
