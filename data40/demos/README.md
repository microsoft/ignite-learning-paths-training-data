# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.

---

## Demo 1 - Loading Data into Azure Synapse Data Warehouse

> 💡 You must have completed the [deployment](../deployment/README.md) before attempting to do the demo.

## Exercise 1: Create an Azure Synapse Analytics
  
Estimated Time: 15 minutes

Individual exercise
  
The main tasks for this exercise are as follows:

1. Create and configure a Azure Synapse Analytics instance.

1. Configure the Server Firewall

1. Pause the warehouse database

### Task 1: Create and configure a Azure Synapse Analytics instanc instance

> 💡 If you created the Azure Synapse Analytics instance by completing the DATA10 deployment script - you can skip this exercise


1. In the Azure portal, click on the link **home** at the top left of the screen.

1. In the Azure portal, click **+ Create a resource**.

1. In the New blade, navigate to the **Search the Marketplace** text box, and type the word **Synapse**. Click **Azure Synapse Analytics (formerly SQL DW)** in the list that appears.

1. In the **Azure Synapse Analytics (formerly SQL DW)** blade, click **Create**.

1. From the **SQL Data Warehouse** blade, create an Azure Synapse Analytics  with the following settings:

    - In the Project details section, type in the following information

        - **Subscription**: the name of the subscription you are using in this lab

        - **Resource group**: **yourresourcegroup(unique)**

    - In **Additional setting** tab, under data source, click **Sample**.

    - Click the **Basics** tab once this has been done.
    
    - In the Database details section, type in the following information

        - **Database warehouse name**: **yourdatawarehousename**

        - **Server**: Create a new server by clicking **Create new** with the following settings and click on **OK**:
            - **Server name**: **yourservername**
            - **Server admin login**: **youradminuser**
            - **Password**: **Pa55w.rd**
            - **Confirm Password**: **Pa55w.rd**
            - **Location**: choose a **location** near to you.
            - Select the checkbox to Allow Azure services to access server
            - click on **OK**

                ![Creating a server instance in the Azure portal](/demos/Linked_Image_Files/M05-E02-T01-img01.png)

    - Performance Level: Click **Select performance level** and select **Gen2 DW100C**.

        ![Configuring performance of Azure Synapse Analytics in the Azure portal](/demos/Linked_Image_Files/M05-E02-T01-img02.png)

    - Click **Apply**. the following configuration is shown.

        ![Configuring Azure Synapse Analytics in the Azure portal](/demos/Linked_Image_Files/M05-E02-T01-img03.png)

1. In the **SQL Data Warehouse** screen, click **Review + create**.

1. In the **SQL Data Warehouse** blade, click **Create**.

   > **Note**: The provision will takes approximately 7 minutes.

### Task 2: Configure the Server Firewall

1. In the Azure portal, in the blade, click **Resource groups**, and then click **yourresourcegroup**, and then click on **yourdatawarehousename**

1. Click on **yourdatawarehousename**

1. In the **yourdatawarehousename** screen, click on **Firewalls and virtual networks**.

1. In the yourdatawarehousename - Firewalls and virtual networks screen, click on the option **+ Add client IP**, and then click on **Save**. On the success screen click **OK**.

    ![Configuring Azure Synapse Analytics firewall settings in the Azure portal](/demos/Linked_Image_Files/M05-E02-T02-img01.png)

    > **Note**: You will receive a message stating that the the server firewall rules have been successfully updated

1. Close down the Firewalls and virtual networks screen.

> **Result**: After you completed this exercise, you have created an Azure  Synapse Analytics  instance and configures the server firewall to enable connections against it.

### Task 3: Pause the warehouse database

1. Click on **yourwarehousename**

1. In the **yourwarehousename** screen, click on **Pause**.

1. In the Pause Warehousexx screen, click **Yes**


## Exercise 2: Creating an Azure Synapse Analytics database and tables

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

1. In **SQL Server Management Studio**, in SQL Editor toolbar, in **Available Databases**, click on **DWDB**.

1. Create a **master key** against the **DWDB** database. In the query editor, type in the following code:

    ```SQL
    CREATE MASTER KEY;
    ```

1. Create a database scoped credential named **AzureStorageCredential** with the following details, by typing in the following code:
    - IDENTITY: **MOCID**
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


