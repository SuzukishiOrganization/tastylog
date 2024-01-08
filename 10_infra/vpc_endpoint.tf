locals {
  vpc_endpoint_subnet_id = local.subnet_ids[0]
}

data "aws_subnet" "vpc_endpoint" {
  id = local.vpc_endpoint_subnet_id
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  tags = {
    Name = "${var.project}-${var.environment}-ecr-dkr-vpc-endpoint"
  }
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  vpc_id            = local.vpc_id
  subnet_ids        = [local.vpc_endpoint_subnet_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api" {
  tags = {
    Name = "${var.project}-${var.environment}-ecr-api-vpc-endpoint"
  }
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  vpc_id            = local.vpc_id
  subnet_ids        = [local.vpc_endpoint_subnet_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  tags = {
    Name = "${var.project}-${var.environment}-logs-vpc-endpoint"
  }
  service_name      = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  vpc_id            = local.vpc_id
  subnet_ids        = [local.vpc_endpoint_subnet_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  tags = {
    Name = "${var.project}-${var.environment}-ssm-vpc-endpoint"
  }
  service_name      = "com.amazonaws.ap-northeast-1.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  vpc_id            = local.vpc_id
  subnet_ids        = [local.vpc_endpoint_subnet_id]
  private_dns_enabled = true
}
