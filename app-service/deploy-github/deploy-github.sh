#!/bin/bash

webappname=mywebapp$RANDOM
gitrepo=<Replace with your GitHub repo URL>
# To deploy a private repo or enable continuous deployment,
# uncomment the next line and provide a Private Access Token
#token=<Replace with a GitHub access token>

# Create a resource group.
az group create --location westeurope --name $webappname

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $webappname --resource-group $webappname --sku FREE

# Create a web app.
az appservice web create --name $webappname --resource-group $webappname --plan $webappname

# Configure GitHub deployment. 
# --git-token parameter is required for continuous publishing and required only once (Azure remembers token).
# uncomment the --git-token, if uncommented above
az appservice web source-control config --name $webappname --resource-group $webappname --repo-url $gitrepo --branch master # --git-token $token

# Browse to the web app.
az appservice web browse --name $webappname --resource-group $webappname