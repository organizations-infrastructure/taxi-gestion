locals {
  common-applications-variables = {
    __PROJECT      = local.project.name
    __ORGANIZATION = local.project.github_organization
    __ABOUT        = local.project.about
  }
}

locals {
  applications = {
    api = {
      github_repository                    = "api"
      github_repository_topics             = ["api", "node", "fastify", "typescript", "postgresql", "aws", "ecr", "docker"]
      template_repositories                = ["codingones-github-templates/fastify-api", "codingones-github-templates/aws-application-api"]
      templated_files_variables            = merge(local.common-applications-variables, { __REPOSITORY = "api" })
      template_fork                        = false
      service                              = "ecr"
      policy                               = local.policies.ecr
      allow_force_pushes_to_default_branch = false
    }
    client = {
      github_repository                    = "client"
      github_repository_topics             = ["client", "node", "typescript", "aws", "cloudfront", "cognito"]
      template_repositories                = ["codingones-github-templates/angular-client", "codingones-github-templates/aws-application-client"]
      templated_files_variables            = merge(local.common-applications-variables, { __REPOSITORY = "client" })
      template_fork                        = false
      service                              = "s3-client"
      policy                               = local.policies.client
      allow_force_pushes_to_default_branch = false
    }
  }
}

module "applications" {
  for_each = local.applications

  source = "github.com/codingones-terraform-modules/aws-application"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization
  project                 = local.project.name

  github_repository        = each.value.github_repository
  github_repository_topics = each.value.github_repository_topics

  template_repositories     = each.value.template_repositories
  templated_files_variables = each.value.templated_files_variables
  template_fork             = each.value.template_fork

  service = each.value.service
  policy  = each.value.policy

  # TODO Replace  local.first_run by if the repo exist or not
  allow_force_pushes_to_default_branch = local.first_run || each.value.allow_force_pushes_to_default_branch


  providers = {
    github = github
    tfe    = tfe
    aws    = aws.organizational_unit
    http   = http
  }

  depends_on = [module.github_organization]
}