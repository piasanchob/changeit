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
		RAISERROR ('La red social ingresada no existe, porfavor vuelva ingrese una red social v�lida.', 1, 1) 
		RETURN
	END

	--simulaci�n de obtebci�n de token
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
		RAISERROR ('El tipo de h�bito no existe, porfavor ingrese un tipo de h�bito v�lido.', 1, 1) 
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
	DECLARE @checksum_aux nvarchar(100)
	DECLARE @checksum varbinary(500)

	SET @usuario = FLOOR(RAND()*100000 + 1)
	SET @habito = FLOOR(RAND()*10 + 1)

	SET @lat = (RAND()*89 + 1) 
	SET @lon = (RAND()*179 + 1) 
	

	IF (select rand()) < 0.5
		SET @lat = @lat*-1
	IF (select rand()) < 0.5
		SET @lon = @lon*-1

	SET @localizacion = geography::Point(@lat, @lon, 4326)

	BEGIN TRAN
	INSERT INTO dbo.HabitosAplicados(usuario, habito, posttime, localizacion)
	VALUES(@usuario, @habito, GETDATE(), @localizacion)

	SET @checksum_aux = (CAST(@usuario as nvarchar(30)) + CAST(@habito as nvarchar(30)) + CAST(GETDATE() AS nvarchar(30)) + CAST(@localizacion as nvarchar(100)))
	SET @checksum = HASHBYTES('SHA2_256', @checksum_aux)

	INSERT INTO dbo.Bitacoras (fecha, descripcion, userbitacora, ip, refid1, refid2, checksum, severidadbit, entitybit, appfuentebit, logtypebit)
	VALUES (GETDATE(), 'Aplicaci�n de Habito', @usuario ,'127.0.0.1', @usuario, @habito, @checksum, 4, 1, 1, 6)
	COMMIT
GO

CREATE PROCEDURE GenerarResumen 
	@usuarioid bigint
AS

	DECLARE @contador int
	DECLARE @aporteid bigint
	DECLARE @aporte nvarchar(100)
	DECLARE @habitocontador int
	DECLARE @cantidad int
	DECLARE @caption nvarchar(500)

	--PRIMERO GENERAR EL RESUMEN

	SET @caption = ''

	--SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito

	--SELECT habito, COUNT(habitoaplicadoid) cantidad FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito

	SET @contador = (SELECT COUNT(habito) FROM (SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito) AS habito_aux)

	SET @habitocontador = 1

	BEGIN TRAN
	
	WHILE @habitocontador <= (SELECT MAX(habitoid) FROM dbo.Habitos) BEGIN

	IF @habitocontador IN (SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito)
	BEGIN
		
		SET @aporteid = (SELECT aporteid FROM dbo.Aportes WHERE dbo.Aportes.habitoid=@habitocontador)

		SET @cantidad = (SELECT cantidad FROM (SELECT habito, COUNT(habitoaplicadoid) cantidad FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito) AS A WHERE A.habito=@habitocontador)

		INSERT INTO dbo.AportesPorUsuario (aporte, cantidad, posttime, usuario)
		VALUES (@aporteid, @cantidad, GETDATE(), @usuarioid)


		SET @aporte = (SELECT nombre FROM dbo.Aportes WHERE dbo.Aportes.aporteid=@aporteid)

		
		SET @caption = @caption + '    ' +  @aporte + ' CANT: ' + CAST(@cantidad as nvarchar(100))
	END
	
	SET @habitocontador = @habitocontador + 1

	END

	INSERT INTO dbo.Resumenes (fecha, caption, usuario)
	VALUES (GETDATE(), @caption, @usuarioid)
	
	COMMIT
GO

