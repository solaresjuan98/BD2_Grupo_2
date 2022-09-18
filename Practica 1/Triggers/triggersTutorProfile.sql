


-- * Trigger despues de crear TutorProfile
CREATE TRIGGER CrearTutorProfile_Historial
ON [practica1].[TutorProfile]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear TutorProfile ')

END
GO

-- * Trigger despues de eliminar TutorProfile
CREATE TRIGGER EliminarTutorProfile_Historial
ON [practica1].[TutorProfile]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar TutorProfile ')

END
GO



-- * Trigger despues de actualizar TutorProfile
CREATE TRIGGER ModificarTutorProfile_Historial
ON [practica1].[TutorProfile]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar TutorProfile ')

END
GO
