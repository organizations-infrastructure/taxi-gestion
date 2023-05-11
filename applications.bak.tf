module "api_repository" {
  source = "github.com/codingones-terraform-modules/aws-ecr-node-api"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization

  github_repository   = "api"
  template_repository = "codingones-github-templates/aws-application-api-fastify"

  project = local.project.name
  service = "ecr"

  service_policy = local.policies.ecr

  providers = {
    github = github
    tfe    = tfe
    aws    = aws.organizational_unit
    http   = http
  }

  depends_on = [module.github_organization_variables]
}

module "client_repository" {
  source = "github.com/codingones/terraform-aws-s3-client"

  terraform_organization = local.project.terraform_cloud_organization
  aws_organization       = local.project.aws_organizational_unit
  github_organization    = local.project.github_organization

  github_repository   = "client"
  commit_author_name  = local.project.commit_author
  commit_author_email = local.project.commit_email

  project = local.project.name
  service = "client"
  about   = "A basic client for project"

  terraform_variables_to_copy_in_github = [
    {
      key_in_terraform_organization_public_variable_set = "cloudfront_s3_bucket"
      key_in_github_variables                           = "AWS_S3_BUCKET"
    },
    {
      key_in_terraform_organization_public_variable_set = "cloudfront_distribution_id"
      key_in_github_variables                           = "AWS_CLOUDFRONT_DISTRIBUTION_ID"
    },
    {
      key_in_terraform_organization_public_variable_set = "cognito_app_integration_id"
      key_in_github_variables                           = "COGNITO_APP_INTEGRATION_ID"
    }
  ]


  github_token = var.github_token

  s3_policy = local.policies.client

  providers = {
    github = github
    aws    = aws.child
    http   = http
    tfe    = tfe
  }

  depends_on = [module.github_organization_variables]
}