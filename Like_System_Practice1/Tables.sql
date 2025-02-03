-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL
);

-- Create the posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    url TEXT NOT NULL
);

-- Create the reactions table
CREATE TABLE reactions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('like', 'dislike', 'love', 'angry', 'sad')), -- Example reaction types
    UNIQUE(user_id, post_id),  -- Ensures a user can only react once per post
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);
