output "aks_cluster_name" {
 value = azurerm_kubernetes_cluster.aks.name
}

output "resourcegroup_name" {
 value = azurerm_resource_group.RG.name
}

