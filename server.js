const mysql = require('mysql2');
const inquirer = require('inquirer');
require('dotenv').config();
const consoleTable = require('console.table');
const fs = require('fs');


const dbOptions = 
    {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
    };

const connection = mysql.createConnection(dbOptions);

connection.connect(function(err) {
    if (err) {
        return console.error(`error: ${err.message}`);
    }
    console.log(`Connected to mySQL`);

    // let schemaQuery = (fs.readFileSync('./db/schema.sql', 'utf-8').replace(/(\r\n|\n|\r)/gm," ")).split(';');
    // console.log(schemaQuery)
    // connection.query(schemaQuery, err => {
    //     if (err) {
    //         throw err
    //     }
    //     console.log(`schema created`);
    // })

    

    // console.log(`running sql seed..`);
    
    // let seedQuery = (fs.readFileSync('./db/seeds.sql', 'utf-8').replace(/(\r\n|\n|\r)/gm," ")).split(';')

    // connection.query(seedQuery, err => {
    // if (err) {
    //     throw err
    // }

    // console.log(`SQL seed complete`);
    init();
// });
});


function init () {
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
                    "View all departments",
                    "View all roles",
                    "View all employees",
                    "Update employee role",
                    "Exit",
                ],
                validate: list => {
                    if (list) {
                        return true;
                    }else {
                        console.log("Please make a selection.");
                        return false;
                    }
                }
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
                case 'Exit':
                    console.log(`Program Ended`);
                    quit();
            }
            init();
        
    }
);
}

function viewEmployees () {
    const sqlQuery = "select * from employee";
    connection.query(sqlQuery, (err, res) => {
     if (err) throw err;   
     console.log(`show employees ${res}`);
     console.table(res);
     init();
    });
}

function viewDepartments () {
    const sqlQuery = "select * from department";
    connection.query(sqlQuery, (err, res) => {
     if (err) throw err;   
     console.log(`show departments ${res}`);
     console.table(res);
     init();
    });
}

    function viewRoles () {
        const sqlQuery = "select * from roles";
        connection.query(sqlQuery, (err, res) => {
         if (err) throw err;   
         console.log(`show roles`);
         console.table(res);
         init();
        });
    }


function quit() {
    connection.end();
    process.exit();
}