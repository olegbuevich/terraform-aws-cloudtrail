locals {
  create = var.create
}

resource "aws_cloudtrail" "this" {
  count = local.create ? 1 : 0

  cloud_watch_logs_group_arn    = null
  cloud_watch_logs_role_arn     = null
  enable_log_file_validation    = var.enable_log_file_validation
  enable_logging                = var.enable_logging
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  kms_key_id                    = var.kms_key_id
  name                          = var.trail_name
  s3_bucket_name                = var.s3_bucket_name
  s3_key_prefix                 = var.s3_key_prefix
  tags                          = var.tags

  dynamic "event_selector" {
    for_each = []
    content {
      exclude_management_event_sources = lookup(event_selector.value, "exclude_management_event_sources", null)
      include_management_events        = lookup(event_selector.value, "include_management_events", null)
      read_write_type                  = lookup(event_selector.value, "read_write_type", null)

      dynamic "data_resource" {
        for_each = lookup(event_selector.value, "data_resource", [])
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }
}
