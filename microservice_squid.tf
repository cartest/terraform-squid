module "microservice_squid" {
  source                          = "github.com/cartest/terraform-microservice.git"
  asg_size_max                    = "${var.squid_asg_size_max}"
  asg_size_min                    = "${var.squid_asg_size_min}"
  availability_zones              = "${var.availability_zones}"
  lc_ami_id                       = "${var.squid_ami_id}"
  lc_instance_type                = "${var.squid_lc_instance_type}"
  load_balancers                  = ["${aws_elb.squid_elb.id}"]
  name                            = "${var.microservice}"
  nodetype                        = "${var.microservice}"
  subnets_cidr                    = "${var.squid_subnets_cidr}"
  subnets_map_public_ip_on_launch = true
  subnets_route_tables            = ["${var.pub_route_table}"]
  vpc_id                          = "${var.vpc_id}"
  asg_enabled_metrics             = "GroupTerminatingInstances,GroupMaxSize,GroupDesiredCapacity,GroupPendingInstances,GroupInServiceInstances,GroupMinSize,GroupTotalInstances"

  tags {
    Environment = "${var.environment}"
    Application = "${var.project}"
    Tier        = "PUB"
  }
}
