// 2022 (Brian Thorson) Copy, move, remove or label any and all parts
// Refer to <https://unlicense.org>
  
terraform {
  required_version = ">=0.12"

  // Azure is the platform here
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

    // In the real world, randomizing instance names
    // could be useful for tracking purposes
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
