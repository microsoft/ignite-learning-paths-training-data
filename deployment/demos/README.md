# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.

---

## Demo 1 - Exploring a Modern Data Warehouse 

> 💡 You must have completed the [deployment](../deployment/README.md) before attempting to do the demo.

##Explore the components of a modern data warehouse


### Walkthrough of Azure Services

As part of this demo you will walk through the items created and provisioned as part of the demo deployment to Azure Script.
You can also walk through and highlight manual provisioning / ARM deployments.

### Step 21: Validation of services

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
1. Click on the storage account
1. Click on Containers
    - Validate that 2 containers **data** and **logs** are existing
1. Click on the **logs** container
    - validate that 3 files exist in the container:
        - preferences.json
        - weblogsQ1.log
        - weblogsQ2.log
1. Repeate the validation for the **data** container as well, validate that 2 files exist in the container:
       - preferences.json
       - DimDate2.txt
       


1. CLick on the SQL Data Warehouse
1. In the SQL Data Warehouse Window, click Pause to pause the service
1. Click on the Azure Data Factory repo and validate Azure Data Factory was deployed succesfully





💡 NOTE - At the end of this demo, if you are NOT going through any other demos - delete the resource group to reduce and mimize Azure spend.