#!/bin/sh
#
# Change these for your account
#
X_DEPT="SA"
X_CUSTOMER="TEST"
X_PROJECT="Demo"
X_APPLICATION="DemoTest"
X_CONTACT="athatcher"
X_TTL="72"

PREFIX="alan8"
RESOURCE_TAGS="X-DEPT=${X_DEPT} X-CUSTOMER=${X_CUSTOMER} X-PROJECT=${X_PROJECT} X-APPLICATION=${X_APPLICATION} X-CONTACT=${X_CONTACT} X-TTL=${X_TTL}"
RESOURCE_GROUP="${PREFIX}-hab-aks-demo"
AKS_CLUSTER_NAME="${PREFIX}-aks-demo"
ACR_NAME="${PREFIX}habitatregistry"
LOCATION="eastus"
AKS_VERSION="1.12.4"
#
# No Need to change these
#
AKS_NODE_COUNT=3
ACR_SKU="Basic"

# #
# Setup AKS
#
az group create --name $RESOURCE_GROUP --location ${LOCATION} --tags ${RESOURCE_TAGS}
az aks create --kubernetes-version ${AKS_VERSION} --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --node-count $AKS_NODE_COUNT --generate-ssh-keys --tags ${RESOURCE_TAGS}
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME