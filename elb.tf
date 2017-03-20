# Squid Internal ELB
resource "aws_elb" "squid_elb" {
  name                        = "${var.environment}-${var.project}-PRI-${var.microservice}-ELB"
  internal                    = "true"
  subnets                     = ["${module.microservice_squid.subnet_ids}"]
  security_groups             = ["${concat(list(aws_security_group.squid_elb_sg.id),var.elb_additional_sg_ids)}"]
  cross_zone_load_balancing   = "true"
  idle_timeout                = "400"
  connection_draining         = "true"
  connection_draining_timeout = "400"

  access_logs {
    bucket   = "${aws_s3_bucket.squid_elb_s3_access_logs.id}"
    interval = "5"
  }

  listener {
    instance_port     = "${var.proxy_port}"
    instance_protocol = "tcp"
    lb_port           = "${var.proxy_port}"
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    timeout             = "5"
    target              = "HTTP:${var.healthcheck_port}${var.healthcheck_path}"
    interval            = "30"
  }

  tags {
    Name        = "${var.environment}-${var.project}-PRI-${var.microservice}-ELB"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Tier        = "PRI"
  }
}
