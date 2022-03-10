const mysql = require('mysql2');
const dotenv = require('dotenv');
const consoleTable = require('console.table')

const db = mysql.createConnection(
    {
        host: process.env.host,
        user: process.env.user,
        password: process.env.password,
        database: process.env.database
    },
    console.log(`Connected to the employee_db database`)
)  

