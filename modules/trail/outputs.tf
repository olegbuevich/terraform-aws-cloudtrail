output "trail_arn" {
  description = "ARN of the trail"
  value       = try(aws_cloudtrail.this.0.arn, "")
}
