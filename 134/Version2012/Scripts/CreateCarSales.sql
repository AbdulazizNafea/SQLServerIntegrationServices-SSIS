
if exists (select * from information_schema.tables where table_name = 'CarSales')
drop table CarSales
go
create table CarSales
(Make varchar(20)
, [Year] INT
, Sales INT)

go
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Honda', 1990, 2000)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Honda', 1990, 1000)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Acura', 1990, 500)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Honda', 1991, 3000)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Acura', 1991, 300)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Acura', 1991, 600)
INSERT INTO CarSales (Make, [Year], Sales) VALUES ('Acura', 1992, 800)
go