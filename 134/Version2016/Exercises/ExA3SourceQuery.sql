select datename(yyyy, OrderDate) + '-Q' + datename(qq, OrderDate) AS Period, CategoryName, sum(NetAmount) AS Sales
FROM dbo.SummarySales 
group by datename(yyyy, OrderDate) + '-Q' + datename(qq, OrderDate),CategoryName
ORDER BY Period