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

CREATE Procedure remove_emp_var()
LANGUAGE plpgsql
as 
$$
    DECLARE
    test_var INT;
    BEGIN
        SELECT employee_id INTO test_var FROM employees WHERE employee_id = 5;
        DELETE FROM employees WHERE employee_id = test_var;
    END
$$;

CALL remove_emp_var();

CREATE Procedure remove_emp_by_id(p_emp_id int)
LANGUAGE plpgsql
as 
$$
    DECLARE
    test_var INT;
    BEGIN
        SELECT employee_id INTO test_var FROM employees WHERE employee_id = p_emp_id;
        DELETE FROM employees WHERE employee_id = test_var;
        RAISE NOTICE 'Employee removed successfully!';
    END
$$;

CALL remove_emp_by_id(7);