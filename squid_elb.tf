###--- Squid ELB
resource "aws_elb" "squid_elb" {
  name                        = "${var.environment}-${var.project}-PRI-${var.microservice}-ELB"
  internal                    = true
  subnets                     = ["${module.microservice_squid.subnet_ids}"]
  security_groups             = ["${aws_security_group.squid_elb_sg.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  access_logs {
    bucket        = "${aws_s3_bucket.squid_elb_s3_access_logs.id}"
    bucket_prefix = ""
    interval      = 5
  }

  listener {
    instance_port     = 3128
    instance_protocol = "tcp"
    lb_port           = 3128
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:3128"
    interval            = 30
  }

  tags {
    Name        = "${var.environment}-${var.project}-PRI-${var.microservice}-ELB"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Tier        = "PRI"
  }
}

###--- Squid ELB CNAME
resource "aws_route53_record" "squid_elb_cname" {
  zone_id = "${var.zone_id}"
  name    = "squid"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_elb.squid_elb.dns_name}"]
}

###--- Security group that will be attached to the squid ELB
resource "aws_security_group" "squid_elb_sg" {
  name        = "${var.environment}-${var.project}-${var.microservice}-elb-sg"
  description = "Squid ELB security group"
  vpc_id      = "${var.vpc_id}"

  tags {
    "Name"        = "${var.environment}-${var.project}-${var.microservice}-elb-sg"
    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
  }
}

###--- Egress rule on the ELB to allow access to squid ASG on 3128
resource "aws_security_group_rule" "squid_elb_egress" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "3128"
  to_port                  = "3128"
  security_group_id        = "${aws_security_group.squid_elb_sg.id}"
  source_security_group_id = "${module.microservice_squid.security_group_id}"
}
