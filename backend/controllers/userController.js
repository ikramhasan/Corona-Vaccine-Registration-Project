const mysql = require("mysql");
const pool = require("./../databaseConnection");

exports.getUserByEmailAndPass = (req, res) => {
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
};

exports.getAllUsers = (req, res) => {
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
};

exports.getUserById = (req, res) => {
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
};

exports.deleteUser = (req, res) => {
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
};

exports.createUser = (req, res) => {
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
};

exports.updateUser = (req, res) => {
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
};
