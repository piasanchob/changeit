use changeit
CREATE PROCEDURE llenadomongo
AS
insert into mongoinfo(restaurante,campaña,monto,fecha,views,shares,ciudad,dia,mes,año)
VALUES 
('Dairy Queen','valentines day',300,'2021-05-11 23:00:04',500,15,'Detroit',11,05,2021),
('Checkers','sport and food',500,'2021-06-12 12:05:00',900,40,'Grand Rapidis',6,12,2021),
('Five Guys','sport and food',1000,'2021-06-20 08:12:00',1200,50,'Oregon',20,6,2021),
('Burger King','christmas',1000,'2020-12-24 13:10:09',2500,45,'Columbia',24,12,2020),
('El Pollo Loco','christmas',250,'2020-12-24 05:12:23',300,8,'Compton',24,12,2020),
('Chipotle Mexican Grill','valentines day',900,'2021-02-14 09:10:10',1200,50,'Chatsworth',14,2,2021),
('SUBWAY','halloween',1200,'2020-10-31 16:08:26',2400,69,'Campbellsville',31,10,2020),
('Pizza Hut','halloween',4000,'2020-10-31 09:00:20',3000,40,'Defiance',31,10,2020),
('Taco Bell','halloween',9000,'2020-10-31 15:16:25',10000,89,'Utica',31,10,2020),
('Chicken Express','sports and food',500,'2020-09-26 11:04:45',500,20,'Paris',26,9,2020),
('Pizza Hut','back to school',900,'2020-09-30 17:05:27',1000,29,'Columbia',30,9,2020),
('Arby´s','kids day',2000,'2021-02-01 14:10:22',1000,99,'Columbia',1,2,2021)

GO
EXEC llenadomongo
