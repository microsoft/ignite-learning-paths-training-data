# DATA10 pre-demo setup

## Prerequisites

- Microsoft Azure subscription
- SQL Management Studio (install on your local machine prior to DATA30) 
  [SQL Server Management Studio](https://docs.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017) 

### Azure Subscription

Having an Azure subscription is mandatory to be able to do the *DATA10: dEMOS​*. If you don't own an Azure subscription already, you can create your **free** account today. It comes with 200$ credit, so you can experience almost everything without spending a dime.

[Create a Free Azure Account here](https://azure.microsoft.com/en-us/free?)


# Deployments



## DATA10 Demo Automated Deployment


## Step 1: Automated Deployment

Simply by pressing the blue "*Deploy to Azure*" button below, will provision the Azure Services required required for DATA10 demos.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fignite-learning-paths-training-data%2Fmaster%2Fdeployment%2Fscripts%2FData10-deployment.json%0D%0A" target="_blank"><img src="https://azuredeploy.net/deploybutton.png"/></a>

## Step 2: Validation of services

## Validate Correct provisioning of services

Estimated Time: 15 minutes
 
1. From the Azure Portal, expand the resource group you deployed the template to and review that the following services are provisioned:

- Azure Synapse Analytics (SQL Data Warehouse)
- Azure Storage Accounts
- Azure Data Factory

1. Click on the storage account and browse to Containers
1. Capture the name of your storage acccount (Data Lake Storage)
1. Expand the resource group
1. CLick on the SQL Data Warehouse
1. In the SQL Data Warehouse Window, click Pause to pause the service
1. Click on the Azure Data Factory repo and validate Azure Data Factory was deployed succesfully

## Step 3: Populate the Azure Storage container Azure CloudShell

1. In the Azure Portal, open an Azure Cloudshell window.
   Complete the configuration process as needed

1. Type the following command to copy the deployment script to Azure Cloud Shell

   This will copy the deployment script that will populate the Azure Data Lake Storage Containers with sample files

```
curl -OL https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-data/master/deployment/scripts/data10-storage.azcli
```
1. Type the following to upload the sample files:

```
bash data10-storage.azcli <storageaccountname>
```
Example: bash data10-storage.azcli mdwdemostoredl

**NOTE:** You have now succesfully validated the demo setup and can go back to the demo script