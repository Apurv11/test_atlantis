resource "aws_iam_role" "test_atlantis" {
  name = "atlantis-role"
  assume_role_policy = data.aws_iam_policy_document.default_ec2_assume_role.json
}

data "aws_iam_policy_document" "default_ec2_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "test_policy" {
  name        = "atlantis-policy"
  path        = "/"
  description = "test policy for atlantis"
  policy      = data.aws_iam_policy_document.atlantis-s3-read.json
}

resource "aws_iam_role_policy_attachment" "atlantis_policy_role_attachment" {
  role       = aws_iam_role.test_atlantis.name
  policy_arn = aws_iam_policy.test_policy.arn
}

data "aws_iam_policy_document" "atlantis-s3-read" {
  statement {
    sid    = 1
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::test1",
      "arn:aws:s3:::test-test-paper-mandates",
      "arn:aws:s3:::test-test-api-invoices",
      "arn:aws:s3:::rzp-api-reconciliation",
      "arn:aws:s3:::rzp-1642-test-nps/*",
      "arn:aws:s3:::rzp-1642-test-nps",
      "arn:aws:s3:::test-test-sftp",
      "arn:aws:s3:::test-test-settlement-service",
      "arn:aws:s3:::test-test-micro-service",
      "arn:aws:s3:::test-test-pizza-service",
      "arn:aws:s3:::test-test-growth-service/*",
      "arn:aws:s3:::test-test-growth-service",
      "arn:aws:s3:::test-test-facebook",
      "arn:aws:s3:::checkout-test",
      "arn:aws:s3:::donut-service"
    ]
  }
}
