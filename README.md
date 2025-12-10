# From-Me-to-We-Personal-Database-Phase-2
A unified relational database integrating person, education, skills, interests, courses, and projects for the Phase 2 From Me to We team project.
Project Overview
Phase 2 of the From Me to We database project required each team to merge their individual Phase 1 databases into a unified relational model representing personal profiles, academic history, skills, interests, and projects. Our team designed the team_profile_db system by integrating all required entity groups: Person, Education, Courses, Skills, Interests, Institutions, and Projects.
The final deliverables included:
•	A normalized relational schema
•	A unified ER diagram
•	A full MySQL database export
•	Team roles and timeline
•	A change journal documenting all revisions
•	A complete README describing the system
________________________________________
Entity-Relationship Diagram (ERD)
Our ERD consists of interconnected entities modeling a comprehensive academic and personal profile system. Core relationships include:
•	One person → many education records
•	One person → many course enrollments
•	One person → many skills (with proficiency)
•	One person → many interests
•	One course → many projects
•	Many projects → many skills (via project_skill)
The model supports complex M:N relationships using associative tables such as person_skill, person_interest, person_course, and project_skill.
________________________________________
Database Schema Overview
The final database includes the following tables (all SQL cited from uploaded files):
________________________________________
1. person
Stores all demographic and profile information for each individual.
(Source: team_profile_db_person.sql)
________________________________________
2. institution
Represents universities, colleges, and academic institutions.
(Source: team_profile_db_institution.sql)
________________________________________
3. education
Links a person to formal education details — major, degree, graduation year, and certifications.
(Source: team_profile_db_education.sql)
________________________________________
4. academic_enrollment
Records person-level enrollment details (grade level, start year, end year).
(Source: team_profile_db_academic_enrollment.sql)
________________________________________
5. course
Represents academic courses tied to institutions and later linked to projects.
(Source: team_profile_db_course.sql)
________________________________________
6. person_course
Associative table linking people to the courses they completed or were enrolled in.
(Source: team_profile_db_person_course.sql)
________________________________________
7. skill
Stores unique skill names with categories and standardized skill levels.
(Source: team_profile_db_skill.sql)
________________________________________
8. person_skill
Many-to-many table linking a person to their skills with a proficiency level.
(Source: team_profile_db_person_skill.sql)
________________________________________
9. interest
Lists interest categories (academic, hobby, professional).
(Source: team_profile_db_interest.sql)
________________________________________
10. person_interest
Links a person to their interest categories.
(Source: team_profile_db_person_interest.sql)
________________________________________
11. project
Represents personal, academic, or course-related projects linked to a person and optionally tied to a course.
(Source: team_profile_db_project.sql)
________________________________________
12. project_skill
Associative table linking a project to the skills used or demonstrated.
(Source: team_profile_db_project_skill.sql)
________________________________________
Normalization and Constraints
The design follows principles of 3rd Normal Form (3NF):
•	No repeating groups
•	No multi-valued attributes
•	All non-key attributes depend on the primary key
•	M:N relationships resolved using junction tables
Foreign key constraints maintain referential integrity across the schema.
________________________________________
Team Roles and Responsibilities
(Compiled from: Team Database Project – Roles, Timeline, and Change Journal)
Project Manager – Marc-Anthony Jones
•	Coordinated team communication
•	Scheduled deadlines for ERD development and SQL integration
•	Verified referential integrity between merged tables
•	Ensured all Phase 1 databases were mapped correctly into the unified schema
•	Oversaw documentation (README, timeline, and change journal)
•	Conducted final review before submission
(If you want, I can expand this into a more polished résumé-ready description.)
Other Team Roles
(Synthesized from team files)
•	Database Architect
•	SQL Integration Lead
•	Documentation Lead
•	QA/Tester
•	ERD Designer
(Names can be added if required for submission.)
________________________________________
Timeline Summary
(From: Team DB Project Timeline & Roles)
Key milestones included:
•	Week 1: Individual databases reviewed and mapped
•	Week 2: Schema consolidation and ERD design
•	Week 3: SQL generation for each table + foreign key integration
•	Week 4: Population of sample data and validation
•	Week 5: Full audit, documentation finalization, and submission
________________________________________
Change Journal Summary
Documented in: Team Database Project – Change Journal
Major updates included:
•	Normalizing interest and skill tables
•	Adjusting entity names for consistency
•	Creating new junction tables for M:N relationships
•	Updating foreign keys for referential integrity
•	Refining project structure and adding project_skill relationship
________________________________________
Technical Summary
The final unified database successfully:
•	Incorporates 12 tables
•	Implements multiple M:N relationships
•	Uses foreign keys with cascading rules for data consistency
•	Normalizes skills, interests, education, courses, and projects
•	Supports cross-functional academic/professional profiling
The system is scalable, extendable, and standards-compliant for relational database modeling.
________________________________________
Files Included
•	Full SQL schema for all tables
•	ERD image (final schema)
•	Change journal
•	Timeline & Roles document
•	README (this file)
________________________________________
Conclusion
The From Me to We Phase 2 project demonstrates the ability to integrate multiple independently designed databases into a structured, normalized, multi-entity relational system. Through collaborative design, schema refinement, and documentation, our team produced a complete and functional database suitable for academic and professional use.

