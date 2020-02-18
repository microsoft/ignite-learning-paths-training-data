# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.


## Demo 1 - Exploring a Modern Data Warehouse 

> 💡 You must have completed the [deployment](../deployment/README.md) before attempting to do the demo.




## Walkthrough of Azure Services

As part of this demo you will walk through the items created and provisioned as part of the demo deployment to Azure Script.
You can also walk through and highlight manual provisioning / ARM deployments.

## Validate Correct provisioning of services


Estimated Time: 15 minutes
 
1. From the Azure Portal, expand the resource group you deployed to review the following services are provisioned:

- Azure Synapse Analytics (SQL Data Warehouse)
- Azure Storage Accounts
- Azure Data Factory


1. Click on the resource groups
1. Validate that 4 resources are listed:
    - Data factory (v2)
    - SQL data warehouse
    - SQL Server
    - Storage account

### Validate the provisioning of data lake storage

1. Click on the storage account
1. Click on Containers
    - Validate that 2 containers **data** and **logs** are existing
1. Click on the **logs** container
    - validate that 3 files exist in the container:
        - preferences.json
        - weblogsQ1.log
        - weblogsQ2.log
1. Repeat the validation for the **data** container as well, validate that 2 files exist in the container:
       - preferences.json
       - DimDate2.txt
       
### Validate the provisioning of SQL Data Warehouse

1. Click on the resource group
1. Click on SQL data warehouse
1. Validate the notification message indicating that the data warehouse is currently paused.
   If the service is NOT paused - click **Pause** to stop the service.

### Validate the provisioning of Azure Data Factory


1. Click on the Azure Data Factory
1. Click on Author & Monitor
1. In Azure Data Factory, click on **Create pipeline from template**
1. Showcase that many ADF Pipelines exist and can easily be deployed in ADF using ARM templates.

**Note:** You will not be creating a new pipeline in this demo, you're only highlighting the some of the components of an modern data warehouse

💡 NOTE - At the end of this demo, if you are NOT going through any other demos - delete the resource group to reduce and mimize Azure spend.