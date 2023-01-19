-- Active: 1674131403635@@127.0.0.1@3306


CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now', 'localtime')) NOT NULL
);

DROP TABLE users;

INSERT INTO users (id, name, email, password)
VALUES("id001", "Lucas", "lucascalabria@gmail.com", "123123"),
("id002", "Iris", "irizinha@gmail.com", "321321"),
("id003", "Patricia", "patricia@gmail.com", "456456");


CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

SELECT * FROM follows;

INSERT INTO follows (follower_id, followed_id)
VALUES("id001", "id002"),
("id001", "id003"),
("id002", "id001");

SELECT * FROM users
INNER JOIN follows
ON follower_id = users.id;


SELECT * FROM users
LEFT JOIN follows
ON follower_id = users.id;

SELECT 
users.id AS userId,
users.name,
users.email,
users.password,
users.created_at AS createdAt,
follows.follower_id AS followerId,
follows.followed_id AS followedId,
usersFollowed.name AS nameFollowed
FROM users
JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id;
