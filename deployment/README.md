# DATA10 pre-demo setup

## Prerequisites

- Microsoft Azure subscription

### Azure Subscription

Having an Azure subscription is mandatory to be able to do the *AFUN95: Figuring Out Azure Functions​*. If you don't own an Azure subscription already, you can create your **free** account today. It comes with 200$ credit, so you can experience almost everything without spending a dime.

[Create your free Azure account today](https://azure.microsoft.com/en-us/free?

# Deployments



## DATA10 Demo Automated Deployment


### Step 1: Automated Deployment

Simply by pressing the blue "*Deploy to Azure*" button below, will provision the Azure Services required required for DATA10 demos.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-data%2Fmaster%2Fdeployment%2Fscripts%2FData10-deployment.json%0D%0A" target="_blank"><img src="https://azuredeploy.net/deploybutton.png"/></a>

### Step 2: Validation of services

## Validate Correct provisioning of services

Estimated Time: 15 minutes
 
1. From the Azure Portal, expand the resource group you deployed the template to and review that the following services are provisioned:

- Azure Synapse Analytics (SQL Data Warehouse)
- Azure Storage Accounts
- Azure Data Factory

1. The instructor will discuss the findings with the group.

## Validate Correct provisioning of services

Estimated Time: 15 minutes
 
1. From the Azure Portal, expand the resource group you deployed the template to and review that the following services are provisioned:

- Azure Synapse Analytics (SQL Data Warehouse)
- Azure Storage Accounts
- Azure Data Factory

1. Click on the storage account and browse to Containers
1. Click on the data container and capture the URL from the Container properties

- The URL should look similar to https://mdwstoragexxxxx.blob.core.windows.net/data
- copy the URL

## Populate the Azure Storage container through AZCOPY command

1. In the Azure Portal, open an Azure Cloudshell window.
   Complete the configuration process as needed

1. Type the following command:

   Complete the configuration process as needed

``` 
curl -OL https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-data/master/deployment/scripts/data10-storage.azcli

```
...
