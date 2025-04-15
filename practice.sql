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

DROP TABLE if EXISTS orders;
CREATE Table orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(101, '2023-01-15', 250.75),
(102, '2022-02-20', 120.00),
(103, '2021-03-05', 540.30),
(101, '2022-04-12', 310.90),
(104, '2020-05-10', 75.50),
(105, '2021-06-18', 990.00),
(102, '2020-07-22', 150.45),
(106, '2022-08-01', 430.00),
(107, '2020-09-15', 220.85),
(101, '2019-10-20', 660.10);

SELECT customer_id, count(customer_id), sum(total_amount) as total_spent from orders
GROUP BY customer_id
HAVING count(customer_id)>2;
SELECT extract(MONTH from order_date) as month, sum(total_amount) from orders
WHERE extract(YEAR from order_date) = 2022
GROUP BY month