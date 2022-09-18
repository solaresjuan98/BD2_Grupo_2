

-- use BD2;

-- * Trigger despues de crear CourseAssignment
CREATE TRIGGER CrearCourseAssignment_Historial
ON [practica1].[CourseAssignment]
AFTER INSERT 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Crear asignación de curso ')

END
GO

-- * Trigger despues de eliminar CourseAssignment
CREATE TRIGGER EliminarCourseAssignment_Historial
ON [practica1].[CourseAssignment]
AFTER DELETE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Eliminar asignación de curso ')

END
GO



-- * Trigger despues de actualizar CourseAssignment
CREATE TRIGGER ModificarCourseAssignment_Historial
ON [practica1].[CourseAssignment]
AFTER UPDATE 
AS
BEGIN

    insert into practica1.HistoryLog
        ([Date], [Description])
    (select GETDATE(), 'Modificar asignación de curso ')

END
GO
