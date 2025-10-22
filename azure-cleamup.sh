#!/bin/bash

echo "=== LIMPEZA COMPLETA AZURE ==="

# Listar assinatura atual
echo "📋 Assinatura atual:"
az account show --query "{Name:name, ID:id}" --output table

echo ""
echo "🔍 Listando todos os Resource Groups:"
az group list --query "[].{Name:name,Location:location}" --output table

# Resource Groups para remover (ajuste conforme seus projetos)
RESOURCE_GROUPS=(
    "myResourceGroup"
    "myResourceGroupEast" 
    "MC_myResourceGroup_myAKSCluster_southcentralus"
    "MC_myResourceGroupEast_myAKSCluster_eastus"
    "NetworkWatcherRG"  # Só se não for usar
)

echo ""
echo "🗑️ Iniciando remoção de Resource Groups..."

for rg in "${RESOURCE_GROUPS[@]}"; do
    if az group exists --name "$rg" | grep -q "true"; then
        echo "Removendo: $rg"
        az group delete --name "$rg" --yes --no-wait
    else
        echo "✓ $rg não existe"
    fi
done

echo ""
echo "⏳ Aguardando remoções..."
sleep 30

echo ""
echo "🔎 Verificando recursos restantes:"

# Verificar recursos órfãos
echo "📀 Discos não associados:"
az disk list --query "[?managedBy==null].{Name:name,ResourceGroup:resourceGroup,Size:diskSizeGb}" --output table

echo ""
echo "🌐 IPs públicos não associados:"
az network public-ip list --query "[?ipConfiguration==null].{Name:name,ResourceGroup:resourceGroup,IP:ipAddress}" --output table

echo ""
echo "💾 Storage accounts:"
az storage account list --query "[].{Name:name,ResourceGroup:resourceGroup}" --output table

echo ""
echo "✅ Limpeza concluída! Verifique no portal em alguns minutos."
