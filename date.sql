-- Active: 1744633018860@@127.0.0.1@5432@ph
SHOW timezone;
SELECT now();
create Table timez( ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);
INSERT INTO timez VALUES('2025-04-15 11:06:30', '2025-04-15 11:06:30');
SELECT * from timez;

SELECT CURRENT_DATE;
SELECT now()::date;
SELECT now()::time;
select to_char(now(), 'dd.mm.yyyy');
SELECT CURRENT_DATE - INTERVAL '1 month';
SELECT age(CURRENT_DATE, '1995-09-09');
SELECT * from students;
SELECT *, age(CURRENT_DATE, dob) from students;
SELECT extract(DAY from '2025-04-15'::date);
SELECT 1::BOOLEAN;