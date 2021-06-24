use changeit

CREATE PROCEDURE InsertarRedesSociales
AS
	INSERT INTO dbo.RedesSociales (nombre, URL, iconoURL)
	VALUES
	('Facebook', 'www.facebook.com', 'www.facebook.com/iconimage/'),
	('Instagram', 'www.instagram.com', 'www.instagram.com/iconimage/'),
	('Twitter', 'www.twitter.com', 'www.twitter.com/iconimage/'),
	('LinkedIn', 'www.linkedin.com', 'www.linkedin.com/iconimage/')

GO

CREATE PROCEDURE InsertarEstadoPagos AS
INSERT INTO dbo.EstadosPago (nombre)
VALUES
('Aceptado'),
('Rechazado'),
('En Tránsito')

GO

CREATE PROCEDURE InsertarTipoPago AS
INSERT INTO dbo.TipoPago (nombre)
VALUES 
('Crédito'),
('Débito')

GO

CREATE PROCEDURE InsertarMerchants AS 
INSERT INTO dbo.Merchants (nombre, URL, deleted, iconoURL)
VALUES
('Paypal', 'www.paypal.com', 0, 'www.paypal.com/imageicon/'),
('Wink', 'www.wink.com', 0, 'www.wink.com/imageicon/'),
('ApplePay', 'www.ApplePay.com', 0, 'www.ApplePay.com/imageicon/'),
('GooglePay', 'www.GooglePay.com', 0, 'www.GooglePay.com/imageicon/'),
('BAC', 'www.Bac.com', 0, 'www.Bac.com/imageicon/'),
('BN', 'www.BancoNacional.com', 0, 'www.BancoNacional.com/imageicon/')

GO

CREATE PROCEDURE InsertarTiposBitacora AS
INSERT INTO dbo.TiposBitacoras (nombretipobitacora)
VALUES
	('Log in Usuario'),
	('Log out Usuario'),
	('Compra'),
	('Post'),
	('Pago'),
	('Registro Hábito'),
	('Patrocinar Hábito'),
	('Resumen'),
	('Revisión')

GO

CREATE PROCEDURE InsertarAPPFuente AS

INSERT INTO dbo.AppFuente (nombreappsource) 
VALUES
('Usuario'),
('Empresa'),
('Pago'),
('Transacción'),
('Ubicación'),
('Post'),
('Ad'),
('Sponsor'),
('Resumen')

GO

CREATE PROCEDURE InsertarSeveridades AS

INSERT INTO dbo.Severidades (nombreseveridad)
VALUES 
('Información'),
('Error'),
('Actualización'),
('Inserción'),
('Borrado')

GO

CREATE PROCEDURE InsertarEntityTypes AS

INSERT INTO dbo.EntityTypes (nombreentity)
VALUES
	('Usuario'),
    ('Administrador'),
	('Empresa'),
    ('Desconocido')

GO

CREATE PROCEDURE InsertarTransTypes AS

INSERT INTO dbo.Trantypes (nombre)
VALUES
('Usuario Log In'),
('Pago'),
('Transacción'),
('Ubicación'),
('Generar Post'),
('Ad'),
('Sponsor'),
('Generar Resumen')

GO

CREATE PROCEDURE InsertarEntidades AS

INSERT INTO dbo.Entidad (nombre)
VALUES
('Usuario'),
('Empresa')

GO

CREATE PROCEDURE TipoHabitos AS

INSERT INTO dbo.TipoHabitos (nombre, medida)
VALUES
('Cantidad de material', 'Kg'),
('Cantidad de líquido', 'L'),
('Cantidad de área', 'Km2'),
('Cantidad de animales', 'animales'),
('Cantidad de monóxido de cárbono', 'mg')
GO





CREATE PROCEDURE InsertarHabitos AS
INSERT INTO dbo.Habitos(nombre,descripcion,imagen,deleted,fechainicio,fechafinal,tipohabito)
VALUES 
('Reducir Pajillas','Reducción del uso de pajillas de plástico','imagen',0,'2021-01-11 13:23:44','2021-03-11 13:23:44',4),
('Reciclar Cartón','Reciclar el cartón','imagen',0,'2021-01-15 14:23:45','2021-01-15 14:23:45',1),
('Usar bolsas reutilizables','Uso de bolsas reutilizables en compras','imagen',0,'2020-02-20 20:10:44','2020-06-23 12:20:45',1),
('Reducir impresión de hojas','Reducción de imprimir hojas','imagen',0,'2021-01-11 08:25:40','2021-05-11 05:06:00',1),
('Durar menos bañandose','Durar menos tiempo bañandose para reducir agua','imagen',0,'2020-05-02 05:23:00','2021-01-11 15:00:44',2),
('Reducir la ingesta de carne','Reducción de la ingesta masiva de carne','imagen',0,'2020-12-24 12:00:00','2021-24-03 07:23:33',4),
('Reducir la compra de ropa masiva repetidamente','No comprar ropa masiva seguidamente','imagen',0,'2020-08-13 16:24:45','2021-05-18 24:00:44',1),
('Utilizar más el transporte público o bicicletas','Reducción del uso de carros y su humo','imagen',0,'2021-02-19 20:00:09','2021-06-01 01:05:12',5),
('Eliminar uso de plástico de un solo uso','Reducción de plástico de un solo uso','imagen',0,'2020-10-27 19:00:00','2021-04-12 04:13:00',1),
('Reducir el humo de cigarro','Reducción del cigarro y su humo','imagen',0,'2020-08-11 08:22:15','2021-04-18 12:23:45',5)



GO

CREATE PROCEDURE InsertarPoblacion As
INSERT INTO dbo.Poblacion(punto1,punto2,punto3,punto4,cantidad,latitudcentro,longitudcentro,ubicacion)
VALUES
(5.536,3.457,1.232,6.768,1000,1.9,3.8,1),
(6.3568,8.2576,8.126,2.3459,4000,1.7,6.5,2),
(8.54,74.257,3.245765,7.2567,23000,1.2,4.5,3),
(9.0874,34.468,5.09098,9.8679,9000,10.9,24.5,4),
(1.234,4.567,3.1965,6.5679,5000,1.2,4.5,1)

GO