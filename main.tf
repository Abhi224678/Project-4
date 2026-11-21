provider "aws" {
  region = "ap-south-1"
}

variable "s3_read_policy" {
  description = "S3 read-only permissions"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::*/*"
    }
  ]
}
POLICY
}
resource "aws_iam_user" "s3_reader" {
  name = "project4-s3-read-user"
}

resource "aws_iam_policy" "s3_read" {
  name   = "project4-s3-read-policy"
  policy = var.s3_read_policy
}

resource "aws_iam_user_policy_attachment" "s3_read" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read.arn
}
	
