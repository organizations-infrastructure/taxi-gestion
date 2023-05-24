locals {
  common-services-variables = {
    __PROJECT                = local.project.name
    __TERRAFORM_ORGANIZATION = local.project.terraform_cloud_organization
    __ORGANIZATION           = local.project.github_organization
  }
}

#data "external" "check_repository_exists" {
#  for_each = local.services
#
#  program = ["./check_repository_exists.sh", var.github_organization, var.github_repository]
#}


locals {
  services = {
    vpc = {
      template                             = "codingones-github-templates/aws-service-vpc"
      deployer_policy                      = local.policies.vpc-infrastructure
      allow_force_pushes_to_default_branch = true
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "vpc-infrastructure" })
    }
    domain = {
      template                             = "codingones-github-templates/aws-service-domain"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "domain-infrastructure" })
      deployer_policy                      = local.policies.domain-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    email = {
      template                             = "codingones-github-templates/aws-service-email"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "email-infrastructure" })
      deployer_policy                      = local.policies.email-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    identity = {
      template                             = "codingones-github-templates/aws-service-identity"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "identity-infrastructure" })
      deployer_policy                      = local.policies.identity-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    persistence = {
      template                             = "codingones-github-templates/aws-service-persistence"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "persistence-infrastructure" })
      deployer_policy                      = local.policies.persistence-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    registry = {
      template                             = "codingones-github-templates/aws-service-registry"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "registry-infrastructure" })
      deployer_policy                      = local.policies.registry-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    api = {
      template                             = "codingones-github-templates/aws-service-api"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "api-infrastructure" })
      deployer_policy                      = local.policies.api-infrastructure
      allow_force_pushes_to_default_branch = true
    }
    client = {
      template                             = "codingones-github-templates/aws-service-client"
      templated_files_variables            = merge(local.common-services-variables, { __REPOSITORY = "client-infrastructure" })
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

  github_repository         = "${each.key}-infrastructure"
  template_repository       = each.value.template
  templated_files_variables = each.value.templated_files_variables
  template_fork             = false

  project = local.project.name
  service = each.key

  # TODO Replace  local.first_run by if the repo exist or not
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
