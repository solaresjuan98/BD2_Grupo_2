CREATE FUNCTION practica1.func_tutor_course (@idTutor int)
RETURNS TABLE
AS
RETURN
(
	SELECT c.CodCourse, c.Name FROM practica1.Course c
	JOIN practica1.CourseTutor ct ON ct.Id = c.CodCourse
	JOIN practica1.Usuarios u ON u.Id = ct.TutorId
	JOIN practica1.TutorProfile tp ON tp.UserId = u.Id
	WHERE tp.TutorCode = @idTutor
);
