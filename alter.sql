-- Active: 1744633018860@@127.0.0.1@5432@ph
select * from person2;

ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@email.com';
ALTER TABLE person2
    DROP COLUMN email;

INSERT INTO person2 VALUES(7, 'test', 45, 'test@gmail.com');

ALTER TABLE person2
    RENAME COLUMN age to user_age;

ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);

ALTER Table person2
    ALTER COLUMN user_age set NOT NULL;

ALTER Table person2
    ALTER COLUMN user_age DROP NOT NULL;