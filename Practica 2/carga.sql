
create database BD2_Practica2;
use BD2_Practica2;

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


show tables;

select * from HABITACION;

LOAD DATA LOCAL INFILE  'C:\\Users\\jsola\\Downloads\\Habitaciones.csv'
INTO TABLE HABITACION
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;