-- Active: 1665848805213@@143.244.167.203@3306@BD2_Practica2

USE BD2_Practica2;

SHOW TABLES;

# 1. . Total de pacientes que llegan a la clínica por edad catalogados por las siguientes categorías
# a. Pediátrico: menores de 18 años
SELECT COUNT(*) total_pacientes
FROM PACIENTE
WHERE edad < 18;

# b. Mediana edad: entre 18 y 60 años
SELECT COUNT(*) total_pacientes
FROM PACIENTE
WHERE edad >= 18 and edad < 60;

# c. Geriatrico: mayores de 60 años
SELECT COUNT(*) as total_pacientes
FROM PACIENTE
WHERE edad >= 60;

# 2. Cantidad de pacientes que pasan por cada habitacion
SELECT
    HABITACION_idHabitacion,
    count(*)
from LOG_ACTIVIDAD
GROUP BY
    HABITACION_idHabitacion;

# 3. Cantidad de pacientes que llegan a la clínica, agrupados por género
SELECT genero, count(*) as num
FROM LOG_ACTIVIDAD
    JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
    GROUP BY genero;

# 4. Top 5 edades más atendidas en la clínica
SELECT edad, count(*) as num
FROM LOG_ACTIVIDAD
    JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
    GROUP BY edad
    ORDER BY num DESC LIMIT 5;

# 5. Top 5 edades menos atendidas en la clinica
SELECT edad, count(*) as num
FROM LOG_ACTIVIDAD
    JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
    GROUP BY edad
    ORDER BY num ASC LIMIT 5;

# 6. Top 5 habitaciones más utilizadas
SELECT HABITACION_idHabitacion, count(*) as num
FROM LOG_ACTIVIDAD
    JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
    GROUP BY HABITACION_idHabitacion
    ORDER BY num DESC LIMIT 5;


# 7. Top 5 habitaciones menos utilizadas
SELECT HABITACION_idHabitacion, count(*) as num
FROM LOG_ACTIVIDAD
    JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
    GROUP BY HABITACION_idHabitacion
    ORDER BY num ASC LIMIT 5;

# 8. Día con más pacientes en la clínica
SELECT timestampx as fecha, count(*) n_pacientes 
from LOG_ACTIVIDAD
    GROUP BY timestampx
    ORDER BY n_pacientes DESC LIMIT 1;