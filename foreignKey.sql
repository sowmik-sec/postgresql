-- Active: 1744633018860@@127.0.0.1@5432@ph
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE Table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) NOT NULL
);
ALTER Table post
alter COLUMN user_id set NOT NULL;


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
SELECT title, username from post
JOIN "user"
WHERE "user.id" = post.user_id;