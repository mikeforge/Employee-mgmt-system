require('dotenv').config();
const mysql = require('mysql2');

const dbOptions = 
    {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        // database: process.env.DB_NAME,
        // multipleStatements: 'true'
    };
console.log(`${process.env.DB_USER}`)
    module.exports = {dbOptions};