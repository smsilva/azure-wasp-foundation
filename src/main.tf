locals {
  regions = {
    "eus2" = {
      region = "eastus2"
    }
    "ceus" = {
      region = "centralus"
    }
  }
}

module "environment" {
  source = "./region"

  name                  = var.name
  region                = var.region
  administrator_id_list = var.administrator_id_list
  tags                  = var.tags
}

module "regions" {
  for_each = local.regions

  source = "./region"

  name                  = "${var.name}-${each.key}"
  region                = each.value.region
  administrator_id_list = var.administrator_id_list
  tags                  = var.tags
}
