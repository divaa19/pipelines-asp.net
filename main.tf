module "aks" {
    source = "Azure/aks/azurerm"
    version = "7.1.0"
    resource_group_name = "testaks"
    agents_max_count = 2
    agents_min_count = 1
    cluster_log_analytics_workspace_name = "testaks"
    cluster_name = "testaks"


    

}
