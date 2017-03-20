# Egress rules to allow ASG outbound to internet
resource "aws_security_group_rule" "outbound_http" {
  count             = "${length(var.asg_egress_http_allowed_cidr)}"
  type              = "egress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["${element(var.asg_egress_http_allowed_cidr, count.index)}"]
  security_group_id = "${module.microservice_squid.security_group_id}"
}

resource "aws_security_group_rule" "outbound_https" {
  count             = "${length(var.asg_egress_https_allowed_cidr)}"
  type              = "egress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  cidr_blocks       = ["${element(var.asg_egress_https_allowed_cidr, count.index)}"]
  security_group_id = "${module.microservice_squid.security_group_id}"
}

# Ingress rule on the ASG to allow inbound from the ELB for proxy traffic
resource "aws_security_group_rule" "asg_inbound_from_elb_proxy" {
  type                     = "ingress"
  from_port                = "${var.proxy_port}"
  to_port                  = "${var.proxy_port}"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_squid.security_group_id}"
  source_security_group_id = "${aws_security_group.squid_elb_sg.id}"
}

# Ingress rule on the ASG to allow inbound from the ELB for healthcheck
resource "aws_security_group_rule" "asg_inbound_from_elb_healthcheck" {
  type                     = "ingress"
  from_port                = "${var.healthcheck_port}"
  to_port                  = "${var.healthcheck_port}"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_squid.security_group_id}"
  source_security_group_id = "${aws_security_group.squid_elb_sg.id}"
}
