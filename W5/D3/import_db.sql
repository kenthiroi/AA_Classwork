PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follow;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
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
);

CREATE TABLE replies(
  id integer PRIMARY KEY,
  question_id integer NOT NULL,
  user_id integer NOT NULL,
);

CREATE TABLE question_likes(

);

INSERT INTO 
  users(fname, lname)

VALUES
  ('Kent', 'Hiroi'), 
  ('Emmett', 'He');

INSERT INTO
  questions(title, body, author_id)

VALUES 
  ('Kent Question', 'Kent Kent Kent', 1),
  ('Emmett Question', 'Emmett Emmett Emmett', 2);

INSERT INTO 
  questions_follow(user_id, question_id)

VALUES
  (1, 1),
  (2, 2);