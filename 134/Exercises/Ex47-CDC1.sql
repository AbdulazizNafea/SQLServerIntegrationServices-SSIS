/* --Part 1: Prepare the source and destination tables for the import  */

USE SourceDB134
IF OBJECT_ID('dbo.Staff') IS NOT NULL DROP TABLE dbo.Staff;


CREATE TABLE Staff
([ID] INT PRIMARY KEY
,[Name] NVARCHAR(50) UNIQUE NOT NULL
,[Address] NVARCHAR(50) NOT NULL
,City NVARCHAR(15) 
)

GO
INSERT INTO Staff ([ID], [Name], [Address], City)
VALUES 
(1, N'Jane White', N'1 Station Road', N'Leatherhead')
,(2, N'Andrew Cate', N'Michael Faraday Drive', N'Reston')
,(3, N'Karen Najjoum', N'Old Street', N'Reston');




USE DB134
GO
IF OBJECT_ID('dbo.StaffDestination') IS NOT NULL DROP TABLE dbo.StaffDestination;

CREATE TABLE StaffDestination
([ID] INT PRIMARY KEY
,[Name] NVARCHAR(50) UNIQUE NOT NULL
,[Address] NVARCHAR(50) NOT NULL
,City NVARCHAR(15) 
)

GO

GO
SELECT * FROM SourceDB134.dbo.Staff;
SELECT * FROM DB134.dbo.StaffDestination;
/********* End of Part 1 ***********************/




/*  Part 2: Enable the database and table Staff for CDC tracking  */
USE SourceDB134
GO
DECLARE @cdc_database INT
SELECT @cdc_database = is_cdc_enabled FROM sys.databases WHERE database_id = DB_ID()
if @cdc_database = 0 EXEC sys.sp_cdc_enable_db  

DECLARE @cdc_table INT 
SELECT @cdc_table = is_tracked_by_cdc FROM sys.tables WHERE object_id = OBJECT_ID('dbo.Staff')
IF @cdc_table = 1 EXEC sys.sp_cdc_disable_table @source_schema = N'dbo', @source_name = 'Staff', @capture_instance = N'dbo_Staff'

EXEC sys.sp_cdc_enable_table @source_schema = N'dbo'
						,@source_name = 'Staff'
						,@role_name = N'cdc_Admin'
						,@capture_instance = N'dbo_Staff'
						,@supports_net_changes = 1

SELECT [name], is_tracked_by_cdc FROM sys.tables WHERE object_id = OBJECT_ID('dbo.Staff')
