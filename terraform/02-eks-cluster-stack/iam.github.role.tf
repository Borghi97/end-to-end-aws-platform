resource "aws_iam_role" "github" {
  name = "github-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.github.arn
      }
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" = "repo:Borghi97/end-to-end-aws-platform:*"
        }
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_policy" "github" {
  name        = "github-role-policy"
 
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
         "ecr:GetAuthorizationToken",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
        ]
        Effect   = "Allow"
        Resource = aws_ecr_repository.this[*].arn
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github" {
  policy_arn = aws_iam_policy.github.arn
  role       = aws_iam_role.github.name
}