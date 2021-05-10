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
  user: "sql6411586",
  password: "NkXhrEVirY",
  database: "sql6411586",
  multipleStatements: true,
});

// const pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "https://www.dbfree.net/",
//   user: "ikramhasan",
//   password: "MYSQLPass",
//   database: "covidvaccination",
//   multipleStatements: true,
// });

module.exports = pool;
