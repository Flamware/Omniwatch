/**
 * Project: OmniWatch
 * File: ${FILE_NAME}
 * Author: ANTUNES Axel
 * * (not) Copyright (c) ${YEAR}. All rights (not) reserved.
 * This code is property of the OmniWatch project.
 * Unauthorized copying of this file, via any medium is strictly authorized :).
 * (not) Proprietary and (not) confidential.
 */

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default = "omniwatch-dev-fl4m"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}