-- Active: 1744633018860@@127.0.0.1@5432@ph
DROP TABLE if EXISTS employees;
DROP TABLE if EXISTS departments;
CREATE Table departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE Table employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO departments (department_name) VALUES
('Engineering'),
('Human Resources'),
('Marketing'),
('Finance'),
('Sales'),
('IT Support');

INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('Alice Johnson', 1, 85000.00, '2020-03-15'),
('Bob Smith', 2, 60000.00, '2019-07-22'),
('Charlie Lee', 1, 95000.00, '2021-01-10'),
('Diana Prince', 3, 72000.00, '2022-06-01'),
('Edward Kim', 4, 88000.00, '2020-11-17'),
('Fiona Chen', 5, 66000.00, '2023-02-05'),
('George Martin', 6, 55000.00, '2021-08-30'),
('Hannah Davis', 3, 70000.00, '2021-04-12'),
('Ian Wright', 1, 91000.00, '2018-12-05'),
('Jessica Lane', 2, 63000.00, '2023-07-19');

SELECT * FROM employees
JOIN departments on employees.department_id = departments.department_id;

SELECT * FROM employees
JOIN departments USING(department_id);

SELECT department_name, round(avg(salary)) as avg_salary from employees
JOIN departments USING(department_id)
GROUP BY department_name;

SELECT department_name, count(*) as employee_count from employees
JOIN departments USING(department_id)
GROUP BY department_name;

SELECT department_name, round(avg(salary)) as avg_salary from employees
JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1;

SELECT extract(YEAR from hire_date) as hire_year, count(*) as hired from employees
GROUP BY hire_year;