variable "asg_egress_http_allowed_cidr" {
  type        = "list"
  description = "List of allowed egress http cidrs that the ASG SG can get talk to"
}

variable "asg_egress_https_allowed_cidr" {
  type        = "list"
  description = "List of allowed egress https cidrs that the ASG SG can get talk to"
}

variable "availability_zones" {
  type        = "list"
  description = "List of availability zones"
}

variable "elb_additional_sg_ids" {
  type        = "list"
  default     = []
  description = "List of additional Security Group IDs to attach to the Squid ELB"
}

variable "environment" {
  type        = "string"
  description = "Environment Name"
}

variable "healthcheck_path" {
  type        = "string"
  description = "Optional URL path to provide to the ELB healthcheck configuration. Requires preceding forwardslash. Set to '' to disable"
  default     = "/healthcheck/"
}

variable "healthcheck_port" {
  type        = "string"
  description = "Port used for healthcheck traffic"
  default     = "9999"
}

variable "microservice" {
  type        = "string"
  description = "Microservice Name"
  default     = "squid"
}

variable "microservice_additional_sg_ids" {
  type        = "list"
  default     = []
  description = "List of additional Security Group IDs to attach to the Squid Microservice Launch Configuration"
}

variable "project" {
  type        = "string"
  description = "Project Name"
}

variable "proxy_port" {
  type        = "string"
  description = "Port used for proxy traffic"
  default     = "3128"
}

variable "pub_route_table" {
  type        = "string"
  description = "Public route table for VPC"
}

variable "squid_ami_id" {
  type        = "string"
  description = "AMI ID"
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

variable "vpc_id" {
  type        = "string"
  description = "Parent VPC ID"
}

variable "zone_id" {
  type        = "string"
  description = "Zone ID for VPC"
}
