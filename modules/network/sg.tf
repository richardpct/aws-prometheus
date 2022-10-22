resource "aws_security_group" "grafana" {
  name   = "sg_grafana-${var.env}"
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "grafana_sg-${var.env}"
  }
}

resource "aws_security_group_rule" "grafana_inbound_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_allowed_ssh]
  security_group_id = aws_security_group.grafana.id
}

resource "aws_security_group_rule" "grafana_inbound_http" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_allowed_ssh]
  security_group_id = aws_security_group.grafana.id
}

resource "aws_security_group_rule" "grafana_outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.grafana.id
}

resource "aws_security_group" "prometheus" {
  name   = "sg_prometheus-${var.env}"
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "prometheus_sg-${var.env}"
  }
}

resource "aws_security_group_rule" "prometheus_inbound_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_allowed_ssh]
  security_group_id = aws_security_group.prometheus.id
}

resource "aws_security_group_rule" "prometheus_inbound_http" {
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_allowed_ssh]
  security_group_id = aws_security_group.prometheus.id
}

resource "aws_security_group_rule" "prometheus_outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.prometheus.id
}

resource "aws_security_group_rule" "grafana_inbound_prometheus" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.prometheus.id
  security_group_id        = aws_security_group.grafana.id
}

resource "aws_security_group_rule" "prometheus_outbound_grafana" {
  type                     = "egress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.grafana.id
  security_group_id        = aws_security_group.prometheus.id
}

resource "aws_security_group_rule" "prometheus_inbound_grafana" {
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.grafana.id
  security_group_id        = aws_security_group.prometheus.id
}

resource "aws_security_group_rule" "grafana_outbound_prometheus" {
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.prometheus.id
  security_group_id        = aws_security_group.grafana.id
}
