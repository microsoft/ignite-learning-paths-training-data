# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.

---

## Demo 1 - Loading Data into Azure Synapse Data Warehouse

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

1. Copy the **"Server name"** and paste it into Notepad.

1. Download data40\demos\CreateTables.sql and install onto your machine

1. On the windows desktop, click on the **Start**, and type **"SQL Server"** and then click on **MIcrosoft SQL Server Management Studio 17**

1. In the **Connect to Server** dialog box, fill in the following details
    - Server Name: **yourdwservername.database.windows.net**
    - Authentication: **SQL Server Authentication**
    - Username: **theadminusernameyoucreated**
    - Password: **thepasswordyoucreated**

1. In the **Connect to Server** dialog box, click **Connect** 

### Task 2: Create a SQL Data Warehouse database.

1. In **SQL Server Management Studio**, in Object Explorer, right click **yourdwservername.database.windows.net** and click on **New Query**. 

1. In the query window, create a DataWarehouse database named **DWDB**, with a service objective of DW100 and a maximum size of 1024GB.

    ```SQL
    CREATE DATABASE DWDB COLLATE SQL_Latin1_General_CP1_CI_AS
    (
        EDITION             = 'DataWarehouse'
    ,   SERVICE_OBJECTIVE   = 'DW100C'
    ,   MAXSIZE             = 1024 GB
    );
    ```

    > **Note**: The creation of the database takes approximately 2 minutes.


### Task 3: Create SQL Data Warehouse tables.

1. In **SQL Server Management Studio**, in Object Explorer, right click **yourdwservername.database.windows.net** and click on **New Query**.

1. In **SQL Server Management Studio**, in SQL Editor toolbar, in **Available Databases**, click on **DWDB**.
1. Download the query file or copy it's content in SQL Management Studio ![SQL Create Table Scripts file](../demos/CreateTables.sql)
1. Execute the Query to create all the tables


## Exercise 4: Using PolyBase to Load Data into Azure Synapse Analytics 

Estimated Time: 10 minutes

Individual exercise

The main tasks for this exercise are as follows:

1. Collect Data Lake Storage container and key details

1. Create a dbo.Dates table using PolyBase from Azure Data Lake Storage

### Task 1: Collect Azure Blob account name and key details

1. In the Azure portal, click on **Resource groups** and then click on **yourresourcegroup**, and then click on **yourblobstorage** where xx are the initials of your name.

1. In the **yourblobstorage** screen, click **Access keys**. Click on the icon next to the **Storage account name** and paste it into Notepad.

1. In the **yourblobstorage - Access keys** screen, under **key1**, Click on the icon next to the **Key** and paste it into Notepad.

### Task 2: Create a dbo.Dates table using PolyBase from Azure Blob

1. In **SQL Server Management Studio**, in Object Explorer, right click **yourdwservername.database.windows.net** and click on **New Query**.

    **Note:** If you haven't previously registered the database instance, you will have to register and use the sql user and password you used to deploy the environment in DATA10

1. In **SQL Server Management Studio**, in SQL Editor toolbar, in **Available Databases**, click on **DWDB**.

**Note:** If you already created a master key as part of DATA20 demo, you can skip the next step and go to create a database scoped credential

1. Create a **master key** against the **DWDB** database. In the query editor, type in the following code:

    ```SQL
    CREATE MASTER KEY;
    ```

1. Create a database scoped credential named **AzureStorageCredential** with the following details, by typing in the following code:
    - IDENTITY: **Blobidentity**
    - SECRET: **The access key of your storage account**

    ```SQL
    CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
    WITH
    IDENTITY = 'BlobIdentity',
    SECRET = 'Your storage account key'
;
    ```

1. In **SQL Server Management Studio**, highlight both statements and then click on **Execute**.

1. In **SQL Server Management Studio**, in the Query window, type in code that will create an external data source named **AzureStorage** for the Blob storage account and data container created in with a type of **HADOOP** that makes use of the ****AzureStorageCredential**. Note that you should replace **yourblobstorage** in the location key with your storage account with your initials 

    ```SQL
	CREATE EXTERNAL DATA SOURCE AzureStorage
    WITH (
        TYPE = HADOOP,
        LOCATION = 'abfs://data@yourblobstorage.dfs.core.windows.net',
        CREDENTIAL = AzureStorageCredential
    );
    ```

