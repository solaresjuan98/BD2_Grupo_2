
const Server = require('./models/server')

require('dotenv').config()

var server = new Server();



server.listen();