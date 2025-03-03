--Insert into hashtags
INSERT INTO hashtags (title) VALUES
('Tech'), ('Sports'), ('Music'), ('Gaming'), ('Travel'),
('Food'), ('Fitness'), ('Movies'), ('Books'), ('Science');


--Insert into posts
INSERT INTO posts (url, user_id) VALUES
('https://example.com/post1', 1),
('https://example.com/post2', 2),
('https://example.com/post3', 3),
('https://example.com/post4', 4),
('https://example.com/post5', 5),
('https://example.com/post6', 6),
('https://example.com/post7', 7),
('https://example.com/post8', 8),
('https://example.com/post9', 9),
('https://example.com/post10', 10);

-- Insert into hashtags_posts (linking hashtags and posts)
INSERT INTO hashtags_posts (hashtag_id, post_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);