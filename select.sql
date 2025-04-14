-- Active: 1744633018860@@127.0.0.1@5432@ph
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Emily', 'Johnson', 20, 'A+', 'Computer Science', 'emily.johnson@example.com', '2004-03-14', 'O+', 'USA'),
('Liam', 'Brown', 22, 'B', 'Mechanical Engineering', 'liam.brown@example.com', '2002-06-25', 'A-', 'Canada'),
('Sophia', 'Martinez', 19, 'A', 'Business Administration', 'sophia.martinez@example.com', '2005-11-02', 'B+', 'Mexico'),
('Noah', 'Davis', 21, 'C+', 'Electrical Engineering', 'noah.davis@example.com', '2003-02-10', 'AB+', 'UK'),
('Isabella', 'Garcia', 23, 'B-', 'Medicine', 'isabella.garcia@example.com', '2001-09-08', 'O-', 'Spain'),
('James', 'Miller', 20, 'A', 'Law', 'james.miller@example.com', '2004-01-17', 'B-', 'Australia'),
('Mia', 'Rodriguez', 18, 'A+', 'Psychology', 'mia.rodriguez@example.com', '2006-07-29', 'A+', 'Brazil'),
('Oliver', 'Wilson', 24, 'C', 'Civil Engineering', 'oliver.wilson@example.com', '2000-05-05', 'AB-', 'Germany'),
('Ava', 'Lee', 22, 'B+', 'Architecture', 'ava.lee@example.com', '2002-10-12', 'O+', 'South Korea'),
('William', 'Anderson', 19, 'A-', 'Physics', 'william.anderson@example.com', '2005-04-20', 'B+', 'India');

SELECT email as "Student Email" from students

SELECT * FROM students ORDER BY dob DESC;

SELECT country from students ORDER BY country ASC;

SELECT DISTINCT country from students;
SELECT DISTINCT blood_group from students;

select * from students 
WHERE country = 'USA';

SELECT * from students 
WHERE grade = 'A-' AND course = 'Physics'

SELECT * FROM students
WHERE (country = 'USA' OR country = 'Brazil') AND age >10

SELECT upper(first_name) as first_name_in_upper_case, * from students;
SELECT concat(first_name, ' ', last_name) FROM students;
SELECT length(first_name) from students;
SELECT avg(age) FROM students;
SELECT max(age) FROM students;
SELECT min(age) FROM students;
SELECT count(*) FROM students;
SELECT max(length(first_name)) from students;
SELECT * from students 
WHERE not country = 'USA'

SELECT * from students
where email is NOT NULL;

SELECT COALESCE(email, 'Email not provided') as "Email" from students;

SELECT * FROM students
WHERE country = 'USA' or country = 'India';
SELECT * FROM students
WHERE country NOT in ('USA', 'Brazil', 'India');
SELECT * from students
WHERE age BETWEEN 10 and 20 ORDER BY age;
SELECT * FROM students 
WHERE first_name LIKE '%ia';
SELECT * FROM students 
WHERE first_name LIKE '__a%';
SELECT * FROM students 
WHERE first_name LIKE 'A%';
