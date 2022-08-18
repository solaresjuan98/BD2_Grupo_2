create PROCEDURE CambioRol(
	@param_email nvarchar(max),
	@param_code int
)
AS    
BEGIN
	DECLARE @userId nvarchar(max), @EmailConfirmed bit, @CodCourse int

	SELECT 
		@userId = u.Id, 
		@EmailConfirmed = u.EmailConfirmed 
	FROM practica1.Usuarios u 
	WHERE u.Email = @param_email;

	SELECT @CodCourse = c.CodCourse 
	FROM practica1.Course c 
	WHERE c.CodCourse = @param_code;


	-- Verificar usuario activo
	IF @EmailConfirmed IS NULL OR @EmailConfirmed = 0 
		BEGIN 
			PRINT 'El usuario no está activo';
			RETURN;
		END
	PRINT 'Usuario Activo';

	-- Agregar a UsuarioRole
	INSERT INTO practica1.UsuarioRole (RoleId, UserId, isLatestVersion) VALUES (
		(
			SELECT r.Id FROM practica1.Roles r WHERE r.RoleName = 'Tutor' 
			ORDER BY r.Id
			OFFSET 0 ROWS 
			FETCH FIRST 1 ROW ONLY
		),
		@userId,
		1
	);
	
	-- Crear perfil de tutor
	INSERT INTO practica1.TutorProfile (UserId, TutorCode) VALUES(@userId, @userId);

	-- Agregar a CourseTutor
	INSERT INTO practica1.CourseTutor (TutorId, CourseCodCourse) VALUES (@userId, @CodCourse);

	-- Enviar notificacion
	INSERT INTO practica1.Notification (UserId, Message, Date) VALUES(@userId, 'Se ha promovido su rol como tutor académico', GETDATE());

END 

-- EXEC CambioRol 'correo@correo.com', 1010;