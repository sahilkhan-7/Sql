-- Creating DataBAses
CREATE DATABASE IF NOT EXISTS xyz_company;

-- DROP DATABASE xyz_company;

-- Using the specific Database
USE xyz_company;

-- Creating table in the database
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT
);

-- Inserting Values in the table
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '2020-01-15', 'IT_PROG', 60000, NULL, 1),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2019-03-12', 'HR_REP', 50000, NULL, 2),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '2018-07-10', 'IT_PROG', 70000, 1, 1),
('Bob', 'Brown', 'bob.brown@example.com', '555-4321', '2021-05-23', 'FIN_ANAL', 45000, NULL, 3),
('Charlie', 'Davis', 'charlie.davis@example.com', '555-6789', '2017-09-19', 'IT_PROG', 65000, 1, 1),
('Diana', 'Miller', 'diana.miller@example.com', '555-2345', '2022-01-05', 'HR_REP', 52000, 2, 2);

-- Selecting all the columns from table
SELECT * FROM employees;
-- Selecting specific columns from table
SELECT employee_id, first_name, last_name, job_id FROM employees;

-- Where Clause
SELECT employee_id, first_name, last_name, job_id FROM employees WHERE job_id = 'IT_PROG';

-- AND OR OPERATIONS   
SELECT * FROM employees WHERE job_id = 'IT_PROG' OR job_id = 'HR_REP';

SELECT * FROM employees WHERE job_id = 'IT_PROG' AND salary > 60000;

-- ORDER BY Clause
-- SELECT * FROM employees ORDER BY last_name ASC; -- arrange data in ascending order
SELECT  * FROM employees ORDER BY last_name DESC; -- arrange data in descending order

-- Limit Clause
SELECT * FROM employees LIMIT 3;

SELECT * FROM employees ORDER BY last_name LIMIT 3;

-- Updating Data
UPDATE employees SET email = 'john.doe@company.com' WHERE employee_id = 1;

UPDATE employees SET manager_id = 5 WHERE employee_id = 2;

-- Deleting data from table
DELETE FROM employees WHERE employee_id = 4;

-- Creating new table to perform joining operations

CREATE Table departments(
    department_id INT AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location_id INT,
    PRIMARY KEY(department_id)
);

INSERT INTO departments (department_id, department_name, location_id) VALUES
(1, "HR", 2001),
(2, "IT", 2002),
(3, "Finance", 2003),
(4, "Marketing", 3000);

SELECT * FROM departments;

CREATE TABLE employees1 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees1 (first_name, last_name, department_id, salary) VALUES
('John', 'Doe', 1, 60000),
('Jane', 'Smith', 2, 50000),
('Alice', 'Johnson', 1, 70000),
('Bob', 'Brown', 3, 45000),
('Charlie', 'Davis', NULL, 65000);

SELECT * FROM employees1;
SELECT * FROM departments;

-- Inner Join
SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
INNER JOIN departments ON departments.department_id = employees1.department_id;

-- Left Join or Left Outer Join
-- Returns all records from the left table (employees), and the matched records from the right table (departments). 
-- The result is NULL from the right side if there is no match.

SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
LEFT JOIN departments ON departments.department_id = employees1.department_id;

-- Right Join or Right Outer Join
-- Returns all records from the right table (employees), and the matched records from the left table (departments). 
-- The result is NULL from the left side if there is no match.

SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
RIGHT JOIN departments ON departments.department_id = employees1.department_id;

-- Full Outer Join
-- Returns all records when there is a match in either left (employees) or right (departments) table.
-- SELECT employees1.first_name, employees1.last_name, departments.department_name
-- FROM employees1
-- FULL OUTER JOIN departments ON departments.department_id = employees1.department_id;
-- MySQL doesnt directly support full outer join

-- INSTEAD WE CAN DO THIS TO GET THE FULL OUTER JOIN

SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
LEFT JOIN departments ON employees1.department_id = departments.department_id
UNION
SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
RIGHT JOIN departments ON employees1.department_id = departments.department_id;

-- Cross Join
-- Returns the Cartesian product of the two tables. 
-- Each row from the first table is combined with each row from the second table.
SELECT employees1.first_name, employees1.last_name, departments.department_name
FROM employees1
CROSS JOIN departments;

-- Alter Table
ALTER TABLE employees1 ADD manager_id INT;

UPDATE employees1 SET manager_id = 1 WHERE employee_id IN (2, 3);
UPDATE employees1 SET manager_id = 3 WHERE employee_id = 4;

