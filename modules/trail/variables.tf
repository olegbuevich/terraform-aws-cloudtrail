variable "create" {
  description = "Controls if resources should be created"
  type        = bool
  default     = true
}

variable "trail_name" {
  description = "Specifies the name of the trail"
  type        = string
  default     = "trail"
}

###

variable "enable_logging" {
  description = "Whether the CloudTrail is currently logging AWS API calls"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "The name of the Amazon S3 bucket designated for publishing log files"
  type        = string
}

### optional
variable "enable_log_file_validation" {
  description = "Specifies whether log file validation is enabled"
  type        = bool
  default     = false
}

variable "include_global_service_events" {
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
  type        = bool
  default     = false
}

variable "is_multi_region_trail" {
  description = "Specifies whether the trail applies only to the current region or to all regions"
  type        = bool
  default     = false
}

variable "is_organization_trail" {
  description = "Specifies whether the trail is created for all accounts in an organization in AWS Organizations"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The KMS key ID to use to encrypt the logs delivered by CloudTrail"
  type        = string
  default     = null
}

variable "s3_key_prefix" {
  description = "Specifies the Amazon S3 key prefix for log files"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags"
  type        = map(string)
  default     = {}
}
