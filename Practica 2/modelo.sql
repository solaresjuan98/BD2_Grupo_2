-- Active: 1665848805213@@143.244.167.203@3306@BD2_Practica2

use BD2_Practica2;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

CREATE TABLE PACIENTE
(	
	idPaciente INT auto_increment PRIMARY KEY,
    edad INT,
    genero VARCHAR(20)
);

CREATE TABLE HABITACION
(
	idHabitacion INT auto_increment PRIMARY KEY,
    habitacion VARCHAR(50)
);


CREATE TABLE LOG_HABITACION
(
	timestampx VARCHAR(100),
    statusx VARCHAR(45),
    idHabitacion INT NOT NULL,
    FOREIGN KEY (idHabitacion) REFERENCES HABITACION(idHabitacion)
);


CREATE TABLE LOG_ACTIVIDAD
(
	id_log_actividad INT auto_increment PRIMARY KEY,
    timestampx VARCHAR(100),
    actividad VARCHAR(500),
    HABITACION_idHabitacion INT NOT NULL,
    PACIENTE_idPaciente INT NOT NULL,
    FOREIGN KEY (HABITACION_idHabitacion) REFERENCES HABITACION(idHabitacion),
    FOREIGN KEY (PACIENTE_idPaciente) REFERENCES PACIENTE(idPaciente)
);




SELECT * from `HABITACION`;
SELECT * FROM `PACIENTE`;
SELECT * FROM `LOG_ACTIVIDAD`;
SELECT * FROM `LOG_HABITACION`; 