1. In **SQL Server Management Studio**, in the Query window, type in code that will create an external file format named **TextFile** with a formattype of **DelimitedText** and a filed terminator of **comma**.

    ```SQL
    CREATE EXTERNAL FILE FORMAT TextFile
    WITH (
        FORMAT_TYPE = DelimitedText,
        FORMAT_OPTIONS (FIELD_TERMINATOR = ',')
    );
    ```

1. In **SQL Server Management Studio**, highlight the statement and then click on **Execute**.

1. In **SQL Server Management Studio**, in the Query window, type in code that will create an external table named **dbo.DimDate2External** with the **location** as the root file, the Data source as **AzureStorage**, the File_format of **TextFile** with the following columns:

    | column name | data type | Nullability|
    |-------------|-----------|------------|
    | Date | datetime2(3) | NULL|
    | DateKey | decimal(38, 0) | NULL|
    | MonthKey | decimal(38, 0) | NULL|
    | Month | nvarchar(100) | NULL|
    | Quarter | nvarchar(100) | NULL|
    | Year | decimal(38, 0) | NULL|
    | Year-Quarter | nvarchar(100) | NULL|
    | Year-Month | nvarchar(100) | NULL|
    | Year-MonthKey | nvarchar(100) | NULL|
    | WeekDayKey| decimal(38, 0) | NULL|
    | WeekDay| nvarchar(100) | NULL|
    | Day Of Month| decimal(38, 0) | NULL|

    ```SQL
	CREATE EXTERNAL TABLE dbo.DimDate2External (
    [Date] datetime2(3) NULL,
    [DateKey] decimal(38, 0) NULL,
    [MonthKey] decimal(38, 0) NULL,
    [Month] nvarchar(100) NULL,
    [Quarter] nvarchar(100) NULL,
    [Year] decimal(38, 0) NULL,
    [Year-Quarter] nvarchar(100) NULL,
    [Year-Month] nvarchar(100) NULL,
    [Year-MonthKey] nvarchar(100) NULL,
    [WeekDayKey] decimal(38, 0) NULL,
    [WeekDay] nvarchar(100) NULL,
    [Day Of Month] decimal(38, 0) NULL
    )
    WITH (
        LOCATION='/DimDate2.txt',
        DATA_SOURCE=AzureStorage,
        FILE_FORMAT=TextFile
    );
    ```

1. In **SQL Server Management Studio**, highlight the statement and then click on **Execute**.

1. Test that the table is created by running a select statement against it

    ```SQL
    SELECT * FROM dbo.DimDate2External;
    ```

1. In **SQL Server Management Studio**, in the Query window, type in a **CTAS** statement that creates a table named **dbo.Dates** with a **columnstore** index and a **distribution** of **round robin** that loads data from the **dbo.DimDate2External** table.

    ```SQL
    CREATE TABLE dbo.Dates
    WITH
    (   
        CLUSTERED COLUMNSTORE INDEX,
        DISTRIBUTION = ROUND_ROBIN
    )
    AS
    SELECT * FROM [dbo].[DimDate2External];
    ```

1. In **SQL Server Management Studio**, highlight the statement and then click on **Execute**.
 
1. In **SQL Server Management Studio**, in the Query window, type in a query that creates statistics on the **DateKey**, **Quarter** and **Month** column.

    ```SQL
    CREATE STATISTICS [DateKey] on [Dates] ([DateKey]);
    CREATE STATISTICS [Quarter] on [Dates] ([Quarter]);
    CREATE STATISTICS [Month] on [Dates] ([Month]);
    ```

1. Test that the table is created by running a select statement against it

    ```SQL
    SELECT * FROM dbo.Dates;
    ```

💡 NOTE - At the end of this demo, if you are NOT going through any other demos - delete the resource group to reduce and mimize Azure spend.
