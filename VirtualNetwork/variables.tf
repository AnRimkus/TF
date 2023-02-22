    variable "base_name" {
        type = string
        description = "The base of the name for the resource group"
    }
    variable "location" {
        type = string
        description = "The location for the deployment"
    }
    variable "VNet" {
        type = string
        description = "Virtual network name"
    }
    variable "SubNet" {
        type = string
        description = "SubNet name"
    }
    variable "AdressFix" {
      type = string
      description = "Adress space"
    }
    variable "SubnetPrefix" {
      type = string
      description = "SubNet prefix"
    }