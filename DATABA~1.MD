# Personal Database - Phase 1 (amarlinsosa_db)

For this project, I created a personal relational database in MySQL called **`amarlinsosa_db`**.  
The database is designed as a simple personal profile that includes my basic information, education, and interests.  
It contains three main tables:

1. **BasicInfo**  
   - Stores general profile information such as name, age, country, hometown, and email.  
   - Example data: Amarlin Sosa, age 20, Dominican Republic, San Pedro de Macorís.  

2. **Education**  
   - Captures academic background including high school, university, certifications, degree, and graduation year.  
   - Example data: Colegio Adventista Juan Pablo Duarte, Oakwood University, CompTIA Security+, BS Computer Science, graduation year 2026.  

3. **Interests**  
   - Contains personal and professional development information such as hobbies, skills, and career path.  
   - Example data: Running and weightlifting, skills in AWS/System Design/Cloud Security, career path as Cloud Security Architect / GRC Specialist.  

### Relationships
- `person_id` is the **primary key** in `BasicInfo`.  
- Both `Education` and `Interests` use `person_id` as a **foreign key** to link back to the profile in `BasicInfo`.  

### Purpose
This database demonstrates the use of **primary keys, foreign keys, relational structure, and realistic sample records**. It serves as a foundation that can be expanded in future phases to connect with other classmates’ databases and model relationships across multiple individuals.
