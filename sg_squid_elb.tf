# Security group that will be attached to the squid ELB
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
