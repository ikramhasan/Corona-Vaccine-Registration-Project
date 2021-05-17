const mysql = require("mysql");

// const pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "localhost",
//   port: 3306,
//   user: "root",
//   password: "",
//   database: "covid vaccination",
//   multipleStatements: true,
// });

const pool = mysql.createPool({
  connectionLimit: 10,
  host: "sql6.freemysqlhosting.net",
  user: "sql6413031",
  password: "EDjfV3Rl9g",
  database: "sql6413031",
  multipleStatements: true,
});

module.exports = pool;
