-- Active: 1744633018860@@127.0.0.1@5432@ph
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE Table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) on delete set DEFAULT DEFAULT 2
);
ALTER Table post
alter COLUMN user_id set NOT NULL;

drop Table "user";
DROP Table post;

INSERT INTO "user"(username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');
INSERT INTO post(title, user_id) VALUES
('Enjoying a sunny day with Akash!', 2),
('Batash just shared a amazing recipe!',1),
('Exploring adventures with Sagor', 4),
('Nodi''s wisdom always leaves me inspired.',4);
DELETE from "user"
where id = 2;
SELECT * from "user";
SELECT * from post;

SELECT post.id as postId, "user".id, title, username from post
JOIN "user" on post.user_id = "user".id;

SELECT * from "user"
join post on post.user_id = "user".id;

INSERT INTO post(id, title, user_id) VALUES
(5, 'This is a test post title!', NULL);

SELECT * from post
left join "user" on post.user_id = "user".id;
SELECT * from post
right join "user" on post.user_id = "user".id;