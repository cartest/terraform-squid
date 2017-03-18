###--- Ingress rule on the ASG to allow inbound from the ELB on 3128
resource "aws_security_group_rule" "squid_asg_ingress" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "3128"
  to_port                  = "3128"
  security_group_id        = "${module.microservice_squid.security_group_id}"
  source_security_group_id = "${aws_security_group.squid_elb_sg.id}"
}

###--- Egress rules to allow ASG outbound to internet
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
