require('dotenv').config();
const mysql = require('mysql2');

let pool;

const dbPool = () => {
  pool = mysql.createConnection({
    connectionLimit: 10,
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    multipleStatements: true
  });


  pool.connect((err, connection) => {
    if (err) {
      throw err;
    }

    console.log('MySQL connected');

  })
}

module.exports = {
  pool: pool ?? function () {
    if (!pool) {
      dbPool();
    }
    return pool;
  }
};