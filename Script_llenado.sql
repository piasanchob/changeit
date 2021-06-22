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
('En Tr�nsito')

GO

CREATE PROCEDURE InsertarTipoPago AS
INSERT INTO dbo.TipoPago (nombre)
VALUES 
('Cr�dito'),
('D�bito')

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
	('Registro H�bito'),
	('Patrocinar H�bito'),
	('Resumen'),
	('Revisi�n')

GO

CREATE PROCEDURE InsertarAPPFuente AS

INSERT INTO dbo.AppFuente (nombreappsource) 
VALUES
('Usuario'),
('Empresa'),
('Pago'),
('Transacci�n'),
('Ubicaci�n'),
('Post'),
('Ad'),
('Sponsor'),
('Resumen')

GO

CREATE PROCEDURE InsertarSeveridades AS

INSERT INTO dbo.Severidades (nombreseveridad)
VALUES 
('Informaci�n'),
('Error'),
('Actualizaci�n'),
('Inserci�n'),
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
('Transacci�n'),
('Ubicaci�n'),
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
('Cantidad de l�quido', 'L'),
('Cantidad de �rea', 'Km2'),
('Cantidad de animales', 'animales')

GO



CREATE PROCEDURE InsertarHabitos AS

INSERT INTO dbo.Habitos (nombre, descripcion, imagen, deleted, fechainicio, fechafinal, tipohabito)
VALUES




GO


