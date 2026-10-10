resource "aws_guardduty_detector" "guardduty_detectors" {
  for_each = var.guardduty_detectors

  enable                       = each.value.enable
  finding_publishing_frequency = each.value.finding_publishing_frequency
  region                       = each.value.region
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all

  dynamic "datasources" {
    for_each = each.value.datasources != null ? [each.value.datasources] : []
    content {
      dynamic "kubernetes" {
        for_each = datasources.value.kubernetes != null ? [datasources.value.kubernetes] : []
        content {
          audit_logs {
            enable = kubernetes.value.audit_logs.enable
          }
        }
      }
      dynamic "malware_protection" {
        for_each = datasources.value.malware_protection != null ? [datasources.value.malware_protection] : []
        content {
          scan_ec2_instance_with_findings {
            ebs_volumes {
              enable = malware_protection.value.scan_ec2_instance_with_findings.ebs_volumes.enable
            }
          }
        }
      }
      dynamic "s3_logs" {
        for_each = datasources.value.s3_logs != null ? [datasources.value.s3_logs] : []
        content {
          enable = s3_logs.value.enable
        }
      }
    }
  }
}

