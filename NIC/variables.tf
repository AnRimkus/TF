variable "base_name" {
    type = string
    description = "The base of the name for the resource group"
}
variable "location" {
    type = string
    description = "The location for the deployment"
}
variable "NICName" {
    type = string
    description = "Network Interface name"
}
variable "SubNetID" {
  type = string
  description = "SubNet ID"
}