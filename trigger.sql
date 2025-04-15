-- Active: 1744633018860@@127.0.0.1@5432@ph
CREATE Table my_users(
    username VARCHAR(50),
    email VARCHAR(30)
);
INSERT INTO my_users VALUES('ahsan', 'ah@sah.com'), ('habib', 'ha@bib.com');
SELECT * FROM my_users;
CREATE Table deleted_users_audit(
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);
-- trigger function
CREATE or REPLACE FUNCTION save_deleted_users()
RETURNS TRIGGER
LANGUAGE plpgsql 
as 
$$
    BEGIN
        INSERT INTO deleted_users_audit VALUES(OLD.username, now());
        RAISE NOTICE 'Deleted user audit log created';
        return OLD;
    END
$$;
CREATE or REPLACE Trigger save_deleted_user_trigger
BEFORE DELETE
on my_users
for EACH row
EXECUTE FUNCTION save_deleted_users();
DELETE FROM my_users WHERE username = 'ahsan';