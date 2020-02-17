# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.

---

## Demo 1 - Query performance tuning 

> 💡 You must have completed the [deployment](../deployment/README.md) before attempting to do the demo.



## Exercise 1: Creating an Azure Synapse Analytics database objects

Estimated Time: 10 minutes

Individual exercise

The main tasks for this exercise are as follows:

1. Validate Connectivity to the SQL DW in SQL Management Studio

1. Create a SQL Data Warehouse database

1. Create SQL Data Warehouse tables

  
### Task 1: Connect to a SQL Data Warehouse instance.

1. In the Azure Portal, in your **Azure Synapse Data Warehouse- Firewalls and virtual networks**, in the blade, click on **Properties**
1. Click **Add Client IP** to get access to the server
1. Click **Overview** write down the server name

## Create a SQL Data Warehouse

1. On the windows desktop, click on the **Start**, and type **"SQL Server"** and then click on **MIcrosoft SQL Server Management Studio 17**
**Note:** Alternatively you can do all the following tasks in the Query Editor in the Azure Portal.

1. In the **Connect to Server** dialog box, fill in the following details
    - Server Name: **yourdwservername.database.windows.net**
    - Authentication: **SQL Server Authentication**
    - Username: **theadminusernameyoucreated**
    - Password: **thepasswordyoucreated**

1. In the **Connect to Server** dialog box, click **Connect** 

```SQL
CREATE DATABASE DWDB COLLATE SQL_Latin1_General_CP1_CI_AS
(
    EDITION             = 'DataWarehouse'
,   SERVICE_OBJECTIVE   = 'DW100C'
,   MAXSIZE             = 1024 GB
);
```

1. Download [data50\demos\CreateTables.sql](https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-data/master/data50/demos/CreateTables.sql) and install onto your machine

### Task 3: Create SQL Data Warehouse tables.

1. In **SQL Server Management Studio**, in Object Explorer, right click **yourdwservername.database.windows.net** and click on **New Query**.

1. In **SQL Server Management Studio**, in SQL Editor toolbar, in **Available Databases**, click on the data warehouse previously created.
1. Download the query file or copy it's content in SQL Management Studio [SQL Create Table Scripts file](../demos/CreateTables.sql)
1. Execute the Query to create all the tables

