CREATE FUNCTION practica1.func_course_usuario (@code int)
RETURNS TABLE
AS
RETURN
(
	SELECT u.Id, u.Firstname, u.Lastname FROM practica1.Usuarios u
	JOIN practica1.CourseAssignment ca ON ca.StudentId = u.id
	JOIN practica1.Course c on ca.CourseCodCourse = c.CodCourse
	WHERE c.CodCourse = @code
);
