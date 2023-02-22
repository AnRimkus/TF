terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }

  backend "azurerm" { 
    resource_group_name  = "myTFstateRG" 
    storage_account_name = "tfstate20230220ra" 
    container_name       = "tfstate" 
    key                  = "terraform.tfstate" 
    #storage_account_key  = "UeJxz7gmnYOTgBvqd0ipeBsAXrJKUDILQlCbxYHg+aclgsAq3DSn2Y6lf4AMVJo1gT+ZmM41wzW9+ASt9UKX2Q=="
  } 
}

provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "myTFResourceGroup"
  location = "westeurope"
}

module "VirtualNetwork" {
  source = "./VirtualNetwork"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  VNet = "tf_vnet"
  SubNet = "tf_subnet"
  AdressFix = "10.0.0.0/16"
  SubnetPrefix = "10.0.1.0/24"
}

module "IPAdress" {
  source = "./IPAddress"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  IpAddressName = "tf_PublicIP"
}

module "NSG" {
  source = "./NSG"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  NSGName = "tf_NetworkSecurityGroup"
}

module "NIC" {
  source = "./NIC"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  NICName = "tf_NIC"
  SubNetID = module.VirtualNetwork.SubNetId_out[0]
}
/*
module "KeyVault" {
  source = "./KeyVault"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  KeyVaultName = "tf-KeyVault-20230217"
}
*/

module "DiagnosticsService" {
  source = "./DiagnosticsService"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  StorageName = "tfstorage20230219"
}

/*
module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "myTFResourceGroup"
  location = "westeurope"
  StorageName = "tfstorage20230218"
}
*/

module "VirtualMachine" {
  source = "./VirtualMachine"
  depends_on = [module.ResourceGroup]
  base_name = "myTFResourceGroup"
  location = "westeurope"
  VNet = module.VirtualNetwork.VNet_out
  SubNet = module.VirtualNetwork.SubNetName_out[0]
  NICId = module.NIC.NICId_out
}
