
if  exists (select * from information_schema.routines where specific_name = 'procCleanSource')
drop proc procCleanSource
go
CREATE PROC procCleanSource 
WITH EXECUTE AS 'CleaningAgent'
AS 
UPDATE LedgerSourceData SET UpdateFlag = 'C' WHERE UpdateFlag IN ('I', 'U')
DELETE LedgerSourceData WHERE UpdateFlag = 'D'
go