const mysql = require("mysql");
const pool = require("./../databaseConnection");

exports.getAllApplications = (req, res) => {
    pool.getConnection((error, connection) => {
      if (error) throw error;
      console.log(`Connect to database as ${connection.threadId}`);
  
      connection.query(
        "SELECT * from user u inner join application a on u.user_id = a.user_id; SELECT * FROM dose",
        (error, rows) => {
          connection.release();
  
          if (!error) {
            var applications = rows[0];
            var doses = rows[1];

            var data = [];

            applications.forEach(application => {
                var dose_list = [];
                data.push({
                    application,
                    dose_list,
                });
                doses.forEach(dose => {
                    if(application.user_id == dose.user_id) {
                        console.log(dose);
                        dose_list.push(dose);
                    };
                });
            });

            res.status(200).send({
              status: "success",
              data,
            });
          } else {
            res.status(200).send({
              status: "fail",
              message: "Could not get applications with doses",
            });
          }
        }
      );
    });
  };