CREATE FUNCTION practica1.func_notification_usuarios (@id int)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM practica1.Notification n
	WHERE n.UserId = @id
);
