CREATE DATABASE KJU;

USE KJU;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(30),
    marks INT
);

INSERT INTO students (name, age, city, marks)
VALUES
('ARPITHA', 20, 'Hyderabad', 90),
('AMITHA', 22, 'Chennai', 75),
('ANVITHA', 22, 'Bengaluru', 75),
('KAVITHA', 22, 'Chennai', 85),
('KUSUMA', 22, 'Bengaluru', 75),
('HITHA', 16, 'Chennai', 85),
('POORNA', 22, 'Chennai', 75),
('NANDISH', 22, 'Bengaluru', 95),
('MAMITHA', 18, 'Chennai', 65),
('PAVAN', 21, 'Delhi', 85);

SELECT * FROM students;

SELECT name, marks FROM students;

SELECT * FROM students WHERE age = 20;

SELECT * FROM students WHERE marks > 80;