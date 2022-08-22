-- use BD2;

-- * Trigger despues de crear TFA
CREATE TRIGGER CrearTFA_Historial
ON [practica1].[TFA]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear TFA ')

END
GO

-- * Trigger despues de eliminar TFA
CREATE TRIGGER EliminarTFA_Historial
ON [practica1].[TFA]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar TFA ')

END
GO



-- * Trigger despues de actualizar TFA
CREATE TRIGGER ModificarTFA_Historial
ON [practica1].[TFA]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar TFA ')

END
GO
