INSERT INTO "Users" ("User_Name") VALUES
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Emma'),
('Frank'),
('Grace'),
('Henry'),
('Ivy'),
('Jack');
INSERT INTO "Users" ("User_Name") VALUES ('Paul'); -- No post for this user

INSERT INTO "posts" ("Title", "Url", "User_id", "Caption", "Lat", "Ing") VALUES
('Post 1', 'http://example.com/post1', 1, 'Caption for post 1', 19.4326, -99.1332),
('Post 2', 'http://example.com/post2', 2, 'Caption for post 2', 40.7128, -74.0060),
('Post 3', 'http://example.com/post3', 3, 'Caption for post 3', 34.0522, -118.2437),
('Post 4', 'http://example.com/post4', 4, 'Caption for post 4', 51.5074, -0.1278),
('Post 5', 'http://example.com/post5', 5, 'Caption for post 5', 35.6895, 139.6917),
('Post 6', 'http://example.com/post6', 6, 'Caption for post 6', -33.8688, 151.2093),
('Post 7', 'http://example.com/post7', 7, 'Caption for post 7', 48.8566, 2.3522),
('Post 8', 'http://example.com/post8', 8, 'Caption for post 8', -23.5505, -46.6333),
('Post 9', 'http://example.com/post9', 9, 'Caption for post 9', 55.7558, 37.6173),
('Post 10', 'http://example.com/post10', 10, 'Caption for post 10', 37.7749, -122.4194);

INSERT INTO "posts" ("Title", "Url", "User_id", "Caption", "Lat", "Ing") VALUES
('Post n1', 'http://example.com/post2', 2, 'Caption for post 2', 40.1111, -73.3330),
('Post n2', 'http://example.com/post2', 2, 'Caption for post 2', 40.2222, -73.3330),
('Post n3', 'http://example.com/post2', 2, 'Caption for post 2', 40.3333, -73.3330);
