
-- use BD2;


-- * Trigger despues de crear perfil de estudiante
CREATE TRIGGER CrearPerfilUsuario_Historial
ON [practica1].[ProfileStudent]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear Perfil de Estudiante')

END
GO

-- * Trigger despues de eliminar perfil de estudiante
CREATE TRIGGER EliminarPerfilUsuario_Historial
ON [practica1].[ProfileStudent]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar Perfil de Estudiante')

END
GO



-- * Trigger despues de actualizar perfil de estudiante
CREATE TRIGGER ModificarPerfilUsuario_Historial
ON [practica1].[ProfileStudent]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Perfil de Estudiante')

END
GO

