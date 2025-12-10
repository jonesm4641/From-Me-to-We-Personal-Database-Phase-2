This project is a SQL database designed to store and manage personal and academic information for a student. It includes data about personal details, courses taken, projects completed, and technical skills.



Database Schema

The database, named my\_profile, consists of five main tables that are linked together to provide a comprehensive profile.



1. basicinfo

This table contains core personal information about the student.

*Columns:* StudentID, FullName, Hometown, ExpectedGraduationYear, GitHub, LinkedIn, and Email.

*Primary Key:* StudentID.

*Data Example:* The provided data shows information for "Miriangie Rondon Mota" from the Dominican Republic, with an expected graduation year of 2026.



2\. courses

This table stores a list of all courses taken by the student.

*Columns:* course\_id, course\_code, title, semester, grade, and credit\_hours.

*Primary Key:* course\_id.

*Data Example:* The table includes entries for courses like IS120 and CM210.



3\. projects

This table details various projects the student has worked on.

*Columns:* project\_id, project\_name, description, start\_date, end\_date, and course\_id.

*Primary Key:* project\_id.

*Foreign Key:* course\_id, which links a project back to a specific course listed in the courses table.

*Data Example:* Projects include "Leveraged Wireshark to analyze Malware" and "Set up a Secure LAN for File Transfer".



4\. skills

This table contains a comprehensive list of technical skills and their proficiency levels.

*Columns*: skill\_id, skill\_name, and level (Beginner, Intermediate, Advanced).

*Primary Key:* skill\_id.

*Data Example:* The skills listed include "Wireshark," "Splunk," and "Python," all at a 'Beginner' level.



5\. projectskills

This is a junction table that connects projects to skills, allowing a single project to have multiple associated skills and a single skill to be used in multiple projects.

*Columns:* project\_id and skill\_id.

*Primary Key:* A composite key of both project\_id and skill\_id.

*Foreign Keys:* It has a foreign key to projects.project\_id and a foreign key to skills.skill\_id.





***How to Use the .sql File***

This file is a self-contained backup that can be used to recreate the entire my\_profile database.



* Open MySQL Workbench: Launch the application and connect to your local MySQL server instance.
* Open the Script: Go to File > Open SQL Script... and select Dump20250820.sql.
* Run the Script: Click the lightning bolt icon to run the entire script. 

This will create the my\_profile database, all five tables, and populate them with the data you previously exported.



