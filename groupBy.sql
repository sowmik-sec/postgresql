-- Active: 1744633018860@@127.0.0.1@5432@ph
SELECT * from students;
SELECT country,  avg(age) from students
GROUP BY country
HAVING avg(age) > 20;
SELECT extract(year from dob) as birth_year, count(*) as total_born from students
GROUP BY birth_year
ORDER BY total_born DESC;