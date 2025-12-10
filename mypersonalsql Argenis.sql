-- Replace the name if you want, but keep it consistent everywhere below
DROP DATABASE IF EXISTS my_personal_argenis_db;
CREATE DATABASE my_personal_argenis_db;
USE my_personal_argenis_db;

-- Confirm you are in the right schema
SELECT DATABASE() AS using_schema;
-- 1) PROFILE (parent)
CREATE TABLE profile (
  profile_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name  VARCHAR(100) NOT NULL,
  hometown   VARCHAR(100),
  email      VARCHAR(100) UNIQUE,
  tagline    TEXT
) ENGINE=InnoDB;

-- 2) EDUCATION (child of profile)
CREATE TABLE education (
  edu_id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT NOT NULL,
  school VARCHAR(150) NOT NULL,
  degree VARCHAR(100) NOT NULL,
  major VARCHAR(100),
  start_year YEAR,
  grad_year YEAR,
  CONSTRAINT fk_education_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
) ENGINE=InnoDB;

-- 3) SKILL (child of profile)
CREATE TABLE skill (
  skill_id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  level ENUM('beginner','intermediate','advanced') DEFAULT 'intermediate',
  category VARCHAR(100),
  CONSTRAINT fk_skill_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
) ENGINE=InnoDB;

-- 4) PROJECT (child of profile)
CREATE TABLE project (
  project_id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT NOT NULL,
  title VARCHAR(150) NOT NULL,
  org   VARCHAR(150),
  start_date DATE,
  end_date   DATE,
  summary    TEXT,
  CONSTRAINT fk_project_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
) ENGINE=InnoDB;

