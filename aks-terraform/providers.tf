terraform {
  required_version = ">=1.0.0"  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
   features{}
   subscription_id = "subid"
}

#terraform backend where state file of this resource is stored
terraform {
  backend "azurerm" {
    access_key = ""                                           #strg access key
    storage_account_name = ""                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = ""                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = ""                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
