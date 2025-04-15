-- Active: 1744633018860@@127.0.0.1@5432@ph
CREATE View dept_avg_salary
as
SELECT department_name FROM employees
GROUP BY department_name;

SELECT * FROM dept_avg_salary;
CREATE View test_view
as
SELECT employee_name, salary, department_name
FROM employees
WHERE department_name in
(SELECT department_name FROM employees WHERE department_name LIKE '%R%');
SELECT * FROM test_view;