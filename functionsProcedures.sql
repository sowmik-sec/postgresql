-- Active: 1744633018860@@127.0.0.1@5432@ph

SELECT * FROM employees;
CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL
as
$$
    SELECT count(*) FROM employees;
$$;
CREATE Function delete_emp()
RETURNS Void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id=1;
$$;

SELECT delete_emp();

CREATE Function delete_emp_by_id(p_emp_id INT)
RETURNS Void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id=p_emp_id;
$$;

SELECT delete_emp_by_id(3);