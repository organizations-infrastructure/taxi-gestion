variable "github_token" {
  description = "Your GitHub Personal Access Token"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "tfe_token" {
  description = "Your TFE Personal Token"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "github_pat" {
  description = "A GitHub Personal Access Token from the admin"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "notification_webhook_failures" {
  description = "A webhook to notify about failed ci"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "notification_webhook_successes" {
  description = "A webhook to notify about successful ci"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "notification_webhook_releases" {
  description = "A webhook to notify about repository release"
  nullable    = false
  default     = false
  sensitive   = true
}