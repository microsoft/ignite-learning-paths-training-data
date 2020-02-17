/*This script configures a database or data warehouse for data ingestion with Polybase

Script use: Modern Data Warehouse - Ignite the tour
Script created by: @iliksql

These scripts are for illustrative and demonstrative purposes only.
Do not alter, or run these scripts in production environments without having a clear understanding of the purpose of each statement

Last Update: See Github repo date

*/

-- PREPARE FOR POLYBASE

-- Database requires a master key - this might already exist
CREATE MASTER KEY
GO
-- Create a database scoped credential to access Azure Blob / Datalake Storage for Polybase Ingestion


CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH
IDENTITY = 'BlobIdentity',
SECRET = 'fillinyourstoragekeyhere' --- fill in your storage key here


-- create an external table to the Azure Data Lake Store that hosts the file to ingest

CREATE EXTERNAL DATA Source AzureStorage
with(TYPE=HADOOP,
LOCATION= 'abfss://data@mdwdemostoredl.dfs.core.windows.net',  -- make sure you update the right location data
CREDENTIAL = AzurestorageCredential)

-- CREATE EXTERNAL FILE FORMAT
CREATE EXTERNAL FILE FORMAT textfile
with (FORMAT_TYPE = DelimitedText,  
      FORMAT_OPTIONS (FIELD_TERMINATOR = ','))

-- create the external table


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
[Day Of Month] decimal(38, 0) NULL)
WITH (
    LOCATION='DimDate2.txt',
    DATA_SOURCE=AzureStorage,
    FILE_FORMAT=TextFile
);

-- ingest the data using a CTAS (Create Table As Statement)

SELECT * FROM dbo.DimDate2External;


CREATE TABLE dbo.Dates
WITH
(   
    CLUSTERED COLUMNSTORE INDEX,
    DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT * FROM [dbo].[DimDate2External];

--- Create Statistics

CREATE STATISTICS [DateKey] on [Dates] ([DateKey]);
CREATE STATISTICS [Quarter] on [Dates] ([Quarter]);
CREATE STATISTICS [Month] on [Dates] ([Month]);