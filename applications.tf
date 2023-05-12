module "api_repository" {
  source = "github.com/codingones-terraform-modules/aws-ecr-node-api"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization
  project                 = local.project.name

  github_repository   = "api"
  template_repository = "codingones-github-templates/aws-application-api-fastify"
  service             = "ecr"
  service_policy      = local.policies.ecr

  providers = {
    github = github
    tfe    = tfe
    aws    = aws.organizational_unit
    http   = http
  }

  depends_on = [module.github_organization]
}

module "client_repository" {
  source = "github.com/codingones-terraform-modules/aws-client-angular"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization
  project                 = local.project.name

  github_repository   = "client"
  template_repository = "codingones-github-templates/aws-application-client-angular"
  service             = "client"
  about               = "A basic web client for project"
  policy              = local.policies.client

  providers = {
    github = github
    aws    = aws.child
    http   = http
    tfe    = tfe
  }

  depends_on = [module.github_organization]
}