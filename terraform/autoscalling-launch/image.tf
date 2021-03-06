#
locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[- TZ:]/", "")}"
}

# Adding image 
data "aws_instance" "sam" {
  instance_tags = {
    clone = "yes"
  }  
     }

resource "aws_ami_from_instance" "stage" {
  name               = "pricebook-catalog-staging_${local.timestamp_sanitized}"
  source_instance_id = data.aws_instance.sam.id
  snapshot_without_reboot = true
  }
#Adding files
