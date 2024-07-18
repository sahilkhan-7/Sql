/*
this is my first time i am using SQL in vscode
*/

-- create DATABASE sahil;

-- DROP DATABASE sahil;

-- use sakila;

-- SHOW TABLES;

-- CREATE DATABASE sahilkhan;

-- DROP DATABASE sahilkhan;

-- USE sakila;

-- SHOW TABLES;

CREATE DATABASE College;

USE College;

SHOW TABLES;

CREATE TABLE student(
    id INT PRIMARY KEY, 
    name VARCHAR(50),
    age INT NOT NULL
);

-- DROP TABLE student;

INSERT INTO student VALUES(1, "Sahil khan", 26);
INSERT INTO student VALUES(2, "Farhan khan", 30);

SELECT * FROM student;
SELECT name FROM student;

-- CREATE DATABASE IF NOT EXISTS College; 

-- DROP DATABASE IF EXISTS college;
INSERT INTO student VALUES
(3, "Gulzar", 40),
(4, "Vivek", 30),
(5, "Saniya", 50)

SELECT * FROM student;


