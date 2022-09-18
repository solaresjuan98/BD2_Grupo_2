

-- USE BD2;
-- * Trigger despues de crear usuario
CREATE TRIGGER CrearUsuario_Historial
ON [practica1].[Usuarios]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear Usuario')

END
GO

-- * Trigger despues de eliminar usuario
CREATE TRIGGER EliminarUsuario_Historial
ON [practica1].[Usuarios]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar Usuario')

END
GO



-- * Trigger despues de actualizar usuario
CREATE TRIGGER ModificarUsuario_Historial
ON [practica1].[Usuarios]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Usuario')

END
GO

