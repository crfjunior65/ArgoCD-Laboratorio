#!/bin/bash

echo "=== CLUSTERS AKS NA SUA ASSINATURA ==="

# Listar todos os clusters
echo "📋 Todos os clusters AKS:"
az aks list --query "[].{Name:name,ResourceGroup:resourceGroup,Location:location,Status:provisioningState,K8sVersion:kubernetesVersion,NodeCount:agentPoolProfiles[0].count}" --output table

echo ""
echo "🔍 Detalhes por Resource Group:"

# Listar todos os Resource Groups e clusters dentro deles
az group list --query "[].name" --output tsv | while read rg; do
    cluster_count=$(az aks list --resource-group "$rg" --query "length(@)" --output tsv)
    if [ "$cluster_count" -gt 0 ]; then
        echo "Resource Group: $rg"
        az aks list --resource-group "$rg" --query "[].{Name:name,Status:provisioningState}" --output table
        echo ""
    fi
done

echo "🎯 Contexto atual do kubectl:"
kubectl config current-context

echo ""
echo "🌐 Informações do cluster atual:"
kubectl cluster-info
