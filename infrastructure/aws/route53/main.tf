resource "aws_route53_zone" "public_zone" {
  name     = var.domain_name
}

resource "aws_route53_zone" "private_zone" {
  name     = var.domain_name
  vpc {
    vpc_id = var.vpc_id
  }
}
