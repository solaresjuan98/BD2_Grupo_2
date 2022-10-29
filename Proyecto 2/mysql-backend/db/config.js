require('dotenv').config();
var mysql = require('mysql2');

var pool  = mysql.createConnection({
  connectionLimit: 10,
  host            : process.env.MYSQL_HOST,
  user            : process.env.MYSQL_USER,
  password        : process.env.MYSQL_PASSWORD,
  database        : process.env.MYSQL_DATABASE,
  multipleStatements: true
});


pool.connect((err, connection) => {
  
  if(err)
    throw err;

  console.log('Database connected successfully');
  
  //connection.relase()

})

// pool.ge((err,connection)=> {
//   if(err)
//   throw err;
//   console.log('Database connected successfully');
//   connection.release();
// });

module.exports = pool;