CREATE PROCEDURE practica1.TR3
    @email NVARCHAR(MAX),
    @codCourse NVARCHAR(MAX)
-- add more stored procedure parameters here
AS

DECLARE @userId NVARCHAR(MAX)
DECLARE @date NVARCHAR(MAX)

-- 
SET @date = (SELECT GETDATE())

-- ? get UserID
SET @userId = (SELECT Usuarios.Id
FROM practica1.Usuarios
WHERE Email = @email)

DECLARE @nombreCurso NVARCHAR(MAX);

-- ? obtener nombre del curso
SET @nombreCurso = ( SELECT Course.Name FROM practica1.Course WHERE Course.CodCourse = @codCourse)
            

-- ? obtener cantidad de estudiantes asignados
DECLARE @numAsignados bit;

SET @numAsignados = (
    SELECT COUNT(*)
        FROM practica1.CourseAssignment
    WHERE CourseAssignment.CourseCodCourse = @codCourse
);

-- ? Obtener si el usuario esta activo (EmailConfirmed)
DECLARE @usuarioActivo VARCHAR(max);

SET @usuarioActivo = (
    SELECT EmailConfirmed FROM practica1.Usuarios WHERE Usuarios.Id = @userId
)
    

    -- ! creditos que tiene el estudiante
    DECLARE @numCreditos int;
    
    set @numCreditos = (
        SELECT top 1 ProfileStudent.Credits
            from practica1.ProfileStudent
            WHERE ProfileStudent.UserId = @userId
    )

    -- ! creditos que requiere el curso
    DECLARE @creditosRequeridos int;

    SET @creditosRequeridos = ( 
        SELECT Course.CreditsRequired FROM practica1.Course
        where Course.CodCourse = @codCourse
    );

    -- ? Validar si hay cupo y es usuario activo
    IF @numAsignados <= 10 AND @usuarioActivo = 1

        BEGIN

            -- ! Validar cantidad de creditos
            IF @numCreditos >= @creditosRequeridos

                BEGIN
                    -- ? Insertar en la tabla de asignaciones
                    INSERT INTO practica1.CourseAssignment
                        (StudentId, CourseCodCourse)
                    VALUES(@userId,@codCourse);


                    DECLARE @logNotification NVARCHAR(MAX);
                    DECLARE @notificacionUsuario NVARCHAR(MAX);

                    -- ? notificacion del USUARIO
                    set @notificacionUsuario = 
                        (
                            SELECT CONCAT('Su asignacion al curso ',@nombreCurso, ' se ha realizado exitosamente. ')
                        )

                    -- ? Generar notificacion al ESTUDIANTE que se acaba de asignar el curso
                    INSERT INTO practica1.Notification
                        (UserId, [Message], [Date])
                    VALUES(@userId, @notificacionUsuario, @date);


                    -- ? Enviar notificacion al TUTOR del curso al que se asigno el estudiante
                    DECLARE @idTutor VARCHAR(MAX);
                    DECLARE @notificacionTutor VARCHAR(MAX);

                    -- ? notificacion del TUTOR DEL CURSO
                    SET @notificacionTutor = 
                        (
                            SELECT CONCAT('El usuario con el id ', @userId, ' se ha asignado al curso ', @nombreCurso, ' del que eres tutor')
                        )

                    -- ? Obtener id del tutor
                    SET @idTutor = (
                        SELECT top 1 CourseTutor.TutorId 
                            FROM practica1.CourseTutor WHERE CourseTutor.CourseCodCourse = @codCourse
                    );

                    -- ? guardar notificacion del tutor
                    INSERT INTO practica1.Notification
                        (UserId, [Message], [Date])
                    VALUES(@idTutor, @notificacionTutor, @date);
                    END

            ELSE
                -- ! el estudiante no tiene suficientes creditos

                BEGIN
                    DECLARE @notificacionError NVARCHAR(max);

                    SET @notificacionError = (
                        
                        SELECT CONCAT('No tienes suficientes creditos para asignarte el curso ', @nombreCurso)
                        
                        )

                    INSERT INTO practica1.Notification
                        (UserId, [Message], [Date])
                    VALUES(@userId, @notificacionError, @date);

                END


            

        END
    ELSE
        
        BEGIN
            -- ? Mensaje para notificar al usuario que no se pudo asignar el curso 
            DECLARE @notificacionError2 VARCHAR(MAX);

            SET @notificacionError2 = (
                SELECT CONCAT('No se pudo asignar el curso ', @nombreCurso, ' porque llegó al número de estudiantes maximos asignados.')
            );
            

            -- ? enviar notificaion de error al usuario
            INSERT INTO practica1.Notification
                (UserId, [Message], [Date])
            VALUES(@userId, @notificacionError2, @date);


        END

GO




-- * ============================================================================

-- drop -- Drop the stored procedure called 'TR3' in schema 'SchemaName'
-- IF EXISTS (
-- SELECT *
--     FROM INFORMATION_SCHEMA.ROUTINES
-- WHERE SPECIFIC_SCHEMA = N'practica1'
--     AND SPECIFIC_NAME = N'TR3'
-- )

DROP PROCEDURE practica1.TR3
-- GO

-- example to execute the stored procedure we just created
-- EXECUTE practica1.TR3 1 /*value_for_param1*/, 2 /*value_for_param2*/
-- GO