-- 1.
CREATE TABLE categories (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT UNIQUE NOT NULL);

-- 2.
CREATE TABLE posts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	category_id INTEGER NOT NULL,
	title TEXT,
	views INTEGER DEFAULT 0,
	FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT
);

-- 3.
INSERT INTO categories (title)
VALUES
	('Mystery'),
	('Action'),
	('Comedy');

INSERT INTO posts (category_id, title, views)
VALUES
	(1, 'Shutter Island', 16000000),
	(3, 'Instant Family', 32000000),
	(2, 'Rampage', 72000000),
	(3, 'Playing with Fire', 17000000),
	(2, 'Edge of Tomorrow', 88000000);


-- 4.
SELECT
	p.id,
	p.title,
	c.title
FROM posts p
INNER JOIN categories c ON p.category_id = c.id;

-- 5.
SELECT
    c.title,
    COUNT(p.id) AS number_of_titles
FROM categories c
LEFT JOIN posts p ON c.id = p.category_id
GROUP BY c.id;

-- 6.
SELECT
	c.title,
	SUM(p.views) AS total_views
FROM posts p
INNER JOIN categories c ON p.category_id = c.id
GROUP BY c.id
ORDER BY total_views DESC
LIMIT 1;
