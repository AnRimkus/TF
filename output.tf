output "SubNetId" {
    value = module.VirtualNetwork.SubNetId_out[0]
}
output "IPAddressId" {
    value = module.IPAdress.IPAddressId_out  
}
output "NSGId" {
    value = module.NSG.NSGId_out
}
output "NICId" {
    value = module.NIC.NICId_out
}
output "StorageURI" {
    value = module.DiagnosticsService.StorageURI_out
}
output "SubNetName" {
    value = module.VirtualNetwork.SubNetName_out[0]
}