###--- S3 bucket to hold elb access logs
resource "aws_s3_bucket" "squid_elb_s3_access_logs" {
  bucket = "${var.environment}-${var.project}-${var.microservice}-access-logs"
  acl    = "private"
  policy = "${data.aws_iam_policy_document.squid_elb_s3_access_logs_iam_policy_document.json}"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "/"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  tags {
    Name        = "${var.environment}-${var.project}-${var.microservice}-access-logs"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

###--- Policy for S3 access log bucket
data "aws_iam_policy_document" "squid_elb_s3_access_logs_iam_policy_document" {
  statement {
    sid = "AllowELBLogging"

    actions = [
      "s3:PutObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["${var.eu_west_1_elb_account_id_arn}"]
    }

    resources = [
      "arn:aws:s3:::${var.environment}-${var.project}-${var.microservice}-access-logs/*",
      "arn:aws:s3:::${var.environment}-${var.project}-${var.microservice}-access-logs",
    ]
  }
}
