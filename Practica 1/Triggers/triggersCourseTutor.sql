

-- * Trigger despues de crear CourseTutor
CREATE TRIGGER CrearCourseTutor_Historial
ON [practica1].[CourseTutor]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear Tutor de curso ')

END
GO

-- * Trigger despues de eliminar CourseTutor
CREATE TRIGGER EliminarCourseTutor_Historial
ON [practica1].[CourseTutor]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar Tutor de curso ')

END
GO



-- * Trigger despues de actualizar CourseTutor
CREATE TRIGGER ModificarCourseTutor_Historial
ON [practica1].[CourseTutor]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar Tutor de curso ')

END
GO
