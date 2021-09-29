PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follow;
CREATE TABLE users(
  fname text NOT NULL,
  lname text NOT NULL,
  id integer PRIMARY KEY
);


CREATE TABLE questions(
  title text NOT NULL,
  body text NOT NULL,
  author_id integer NOT NULL,
  id integer PRIMARY KEY,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follow(
  id integer PRIMARY KEY,
  user_id integer NOT NULL,
  question_id integer NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);`