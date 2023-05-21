locals {
  applications = {
    api = {
      github_repository        = "api"
      github_repository_topics = ["api", "node", "fastify", "typescript", "postgresql", "aws", "ecr", "docker"]
      template_repositories    = ["codingones-github-templates/fastify-api", "codingones-github-templates/aws-application-api"]
      service                  = "ecr"
      policy                   = local.policies.ecr
    }
    client = {
      github_repository        = "client"
      github_repository_topics = ["client", "node", "typescript", "aws", "cloudfront", "cognito"]
      template_repositories    = ["codingones-github-templates/angular-client", "codingones-github-templates/aws-application-client", ]
      service                  = "s3-client"
      policy                   = local.policies.client
    }
  }
}

#module "applications" {
#  for_each = local.applications
#
#  source = "github.com/codingones-terraform-modules/aws-application"
#
#  aws_organizational_unit = local.project.aws_organizational_unit
#  github_organization     = local.project.github_organization
#  terraform_organization  = local.project.terraform_cloud_organization
#  project                 = local.project.name
#
#  github_repository        = each.value.github_repository
#  github_repository_topics = each.value.github_repository_topics
#  template_repositories    = each.value.template_repositories
#  service                  = each.value.service
#  policy                   = each.value.policy
#
#  providers = {
#    github = github
#    tfe    = tfe
#    aws    = aws.organizational_unit
#    http   = http
#  }
#
#  depends_on = [module.github_organization]
#}