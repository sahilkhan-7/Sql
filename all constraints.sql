
CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student(
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)   
);

-- Add a new (age) column to the student table with a CHECK constraint to ensure that the age is greater than or equal to 18.
ALTER TABLE student ADD age INT CHECK (age >=18);

INSERT INTO student (rollno, name, marks, grade, city, age) VALUES
(101, 'John Doe', 85, 'A', 'New York', 19),
(102, 'Jane Smith', 92, 'A', 'Los Angeles', 20),
(103, 'Mike Brown', 76, 'B', 'Chicago', 18),
(104, 'Lisa Ray', 88, 'A', 'Houston', 21);

-- INSERT INTO student(rollno, name, marks, grade, city, age) VALUES(103, 'Sahil Khan', 99, 'A', 'Jaipur', 17);
-- The above query will throw an error because the age is less than 18. And rollno is a primary key so it will also throw an error.

INSERT INTO student(rollno, name, marks, grade, city, age) VALUES(105, 'Sahil Khan', 99, 'A', 'Jaipur', 19);


SELECT * FROM student;

SELECT name, grade FROM student WHERE marks > 80;
SELECT name, city FROM student WHERE city = 'New York';

INSERT INTO student (rollno, name, marks, grade, city, age) VALUES
(201, 'Will Smith', 65, 'C', 'New York', 29),
(202, 'Lena callh', 52, 'D', 'Los Angeles', 23),
(203, 'Alison fion', 76, 'B', 'Los Angeles', 22),
(204, 'Lisa Manoban', 68, 'C', 'Houston', 21);

SELECT DISTINCT grade FROM student;

-- Using Operators in Where
-- Arithmetic Operators : +, -, /, *
SELECT * FROM student WHERE marks + 11 > 100;

-- Comparison Operator : =, >, <, >=, <=, != (Not equal to)
SELECT * FROM student WHERE marks >= 80;

-- Logical Operator : AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY

SELECT * FROM student WHERE city IN ("New York", "Jaipur");
SELECT * FROM student WHERE marks BETWEEN 70 AND 90;
SELECT * FROM student WHERE city NOT IN ("New York", "Jaipur") LIMIT 3;

-- Bitwise Operators : & (Bitwise AND), | (Bitwise OR)

-- Order By Clause : To sort in ascending (ASC) or Descending order (DESC)
SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY marks DESC;

-- Top 3 Students with Maximum Marks
SELECT * FROM student ORDER BY marks DESC LIMIT 3;

-- Aggregate Functions
-- Aggregate functions perform a calculation on a set of values, and return a single value.

SELECT COUNT(rollno) FROM student;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT SUM(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT SUM(marks) / COUNT(marks) FROM student;

-- Group By Clause : Groups rows that have the same values into summary rows. It collects data from multiple records and groups the result by one or more columns

-- Generally we use Group by with some aggregation function.

SELECT city, COUNT(name) FROM student GROUP BY city;
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) DESC;

SELECT grade, COUNT(grade) FROM student GROUP BY grade;

-- HaVing Clasue : use to defind conditions similar to WHERE
-- Count number of students in each city where max marks cross 90
SELECT city, COUNT(name), MAX(marks) FROM student
GROUP BY city
HAVING MAX(marks) > 85
ORDER BY MAX(marks) DESC;

SELECT city, LENGTH(city) FROM student;

SELECT MAX(LENGTH(city)) AS longest_name_length, MIN(LENGTH(city)) AS shortest_name_length
FROM student;

UPDATE student SET grade = 'O' WHERE grade = 'A';

UPDATE student SET grade = 'B' WHERE marks BETWEEN 80 AND 90;

UPDATE student SET marks = marks + 1; -- we are doing it without where clause so MySQL will confirm it first

-- DELETE : to delete existing rows
SELECT * FROM student;

INSERT INTO student(rollno, name, marks, grade, city, age) VALUES(12, 'Spider', 35, 'F', 'Delhi', 28);

DELETE FROM student WHERE marks < 36;


SELECT name, marks FROM student WHERE marks>75 ORDER BY RIGHT(name, 3) DESC;

ALTER TABLE student DROP COLUMN city;

ALTER TABLE student RENAME TO students;
SELECT * FROM students;

ALTER TABLE students CHANGE COLUMN rollno roll_no INT;

ALTER TABLE students MODIFY COLUMN age INT; -- Age is already int

TRUNCATE TABLE students;

