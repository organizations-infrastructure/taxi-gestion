locals {
  policies = {
    vpc-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:DescribeAvailabilityZones",
            "ec2:CreateTags"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateNatGateway",
            "ec2:DeleteNatGateway",
            "ec2:DescribeNatGateways",
            "ec2:AllocateAddress",
            "ec2:ReleaseAddress",
            "ec2:DescribeAddresses",
            "ec2:CreateInternetGateway",
            "ec2:DescribeInternetGateways",
            "ec2:AttachInternetGateway",
            "ec2:DetachInternetGateway",
            "ec2:DeleteInternetGateway"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateVpc",
            "ec2:DescribeVpcs",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeVpcAttribute",
            "ec2:ModifyVpcAttribute",
            "ec2:DeleteVpc",
            "ec2:DescribeVpcClassicLink",
            "ec2:DisableVpcClassicLink",
            "ec2:EnableVpcClassicLink",
            "ec2:DescribeVpcClassicLinkDnsSupport",
            "ec2:DisableVpcClassicLinkDnsSupport",
            "ec2:EnableVpcClassicLinkDnsSupport"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateSubnet",
            "ec2:DescribeSubnets",
            "ec2:ModifySubnetAttribute",
            "ec2:DeleteSubnet"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateRouteTable",
            "ec2:DescribeRouteTables",
            "ec2:CreateRoute",
            "ec2:ReplaceRoute",
            "ec2:DeleteRoute",
            "ec2:DeleteRouteTable",
            "ec2:AssociateRouteTable",
            "ec2:DisassociateRouteTable",
            "ec2:ReplaceRouteTableAssociation"
          ],
          "Resource" : "*"
        }
      ]
    })
    domain-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "acm:RequestCertificate",
            "acm:DescribeCertificate",
            "acm:DeleteCertificate",
            "acm:ListCertificates",
            "acm:ListTagsForCertificate",
            "acm:AddTagsToCertificate",
            "acm:RemoveTagsFromCertificate"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "route53:GetHostedZone",
            "route53:ListHostedZones",
            "route53:ChangeTagsForResource",
            "route53:CreateHostedZone",
            "route53:DeleteHostedZone",
            "route53:UpdateHostedZoneComment",
            "route53:ChangeResourceRecordSets",
            "route53:ListResourceRecordSets",
            "route53:ListTagsForResource",
            "route53:GetChange",
            "route53:GetReusableDelegationSet",
            "route53:ListReusableDelegationSets",
            "route53:CreateReusableDelegationSet",
            "route53:DeleteReusableDelegationSet"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "route53domains:ListDomains",
            "route53domains:GetDomainDetail",
            "route53domains:RegisterDomain",
            "route53domains:DeleteDomain",
            "route53domains:GetOperationDetail",
            "route53domains:UpdateDomainContact",
            "route53domains:UpdateDomainNameservers",
            "route53domains:CheckDomainAvailability",
            "route53domains:RetrieveDomainAuthCode",
            "route53domains:ListTagsForDomain",
            "route53domains:UpdateTagsForDomain"
          ],
          "Resource" : "*"
        }
      ]
    })
    email-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateRole",
            "iam:DeleteRole",
            "iam:AttachRolePolicy",
            "iam:DetachRolePolicy",
            "iam:PutRolePolicy",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:ListRolePolicies",
            "iam:ListAttachedRolePolicies",
            "iam:DeleteRolePolicy",
            "iam:ListInstanceProfilesForRole",
            "iam:PassRole"
          ],
          "Resource" : "arn:aws:iam::*:role/lambda_execution_role"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "lambda:CreateFunction",
            "lambda:UpdateFunctionCode",
            "lambda:UpdateFunctionConfiguration",
            "lambda:GetFunction",
            "lambda:GetFunctionConfiguration",
            "lambda:GetFunctionCodeSigningConfig",
            "lambda:GetPolicy",
            "lambda:ListFunctions",
            "lambda:ListVersionsByFunction",
            "lambda:DeleteFunction",
            "lambda:InvokeFunction",
            "lambda:AddPermission",
            "lambda:RemovePermission"
          ],
          "Resource" : "arn:aws:lambda:*:*:function:email_forwarding"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:CreateBucket",
            "s3:DeleteBucket",
            "s3:DeleteObject",
            "s3:DeleteBucketPolicy",
            "s3:GetAccelerateConfiguration",
            "s3:GetAnalyticsConfiguration",
            "s3:GetBucketAcl",
            "s3:GetBucketCORS",
            "s3:GetBucketLocation",
            "s3:GetBucketLogging",
            "s3:GetBucketNotification",
            "s3:GetBucketObjectLockConfiguration",
            "s3:GetBucketOwnershipControls",
            "s3:GetBucketPolicy",
            "s3:GetBucketPolicyStatus",
            "s3:GetBucketPublicAccessBlock",
            "s3:GetBucketRequestPayment",
            "s3:GetBucketTagging",
            "s3:GetBucketVersioning",
            "s3:GetBucketWebsite",
            "s3:GetEncryptionConfiguration",
            "s3:GetIntelligentTieringConfiguration",
            "s3:GetInventoryConfiguration",
            "s3:GetLifecycleConfiguration",
            "s3:GetMetricsConfiguration",
            "s3:GetObject",
            "s3:GetObjectAcl",
            "s3:GetObjectAttributes",
            "s3:GetObjectLegalHold",
            "s3:GetObjectRetention",
            "s3:GetObjectTagging",
            "s3:GetObjectTorrent",
            "s3:GetObjectVersion",
            "s3:GetObjectVersionAcl",
            "s3:GetObjectVersionAttributes",
            "s3:GetObjectVersionForReplication",
            "s3:GetObjectVersionTagging",
            "s3:GetObjectVersionTorrent",
            "s3:GetReplicationConfiguration",
            "s3:ListBucket",
            "s3:PutBucketPolicy",
            "s3:PutBucketTagging",
            "s3:PutObject"
          ],
          "Resource" : [
            "arn:aws:s3:::${local.project.name}-email",
            "arn:aws:s3:::${local.project.name}-email/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ses:CreateConfigurationSet",
            "ses:CreateEmailIdentity",
            "ses:CreateEmailTemplate",
            "ses:CreateReceiptRule",
            "ses:CreateReceiptRuleSet",
            "ses:DeleteConfigurationSet",
            "ses:DeleteEmailIdentity",
            "ses:DeleteEmailTemplate",
            "ses:DeleteReceiptRule",
            "ses:DeleteReceiptRuleSet",
            "ses:DescribeReceiptRule",
            "ses:DescribeReceiptRuleSet",
            "ses:GetConfigurationSet",
            "ses:GetEmailIdentity",
            "ses:GetEmailTemplate",
            "ses:ListConfigurationSets",
            "ses:ListEmailIdentities",
            "ses:ListEmailTemplates",
            "ses:ListReceiptRules",
            "ses:ListReceiptRuleSets",
            "ses:ListTagsForResource",
            "ses:SendEmail",
            "ses:SendRawEmail",
            "ses:TagResource",
            "ses:UpdateConfigurationSet",
            "ses:UpdateEmailIdentity",
            "ses:UpdateEmailTemplate",
            "ses:UpdateReceiptRule",
            "ses:UpdateReceiptRuleSet"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "route53:ChangeResourceRecordSets",
            "route53:ListResourceRecordSets",
            "route53:GetHostedZone",
            "route53:GetChange"
          ],
          "Resource" : [
            "arn:aws:route53:::hostedzone/*",
            "arn:aws:route53:::change/*"
          ]
        }
      ]
    })
    identity-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "cognito-idp:CreateUserPool",
            "cognito-idp:DeleteUserPool",
            "cognito-idp:UpdateUserPool",
            "cognito-idp:CreateUserPoolClient",
            "cognito-idp:DeleteUserPoolClient",
            "cognito-idp:UpdateUserPoolClient",
            "cognito-idp:Describe*",
            "cognito-idp:List*",
            "cognito-idp:AdminCreateUser",
            "cognito-idp:AdminDeleteUser",
            "cognito-idp:AdminUpdateUserAttributes",
            "cognito-idp:AdminAddUserToGroup",
            "cognito-idp:AdminRemoveUserFromGroup",
            "cognito-idp:SignUp",
            "cognito-idp:ConfirmSignUp",
            "cognito-idp:InitiateAuth",
            "cognito-idp:RespondToAuthChallenge",
            "cognito-idp:ForgotPassword",
            "cognito-idp:ConfirmForgotPassword",
            "cognito-idp:GlobalSignOut",
            "cognito-idp:ChangePassword",
            "cognito-idp:GetUserPoolMfaConfig",
            "cognito-idp:CreateGroup",
            "cognito-idp:ListGroup",
            "cognito-idp:DeleteGroup",
            "cognito-idp:GetGroup",
            "cognito-idp:UpdateGroup",
            "cognito-idp:TagResource"
          ],
          "Resource" : [
            "*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "sns:SetSMSAttributes",
            "sns:GetSMSAttributes",
            "sns:Publish"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateServiceLinkedRole",
            "iam:DeleteServiceLinkedRole",
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateRole",
            "iam:DeleteRole",
            "iam:AttachRolePolicy",
            "iam:DetachRolePolicy",
            "iam:PutRolePolicy",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:ListRolePolicies",
            "iam:ListAttachedRolePolicies",
            "iam:DeleteRolePolicy",
            "iam:ListInstanceProfilesForRole",
            "iam:PassRole"
          ],
          "Resource" : "arn:aws:iam::*:role/CognitoSNSTrustedRole"
        },
      ]
    })
    persistence-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "rds:DescribeDBInstances",
            "rds:CreateDBInstance",
            "rds:ModifyDBInstance",
            "rds:DeleteDBInstance",
            "rds:StartDBInstance",
            "rds:StopDBInstance",
            "rds:CreateDBSnapshot",
            "rds:DeleteDBSnapshot",
            "rds:RestoreDBInstanceFromDBSnapshot",
            "rds:DescribeDBSubnetGroups",
            "rds:ListTagsForResource",
            "rds:AddTagsToResource",
            "rds:RemoveTagsFromResource",
            "rds:CreateDBSubnetGroup",
            "rds:ModifyDBSubnetGroup",
            "rds:DeleteDBSubnetGroup"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Action" : [
            "ec2:CreateTags",
            "ec2:DescribeSecurityGroups",
            "ec2:CreateSecurityGroup",
            "ec2:DeleteSecurityGroup",
            "ec2:DescribeSecurityGroupRules",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:RevokeSecurityGroupIngress",
            "ec2:AuthorizeSecurityGroupEgress",
            "ec2:RevokeSecurityGroupEgress",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcs",
            "ec2:DescribeSubnets",
            "ec2:DescribeAvailabilityZones"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateServiceLinkedRole",
            "iam:DeleteServiceLinkedRole",
            "iam:GetServiceLinkedRoleDeletionStatus"
          ],
          "Resource" : "arn:aws:iam::*:role/aws-service-role/rds.amazonaws.com/AWSServiceRoleForRDS",
          "Condition" : {
            "StringLike" : {
              "iam:AWSServiceName" : "rds.amazonaws.com"
            }
          }
        },
        {
          "Action" : [
            "secretsmanager:CancelRotateSecret",
            "secretsmanager:CreateSecret",
            "secretsmanager:DeleteSecret",
            "secretsmanager:DescribeSecret",
            "secretsmanager:GetRandomPassword",
            "secretsmanager:GetResourcePolicy",
            "secretsmanager:GetSecretValue",
            "secretsmanager:ListSecrets",
            "secretsmanager:ListSecretVersionIds",
            "secretsmanager:PutResourcePolicy",
            "secretsmanager:PutSecretValue",
            "secretsmanager:RotateSecret",
            "secretsmanager:TagResource",
            "secretsmanager:UntagResource",
            "secretsmanager:UpdateSecret",
            "secretsmanager:UpdateSecretVersionStage"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Action" : [
            "kms:CreateGrant",
            "kms:Decrypt",
            "kms:DescribeKey",
            "kms:Encrypt",
            "kms:GenerateDataKey",
            "kms:GenerateDataKeyWithoutPlaintext",
            "kms:ReEncrypt*",
            "kms:RetireGrant"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
        # Ephemeral
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:DescribeAvailabilityZones",
            "ec2:CreateTags"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateVpc",
            "ec2:DescribeVpcs",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeVpcAttribute",
            "ec2:ModifyVpcAttribute",
            "ec2:DeleteVpc",
            "ec2:DescribeVpcClassicLink",
            "ec2:DisableVpcClassicLink",
            "ec2:EnableVpcClassicLink",
            "ec2:DescribeVpcClassicLinkDnsSupport",
            "ec2:DisableVpcClassicLinkDnsSupport",
            "ec2:EnableVpcClassicLinkDnsSupport"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateSubnet",
            "ec2:DescribeSubnets",
            "ec2:ModifySubnetAttribute",
            "ec2:DeleteSubnet"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateInternetGateway",
            "ec2:DescribeInternetGateways",
            "ec2:AttachInternetGateway",
            "ec2:DetachInternetGateway",
            "ec2:DeleteInternetGateway"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateRouteTable",
            "ec2:DescribeRouteTables",
            "ec2:CreateRoute",
            "ec2:ReplaceRoute",
            "ec2:DeleteRoute",
            "ec2:DeleteRouteTable"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:AssociateRouteTable",
            "ec2:DisassociateRouteTable",
            "ec2:ReplaceRouteTableAssociation"
          ],
          "Resource" : "*"
        }
        # Ephemeral
      ]
    })
    registry-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:CreateRepository",
            "ecr:DeleteRepository",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload",
            "ecr:DescribeRepositories",
            "ecr:ListImages",
            "ecr:ListTagsForResource",
            "ecr:TagResource",
            "ecr:UntagResource",
            "ecr:DescribeImages"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
    ecr = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ecr:GetAuthorizationToken"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload",
            "ecr:PutImage"
          ],
          "Resource" : "*" #"arn:aws:ecr:us-east-1:<account-id>:repository/<repository-name>" => get account id from child-organization output
        }
      ]
    })
    api-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ecs:CreateCluster",
            "ecs:DeleteCluster",
            "ecs:DescribeClusters",
            "ecs:UpdateClusterSettings",
            "ecs:CreateTaskDefinition",
            "ecs:DeleteTaskDefinition",
            "ecs:DescribeTaskDefinition",
            "ecs:UpdateTaskDefinition",
            "ecs:RegisterTaskDefinition",
            "ecs:CreateService",
            "ecs:UpdateService",
            "ecs:DeleteService",
            "ecs:DescribeServices",
            "ecs:ListTasks",
            "ecs:DescribeTasks",
            "ecs:RunTask",
            "ecs:StartTask",
            "ecs:StopTask",
            "ecs:DeregisterTaskDefinition",
            "ecs:DescribeContainerInstances",
            "ecs:DescribeTaskSets",
            "ecs:UpdateContainerInstancesState",
            "ecs:PutAccountSetting",
            "ecs:PutAccountSettingDefault",
            "ecs:PutClusterCapacityProviders",
            "ecs:RegisterContainerInstance",
            "ecs:Submit*"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:DescribeLogGroups",
            "logs:DescribeLogStreams",
            "logs:PutLogEvents"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:DescribeRepositories",
            "ecr:ListImages",
            "ecr:DescribeImages",
          ],
          "Resource" : "*"
        },
        {
          Action = [
            "elasticloadbalancing:CreateListener",
            "elasticloadbalancing:CreateLoadBalancer",
            "elasticloadbalancing:CreateTargetGroup",
            "elasticloadbalancing:DeleteListener",
            "elasticloadbalancing:DeleteLoadBalancer",
            "elasticloadbalancing:DeleteTargetGroup",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:DescribeListeners",
            "elasticloadbalancing:DescribeLoadBalancerAttributes",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeTags",
            "elasticloadbalancing:AddTags",
            "elasticloadbalancing:RemoveTags",
            "elasticloadbalancing:DescribeTargetGroupAttributes",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:DescribeTargetHealth",
            "elasticloadbalancing:ModifyListener",
            "elasticloadbalancing:ModifyLoadBalancerAttributes",
            "elasticloadbalancing:ModifyTargetGroup",
            "elasticloadbalancing:ModifyTargetGroupAttributes",
            "elasticloadbalancing:RegisterTargets",
            "elasticloadbalancing:SetSecurityGroups"
          ]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "apigateway:CreateApi",
            "apigateway:CreateAuthorizer",
            "apigateway:CreateIntegration",
            "apigateway:CreateRoute",
            "apigateway:CreateStage",
            "apigateway:CreateVpcLink",
            "apigateway:DeleteApi",
            "apigateway:DeleteAuthorizer",
            "apigateway:DeleteIntegration",
            "apigateway:DeleteRoute",
            "apigateway:DeleteStage",
            "apigateway:DeleteVpcLink",
            "apigateway:GET",
            "apigateway:DELETE",
            "apigateway:GetApi",
            "apigateway:GetApis",
            "apigateway:GetAuthorizer",
            "apigateway:GetAuthorizers",
            "apigateway:GetIntegration",
            "apigateway:GetIntegrations",
            "apigateway:GetRoute",
            "apigateway:GetRoutes",
            "apigateway:GetStage",
            "apigateway:GetStages",
            "apigateway:GetVpcLink",
            "apigateway:GetVpcLinks",
            "apigateway:PATCH",
            "apigateway:POST",
            "apigateway:PUT",
            "apigateway:TagResource",
            "apigateway:UpdateApi",
            "apigateway:UpdateAuthorizer",
            "apigateway:UpdateIntegration",
            "apigateway:UpdateRoute",
            "apigateway:UpdateStage",
            "apigateway:UpdateVpcLink"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateServiceLinkedRole",
            "iam:ListInstanceProfilesForRole",
            "iam:DeleteServiceLinkedRole",
            "iam:DeleteServiceLinkedRole"
          ],
          "Resource" : [
            "*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateRole",
            "iam:DeleteRole",
            "iam:GetRole",
            "iam:UpdateRole",
            "iam:AttachRolePolicy",
            "iam:DetachRolePolicy",
            "iam:ListAttachedRolePolicies",
            "iam:ListRolePolicies",
            "iam:GetRolePolicy",
            "iam:PutRolePolicy",
            "iam:DeleteRolePolicy",
            "sts:AssumeRole"
          ],
          "Resource" : [
            "arn:aws:iam::*:role/ecsTaskExecutionRole"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:PassRole"
          ],
          "Resource" : [
            "arn:aws:iam::*:role/ecsTaskExecutionRole"
          ],
          "Condition" : {
            "StringEquals" : {
              "iam:PassedToService" : "ecs-tasks.amazonaws.com"
            }
          }
        },
        {
          "Action" : [
            "ec2:CreateTags",
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeInternetGateways",
            "ec2:DescribeSecurityGroups",
            "ec2:CreateSecurityGroup",
            "ec2:DeleteSecurityGroup",
            "ec2:DescribeSecurityGroupRules",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:RevokeSecurityGroupIngress",
            "ec2:AuthorizeSecurityGroupEgress",
            "ec2:RevokeSecurityGroupEgress",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcs",
            "ec2:DescribeSubnets",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface",
            "ec2:DetachNetworkInterface",
            "ec2:DeleteNetworkInterfacePermission"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        }
      ]
    })
    client-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "cloudfront:CreateDistribution",
            "cloudfront:UpdateDistribution",
            "cloudfront:GetDistribution",
            "cloudfront:DeleteDistribution",
            "cloudfront:ListDistributions",
            "cloudfront:CreateCloudFrontOriginAccessIdentity",
            "cloudfront:GetCloudFrontOriginAccessIdentity",
            "cloudfront:UpdateCloudFrontOriginAccessIdentity",
            "cloudfront:DeleteCloudFrontOriginAccessIdentity",
            "cloudfront:DescribeFunction",
            "cloudfront:PublishFunction",
            "cloudfront:CreateFunction",
            "cloudfront:UpdateFunction",
            "cloudfront:GetFunction",
            "cloudfront:DeleteFunction",
            "cloudfront:CreateResponseHeadersPolicy",
            "cloudfront:UpdateResponseHeadersPolicy",
            "cloudfront:GetResponseHeadersPolicy",
            "cloudfront:DeleteResponseHeadersPolicy",
            "cloudfront:TagResource",
            "cloudfront:ListTagsForResource"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:CreateBucket",
            "s3:DeleteBucket",
            "s3:DeleteBucketPolicy",
            "s3:DeleteObject",
            "s3:GetAccelerateConfiguration",
            "s3:GetAnalyticsConfiguration",
            "s3:GetBucketAcl",
            "s3:GetBucketCORS",
            "s3:GetBucketLocation",
            "s3:GetBucketLogging",
            "s3:GetBucketNotification",
            "s3:GetBucketObjectLockConfiguration",
            "s3:GetBucketOwnershipControls",
            "s3:GetBucketPolicy",
            "s3:GetBucketPolicyStatus",
            "s3:GetBucketPublicAccessBlock",
            "s3:GetBucketRequestPayment",
            "s3:GetBucketTagging",
            "s3:GetBucketVersioning",
            "s3:GetBucketWebsite",
            "s3:GetEncryptionConfiguration",
            "s3:GetIntelligentTieringConfiguration",
            "s3:GetInventoryConfiguration",
            "s3:GetLifecycleConfiguration",
            "s3:GetMetricsConfiguration",
            "s3:GetObject",
            "s3:GetObjectAcl",
            "s3:GetObjectAttributes",
            "s3:GetObjectLegalHold",
            "s3:GetObjectRetention",
            "s3:GetObjectTagging",
            "s3:GetObjectTorrent",
            "s3:GetObjectVersion",
            "s3:GetObjectVersionAcl",
            "s3:GetObjectVersionAttributes",
            "s3:GetObjectVersionForReplication",
            "s3:GetObjectVersionTagging",
            "s3:GetObjectVersionTorrent",
            "s3:GetReplicationConfiguration",
            "s3:HeadBucket",
            "s3:ListAllMyBuckets",
            "s3:ListBucket",
            "s3:PutBucketAcl",
            "s3:PutObjectAcl",
            "s3:PutObjectVersionAcl",
            "s3:PutBucketOwnershipControls",
            "s3:PutBucketPolicy",
            "s3:PutBucketTagging",
            "s3:PutObject"
          ],
          "Resource" : [
            "arn:aws:s3:::${local.project.name}-client",
            "arn:aws:s3:::${local.project.name}-client/*",
            "arn:aws:s3:::${local.project.name}-client-logs",
            "arn:aws:s3:::${local.project.name}-client-logs/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "route53:ChangeResourceRecordSets",
            "route53:ListResourceRecordSets",
            "route53:GetHostedZone",
            "route53:GetChange"
          ],
          "Resource" : [
            "arn:aws:route53:::hostedzone/*",
            "arn:aws:route53:::change/*"
          ]
        }
      ]
    })
    client = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject"
          ],
          "Resource" : [
            "arn:aws:s3:::${local.project.name}-client",
            "arn:aws:s3:::${local.project.name}-client/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "cloudfront:CreateInvalidation"
          ],
          "Resource" : "*"
        }
      ]
    })
  }
}
