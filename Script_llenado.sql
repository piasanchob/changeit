use changeit

CREATE PROCEDURE InsertarRedesSociales AS
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

CREATE PROCEDURE InsertarTipoHabitos AS

INSERT INTO dbo.TipoHabitos (nombre, medida)
VALUES
('Cantidad de material', 'Kg'),
('Cantidad de líquido', 'L'),
('Cantidad de área', 'Km2'),
('Cantidad de animales', 'animales'),
('Cantidad de monóxido de cárbono', 'mg CO/ hora m2')
GO

CREATE PROCEDURE InsertarHabitos AS
INSERT INTO dbo.Habitos(nombre,descripcion,imagenURL,deleted,fechainicio,fechafinal,tipohabito)
VALUES 
('Reducir Pajillas','Reducción del uso de pajillas de plástico','imagen',0,'20210111','20210311',4),
('Reciclar Cartón','Reciclar el cartón','imagen',0,'20210115','20210115',1),
('Usar bolsas reutilizables','Uso de bolsas reutilizables en compras','imagen',0,'20200220','20200623',1),
('Reducir impresión de hojas','Reducción de imprimir hojas','imagen',0,'20210111','20210511',1),
('Durar menos bañandose','Durar menos tiempo bañandose para reducir agua','imagen',0,'20200502','20210111',2),
('Reducir la ingesta de carne','Reducción de la ingesta masiva de carne','imagen',0,'20201224','20211203',4),
('Reducir la compra de ropa masiva repetidamente','No comprar ropa masiva seguidamente','imagen',0,'20200813','20210518',1),
('Utilizar más el transporte público o bicicletas','Reducción del uso de carros y su humo','imagen',0,'20210219','20210601',5),
('Eliminar uso de plástico de un solo uso','Reducción de plástico de un solo uso','imagen',0,'20201027','20210412',1),
('Reducir el humo de cigarro','Reducción del cigarro y su humo','imagen',0,'20200811','20210418',5)
GO

CREATE PROCEDURE InsertarTipoReacciones AS
INSERT INTO dbo.TipoReaccion (nombre)
VALUES
('Me gusta'),
('Views'),
('Links'),
('Shares'),

GO

CREATE PROCEDURE Insertar100kUsuarios AS

	DECLARE @redsocialid smallint
	DECLARE @token bigint
	DECLARE @nombre nvarchar(100)
	DECLARE @apellido nvarchar(100)
	DECLARE @contador int

	SET @contador=0

	WHILE @contador < 100000 BEGIN

	SET @redsocialid = FLOOR(RAND()*(5-1)+1)

	IF NULLIF(@redsocialid, '') IS NULL
		continue


	--simulación de obtebción de token
	SET @token = FLOOR(RAND()*100000000000)

		INSERT INTO dbo.ValidacionRRSS (token, posttime, tokenvalido, redsocial, tiempo)
		VALUES (@token, GETDATE(), 1, @redsocialid, 100000000)

		-- simulo la obtencion de nombre

		SET @nombre = FLOOR(RAND()*10000)
		SET @apellido = FLOOR(RAND()*10000)

		INSERT INTO dbo.Users (nombre, apellido, username, deleted, validaciontoken)
		VALUES (@nombre, @apellido, 
		cast(@nombre as varchar(100))+cast(@apellido as varchar(100))+cast(FLOOR(RAND()*1000) as varchar(100)), 0, (SELECT MAX(validacionid) FROM dbo.ValidacionRRSS))

	SET @contador = @contador + 1

	END
GO

CREATE PROCEDURE InsertarAportes AS

INSERT INTO dbo.Aportes (nombre, descripcion, habitoid)
VALUES
('Tortugas salvadas', 'Ha logrado salvar torugas gracias a no usar pajillas', 1),
('Reciclador', 'Ha logrado disminuir el consumo de cartón', 2),
('Reutilizad@r de bolsas', 'Ha contribuido al medio ambiente usando bolsas de tel en lugar de bolsas plásticas', 3),
('Reducción de hojas', 'Al disminuir el consumo de papel, ha ayudado a salvar areas verdes',4),
('Menos Ducha', 'Ha logrado ahorrar litros de agua al disminuir el tiempo de ducha',5),
('Menos Carne', 'Ha logrado salvar vacas al disminuir el consumo de carne',6),
('Menos Ropa', 'ha logrado ahorrar litros de agua al disminuir el tiempo de ducha',7),
('Trabnsporte Ecologico', 'Ha reducido la contaminación del aire al usar transporte público en vez de vehículo particular',8),
('No plastico', 'Ha logrado reducir la cantidad de plastico de un solo uso utilizada',9),
('No fumado', 'Ha logrado disminuir la contaminación ambiental y mejorar la salud de otros al no fumar',10)
GO


CREATE PROCEDURE LlenarBaseDeDatos AS
EXEC InsertarRedesSociales
EXEC InsertarEstadoPagos
EXEC InsertarTipoPago 
EXEC InsertarMerchants
EXEC InsertarTiposBitacora
EXEC InsertarAPPFuente
EXEC InsertarSeveridades
EXEC InsertarEntityTypes
EXEC InsertarTransTypes
EXEC InsertarEntidades
EXEC InsertarTipoHabitos
EXEC InsertarHabitos
EXEC InsertarTipoReacciones
EXEC Insertar100kUsuarios

GO


EXEC LlenarBaseDeDatos

