DROP DATABASE IF EXISTS  employee_db;

CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE department(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE role(
    id INT NOT NULL auto_increment PRIMARY KEY ,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT NOT NULL,
    foreign key (department_id) references department(id)
);

CREATE TABLE employee(
     id INT NOT NULL auto_increment PRIMARY KEY,
     first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(30) NOT NULL,
     role_id INT NOT NULL,
     mgr_id INT,
     FOREIGN KEY (role_id) REFERENCES role(id)
);



