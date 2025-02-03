-- Insert users
INSERT INTO users (username) VALUES 
('alice123'), ('bob_smith'), ('charlie99'), ('david_w'), ('emma_rose'),
('frankie_j'), ('grace_m'), ('harry_potter'), ('isabella'), ('jackson12');

-- Insert posts
INSERT INTO posts (url) VALUES 
('https://example.com/post1'), ('https://example.com/post2'), ('https://example.com/post3'), 
('https://example.com/post4'), ('https://example.com/post5'), ('https://example.com/post6'), 
('https://example.com/post7'), ('https://example.com/post8'), ('https://example.com/post9'), 
('https://example.com/post10');

-- Insert reactions (20 rows)
INSERT INTO reactions (user_id, post_id, type) VALUES 
(1, 1, 'like'), (2, 1, 'love'), (3, 2, 'dislike'), (4, 2, 'angry'), (5, 3, 'sad'),
(6, 3, 'like'), (7, 4, 'love'), (8, 4, 'dislike'), (9, 5, 'angry'), (10, 5, 'sad'),
(1, 6, 'like'), (2, 7, 'love'), (3, 8, 'dislike'), (4, 9, 'angry'), (5, 10, 'sad'),
(6, 1, 'like'), (7, 2, 'love'), (8, 3, 'dislike'), (9, 4, 'angry'), (10, 5, 'sad');
