
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

const countQuery = (query, collection) => {

    return new Promise(async (resolve, reject) => {

        try {

            const dataset = db.collection('Pacientes');
            const result = dataset.countDocuments(query, function (err, count) {

                if (err) {
                    console.log(err)
                }
                else {
                    resolve(count)
                }
            });

        } catch (error) {
            console.log(error);
            reject(error);
        }
    })
}


const mongo1a = () => {

    let query = { edad: { $gte: 18 } };
    return countQuery(query, 'Pacientes')
}

const mongo1b = () => {

    let query = { 
        $and: [
            { 
                edad: { $gte: 18 }, 
                edad: { $lt: 60 } 
            }
        ]
    };

    return countQuery(query, 'Pacientes')
}

const mongo1c = () => {

    let query = { edad: { $gte: 60 }};
    return countQuery(query, 'Pacientes')
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
    mongo1a,
    mongo1b,
    mongo1c,
    mongo2,
    mongo3,
    mongo4,
    mongo5,
    mongo6,
    mongo7,
    mongo8
}