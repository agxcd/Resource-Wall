DROP TABLE IF EXISTS ratings CASCADE;

CREATE TABLE likes (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
  is_liked BOOLEAN NOT NULL DEFAULT FALSE
);