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
    description = "VNet name"
}
variable "SubNet" {
    type = string
    description = "Subnet name"
}
variable "NICId" {
    type = string
    description = "Network interface ID"
}