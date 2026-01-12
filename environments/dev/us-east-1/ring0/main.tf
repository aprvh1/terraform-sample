terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {}

locals {
  service_name = "myservice1"
  server_count = 2
  environment  = "dev"
  region       = "us-east-1"
  ring         = "ring0"
}

module "workspace" {
  source = "../../../../modules/random"

  server_count = local.server_count
  service_name = local.service_name
  environment  = local.environment
  ring         = local.ring

  generate_new_random_resource = "random1234"
}

output "var1_out" {
  description = "The value of var1 passed through as an output"
  value       = var.var1
}

output "workspace_names" { value = module.workspace.workspaces }

