#create resourcegroup
resource "azurerm_resource_group" "RG" {
  name     = "${var.resourcegroup_location}"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name}"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  dns_prefix          = "${var.dns_prefix}"

  default_node_pool {
    name       = "default"
    node_count = "${var.node_count}"
    vm_size    = "${var.vm_size}"
  }


}


resource "azurerm_role_assignment" "aks_acr_pull" {
principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
role_definition_name = "AcrPull"
scope = "${var.acr_id}"
}