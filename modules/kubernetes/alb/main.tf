resource "aws_lb" "k8s-nullplatform" {
  name               = "k8s-nullplatform-${var.visibility}"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.k8s-nullplatform.id]
  subnets            = var.subnets
}

resource "aws_lb_listener" "k8s-nullplatform-listener-http" {
  load_balancer_arn = aws_lb.k8s-nullplatform.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "k8s-nullplatform-listener-https" {
  load_balancer_arn = aws_lb.k8s-nullplatform.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "UnAuthorized"
      status_code  = "401"
    }
  }
}

resource "aws_security_group" "k8s-nullplatform" {
  vpc_id = var.vpc_id

  tags = {
    Name = "k8s-nullplatform-${var.visibility}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_lb_https" {
  security_group_id = aws_security_group.k8s-nullplatform.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_lb_http" {
  security_group_id = aws_security_group.k8s-nullplatform.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_lb_all" {
  security_group_id = aws_security_group.k8s-nullplatform.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = -1
  ip_protocol = -1
  to_port     = -1
}
