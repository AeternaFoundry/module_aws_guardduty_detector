variable "guardduty_detectors" {
  description = <<EOT
Map of guardduty_detectors, attributes below
Optional:
    - enable
    - finding_publishing_frequency
    - region
    - tags
    - tags_all
    - datasources (block):
        - kubernetes (optional, block):
            - audit_logs (required, block):
                - enable (required)
        - malware_protection (optional, block):
            - scan_ec2_instance_with_findings (required, block):
                - ebs_volumes (required, block):
                    - enable (required)
        - s3_logs (optional, block):
            - enable (required)
EOT

  type = map(object({
    enable                       = optional(bool)
    finding_publishing_frequency = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    datasources = optional(object({
      kubernetes = optional(object({
        audit_logs = object({
          enable = bool
        })
      }))
      malware_protection = optional(object({
        scan_ec2_instance_with_findings = object({
          ebs_volumes = object({
            enable = bool
          })
        })
      }))
      s3_logs = optional(object({
        enable = bool
      }))
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

