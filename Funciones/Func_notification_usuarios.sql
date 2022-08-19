CREATE FUNCTION practica1.func_tutor_course (@id int)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM practica1.Notification n
	WHERE n.UserId = @id
);
