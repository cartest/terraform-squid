# Egress rule on the ELB to allow access to squid proxy port
resource "aws_security_group_rule" "elb_egress_squid_proxy" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${var.proxy_port}"
  to_port                  = "${var.proxy_port}"
  security_group_id        = "${aws_security_group.squid_elb_sg.id}"
  source_security_group_id = "${module.microservice_squid.security_group_id}"
}

# Egress rule on the ELB to allow access to squid healthcheck port
resource "aws_security_group_rule" "elb_egress_squid_healthcheck" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "${var.healthcheck_port}"
  to_port                  = "${var.healthcheck_port}"
  security_group_id        = "${aws_security_group.squid_elb_sg.id}"
  source_security_group_id = "${module.microservice_squid.security_group_id}"
}
