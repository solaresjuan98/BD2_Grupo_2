

use BD2

go

-- * Trigger despues de crear curso
CREATE TRIGGER Guardar_Historial
ON [practica1].[Course]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear Curso')

END
GO

-- * Trigger despues de eliminar curso
CREATE TRIGGER EliminarCurso_Historial
ON [practica1].Course
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar Curso')

END
GO


-- * Trigger despues de actualizar curso
CREATE TRIGGER ModificarCurso_Historial
ON [practica1].Course
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Curso')

END
GO


