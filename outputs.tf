output "guardduty_detectors_id" {
  description = "Map of id values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "guardduty_detectors_account_id" {
  description = "Map of account_id values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "guardduty_detectors_arn" {
  description = "Map of arn values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "guardduty_detectors_datasources" {
  description = "Map of datasources values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => one(v.datasources) if v.datasources != null && length(v.datasources) > 0 }
}
output "guardduty_detectors_enable" {
  description = "Map of enable values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.enable if v.enable != null }
}
output "guardduty_detectors_finding_publishing_frequency" {
  description = "Map of finding_publishing_frequency values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.finding_publishing_frequency if v.finding_publishing_frequency != null && length(v.finding_publishing_frequency) > 0 }
}
output "guardduty_detectors_region" {
  description = "Map of region values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.region if v.region != null && length(v.region) > 0 }
}
output "guardduty_detectors_tags" {
  description = "Map of tags values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "guardduty_detectors_tags_all" {
  description = "Map of tags_all values across all guardduty_detectors, keyed the same as var.guardduty_detectors"
  value       = { for k, v in aws_guardduty_detector.guardduty_detectors : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

