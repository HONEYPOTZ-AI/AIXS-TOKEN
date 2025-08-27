
terraform {
  required_providers {
    alchemy = {
      source  = "alchemy/alchemy"
      version = "~> 1.0"
    }
  }
}

provider "alchemy" {
  api_key = var.alchemy_api_key
  network = var.network
}

variable "alchemy_api_key" {
  description = "Alchemy API key for Ethereum-compatible network"
  type        = string
}

variable "network" {
  description = "Ethereum-compatible network (e.g., mainnet, goerli)"
  type        = string
  default     = "goerli"
}

variable "contract_name" {
  description = "Smart contract name to deploy"
  type        = string
  default     = "AIXSToken"
}

variable "initial_supply" {
  description = "Initial token supply"
  type        = string
  default     = "1000000"
}

resource "alchemy_contract_deployment" "aixs_token" {
  name            = var.contract_name
  source_file     = "${path.module}/contracts/AIXSToken.sol"
  constructor_args = [var.initial_supply]
  network         = var.network
  api_key         = var.alchemy_api_key
}

output "contract_address" {
  value = alchemy_contract_deployment.aixs_token.address
}
