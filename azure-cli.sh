# set shell variables.......................

# create storage account
RG=rg_sb_eastus_192200_1_171910405634
location=eastus
name=$cour
subscription="Company subscription" # when there is a space...
# use variable
az storage account create \
  --kind StorageV2 \
  --resource-group $RG \
  --location $location \
  --name courseraxe

