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
      "arn:aws:s3:::test1/*",
      "arn:aws:s3:::test2",
      "arn:aws:s3:::test2/*",
      "arn:aws:s3:::test3",
      "arn:aws:s3:::test3/*",
      "arn:aws:s3:::test4",
      "arn:aws:s3:::test4/*",
      "arn:aws:s3:::test5",
      "arn:aws:s3:::test5/*",
      "arn:aws:s3:::test6",
      "arn:aws:s3:::test6/*",
      "arn:aws:s3:::test7",
      "arn:aws:s3:::test7/*",
      "arn:aws:s3:::test8",
      "arn:aws:s3:::test8/*",
      "arn:aws:s3:::test9",
      "arn:aws:s3:::test9/*",
      "arn:aws:s3:::test16",
      "arn:aws:s3:::test16/*",
      "arn:aws:s3:::test17",
      "arn:aws:s3:::test17/*",
      "arn:aws:s3:::test18",
      "arn:aws:s3:::test18/*",
      "arn:aws:s3:::test19",
      "arn:aws:s3:::test19/*",
      "arn:aws:s3:::test20",
      "arn:aws:s3:::test20/*",
    ]
  }
}


resource "null_resource" "example" {}
