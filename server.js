const mysql = require('mysql2');
const dotenv = require('dotenv');
const consoleTable = require('console.table');
const connection = require('mysql2/typings/mysql/lib/Connection');
const fs = require('fs');

const seedQuery = fs.readFileSync('./seeds.sql', {
    encoding: 'utf-8',
})

const db = mysql.createConnection(
    {
        host: process.env.host,
        user: process.env.user,
        password: process.env.password,
        database: process.env.database
    },
    console.log(`Connected to the employee_db database`)
)


connection.connect()

console.log(`running sql seed..`)

connection.query(seedQuery, err => {
    if (err) {
        throw err
    }

    console.log(`SQL seed complete`)
});


