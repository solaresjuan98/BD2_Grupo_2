SELECT * FROM bd2_proyecto1.habitacion LIMIT 20;
SELECT * FROM bd2_proyecto1.log_actividad LIMIT 20;
SELECT * FROM bd2_proyecto1.log_habitacion LIMIT 20;
SELECT * FROM bd2_proyecto1.paciente LIMIT 20;

SELECT * FROM bd2_proyecto1.habitacion ORDER BY idHabitacion DESC LIMIT 20;
SELECT * FROM bd2_proyecto1.log_actividad ORDER BY id_log_actividad DESC LIMIT 20;
SELECT * FROM bd2_proyecto1.log_habitacion ORDER BY idHabitacion, timestampx, statusx DESC LIMIT 20;
SELECT * FROM bd2_proyecto1.paciente ORDER BY idPaciente DESC LIMIT 20;

SELECT * FROM
	(SELECT COUNT(*) conteoHabitaciones FROM bd2_proyecto1.habitacion) AS conteoHabitaciones,
	(SELECT COUNT(*) conteoLogActividad FROM bd2_proyecto1.log_actividad) AS conteoLogActividad,
	(SELECT COUNT(*) conteoLogHabitacion FROM bd2_proyecto1.log_habitacion) AS conteoLogHabitacion,
	(SELECT COUNT(*) conteoPaciente FROM bd2_proyecto1.paciente) AS conteoPaciente;