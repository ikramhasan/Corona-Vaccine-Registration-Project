const mysql = require("mysql");

// const pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "localhost",
//   port: 3306,
//   user: "root",
//   password: "",
//   database: "covid vaccination",
// });

const pool = mysql.createPool({
  connectionLimit: 10,
  host: "sql6.freemysqlhosting.net",
  user: "sql6409757",
  password: "3eVEN6Axak",
  database: "sql6409757",
});

module.exports = pool;
