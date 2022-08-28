USE BD2
GO
SELECT * FROM practica1.UsuarioRole;

GO

-- * Trigger despues de crear usuario
CREATE TRIGGER CrearUsuarioRol_Historial
ON [practica1].[UsuarioRole]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear registro UsuarioRole')

END
GO

-- * Trigger despues de eliminar usuario
CREATE TRIGGER EliminarUsuarioRol_Historial
ON [practica1].[UsuarioRole]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar registro UsuarioRole')

END
GO



-- * Trigger despues de actualizar usuario
CREATE TRIGGER ModificarUsuarioRol_Historial
ON [practica1].[UsuarioRole]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar registro UsuarioRole')

END
GO

