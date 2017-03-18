###--- ELB SG output to allow SG rules from within env code
output "squid_elb_sg_id" {
  value = "${aws_security_group.squid_elb_sg.id}"
}

###--- ELB CNAME
output "squid_elb_cname_fqdn" {
  value = "${aws_route53_record.squid_elb_cname.fqdn}"
}

output "squid_sg_id" {
  value = "${module.microservice_squid.security_group_id}"
}
