# ELB Account Principal for Whitelisting Bucket Access
data "aws_elb_service_account" "main" {}

# Policy for S3 access log bucket
data "aws_iam_policy_document" "squid_elb_s3_access_logs_iam_policy_document" {
  statement {
    sid = "AllowELBLogging"

    actions = [
      "s3:PutObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["${data.aws_elb_service_account.main.arn}"]
    }

    resources = [
      "arn:aws:s3:::${var.environment}-${var.project}-${var.microservice}-access-logs/*",
    ]
  }
}
