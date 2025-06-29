module "resource_group" {
  source = "../../module/resource_group"
  rg_name = "rg-prepod"
  location = "centralindia"
  
}
module "vnet" {
    source = "../../module/vnet"
    depends_on = [ module.resource_group ]
    vnet_name = "vnet-prepod"
    rg_name = "rg-prepod"
    location = "centralindia"
    address_space = ["10.0.0.0/16"]
  
}
module "fsubnet" {
    source = "../../module/subnet"
    depends_on = [ module.vnet ]
    subnet_name = "fsubnet-prepod"
    vnet_name = "vnet-prepod"
    rg_name = "rg-prepod"
    address_prefixes = ["10.0.1.0/24"]
}
module "bsubnet" {
    source = "../../module/subnet"
    depends_on = [ module.vnet ]
    subnet_name = "bsubnet-prepod"
    vnet_name = "vnet-prepod"
    rg_name = "rg-prepod"
    address_prefixes = ["10.0.2.0/24"]
}
module "fpublic_ip" {
    source = "../../module/public_ip"
    depends_on = [ module.fsubnet ]
    public_ip_name = "fpip-prepod"
    rg_name = "rg-prepod"
    location = "centralindia"
    allocation_method = "Static"
}
module "bpublic_ip" {
    source = "../../module/public_ip"
    depends_on = [ module.bsubnet ]
    public_ip_name = "bpip-prepod"
    rg_name = "rg-prepod"
    location = "centralindia"
    allocation_method = "Static"
}

module "fvm" {   
  source            = "../../module/virtual_machine"
  depends_on        = [ module.fpublic_ip, module.fsubnet, module.vnet ]
  nic_name          = "fnic-prepod"
  location          = "centralindia"
  rg_name           = "rg-prepod"
  public_ip_name    = "fpip-prepod"
  subnet_name       = "fsubnet-prepod"
  vm_name            = "fvm-preprod" 
  vm_size           = "Standard_B1s"
  vmusername        = "vmkauser"
  vmpassword        = "vmkapassword"
  key_vault_name    = "B18-Locker"    
  kvrg_name         = "RG-B18"
  vnet_name         = "vnet-prepod"
}
module "bvm" {   
  source            = "../../module/virtual_machine"
  depends_on        = [ module.bpublic_ip, module.bsubnet, module.vnet ]
  nic_name          = "bnic-prepod"
  location          = "centralindia"
  rg_name           = "rg-prepod"
  public_ip_name    = "bpip-prepod"
  subnet_name       = "bsubnet-prepod"
  vm_name            = "vm-preprod" 
  vm_size           = "Standard_B1s"
  vmusername        = "vmkauser"
  vmpassword        = "vmkapassword"
  key_vault_name    = "B18-Locker"    
  kvrg_name         = "RG-B18"
  vnet_name         = "vnet-prepod"
}
module "sqlserver" {
  depends_on = [ module.resource_group ]
  source = "../../module/sql_server"
  sql_server_name = "todosqlserverprepod"
   rg_name           = "rg-prepod"
   location         = "centralindia"
  sql_server_version = "12.0"  
  key_vault_name    = "B18-Locker"  
  kvrg_name          = "RG-B18"
  sqlserverusername = "vmkauser"
  sqlserverpassword = "vmkapassword"
}
module "sqldatabase" {
  depends_on = [ module.sqlserver ]
  source = "../../module/sql_database"
  sql_server_name = "todosqlserverprepod"
  sql_database_name = "todosqldatabaseprepod"

  rg_name = "rg-prepod"
}
