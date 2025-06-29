terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.50"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1ecb1540-18db-4ab8-9eac-659a71d4a5f7"
    

}