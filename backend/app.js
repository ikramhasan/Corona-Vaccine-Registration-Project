const express = require("express");
var cors = require("cors");
const mysql = require("mysql");

const app = express();
const port = process.env.PORT || 5000;
const userRouter = express.Router();

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

const getAllUsers = (req, res) => {
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

const getUserById = (req, res) => {
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

const getUserByEmailAndPass = (req, res) => {
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

const deleteUser = (req, res) => {
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

const createUser = (req, res) => {
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

const updateUser = (req, res) => {
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

const createAdmin = (req, res) => {
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

const getAdminByEmailAndPass = (req, res) => {
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

app.patch('/users/:id', (req, res) => {

});

app.use('/api/v1/users', userRouter);

userRouter
  .route('/')
  .get(getAllUsers)
  .post(createUser)
  .put(updateUser)
  .delete(deleteUser);

  userRouter.route("/:id").get(getUserById);

// Get an user by email and password
app.get("/user", getUserByEmailAndPass);

// Delete an user
// app.delete("/users/:id", deleteUser);

// Create a new user
// app.post("/users", createUser);

// Update an existing user
// app.put("/users", updateUser);

// Create a new admin
app.post("/admins", createAdmin);

// Get an admin by email and password
app.get("/admin", getAdminByEmailAndPass);

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
