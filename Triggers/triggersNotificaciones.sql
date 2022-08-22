
-- use BD2;


-- * Trigger despues de crear notificaciones
CREATE TRIGGER CrearNotificacion_Historial
ON [practica1].[Notification]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear Notificacion ')

END
GO

-- * Trigger despues de eliminar notificaciones
CREATE TRIGGER EliminarNotificacion_Historial
ON [practica1].[Notification]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar Notificacion ')

END
GO



-- * Trigger despues de actualizar notificaciones
CREATE TRIGGER ModificarNotificacion_Historial
ON [practica1].[Notification]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Notificacion ')

END
GO

