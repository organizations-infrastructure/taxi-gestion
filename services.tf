module "vpc_service" {
  source = "github.com/codingones-terraform-modules/aws-service-infrastructure"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization

  github_repository   = "vpc-infrastructure"
  template_repository = "codingones-github-templates/aws-service-vpc"

  project = local.project.name
  service = "vpc"

  service_policy = local.policies.vpc-infrastructure

  providers = {
    github = github
    tfe    = tfe
    aws    = aws.organizational_unit
    http   = http
  }

  depends_on = [module.github_organization_variables]
}