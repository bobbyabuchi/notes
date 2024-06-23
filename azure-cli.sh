# set shell variables.......................

# create storage account
RG=rg_sb_eastus_192200_1_171910405634
location=eastus
name=courseraxe
subscription="Company subscription" # when there is a space...
# use variable
az storage account create \
  --kind StorageV2 \
  --resource-group $RG \
  --location $location \
  --name courseraxe

#.................................................
az appservice plan create \
--name blob-exercise-plan \
--resource-group $RG \
--sku FREE --location $location

az webapp create \
--name courseraxeApp \
--plan blob-exercise-plan \
--resource-group $RG

CONNECTIONSTRING=$(az storage account show-connection-string \
--name courseraxe \
--output tsv)

az webapp config appsettings set \
--name courseraxeApp --resource-group $RG \
--settings AzureStorageConfig:ConnectionString=$CONNECTIONSTRING AzureStorageConfig:FileContainerName=files
