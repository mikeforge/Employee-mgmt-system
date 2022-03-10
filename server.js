const mysql = require('mysql2');
require('dotenv').config();
const consoleTable = require('console.table');
// const connection = require('mysql2/typings/mysql/lib/Connection');
const fs = require('fs');

// const seedQuery = fs.readFileSync('./db/seeds.sql', {
//     encoding: 'utf-8',
// })

let connection;
 async function connect () {
     connection = mysql.createConnection(
    {
        host: process.env.host,
        user: process.env.user,
        password: process.env.password,
        database: process.env.database,
        multipleStatements: 'true'
    });
    console.log(`Connected to the employee_db database`);
    await connection.query(fs.readFileSync('./db/schema.sql'));
    console.log(`schema defined`);
    init();
 };


// connection.query(fs.readFileSync('./db/schema.sql'));
// connection.query(fs.readFileSync('./db/seeds.sql'));


// connection.connect()

// console.log(`running sql seed..`)

// connection.query(seedQuery, err => {
//     if (err) {
//         throw err
//     }

//     console.log(`SQL seed complete`);
//     init();
// });


function init() {
    inquirer
        .prompt([
            {
                type: "list",
                name: "choices",
                message: "What would you like to do? Choose the option from below",
                choices: [
                    "Add a new department",
                    "Add a new role",
                    "Add a new employee",
                    "View all department",
                    "View all role",
                    "View all employee",
                    "Update employee role",
                    "Exit",
                ],
            },
        ])

        .then((answer) => {
            console.log(`Would you like to: ${answer.choices}`);
            switch (answer.choices) {
                case "View all employees":
                    viewEmployees();
                    break;
                case "View all roles":
                    viewRoles();
                    break;
                case "View all departments":
                    viewDepartments();
                    break;
                case "Add a new department":
                    addDepartment();
                    break;
                case "Add a new role":
                    addRole();
                    break;
                case "Add a new employee":
                    addEmployee();
                    break;
                case "Update employee role":
                    updateEmployeeRole();
                    break;
                default:
                    exit();
            }
        });
}

function viewEmployees () {
    const sqlQuery = "select * from employee";
    connection.query(sqlQuery, (err, res) => {
     if (err) throw err;   
     console.log(`show employees`);
     console.table(res);
    });

}