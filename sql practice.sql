-- Creating DataBAses
CREATE DATABASE IF NOT EXISTS xyz_company;
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
SELECT * FROM employees LIMIT 3

SELECT * FROM employees ORDER BY last_name LIMIT 3

-- Updating Data
UPDATE employees SET email = 'john.doe@company.com' WHERE employee_id = 1;

UPDATE employees SET manager_id = 5 WHERE employee_id = 2;

-- Deleting data from table
DELETE FROM employees WHERE employee_id = 4;