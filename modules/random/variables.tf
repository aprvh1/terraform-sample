variable "environment" {
  type        = string
  description = "Injected by Harness Workspace (e.g., dev, stage, prod)"
}

variable "region" {
  type        = string
  description = "Injected by Harness Workspace (e.g., us-east-1)"
}

variable "ring" {
  type        = string
  description = "Injected by Harness Workspace (e.g., ring0, ring1)"
}
