-- Azure Synapse Analytics DW

CREATE TABLE dbo.Users(
userId int null,
City nvarchar(100) null,
Region nvarchar(100) null,
Country nvarchar(100) null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = REPLICATE
);
GO
-- Products Table
CREATE TABLE dbo.Products(
ProductId int null,
EnglishProductName nvarchar(100) null,
Color nvarchar(100) null,
StandardCost int null,
ListPrice int null,
Size nvarchar(100) null,
Weight int null,
DaysTomanufacture int null,
Class nvarchar(100) null,
Style nvarchar(100) null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = ROUND_ROBIN
);
GO
-- FactSales Table
CREATE TABLE dbo.FactSales(
DateId int null,
ProductId int null,
UserId int null,
UserPreferenceId int null,
SalesUnit int null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = HASH
);
GO
