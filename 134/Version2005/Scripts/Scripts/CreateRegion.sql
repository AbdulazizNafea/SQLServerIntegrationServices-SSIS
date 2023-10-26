
if  exists (select * from information_schema.tables where table_name = 'Region')
drop table dbo.Region
go
create table Region (
 City nvarchar(15)
,Country nvarchar(15)
,Region nvarchar(30)
)
go
--Canadian 
insert into Region values ('Vancouver', 'Canada', 'British Columbia')
insert into Region values ('Tsawassen', 'Canada', 'British Columbia')
insert into Region values ('Montr�al', 'Canada', 'Qu�bec')
--British 
insert into Region values ('London', 'UK', 'England')
insert into Region values ('Cowes', 'UK', 'Isle of Wight')
--German
insert into Region values ('M�nchen', 'Germany', 'Bayern')
insert into Region values ('K�ln', 'Germany', 'Nordrhein-Westfalen')
insert into Region values ('Berlin', 'Germany', 'Berlin')
insert into Region values ('K�ln', 'Germany', 'Nordrhein-Westfalen')
insert into Region values ('Stuttgart', 'Germany', 'Baden-W�rttemberg')
insert into Region values ('Frankfurt a.M.', 'Germany', 'Hesse')
insert into Region values ('Aachen', 'Germany', 'Nordrhein-Westfalen')
insert into Region values ('Brandenburg', 'Germany', 'Brandenburg')
insert into Region values ('Leipzig', 'Germany', 'Sachsen')
insert into Region values ('M�nster', 'Germany', 'Nordrhein-Westfalen')
insert into Region values ('Mannheim', 'Germany', 'Baden-W�rttemberg')
--French
insert into Region values ('Strasbourg', 'France', 'Alsace')
insert into Region values ('Lyon', 'France', 'Rhone-Alpes')
insert into Region values ('Paris', 'France', '�le-de-France')
insert into Region values ('Versailles', 'France', '�le-de-France')
insert into Region values ('Nantes', 'France', 'Pays-de-la-Loire')
insert into Region values ('Lille', 'France', 'Nord-Pas-de-Calais')
insert into Region values ('Reims', 'France', 'Champagne-Ardenne')
insert into Region values ('Toulouse', 'France', 'Midi-Pyr�n�es')
insert into Region values ('Marseille', 'France', 'Provence-Alpes-C�te d''Azur')
--Spanish
insert into Region values ('Sevilla', 'Spain', 'Andalucia')
insert into Region values ('Madrid', 'Spain', 'Madrid')
insert into Region values ('Barcelona', 'Spain', 'Catalonia')
--Italy
insert into Region values ('Torino', 'Italy', 'Piemonte')
insert into Region values ('Bergamo', 'Italy', 'Lombardia')
insert into Region values ('Reggio Emilia', 'Italy', 'Emilia-Romagna')

go