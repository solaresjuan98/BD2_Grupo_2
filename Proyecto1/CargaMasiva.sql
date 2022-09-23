LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Habitaciones.csv' 
INTO TABLE bd2_proyecto1.habitacion
CHARACTER SET latin1
FIELDS TERMINATED BY  ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Pacientes.csv' 
INTO TABLE bd2_proyecto1.paciente
CHARACTER SET latin1
FIELDS TERMINATED BY  ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE TEMP_LOG_ACTIVIDAD
(
    timestampx VARCHAR(100),
    actividad VARCHAR(500),
    HABITACION_idHabitacion INT NOT NULL,
    PACIENTE_idPaciente INT NOT NULL,
    Edad INT, 
    Genero VARCHAR(100),
    Habitacion VARCHAR(400)
);
-- DROP TABLE TEMP_LOG_ACTIVIDAD;


LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Logactividades1.csv' 
INTO TABLE bd2_proyecto1.TEMP_LOG_ACTIVIDAD
CHARACTER SET latin1
FIELDS TERMINATED BY  ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO bd2_proyecto1.log_actividad ( timestampx, actividad, HABITACION_idHabitacion, PACIENTE_idPaciente)
SELECT tla.timestampx, tla.actividad, tla.HABITACION_idHabitacion, tla.PACIENTE_idPaciente 
FROM bd2_proyecto1.TEMP_LOG_ACTIVIDAD tla;

CREATE TABLE TEMP_LOG_ACTIVIDAD
(
    timestampx VARCHAR(100),
    actividad VARCHAR(500),
    HABITACION_idHabitacion INT NOT NULL,
    PACIENTE_idPaciente INT NOT NULL
);

-- DROP TABLE bd2_proyecto1.TEMP_LOG_ACTIVIDAD

-- Log actividad 2
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/LogActividades2.csv' 
INTO TABLE bd2_proyecto1.TEMP_LOG_ACTIVIDAD
CHARACTER SET latin1
FIELDS TERMINATED BY  ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO bd2_proyecto1.log_actividad ( timestampx, actividad, HABITACION_idHabitacion, PACIENTE_idPaciente)
SELECT tla.timestampx, tla.actividad, tla.HABITACION_idHabitacion, tla.PACIENTE_idPaciente 
FROM bd2_proyecto1.TEMP_LOG_ACTIVIDAD tla;

CREATE TABLE TEMP_LOG_HABITACION
(
    idHabitacion INT NOT NULL,
    timestampx VARCHAR(100),
    statusx VARCHAR(500),
    Habitacion VARCHAR(300)
);
-- DROP TABLE TEMP_LOG_HABITACION;


LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/LogHabitaciones.csv' 
INTO TABLE bd2_proyecto1.TEMP_LOG_HABITACION
CHARACTER SET latin1
FIELDS TERMINATED BY  ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO bd2_proyecto1.log_habitacion ( timestampx, statusx, idHabitacion)
SELECT tlh.timestampx, tlh.statusx, tlh.idHabitacion
FROM bd2_proyecto1.TEMP_LOG_HABITACION tlh;