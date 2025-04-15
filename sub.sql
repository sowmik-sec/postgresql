-- Active: 1744633018860@@127.0.0.1@5432@ph
drop TABLE if EXISTS employees;
CREATE Table employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES
('Alice Johnson', 'Engineering', 85000.00, '2020-03-15'),
('Bob Smith', 'Human Resources', 60000.00, '2019-07-22'),
('Charlie Lee', 'Engineering', 95000.00, '2021-01-10'),
('Diana Prince', 'Marketing', 72000.00, '2022-06-01'),
('Edward Kim', 'Finance', 88000.00, '2020-11-17'),
('Fiona Chen', 'Sales', 66000.00, '2023-02-05'),
('George Martin', 'IT Support', 55000.00, '2021-08-30'),
('Hannah Davis', 'Marketing', 70000.00, '2021-04-12'),
('Ian Wright', 'Engineering', 91000.00, '2018-12-05'),
('Jessica Lane', 'Human Resources', 63000.00, '2023-07-19');

SELECT * FROM employees
WHERE salary > (SELECT max(salary) from employees
WHERE department_name='Marketing');