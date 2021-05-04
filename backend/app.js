const express = require("express");
var cors = require('cors')
const mysql = require("mysql");

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Listen on port
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});

// Connect to Database
// const pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "localhost",
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

// Connect to server
app.get("/", (req, res) => {
    res.send('Server running...');
});

// Get all users
app.get("/users", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query("SELECT * from user", (error, rows) => {
      connection.release();

      if (!error) {
        res.send(rows);
      } else {
        console.log(error);
      }
    });
  });
});

// Get an user by id
app.get("/users/:id", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "SELECT * from user WHERE user_id = ?",
      [req.params.id],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({ status: 200, result: rows });
        } else {
          console.log(error);
        }
      }
    );
  });
});

// Get an user by email and password
app.get("/user", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const email = req.query.email;
    const password = req.query.password;

    connection.query(
      "SELECT * from user WHERE email = ? AND password = ?",
      [email, password],
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

// Delete an user
app.delete("/users/:id", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "DELETE from user WHERE user_id = ?",
      [req.params.id],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: 200,
            message: "User has been removed succesfully",
          });
        } else {
          console.log(error);
        }
      }
    );
  });
});

// Create a new user
app.post("/users", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const params = req.body;

    connection.query("INSERT INTO user SET ?", params, (error, rows) => {
      connection.release();

      if (!error) {
        res.status(200).send({
          status: 200,
          message: "User has been added succesfully",
        });
      } else {
        console.log(error);
      }
    });
  });
});

// Update an existing user
app.put("/users", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const {
      user_id,
      name,
      email,
      password,
      phone_no,
      nid,
      age,
      location,
      occupation,
    } = req.body;

    connection.query(
      "UPDATE user SET name = ?, email = ?, password = ?, phone_no = ?, nid = ?, age = ?, location = ?, occupation = ? WHERE user_id = ?",
      [
        name,
        email,
        password,
        phone_no,
        nid,
        age,
        location,
        occupation,
        user_id,
      ],

      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: 200,
            message: "User has been updated succesfully",
          });
        } else {
          console.log(error);
        }
      }
    );
  });
});

// Create a new user
app.post("/admins", (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const params = req.body;

    connection.query("INSERT INTO admin SET ?", params, (error, rows) => {
      connection.release();

      if (!error) {
        res.status(200).send({
          status: 200,
          message: "admin has been added succesfully",
        });
      } else {
        console.log(error);
      }
    });
  });
});