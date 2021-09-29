PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  fname TEXT NOT NULL,
  lname TEXT NOT NULL,
  id INTEGER PRIMARY KEY
);


CREATE TABLE questions(
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
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
  question_follows(user_id, question_id)
VALUES
  (1, 1),
  (2, 2);

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 2),
  (2, 1);

INSERT INTO
  replies(question_id, user_id, parent_id, body)
VALUES
  (1, 2, null, 'Reply 1 from Emmett'),
  (2, 1, null, 'Reply 2 from Kent'),
  (1, 1, 1, 'Reply to reply 1'),
  (2, 2, 2, 'Reply to reply 2');