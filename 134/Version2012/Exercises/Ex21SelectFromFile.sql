SELECT * FROM 
		OPENROWSET(BULK 'c:\134\Exercises\SalesData.txt'
		,FORMATFILE='c:\134\Exercises\SalesData_Format.xml', FirstRow = 2) as x
