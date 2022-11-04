const { pool } = require('./config');



const query1a = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT COUNT(*) total_pacientes
        FROM PACIENTE
        WHERE edad < 18; `
        console.log(pool);
        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}

const query1b = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT COUNT(*) total_pacientes
        FROM PACIENTE
        WHERE edad >= 18 and edad < 60; `

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}

const query1c = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT COUNT(*) as total_pacientes
        FROM PACIENTE
        WHERE edad >= 60;`

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}


const query2 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT
        distinct
        habitacion,
        count(*) num_veces
    from LOG_ACTIVIDAD
        JOIN HABITACION h
        on LOG_ACTIVIDAD.HABITACION_idHabitacion = h.idHabitacion
    GROUP BY
        HABITACION_idHabitacion
        ORDER BY num_veces`

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}


const query3 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT distinct genero, count(*) as num
        FROM LOG_ACTIVIDAD
            JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
            GROUP BY genero;`

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}


const query4 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT distinct edad, count(*) as num
        FROM LOG_ACTIVIDAD
            JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
            GROUP BY edad
            ORDER BY num DESC LIMIT 5;`

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}

const query5 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT edad, count(*) as num
        FROM LOG_ACTIVIDAD
            JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
            GROUP BY edad
            ORDER BY num ASC LIMIT 5`

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}



const query6 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT HABITACION_idHabitacion, count(*) as num
        FROM LOG_ACTIVIDAD
            JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
            GROUP BY HABITACION_idHabitacion
            ORDER BY num DESC LIMIT 5;
        `

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}


const query7 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT HABITACION_idHabitacion, count(*) as num
        FROM LOG_ACTIVIDAD
            JOIN PACIENTE p on LOG_ACTIVIDAD.PACIENTE_idPaciente = p.idPaciente
            GROUP BY HABITACION_idHabitacion
            ORDER BY num ASC LIMIT 5
        `

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}


const query8 = () => {

    return new Promise((resolve, reject) => {

        let query = `SELECT timestampx as fecha, count(*) n_pacientes 
        from LOG_ACTIVIDAD
            GROUP BY timestampx
            ORDER BY n_pacientes DESC LIMIT 1;
        `

        pool.query(query, (err, res) => {
            if (err) reject(err);

            return resolve(res);
        })

    })

}







const queries = {
    query1a,
    query1b,
    query1c,
    query2,
    query3,
    query4,
    query5,
    query6,
    query7,
    query8
}

module.exports = {
    queries

}