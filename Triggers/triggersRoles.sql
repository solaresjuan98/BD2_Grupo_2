


-- use bd2;


-- * Trigger despues de crear rol
-- CREATE TRIGGER GuardarRol_Historial
-- ON [practica1].[Roles]
-- AFTER INSERT 
-- AS
-- BEGIN

--     insert into practica1.HistoryLog
--         ([Date], [Description])
--     (select GETDATE(), 'Crear Rol')

-- END
-- GO

-- * Trigger despues de eliminar rol
-- CREATE TRIGGER EliminarRol_Historial
-- ON [practica1].[Roles]
-- AFTER DELETE 
-- AS
-- BEGIN

--     insert into practica1.HistoryLog
--         ([Date], [Description])
--     (select GETDATE(), 'Eliminar Rol')

-- END
-- GO


-- * Trigger despues de actualizar rol
-- CREATE TRIGGER ModificarRol_Historial
-- ON [practica1].[Roles]
-- AFTER UPDATE 
-- AS
-- BEGIN

--     insert into practica1.HistoryLog
--         ([Date], [Description])
--     (select GETDATE(), 'Modificar Rol')

-- END
-- GO


-- * Trigger despues de actualizar rol del usuario

CREATE TRIGGER ModificarRolUsuario_Historial
ON [practica1].[UsuarioRole]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Rol de Usuario')

END
GO