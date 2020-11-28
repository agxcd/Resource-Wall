DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
)

CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  thumbnail_photo VARCHAR(255) NOT NULL,
  date_created DATE,
  url VARCHAR(2083),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  tags_id INTEGER REFERENCES tags(id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL DEFAULT 0,
  is_liked BOOLEAN NOT NULL DEFAULT FALSE,
)

CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
  date_posted DATE,
  comment_text TEXT
)

CREATE TABLE categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE
)

CREATE TABLE tags (
  id SERIAL PRIMARY KEY NOT NULL,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
  tag_name VARCHAR(255) NOT NULL,
)
