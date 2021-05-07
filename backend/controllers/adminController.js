const mysql = require("mysql");
const pool = require("./../databaseConnection");

exports.createAdmin = (req, res) => {
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
};

exports.getAdminByEmailAndPass = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const email = req.query.email;
    const password = req.query.password;

    connection.query(
      "SELECT * from admin WHERE email = ? AND password = ?",
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
