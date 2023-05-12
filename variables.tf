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

variable "notification_webhook" {
  description = "A webhook to notify about deployments"
  nullable    = false
  default     = false
  sensitive   = true
}