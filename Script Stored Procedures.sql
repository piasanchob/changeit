-- SCRIPT CON LOS STORED PROCEDURES

use changeit

CREATE PROCEDURE RegistrarUsuario 
	@redsocial nvarchar(50)
AS
	
	DECLARE @redsocialid smallint
	DECLARE @token bigint
	DECLARE @nombre nvarchar(100)
	DECLARE @apellido nvarchar(100)

	SET @redsocialid = (SELECT redessocialesid FROM dbo.RedesSociales WHERE dbo.RedesSociales.nombre = @redsocial)

	IF NULLIF(@redsocialid, '') IS NULL
	BEGIN
		RAISERROR ('La red social ingresada no existe, porfavor vuelva ingrese una red social válida.', 1, 1) 
		RETURN
	END

	--simulación de obtebción de token
	SET @token = FLOOR(RAND()*100000000000)

		INSERT INTO dbo.ValidacionRRSS (token, posttime, tokenvalido, redsocial, tiempo)
		VALUES (@token, GETDATE(), 1, @redsocialid, 100000000)

	BEGIN TRAN
		-- simulo la obtencion de nombre

		SET @nombre = FLOOR(RAND()*10000)
		SET @apellido = FLOOR(RAND()*10000)

		INSERT INTO dbo.Users (nombre, apellido, username, deleted, validaciontoken)
		VALUES (@nombre, @apellido, 
		cast(@nombre as varchar(100))+cast(@apellido as varchar(100))+cast(FLOOR(RAND()*1000) as varchar(100)), 0, (SELECT MAX(validacionid) FROM dbo.ValidacionRRSS))

	COMMIT
GO


CREATE PROCEDURE RegistrarHabito
	@nombre nvarchar(100),
	@descripcion nvarchar(100),
	@imagenURL nvarchar(128),
	@fechainicio datetime,
	@fechafinal datetime,
	@tipohabito nvarchar(100)
AS
	DECLARE @tipohabitoid smallint

	SET @tipohabitoid = (SELECT tipoid FROM dbo.TipoHabitos WHERE dbo.TipoHabitos.nombre=@tipohabito)

	IF NULLIF(@tipohabitoid, '') IS NULL
	BEGIN
		RAISERROR ('El tipo de hábito no existe, porfavor ingrese un tipo de hábito válido.', 1, 1) 
		RETURN
	END

	IF  NULLIF(@fechainicio, '') IS NOT NULL AND NULLIF(@fechafinal, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, fechafinal, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, @fechainicio, @fechafinal, 0)

	ELSE IF NULLIF(@fechainicio, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, @fechainicio, 0)

	ELSE IF NULLIF(@fechafinal, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, fechafinal, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, GETDATE(), @fechafinal, 0)

	ELSE IF NULLIF(@fechainicio, '') IS NULL AND NULLIF(@fechafinal, '') IS NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, GETDATE(), 0)
GO

CREATE PROCEDURE AplicarHabito AS

	DECLARE @usuario bigint
	DECLARE @habito int
	DECLARE @lat decimal(8,6)
	DECLARE @lon decimal(9,6)
	DECLARE @localizacion geography

	SET @usuario = FLOOR(RAND()*100000 + 1)
	SET @habito = FLOOR(RAND()*10 + 1)

	SET @lat = (RAND()*90 + 1) 
	SET @lon = (RAND()*180 + 1) 
	

	IF (select rand()) < 0.5
		SET @lat = @lat*-1
	IF (select rand()) < 0.5
		SET @lon = @lon*-1

	SET @localizacion = geography::Point(@lat, @lon, 4326)


	INSERT INTO dbo.HabitosAplicados(usuario, habito, posttime, localizacion)
	VALUES(@usuario, @habito, GETDATE(), @localizacion)

GO





DBCC CHECKIDENT ('changeit.dbo.ValidacionRRSS', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.HabitosAplicados', RESEED, 0);

SELECT * FROM RedesSociales
SELECT * FROM Users
select * from ValidacionRRSS
select * from HabitosAplicados


delete from ValidacionRRSS
delete from Users
delete from Habitos
delete from HabitosAplicados

EXEC RegistrarUsuario 'Twitter'


EXEC AplicarHabito


select * from dbo.Fast_Food_Restaurants