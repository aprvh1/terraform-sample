terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}

# 1. INPUT: The variable you pass from Harness/CLI
variable "service_name" {
  description = "Name of the service passed from the pipeline"
  type        = string
}

# 2. LOGIC: Using the variable in a resource - Extra 1
resource "random_id" "server_id" {
  byte_length = 4
  prefix      = "${var.service_name}-"
}

# 3. OUTPUT: Sending the result back to the console/pipeline
output "final_server_id" {
  description = "The generated ID combining the input variable and random hex"
  value       = random_id.server_id.hex
}

# 4. PASSTHROUGH: Simply echoing the input variable back out
output "input_was" {
  description = "Verification of what was passed in"
  value       = var.service_name
}
