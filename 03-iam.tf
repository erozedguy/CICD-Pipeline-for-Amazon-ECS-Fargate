resource "aws_iam_role" "codebuild-role" {
  name = "codebuild-role" 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "codebuild-policy" {
  role = "${aws_iam_role.codebuild-role.name}"

  policy =  jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid      = "CodeCommitPolicy"
          Action   = ["codecommit:GitPull"]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Sid      = "ECRPullPolicy"
          Action   = [
                      "ecr:BatchCheckLayerAvailability",
                      "ecr:GetDownloadUrlForLayer",
                      "ecr:BatchGetImage",
                      "ecr:PutImage"]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Sid      = "ECRAuthPolicy"
          Action   = ["ecr:BatchCheckLayerAvailability",
                      "ecr:CompleteLayerUpload",
                      "ecr:GetAuthorizationToken",
                      "ecr:InitiateLayerUpload",
                      "ecr:PutImage",
                      "ecr:UploadLayerPart"]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Sid      = "CloudWatchLogsPolicy",
          Action   = [
                      "logs:CreateLogGroup",
                      "logs:CreateLogStream",
                      "logs:PutLogEvents"]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action   = [
                      "s3:PutObject",
                      "s3:GetObject",
                      "s3:GetObjectVersion",
                      "s3:GetBucketAcl",
                      "s3:GetBucketLocation"]
          Effect   = "Allow"
          Resource = "*"
        }
      ]


  })

}