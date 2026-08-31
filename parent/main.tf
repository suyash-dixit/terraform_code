module "rgs" {
  source = "../child/azure_rg"
  rgs    = var.rgs
}

module "vents" {
  depends_on = [module.rgs]
  source     = "../child/azure_vnet"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.vents]
  source     = "../child/azure_subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rgs]
  source     = "../child/azure_pip"
  pips       = var.pips
}

module "nics" {
  depends_on = [module.rgs, module.vents, module.subnets]
  source     = "../child/azure_nic"
  nics       = var.nics
}

module "vms" {
  depends_on = [module.rgs, module.vents, module.subnets, module.nics, module.pips]
  source     = "../child/azure_vm"
  vms        = var.vms
}