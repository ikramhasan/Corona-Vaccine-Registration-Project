const express = require("express");
var cors = require("cors");

const userRouter = require("./routes/userRoutes");
const adminRouter = require("./routes/adminRoutes");
const applicationRouter = require("./routes/applicationRoutes");
const pool = require("./databaseConnection");

const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use("/api/v1/admins", adminRouter);
app.use("/api/v1/users", userRouter);
app.use("/api/v1/applications", applicationRouter);

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

module.exports = app;
