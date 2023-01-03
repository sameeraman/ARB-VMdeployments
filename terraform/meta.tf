module "naming" {
  source              = "github.com/sameeraman/terraform-azurerm-naming"
  company-prefix      = var.company_prefix
  region-prefix       = var.location_prefix
  environment-prefix  = var.environment_prefix
}



locals {

    
}

data "azurerm_client_config" "current" {}