CREATE PROCEDURE HacerPosteo AS

	DECLARE @tag1 nvarchar(20)
	DECLARE @tag2 nvarchar(20)
	DECLARE @tag3 nvarchar(20)
	DECLARE @tag4 nvarchar(20)
	DECLARE @tag5 nvarchar(20)
	DECLARE @usuarioid bigint
	DECLARE @resumenid bigint
	DECLARE @caption nvarchar(500)
	DECLARE @URL nvarchar(128)
	DECLARE @redsocialid smallint
	DECLARE @URLredsocial nvarchar(50)
	DECLARE @postid bigint
	DECLARE @pubilcacionid bigint
	DECLARE @checksum_aux nvarchar(100)
	DECLARE @checksum varbinary(500)

	-- SE GENERA RESUMEN y SACO DATOS

	SET @usuarioid = FLOOR(RAND()*100000-1 + 1)

	EXEC GenerarResumen @usuarioid

	SET @resumenid = (SELECT MAX(resumenid) FROM dbo.Resumenes WHERE dbo.Resumenes.usuario=@usuarioid)

	SET @caption = (SELECT caption FROM dbo.Resumenes 
	WHERE dbo.Resumenes.usuario=@usuarioid AND dbo.Resumenes.resumenid=@resumenid)

	SET @redsocialid = (SELECT redsocial FROM ValidacionRRSS INNER JOIN Users ON ValidacionRRSS.validacionid=Users.validaciontoken WHERE Users.userid=@usuarioid)

	-- SE GENERAN LOS TAGS PARA EL URL Y SE HACE LA PUBLICACION

	SET @tag1 = FLOOR(RAND()*100000)
	SET @tag2 = FLOOR(RAND()*100000)
	SET @tag3 = FLOOR(RAND()*100000)
	SET @tag4 = FLOOR(RAND()*100000)
	SET @tag5 = FLOOR(RAND()*100000)

	BEGIN TRAN
					
	SET @URLredsocial = (SELECT URL FROM RedesSociales WHERE redessocialesid=@redsocialid)
	SET @URL = @URLredsocial + 'Tag1=' + @tag1 + 'Tag2=' + @tag2 + 'Tag3=' + @tag3 + 'Tag4=' + @tag4 + 'Tag5=' + @tag5

	INSERT INTO Publicaciones (caption, URL, fecha, deleted, updatepost, redsocial, usuario, resumen)
	VALUES (@caption, @URL, GETDATE(), 0, 0, @redsocialid, @usuarioid, @resumenid)

	SET @postid = (SELECT MAX(publicacionid) FROM dbo.Publicaciones)

	INSERT INTO dbo.Tags (tag, tipotag, referenceid)
	VALUES
	(@tag1, 1, @postid),
	(@tag2, 1, @postid),
	(@tag3, 1, @postid),
	(@tag4, 1, @postid),
	(@tag5, 1, @postid)

	SET @pubilcacionid = (SELECT MAX(publicacionid) FROM dbo.Publicaciones)

	SET @checksum_aux = (CAST(@usuarioid as nvarchar(30)) + CAST(@pubilcacionid as nvarchar(30)) + CAST(GETDATE() AS nvarchar(30)) + '127.0.0.1')
	SET @checksum = HASHBYTES('SHA2_256', @checksum_aux)

	INSERT INTO dbo.Bitacoras (fecha, descripcion, userbitacora, ip, refid1, refid2, checksum, severidadbit, entitybit, appfuentebit, logtypebit)
	VALUES (GETDATE(), 'Posteo en red social', @usuarioid ,'127.0.0.1', @redsocialid, @pubilcacionid, @checksum, 4, 1, 6, 4)

	COMMIT

GO

CREATE PROCEDURE GenerarVariosPosts AS
	
	DECLARE @contador int
	DECLARE @limite int

	SET @contador=0
	SET @limite = FLOOR(RAND()*(12000-2000)+2000)

	WHILE @contador<@limite BEGIN

		EXEC HacerPosteo
		SET @contador = @contador+1
	END
GO

CREATE PROCEDURE GenerarVariosHabitosAplicados AS

	DECLARE @contador int
	DECLARE @limite int

	SET @contador=0
	SET @limite = FLOOR(RAND()*(4000-1000)+1000)

	WHILE @contador<@limite BEGIN

		EXEC AplicarHabito
		SET @contador = @contador+1
	END

GO





DBCC CHECKIDENT ('changeit.dbo.Publicaciones', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Tags', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Resumenes', RESEED, 0);

SELECT * FROM RedesSociales
SELECT * FROM Users
select * from ValidacionRRSS
select * from HabitosAplicados

--EXEC GenerarVariosHabitosAplicados
--EXEC GenerarVariosPosts



select * from Publicaciones
select * from Tags
select * from Resumenes


delete from Publicaciones
delete from Tags
delete from Resumenes
delete from RedesSociales
delete from EstadosPago
delete from TipoPago
delete from Merchants
delete from TiposBitacoras
delete from AppFuente
delete from Severidades
delete from EntityTypes
delete from Trantypes
delete from Entidad
delete from Habitos
delete from HabitosAplicados
delete from TipoHabitos
delete from TipoReaccion
delete from Users
delete from Aportes
delete from AportesPorUsuario
delete from ValidacionRRSS


DBCC CHECKIDENT ('changeit.dbo.ValidacionRRSS', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Publicaciones', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Tags', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Resumenes', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.RedesSociales', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.EstadosPago', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.TipoPago', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Merchants', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.TiposBitacoras', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.AppFuente', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Severidades', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.EntityTypes', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Trantypes', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Entidad', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.TipoHabitos', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.TipoReaccion', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Users', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Aportes', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.Habitos', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.HabitosAplicados', RESEED, 0);
DBCC CHECKIDENT ('changeit.dbo.AportesPorUsuario', RESEED, 0);


EXEC RegistrarUsuario 'Twitter'


EXEC AplicarHabito

select * from dbo.Fast_Food_Restaurants

select * from HabitosAplicados

select * from Publicaciones

select * from Resumenes

select * from Bitacoras

EXEC GenerarVariosHabitosAplicados
EXEC GenerarVariosPosts