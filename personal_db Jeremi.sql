CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Basic Info
CREATE TABLE person (
  person_id   INTEGER PRIMARY KEY,
  full_name   TEXT NOT NULL,
  age         INTEGER,
  hometown    TEXT,
  current_city TEXT
);

-- Education
CREATE TABLE education (
  education_id INTEGER PRIMARY KEY,
  person_id    INTEGER NOT NULL,
  school       TEXT NOT NULL,
  degree       TEXT,
  field        TEXT,
  grad_year    INTEGER,
  FOREIGN KEY (person_id) REFERENCES person(person_id) ON DELETE CASCADE
);

-- Skills
CREATE TABLE skill (
  skill_id  INTEGER PRIMARY KEY,
  name      TEXT NOT NULL,
  category  TEXT,
  level     TEXT
);

-- Interests
CREATE TABLE interest (
  interest_id INTEGER PRIMARY KEY,
  name        TEXT NOT NULL,
  category    TEXT
);

-- Link tables
CREATE TABLE person_skill (
  person_id INTEGER NOT NULL,
  skill_id  INTEGER NOT NULL,
  PRIMARY KEY (person_id, skill_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id) ON DELETE CASCADE,
  FOREIGN KEY (skill_id)  REFERENCES skill(skill_id)  ON DELETE CASCADE
);

CREATE TABLE person_interest (
  person_id   INTEGER NOT NULL,
  interest_id INTEGER NOT NULL,
  PRIMARY KEY (person_id, interest_id),
  FOREIGN KEY (person_id)   REFERENCES person(person_id)   ON DELETE CASCADE,
  FOREIGN KEY (interest_id) REFERENCES interest(interest_id) ON DELETE CASCADE
);

-- Insert Jeremi’s info
INSERT INTO person (person_id, full_name, age, hometown, current_city) VALUES
(1, 'Jeremi Samuel', 19, 'Long Island, NY', 'Houston, TX');

-- Education
INSERT INTO education (education_id, person_id, school, degree, field, grad_year) VALUES
(1, 1, 'Greater New York Academy (GNYA)', 'High School Diploma', NULL, 2022),
(2, 1, 'Oakview Academy', 'High School Coursework', NULL, 2022),
(3, 1, 'Oakwood University', 'Bachelor''s', 'Computer Networks', 2026);

-- Skills
INSERT INTO skill (skill_id, name, category, level) VALUES
(1, 'Python', 'Programming', 'intermediate'),
(2, 'IBM Internship Experience', 'Professional', 'beginner'),
(3, 'Tech Exploration', 'Technology', 'intermediate');

-- Interests
INSERT INTO interest (interest_id, name, category) VALUES
(1, 'Reading', 'Leisure'),
(2, 'Cooking', 'Lifestyle'),
(3, 'Fashion', 'Creative'),
(4, 'Technology', 'Academic/Professional');

-- Link person to skills
INSERT INTO person_skill (person_id, skill_id) VALUES
(1,1),(1,2),(1,3);

-- Link person to interests
INSERT INTO person_interest (person_id, interest_id) VALUES
(1,1),(1,2),(1,3),(1,4);
