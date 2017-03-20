# ELB CNAME
output "squid_elb_cname_fqdn" {
  value = "${aws_route53_record.squid_elb_cname.fqdn}"
}

# Squid ELB S3 Log Bucket
output "squid_elb_logs_bucket_name" {
  value = "${aws_s3_bucket.squid_elb_s3_access_logs.id}"
}

# ELB SG output to allow SG rules from within env code
output "squid_elb_sg_id" {
  value = "${aws_security_group.squid_elb_sg.id}"
}

# Squid Microservice Security Group ID
output "squid_sg_id" {
  value = "${module.microservice_squid.security_group_id}"
}

# Squid Microservice Security Group Name
output "squid_security_group_name" {
  value = "${module.microservice_squid.security_group_name}"
}

# Squid Microservice Launch Configuration ID
output "squid_launch_configuration_id" {
  value = "${module.microservice_squid.launch_configuration_id}"
}

# Squid Microservice Autoscaling Group ID
output "squid_autoscaling_group_id" {
  value = "${module.microservice_squid.autoscaling_group_id}"
}

# Squid Microservice Autoscaling Group Name
output "squid_autoscaling_group_name" {
  value = "${module.microservice_squid.autoscaling_group_name}"
}

# Squid Microservice Instance Profile ID
output "squid_iam_instance_profile_id" {
  value = "${module.microservice_squid.iam_instance_profile_id}"
}

# Squid Microservice Instance Profile ARN
output "squid_iam_instance_profile_arn" {
  value = "${module.microservice_squid.iam_instance_profile_arn}"
}

# Squid Microservice Instance Profile ARN
output "squid_iam_instance_profile_name" {
  value = "${module.microservice_squid.iam_instance_profile_name}"
}

# Squid Microservice Instance Profile Unique ID
output "squid_iam_instance_profile_unique_id" {
  value = "${module.microservice_squid.iam_instance_profile_unique_id}"
}

# Squid Microservice IAM Role ARN
output "squid_iam_role_arn" {
  value = "${module.microservice_squid.iam_role_arn}"
}

# Squid Microservice IAM Role Unique ID
output "squid_iam_role_unique_id" {
  value = "${module.microservice_squid.iam_role_unique_id}"
}

# Squid Microservice IAM Role Name
output "squid_iam_role_name" {
  value = "${module.microservice_squid.iam_role_name}"
}

# Squid Microservice Subnet IDs
output "squid_subnet_ids" {
  value = ["${module.microservice_squid.subnet_ids}"]
}
