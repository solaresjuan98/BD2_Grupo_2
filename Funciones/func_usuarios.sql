CREATE FUNCTION practica1.func_tutor_course (@id int)
RETURNS TABLE
AS
RETURN (SELECT u.Firstname, u.Lastname, u.Email, u.DateOfBirth, ps.Credits, r.RoleName 
FROM practica1.Usuarios u
JOIN practica1.ProfileStudent ps ON ps.UserId = u.Id
JOIN practica1.UsuarioRole ur ON ur.UserId = u.Id
JOIN practica1.Roles r ON r.Id = ur.RoleId
);





