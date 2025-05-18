
module "resource_groups" {
  source          = "./modules/resource_group"
  resource_groups = var.resource_groups
  tags            = var.tags
}

module "app_service_plans" {
  source            = "./modules/app_service_plan"
  app_service_plans = var.app_service_plans
  tags              = var.tags
}

module "app_services" {
  source       = "./modules/app_service"
  app_services = var.app_services
  allowed_ip   = var.allowed_ip
  tags         = var.tags
}

module "traffic_manager" {
  source          = "./modules/traffic_manager"
  traffic_manager = var.traffic_manager
  app_services    = var.app_services
  tags            = var.tags
}
