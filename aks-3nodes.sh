# Variáveis de configuração
RESOURCE_GROUP="myResourceGroup"
CLUSTER_NAME="my-cluster-aks"
LOCATION="southcentralus"  # ou "brazilsouth"

# Criar Resource Group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Criar cluster AKS com 3 nodes
az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $CLUSTER_NAME \
    --node-count 3 \
    --node-vm-size "Standard_B2s" \
    --enable-addons monitoring \
    --generate-ssh-keys \
    --load-balancer-sku basic \
    --network-plugin azure
