locals {
  services = {
    vpc = {
      template                             = "codingones-github-templates/aws-service-vpc"
      deployer_policy                      = local.policies.vpc-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    domain = {
      template                             = "codingones-github-templates/aws-service-domain"
      deployer_policy                      = local.policies.domain-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    email = {
      template                             = "codingones-github-templates/aws-service-email"
      deployer_policy                      = local.policies.email-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    identity = {
      template                             = "codingones-github-templates/aws-service-identity"
      deployer_policy                      = local.policies.identity-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    persistence = {
      template                             = "codingones-github-templates/aws-service-persistence"
      deployer_policy                      = local.policies.persistence-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    registry = {
      template                             = "codingones-github-templates/aws-service-registry"
      deployer_policy                      = local.policies.registry-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    api = {
      template                             = "codingones-github-templates/aws-service-api"
      deployer_policy                      = local.policies.api-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    client = {
      template                             = "codingones-github-templates/aws-service-client"
      deployer_policy                      = local.policies.client-infrastructure
      allow_force_pushes_to_default_branch = true
    }
  }
}

module "services" {
  for_each = local.services

  source = "github.com/codingones-terraform-modules/aws-service-infrastructure"

  aws_organizational_unit = local.project.aws_organizational_unit
  github_organization     = local.project.github_organization
  terraform_organization  = local.project.terraform_cloud_organization

  github_repository   = "${each.key}-infrastructure"
  template_repository = each.value.template

  project = local.project.name
  service = each.key

  allow_force_pushes_to_default_branch = local.first_run || each.value.allow_force_pushes_to_default_branch

  policy = each.value.deployer_policy

  providers = {
    github = github
    tfe    = tfe
    aws    = aws.organizational_unit
    http   = http
  }

  depends_on = [module.github_organization]
}
