-- Active: 1744633018860@@127.0.0.1@5432@ph
EXPLAIN ANALYSE
SELECT * FROM employees;
CREATE INDEX idx_employees_last_name
ON employees (employee_name);