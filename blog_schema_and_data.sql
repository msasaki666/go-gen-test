-- ユーザーテーブル
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- カテゴリテーブル
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ブログ記事テーブル
CREATE TABLE blog_posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    category_id INTEGER,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- コメントテーブル
CREATE TABLE comments (
    comment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER,
    user_id INTEGER,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES blog_posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- タグテーブル
CREATE TABLE tags (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

-- ブログ記事とタグのリレーションテーブル
CREATE TABLE post_tags (
    post_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES blog_posts(post_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

-- サンプルユーザーの挿入
INSERT INTO users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'password_hash_1'),
('user2', 'user2@example.com', 'password_hash_2'),
('user3', 'user3@example.com', 'password_hash_3');

-- サンプルカテゴリの挿入
INSERT INTO categories (name, description) VALUES
('Technology', 'All about the latest in technology.'),
('Travel', 'Travel tips and destination guides.'),
('Food', 'Delicious recipes and restaurant reviews.');

-- サンプルブログ記事の挿入
INSERT INTO blog_posts (user_id, category_id, title, content) VALUES
(1, 1, 'The Future of AI', 'Artificial Intelligence is evolving rapidly...'),
(2, 2, 'Top 10 Travel Destinations', 'Here are the top 10 travel destinations for 2024...'),
(3, 3, 'Best Pasta Recipes', 'Try out these amazing pasta recipes for dinner...');

-- サンプルコメントの挿入
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'Great article on AI!'),
(2, 1, 'I would love to visit these places.'),
(3, 2, 'The pasta recipes are fantastic!');

-- サンプルタグの挿入
INSERT INTO tags (name) VALUES
('AI'),
('Travel'),
('Food'),
('Recipes');

-- サンプルブログ記事とタグのリレーションの挿入
INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4);
