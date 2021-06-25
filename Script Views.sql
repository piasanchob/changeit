-- VIEWS DE LA BASE DE DATOS

use changeit

CREATE VIEW VerTipoHabitosNombres
AS SELECT nombre FROM dbo.TipoHabitos;


CREATE VIEW VerTipoReaccion
AS SELECT nombre FROM dbo.Tiporeaccion;


CREATE VIEW VerRedesSociales 
AS SELECT * FROM RedesSociales;
