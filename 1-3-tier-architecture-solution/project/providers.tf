terraform {
  // backend to store terraform state files, 
  // enable this when commiting to repo
  #   backend "azurerm" {
  #   }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
