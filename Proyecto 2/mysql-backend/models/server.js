const express = require('express');
const cors = require('cors');
const morgan = require('morgan')

const bodyParser = require('body-parser');
const appRouter = require('../routes/routes');

// const connection = require('../db/config');
const { dbConnection: mongoCNN } = require('../db/mongo-config');
const { pool } = require('../db/config');

class Server {
    constructor() {
        this.port = process.env.PORT ?? 5000
        this.app = express();
        this.middlewares();
        this.routes();
        this.database();
    }

    middlewares() {
        this.app.use(cors());
        this.app.use(express.json());
        this.app.use(bodyParser.json())
        this.app.use(morgan('dev'))

    }

    async database () {
        await mongoCNN();
        await pool();
    }

    routes() {
        this.app.use('/mysql', appRouter);
        this.app.use('/mongo', require('../routes/mongo'));
    }

    listen(){
        this.app.listen(process.env.PORT, () => {
            console.log(`Server running on port ${process.env.PORT}`);
        });
    }
}

module.exports = Server;
