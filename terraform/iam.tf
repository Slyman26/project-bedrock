# ----------------------------
# Developer IAM User
# ----------------------------
resource "aws_iam_user" "dev_view" {
  name = "bedrock-dev-view"
  tags = {
    Project = "barakat-2025-capstone"
  }
}

# Attach AWS managed ReadOnlyAccess policy
resource "aws_iam_user_policy_attachment" "dev_view_readonly" {
  user       = aws_iam_user.dev_view.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Custom policy: allow S3 putObject to assets bucket
resource "aws_iam_policy" "dev_view_s3_put" {
  name        = "bedrock-dev-view-s3-put"
  description = "Allow dev user to put objects into assets bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:PutObject", "s3:ListBucket"]
        Resource = [
          aws_s3_bucket.assets.arn,
          "${aws_s3_bucket.assets.arn}/*"
        ]
      }
    ]
  })
}

# Attach policy to user
resource "aws_iam_user_policy_attachment" "dev_view_s3_attach" {
  user       = aws_iam_user.dev_view.name
  policy_arn = aws_iam_policy.dev_view_s3_put.arn
}

# Create access key for user
resource "aws_iam_access_key" "dev_view_key" {
  user = aws_iam_user.dev_view.name

  depends_on = [
    aws_iam_user_policy_attachment.dev_view_readonly,
    aws_iam_user_policy_attachment.dev_view_s3_attach
  ]
}
