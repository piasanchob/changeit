use changeitcubes
CREATE PROCEDURE insertions
AS
insert into restaurantes(restaurante)
VALUES 
('Dairy Queen'),
('Checkers'),
('Five Guys'),
('Burger King'),
('El Pollo Loco'),
('Chipotle Mexican Grill'),
('SUBWAY'),
('Pizza Hut'),
('Taco Bell'),
('Chicken Express'),
('Pizza Hut'),
('Arby´s')
insert into ciudades(ciudad)
VALUES 
('Detroit'),
('Grand Rapidis'),
('Oregon'),
('Columbia'),
('Compton'),
('Chatsworth'),
('Campbellsville'),
('Defiance'),
('Utica'),
('Paris'),
('Columbia'),
('Columbia')
insert into campañas(campaña)
VALUES 
('valentines day'),
('sport and food'),
('sport and food'),
('christmas'),
('christmas'),
('valentines day'),
('halloween'),
('halloween'),
('halloween'),
('sports and food'),
('back to school'),
('kids day')
insert into fechas(fecha,dia,mes,año)
VALUES 
('2021-05-11 23:00:04',11,05,2021),
('2021-06-12 12:05:00',6,12,2021),
('2021-06-20 08:12:00',20,6,2021),
('2020-12-24 13:10:09',24,12,2020),
('2020-12-24 13:10:09',24,12,2020),
('2021-02-14 09:10:10',14,2,2021),
('2020-10-31 16:08:26',31,10,2020),
('2020-10-31 09:00:20',31,10,2020),
('2020-09-26 11:04:45',26,9,2020),
('2020-09-30 17:05:27',30,9,2020),
('2021-02-01 14:10:22',1,2,2021),
('2021-04-11 17:00:28',11,4,2021)
insert into info(restauranteid,campañaid,monto,fechaid,views,shares,ciudadid)
VALUES 
(1,1,300,1,500,15,1),
(2,2,500,2,900,40,2),
(3,3,1000,3,1200,50,3),
(4,4,1000,4,2500,45,4),
(5,5,250,5,300,8,5),
(6,6,900,6,1200,50,6),
(7,7,1200,7,2400,69,7),
(8,8,4000,8,3000,40,8),
(9,9,9000,9,10000,89,9),
(10,10,500,10,500,20,10),
(11,11,900,11,1000,29,11),
(12,12,2000,12,1000,99,12)
GO

EXEC insertions

delete from restaurantes
select * from campañas
DBCC CHECKIDENT
(ciudades,RESEED,0)

