locals {
  create = var.create

  tags = length(var.tags) > 0 ? [
    for k, v in var.tags : {
      key   = k
      value = v
    }
  ] : null
}

resource "awscc_cloudtrail_trail" "this" {
  count = local.create ? 1 : 0

  advanced_event_selectors      = null
  cloudwatch_logs_log_group_arn = null
  cloudwatch_logs_role_arn      = null
  enable_log_file_validation    = var.enable_log_file_validation
  event_selectors               = null
  include_global_service_events = var.include_global_service_events
  insight_selectors             = null
  is_logging                    = var.is_logging
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  kms_key_id                    = var.kms_key_id
  s3_bucket_name                = var.s3_bucket_name
  s3_key_prefix                 = var.s3_key_prefix
  sns_topic_name                = null
  tags                          = local.tags
  trail_name                    = var.trail_name
}
