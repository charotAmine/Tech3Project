targetScope='subscription'

param suffix string = uniqueString(subscription().id)
param location string = deployment().location
param runNumber string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-tech3-${suffix}'
  location: location
}

module tech3Module 'module.bicep' = {
  name: 'tech3Module${runNumber}'
  scope: resourceGroup
  params: {
    suffix: suffix
    location: location
  }
}

output appServiceName string = coHackModule.outputs.appServiceName
