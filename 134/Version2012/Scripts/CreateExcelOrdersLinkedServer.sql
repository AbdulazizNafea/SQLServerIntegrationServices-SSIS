/* This script is required for creating the Excel linked server
that is used in Exercises 4.2 and 4.3. Because the 64 bit version of SSIS 
does not support OLE DB connections to Excel, I have changed this exercise
to use a linked server instead. Charles Kangai, June 18, 2010. */

exec sp_addLinkedServer 
@server= 'EXCELOrders', 
@srvproduct = 'ACE 12.0', 
@provider = 'Microsoft.ACE.OLEDB.12.0', 
@datasrc = 'c:\134\Exercises\OrderDetails.xlsx', 
@provstr = 'Excel 12.0; HDR=Yes' 