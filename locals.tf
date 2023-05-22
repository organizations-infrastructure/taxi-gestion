locals {
  first_run = true #set to false after initial repositories run
  project = {
    name                         = "taxi-gestion"
    github_organization          = "taxi-gestion"
    terraform_cloud_organization = "taxi-gestion"
    aws_organizational_unit      = "taxi-gestion"
    commit_author                = "github-actions[bot]"
    commit_email                 = "github-actions[bot]@users.noreply.github.com"
    organization_email           = "romain.cambonie@gmail.com"
    aws_root_id                  = "r-gw1z"
    aws_management_account       = "ma-ou-taxi-gestion"
    aws_management_email         = "romain.cambonie+ma-ou-tg@gmail.com"
    terraform_organization_variables = {
      "project" = {
        hcl         = false
        sensitive   = false
        value       = "taxi-gestion"
        description = "The project name in the Project-Service-Layer architecture"
      }
      "terraform_organization" = {
        hcl         = false
        sensitive   = false
        value       = "taxi-gestion"
        description = "The organization name on terraform cloud"
      }
      "aws_default_region" = {
        hcl         = false
        sensitive   = false
        value       = "us-east-1"
        description = "The aws default region"
      }
      "domain_name" = {
        hcl         = false
        sensitive   = false
        value       = "taxi-gestion.com"
        description = "The registered domain name (does not need to be registered yet but check availability)"
      }
      "sender_id" = {
        hcl         = false
        sensitive   = false
        value       = "taxigestion"
        description = "Sender id for transactional sms (auth). Maximum 11 alphanumeric or hyphen (-) characters, including at least one letter and no spaces. It has to start and end with an alphanumeric character."
      }
      "domain_email_forward_addresses" = {
        hcl         = false
        sensitive   = false
        value       = "['romain.cambonie@gmail.com']"
        description = "The emails addresses to forward the emails sent to the SES verified domain"
      }
      "notification_webhook_failures" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_failures
        description = "A webhook url to notify about deployments"
      }
      "notification_webhook_successes" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_successes
        description = "A webhook url to notify about deployments"
      }
      "notification_webhook_releases" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_releases
        description = "A webhook url to notify about deployments"
      }
      "github_pat" = {
        hcl         = false
        sensitive   = false
        value       = var.github_pat
        description = "A github PAT that allow administration operation on repositories"
      }
    }
    github_organization_secrets = {
      "tfe_team_token" = {
        github_key    = "TF_API_TOKEN"
        terraform_key = "tfe_team_token"
      }
      "notification_webhook_failures" = {
        github_key    = "DISCORD_FAILURES_WEBHOOK"
        terraform_key = "notification_webhook_failures"
      }
      "notification_webhook_successes" = {
        github_key    = "DISCORD_SUCCESSES_WEBHOOK"
        terraform_key = "notification_webhook_successes"
      }
      "notification_webhook_releases" = {
        github_key    = "DISCORD_RELEASES_WEBHOOK"
        terraform_key = "notification_webhook_releases"
      }
      "github_pat" = {
        github_key    = "PAT"
        terraform_key = "github_pat"
      }
    }
    github_organization_variables = {
      "cloudfront_s3_bucket" = {
        terraform_key = "cloudfront_s3_bucket"
        github_key    = "CLOUDFRONT_S3_BUCKET"
      }
      "cloudfront_distribution_id" = {
        github_key    = "CLOUDFRONT_DISTRIBUTION_ID"
        terraform_key = "cloudfront_distribution_id"
      }
      "cognito_app_integration_id" = {
        github_key    = "COGNITO_APP_INTEGRATION_ID"
        terraform_key = "cognito_app_integration_id"
      }
      "aws_default_region" = {
        github_key    = "AWS_DEFAULT_REGION"
        terraform_key = "aws_default_region"
      }
    }
  }
}
