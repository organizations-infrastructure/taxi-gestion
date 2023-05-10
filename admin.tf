module "aws_organization" {
  source = "github.com/organizations-infrastructure/aws-organizational-unit"

  aws_organization                          = local.project.aws_organizational_unit
  aws_organization_parent_id                = local.project.aws_root_id
  aws_organization_management_account_email = local.project.aws_management_email
  aws_organization_management_account_name  = local.project.aws_management_account

  providers = {
    aws = aws.root
  }
}

provider "aws" {
  alias  = "organizational_unit"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${module.aws_organization.organizational_unit_account_id}:role/OrganizationAccountAccessRole"
  }
}

module "aws_organizational_unit_iam" {
  source = "github.com/organizations-infrastructure/aws-organizational-unit-iam"

  aws_organization = local.project.aws_organizational_unit

  providers = {
    aws = aws.organizational_unit
  }

  depends_on = [module.aws_organization]
}

module "terraform_cloud" {
  source = "github.com/organizations-infrastructure/terraform-cloud-organization"

  terraform_organization                          = local.project.terraform_cloud_organization
  organization_email                              = local.project.organization_email
  organization_iam_deployer_aws_access_key_id     = module.aws_organizational_unit_iam.aws_deployer_iam_access_key_id
  organization_iam_deployer_aws_secret_access_key = module.aws_organizational_unit_iam.aws_deployer_iam_access_key_secret
  project                                         = local.project.name
  organization_variables                          = local.project.organization_variables

  providers = {
    tfe = tfe
  }

  depends_on = [module.aws_organizational_unit_iam]
}

module "github_organization_variables" {
  source = "github.com/organizations-infrastructure/github-organization"

  tfe_team_token = module.terraform_cloud.tfe_team_token

  providers = {
    github = github
  }

  depends_on = [module.terraform_cloud]
}