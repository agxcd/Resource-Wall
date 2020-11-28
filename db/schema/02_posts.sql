DROP TABLE IF EXISTS posts CASCADE;

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
