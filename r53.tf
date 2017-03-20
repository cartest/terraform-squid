# Squid ELB CNAME
resource "aws_route53_record" "squid_elb_cname" {
  zone_id = "${var.zone_id}"
  name    = "squid"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_elb.squid_elb.dns_name}"]
}
