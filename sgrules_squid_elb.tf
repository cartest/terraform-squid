# Egress rule on the ELB to allow access to squid ASG on 3128
resource "aws_security_group_rule" "squid_elb_egress" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "3128"
  to_port                  = "3128"
  security_group_id        = "${aws_security_group.squid_elb_sg.id}"
  source_security_group_id = "${module.microservice_squid.security_group_id}"
}
