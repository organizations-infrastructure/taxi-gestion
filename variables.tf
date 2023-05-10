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