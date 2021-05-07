const express = require("express");
var cors = require("cors");
const mysql = require("mysql");

const userRouter = require('./routes/userRoutes');
const adminRouter = require('./routes/adminRoutes');

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Listen on port
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});

// const pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "sql6.freemysqlhosting.net",
//   user: "sql6409757",
//   password: "3eVEN6Axak",
//   database: "sql6409757",
// });
const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "covid vaccination",
});

// Connect to server
app.get("/", (req, res) => {
  res.send("Server running...");
});

app.use("/api/v1/admins", adminRouter);
app.use("/api/v1/users", userRouter);

// ----- Merazul Islam Dihan -------

// "SELECT * FROM application Where location=$location"

// Get all data from submit table.
// app.get("/submits", (req, res) => {
//   pool.getConnection((error, connection) => {
//     if (error) throw error;
//     console.log(`Connect to database as ${connection.threadId}`);

//     connection.query("SELECT * from submit", (error, rows) => {
//       connection.release();

//       if (!error) {
//         res.send(rows);
//       } else {
//         console.log(error);
//       }

//     });
//   });
// });

// Get an application and user by id
app.get("/submit", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const user_id = req.query.user_id;
    const application_id = req.query.application_id;

    connection.query(
      "SELECT * from submit WHERE user_id = ? AND application_id = ?",
      [user_id, application_id],
      (error, row) => {
        connection.release();

        if (!error) {
          res.status(200).send(row);
        } else {
          console.log(error);
        }
      }
    );
  });
});

// Get all user and assosiated application by username
app.get("/submits", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const userName = req.query.userName;

    connection.query(
      "SELECT * from user u inner join application a on u.user_id=a.application_id Where u.name= ?",
      [userName],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.send(rows);
        } else {
          console.log(error);
        }
      }
    );
  });
});

// Get all user and assosiated application
app.get("/submitsz", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "SELECT * from user u inner join application a on u.user_id = a.application_id",
      (error, rows) => {
        connection.release();

        if (!error) {
          res.send(rows);
        } else {
          console.log(error);
        }
      }
    );
  });
});