-- 5) PROJECT_SKILL (bridge: project ↔ skill)
CREATE TABLE project_skill (
  project_id INT NOT NULL,
  skill_id   INT NOT NULL,
  PRIMARY KEY (project_id, skill_id),
  CONSTRAINT fk_ps_project
    FOREIGN KEY (project_id) REFERENCES project(project_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_ps_skill
    FOREIGN KEY (skill_id)   REFERENCES skill(skill_id)
      ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Quick check: you should see 5 tables now
SHOW TABLES;
-- profile row (you)
INSERT INTO profile (full_name, hometown, email, tagline)
VALUES ('Argenis Rosario Reyes','Huntsville, Alabama','argenis.rosario@oakwood.edu',
        'MIS student blending IT, leadership, and service');

-- project & skill each require an existing profile_id (1)
INSERT INTO project (profile_id, title) VALUES (1, 'Test Project');
INSERT INTO skill   (profile_id, name, level, category)
VALUES (1, 'SQL', 'advanced', 'data');

-- bridge row should now succeed (references project_id=1, skill_id=1)
INSERT INTO project_skill (project_id, skill_id) VALUES (1,1);

-- sanity checks
SELECT * FROM profile;
SELECT * FROM project;
SELECT * FROM skill;
SELECT * FROM project_skill;
USE my_personal_argenis_db;
SHOW TABLES;
USE my_personal_argenis_db;
CREATE TABLE IF NOT EXISTS skill (
  skill_id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  level ENUM('beginner','intermediate','advanced') DEFAULT 'intermediate',
  category VARCHAR(100),
  CONSTRAINT fk_skill_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS education (
  edu_id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT NOT NULL,
  school VARCHAR(150) NOT NULL,
  degree VARCHAR(100) NOT NULL,
  major VARCHAR(100),
  start_year YEAR,
  grad_year YEAR,
  CONSTRAINT fk_education_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS project_skill (
  project_id INT NOT NULL,
  skill_id   INT NOT NULL,
  PRIMARY KEY (project_id, skill_id),
  CONSTRAINT fk_ps_project FOREIGN KEY (project_id) REFERENCES project(project_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_ps_skill   FOREIGN KEY (skill_id)   REFERENCES skill(skill_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
SHOW TABLES;
-- ensure at least one profile row exists
INSERT INTO profile (full_name) VALUES ('Test User') ON DUPLICATE KEY UPDATE full_name=VALUES(full_name);

-- add one project & one skill linked to that profile_id=1
INSERT INTO project (profile_id, title) VALUES (1, 'Test Project');
INSERT INTO skill (profile_id, name, level, category) VALUES (1, 'SQL', 'advanced', 'data');

-- link them via bridge (should succeed now)
INSERT INTO project_skill (project_id, skill_id) VALUES (1,1);

-- quick checks
SELECT * FROM project LIMIT 5;
SELECT * FROM skill LIMIT 5;
SELECT * FROM project_skill LIMIT 5;
-- PROFILE
INSERT INTO profile (full_name, hometown, email, tagline)
VALUES ('Argenis Rosario Reyes','Huntsville, Alabama','argenis.rosario@oakwood.edu',
        'MIS student blending IT, leadership, and service');

-- EDUCATION
INSERT INTO education (profile_id, school, degree, major, start_year, grad_year) VALUES
(1,'Oakwood University','B.S.','Management Information Systems',2022,2026),
(1,'AdventHealth Leadership Institute','Certificate','Leadership Foundations',2025,2025),
(1,'Cisco Networking Academy','Certificate','Networking Basics',2024,2024),
(1,'Udemy','Certificate','CompTIA Security+ Prep',2025,2025),
(1,'Self-Study','Certification Prep','Azure Fundamentals (AZ-900)',2025,NULL);

-- SKILLS
INSERT INTO skill (profile_id, name, level, category) VALUES
(1,'SQL','advanced','data'),
(1,'ServiceNow','intermediate','ITSM'),
(1,'Networking Fundamentals','intermediate','networking'),
(1,'Azure Fundamentals','beginner','cloud'),
(1,'Leadership & Communication','advanced','leadership'),
(1,'Project Management','intermediate','PM'),
(1,'Python','intermediate','data'),
(1,'Public Speaking','intermediate','leadership');

-- PROJECTS  (use 1st of month for DATE fields)
INSERT INTO project (profile_id, title, org, start_date, end_date, summary) VALUES
(1,'HelloCare Virtual Care Dashboard','AdventHealth','2024-06-01','2024-08-01',
   'Built analytics to track NICU deliveries and operational KPIs.'),
(1,'HAM Pro IT Asset Scope','AdventHealth','2025-06-01','2025-08-01',
   'Designed warehouse asset tracking process with Service Mgmt & PMO.'),
(1,'Uniket MVP (HBCU Pitch)','Competition','2025-03-01','2025-04-01',
   'Marketing lead; emergency alerts and disaster reporting demo.'),
(1,'StudyFlow Prototype','Class Project','2025-02-01','2025-02-15',
   'Media-first one-page prototype in Carrd.'),
(1,'Network Performance Analyst Simulation','Course','2025-02-01','2025-03-01',
   'Monitored LAN traffic and documented performance insights.');

-- PROJECT ↔ SKILL LINKS (bridge)
INSERT INTO project_skill (project_id, skill_id) VALUES
(1,1),(1,2),(1,6),
(2,2),(2,6),(2,5),
(3,5),(3,7),
(4,7),(4,5),
(5,3),(5,1);
SELECT project_id, title FROM project;
SELECT skill_id,   name  FROM skill;
INSERT INTO project_skill (project_id, skill_id)
-- HelloCare → SQL, ServiceNow, Project Management
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='SQL'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='ServiceNow'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='Project Management'

-- HAM Pro → ServiceNow, Project Management, Leadership & Communication
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='ServiceNow'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='Project Management'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='Leadership & Communication'

-- Uniket MVP → Leadership & Communication, Python
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Uniket MVP (HBCU Pitch)' AND s.name='Leadership & Communication'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Uniket MVP (HBCU Pitch)' AND s.name='Python'

-- StudyFlow → Python, Leadership & Communication
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='StudyFlow Prototype' AND s.name='Python'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='StudyFlow Prototype' AND s.name='Leadership & Communication'

-- Network Performance Analyst Simulation → Networking Fundamentals, SQL
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Network Performance Analyst Simulation' AND s.name='Networking Fundamentals'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Network Performance Analyst Simulation' AND s.name='SQL';
SELECT * FROM project_skill;
-- Nice view: project with its skills
SELECT p.title, GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS skills
FROM project p
JOIN project_skill ps ON ps.project_id = p.project_id
JOIN skill s ON s.skill_id = ps.skill_id
GROUP BY p.project_id;
SELECT * FROM project_skill;
-- Nice view: project with its skills
SELECT p.title, GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS skills
FROM project p
JOIN project_skill ps ON ps.project_id = p.project_id
JOIN skill s ON s.skill_id = ps.skill_id
GROUP BY p.project_id;
SELECT DATABASE() AS using_schema;
USE my_personal_argenis_db;
SHOW TABLES;
SELECT 'profile'        AS tbl, COUNT(*) FROM profile
UNION ALL SELECT 'education', COUNT(*) FROM education
UNION ALL SELECT 'skill',     COUNT(*) FROM skill
UNION ALL SELECT 'project',   COUNT(*) FROM project
UNION ALL SELECT 'project_skill', COUNT(*) FROM project_skill;
INSERT INTO profile (full_name, hometown, email, phone)
VALUES ('Argenis Rosario Reyes', 'Huntsville, Alabama', 'argenis.rosario@oakwood.edu', '256-123-4567');
DESCRIBE profile;
INSERT INTO profile (full_name, hometown, email)
VALUES ('Argenis Rosario Reyes', 'Huntsville, Alabama', 'argenis.rosario@oakwood.edu');
ALTER TABLE profile ADD COLUMN phone VARCHAR(20);
INSERT INTO profile (full_name, hometown, email, phone)
VALUES ('Argenis Rosario Reyes', 'Huntsville, Alabama', 'argenis.rosario@oakwood.edu', '256-123-4567');
ALTER TABLE profile ADD COLUMN phone VARCHAR(20);
INSERT INTO profile (full_name, hometown, email, phone)
VALUES ('Argenis Rosario Reyes', 'Huntsville, Alabama', 'argenis.rosario@oakwood.edu', '256-123-4567');
SELECT * FROM profile;
SELECT * FROM profile;
INSERT INTO education (profile_id, school_name, degree, start_date, end_date) 
VALUES 
(1, 'Oakwood University', 'B.S. in Management Information Systems', '2022-08-01', NULL),
(1, 'AdventHealth Internship', 'Healthcare IT Internship', '2024-06-01', '2024-08-01');
SELECT * FROM education;
INSERT INTO education (profile_id, school, degree, major, start_year, grad_year) 
VALUES
(1, 'Oakwood University', 'B.S.', 'Management Information Systems', 2022, NULL),
(1, 'AdventHealth Internship', 'Internship', 'Healthcare IT', 2024, 2024);
INSERT INTO skill (profile_id, name, level, category) VALUES
(1,'SQL','advanced','data'),
(1,'ServiceNow','intermediate','itsm'),
(1,'Networking Fundamentals','intermediate','networking'),
(1,'Azure Fundamentals','beginner','cloud'),
(1,'Leadership & Communication','advanced','leadership'),
(1,'Project Management','intermediate','pm'),
(1,'Python','intermediate','data'),
(1,'Public Speaking','intermediate','leadership');
SELECT * FROM skill;
INSERT INTO project (profile_id, title, org, start_date, end_date, summary) VALUES
(1,'HelloCare Virtual Care Dashboard','AdventHealth','2024-06-01','2024-08-01',
   'Built analytics to track NICU deliveries and operational KPIs.'),
(1,'HAM Pro IT Asset Scope','AdventHealth','2025-06-01','2025-08-01',
   'Designed warehouse IT asset tracking process with Service Mgmt & PMO.'),
(1,'Uniket MVP (HBCU Pitch)','Competition','2025-03-01','2025-04-01',
   'Marketing lead; emergency alerts & disaster reporting demo.'),
(1,'StudyFlow Prototype','Class Project','2025-02-01','2025-02-15',
   'Media-first one-page prototype concept.'),
(1,'Network Performance Analyst Simulation','Course','2025-02-01','2025-03-01',
   'Monitored LAN traffic and documented performance insights.');
SELECT project_id, title FROM project ORDER BY project_id;
INSERT INTO project_skill (project_id, skill_id)
-- HelloCare → SQL, ServiceNow, Project Management
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='SQL'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='ServiceNow'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HelloCare Virtual Care Dashboard' AND s.name='Project Management'

-- HAM Pro → ServiceNow, Project Management, Leadership & Communication
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='ServiceNow'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='Project Management'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='HAM Pro IT Asset Scope' AND s.name='Leadership & Communication'

-- Uniket MVP → Leadership & Communication, Python
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Uniket MVP (HBCU Pitch)' AND s.name='Leadership & Communication'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Uniket MVP (HBCU Pitch)' AND s.name='Python'

-- StudyFlow → Python, Leadership & Communication
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='StudyFlow Prototype' AND s.name='Python'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='StudyFlow Prototype' AND s.name='Leadership & Communication'

-- Network Performance Analyst Simulation → Networking Fundamentals, SQL
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Network Performance Analyst Simulation' AND s.name='Networking Fundamentals'
UNION ALL
SELECT p.project_id, s.skill_id FROM project p JOIN skill s
  ON p.title='Network Performance Analyst Simulation' AND s.name='SQL';
SELECT * FROM project_skill;
SELECT 'profile', COUNT(*) FROM profile
UNION ALL SELECT 'education', COUNT(*) FROM education
UNION ALL SELECT 'skill', COUNT(*) FROM skill
UNION ALL SELECT 'project', COUNT(*) FROM project
UNION ALL SELECT 'project_skill', COUNT(*) FROM project_skill;
SELECT p.title AS project,
       GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS skills
FROM project p
JOIN project_skill ps ON ps.project_id = p.project_id
JOIN skill s ON s.skill_id = ps.skill_id
GROUP BY p.project_id
ORDER BY p.title;
-- Profile Info
SELECT * FROM profile;

-- Education
SELECT e.school, e.degree, e.major, e.start_year, e.grad_year
FROM education e
WHERE e.profile_id = 1;

-- Projects with Skills
SELECT p.title AS project,
       p.description,
       GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS skills
FROM project p
JOIN project_skill ps ON p.project_id = ps.project_id
JOIN skill s ON ps.skill_id = s.skill_id
GROUP BY p.project_id
ORDER BY p.title;
SELECT * FROM profile;
SELECT * FROM education;

SELECT * FROM skill;
SELECT * FROM project;
SELECT * FROM profile;
Select * from profile;
select * from education;
select * FROM skill;
show tables
select * profile;
show tables
select * from profile;
SELECT * FROM education;
select * from skill;
select * from project;
show tables
select * from profile;
show tables
