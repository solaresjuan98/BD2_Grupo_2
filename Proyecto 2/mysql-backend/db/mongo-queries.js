
const { default: mongoose } = require('mongoose');

const db = mongoose.connection.useDb('practica2');

const performAggregation = (aggregation, collection) => {
    return new Promise(async (resolve, reject) => {
        try {
            const coll = db.collection(collection)
            const result = coll.aggregate(aggregation).toArray();

            resolve(result)
        } catch (err) {
            console.error(err)
            reject(err)
        }
    })
}

const mongo1a = () => {

    return new Promise((resolve, reject) => {

        let query = [
            {
                $group: {
                    _id: '$idHabitacion',
                    idHabitacion: {
                        $first: '$idHabitacion'
                    },
                    Habitacion: {
                        $first: '$Habitacion'
                    },
                    count: {
                        $sum: 1
                    }
                }
            },
            {
                $sort: {
                    _id: 1
                }
            }
        ]
        const result = mongoose.connection.db.LogActividades.aggregate(query);
        resolve(result);

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


const mongo2 = () => {
    let query = [
        {
            $group: {
                _id: '$idHabitacion',
                idHabitacion: {
                    $first: '$idHabitacion'
                },
                Habitacion: {
                    $first: '$Habitacion'
                },
                count: {
                    $sum: 1
                }
            }
        },
        {
            $sort: {
                _id: 1
            }
        }
    ]
    return performAggregation(query, 'LogActividades')
}


const mongo3 = () => {

    let query = [
        {
            $project: {
                Genero: 1
            }
        },
        {
            $sortByCount: '$Genero'
        }
    ]
    return performAggregation(query, 'LogActividades')

}


const mongo4 = () => {

    let query = [
        {
            $group: {
                _id: '$Edad',
                count: {
                    $sum: 1
                }
            }
        },
        {
            $sort: {
                count: -1
            }
        },
        {
            $limit: 5
        }
    ]
    return performAggregation(query, 'LogActividades')

}

const mongo5 = () => {

    let query = [
        {
            $group: {
                _id: '$Edad',
                count: {
                    $sum: 1
                }
            }
        },
        {
            $sort: {
                count: 1
            }
        },
        {
            $limit: 5
        }
    ]
    return performAggregation(query, 'LogActividades')
}


const mongo6 = () => {

    let query = [
        {
            $group: {
                _id: '$idHabitacion',
                Habitacion: {
                    $first: '$Habitacion'
                },
                count: {
                    $sum: 1
                }
            }
        },
        {
            $sort:
            {
                count: -1
            }
        },
        {
            $limit: 5
        }
    ]
    return performAggregation(query, 'LogActividades')
}


const mongo7 = () => {

    let query = [
        {
            $group: {
                _id: '$idHabitacion',
                Habitacion: {
                    $first: '$Habitacion'
                },
                count: {
                    $sum: 1
                }
            }
        },
        {
            $sort:
            {
                count: 1
            }
        },
        {
            $limit: 5
        }
    ]
    return performAggregation(query, 'LogActividades')
}


const mongo8 = () => {

    let query = [
        {
            $sortByCount: '$timestampx'
        },
        {
            $limit: 1
        }
    ]
    return performAggregation(query, 'LogActividades')
}

module.exports = {
    mongo2,
    mongo3,
    mongo4,
    mongo5,
    mongo6,
    mongo7,
    mongo8
}