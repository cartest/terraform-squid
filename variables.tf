variable "vpc_id" {
  type        = "string"
  description = "Parent VPC ID"
}

variable "squid_ami_id" {
  type        = "string"
  description = "AMI ID"
}

variable "environment" {
  type        = "string"
  description = "Environment Name"
}

variable "project" {
  type        = "string"
  description = "Project Name"
}

variable "microservice" {
  type        = "string"
  description = "Microservice Name"
  default     = "squid"
}

variable "squid_asg_size_min" {
  type        = "string"
  description = "Squid ASG Minimum Size"
}

variable "squid_asg_size_max" {
  type        = "string"
  description = "Squid ASG Maximum Size"
}

variable "squid_lc_instance_type" {
  type        = "string"
  description = "Squid Instance Type"
}

variable "squid_subnets_cidr" {
  type        = "list"
  description = "Subnet list for Squid microservice"
}

variable "pub_route_table" {
  type        = "string"
  description = "Public route table for VPC"
}

variable "availability_zones" {
  type        = "list"
  description = "List of availability zones"
}

variable "zone_id" {
  type        = "string"
  description = "Zone ID for VPC"
}

variable "eu_west_1_elb_account_id_arn" {
  type        = "string"
  description = "ELB account ID for eu-west-1"
  default     = "arn:aws:iam::156460612806:root"
}

variable "asg_egress_http_allowed_cidr" {
  type        = "list"
  description = "List of allowed egress http cidrs that the ASG SG can get talk to"
}

variable "asg_egress_https_allowed_cidr" {
  type        = "list"
  description = "List of allowed egress https cidrs that the ASG SG can get talk to"
}
