
/*This script is used as part of DATA50 Demo - creation of database objects. and used to explain table distribution in a relational data warehouse (Azure Synapse Analytics)

Script use: Modern Data Warehouse - Ignite the tour
Script created by: @ilikesql

These scripts are for illustrative and demonstrative purposes only.
Do not alter, or run these scripts in production environments without having a clear understanding of the purpose of each statement

Last Update: See Github repo date

*/


-- Create database objects in the Azure Synapse DW

--- Create users table
CREATE TABLE dbo.Users(userId int null,
	City nvarchar(100) null,
	Region nvarchar(100) null,
	Country nvarchar(100) null)
	WITH (CLUSTERED COLUMNSTORE INDEX,DISTRIBUTION = REPLICATE);
	GO

--- Create products table

CREATE TABLE dbo.Products(ProductId int null,
	EnglishProductName nvarchar(100) null,
	Color nvarchar(100) null,
	StandardCost int null,
	ListPrice int null,
	Size nvarchar(100) null,
	Weight int null,
	DaysTomanufacture int null,
	Class nvarchar(100) null,
	Style nvarchar(100) null)
	WITH (CLUSTERED COLUMNSTORE INDEX,DISTRIBUTION = ROUND_ROBIN);
	GO

-- FactSales Table

CREATE TABLE dbo.FactSales(DateId int null,
	ProductId int null,
	UserId int null,
	UserPreferenceId int null,
	SalesUnit int null)
	WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH(DateID));
	GO

