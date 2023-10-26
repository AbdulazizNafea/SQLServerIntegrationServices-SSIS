
USE SourceDB134

UPDATE Staff SET Address =  N'New Street', City = N'Herndon' WHERE [ID] = 2
DELETE FROM Staff WHERE [ID] = 3
INSERT INTO Staff ([ID], [Name], [Address], City) VALUES (4, N'Kimberly Carella', N'Prosperity Highway', N'Austin')
INSERT INTO Staff([ID], [Name], [Address], [City]) VALUES (5, N'Amy Mazariego', N'Technology Drive', N'Dulles')


SELECT * FROM SourceDB134.dbo.Staff
SELECT * FROM DB134.dbo.StaffDestination;

----More updates and inserts if needed
--UPDATE Staff SET Address = N'24 Eversholt Street', City = 'London' WHERE ID = 1
--UPDATE Staff SET Address = 'Dulles Technology Drive' WHERE ID = 2
--UPDATE Staff SET City = 'Herndon' WHERE ID = 5
--INSERT INTO Staff (ID, Name, Address, City) VALUES (6, 'Charles Kangai', '31 Waverley Road', 'Bristol')
--INSERT INTO Staff(ID, Name, Address, City) VALUES (7, 'David Orledge', '1 Station Road', 'Leatherhead')
-- exec sp_cdc_start_job


--disabling CDC
--USE SourceDB134  
--GO  
--EXEC sys.sp_cdc_disable_table  
--@source_schema = N'dbo',  
--@source_name   = N'Staff',  
--@capture_instance = N'dbo_Staff'  
--GO  

--USE SourceDB134  
--GO  
--EXEC sys.sp_cdc_disable_db  
--GO  