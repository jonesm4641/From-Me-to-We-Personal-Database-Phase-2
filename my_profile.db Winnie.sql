BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "BasicInfo" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"age"	INTEGER,
	"hometown"	TEXT,
	"email"	TEXT UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Education" (
	"edu_id"	INTEGER,
	"school_name"	TEXT NOT NULL,
	"degree"	TEXT,
	"grad_year"	INTEGER,
	"basicinfo_id"	INTEGER,
	PRIMARY KEY("edu_id" AUTOINCREMENT),
	FOREIGN KEY("basicinfo_id") REFERENCES "BasicInfo"("id")
);
CREATE TABLE IF NOT EXISTS "Interests" (
	"int_id"	INTEGER,
	"hobby"	TEXT NOT NULL,
	"skill_level"	TEXT,
	"category"	TEXT,
	"basicinfo_id"	INTEGER,
	PRIMARY KEY("int_id" AUTOINCREMENT),
	FOREIGN KEY("basicinfo_id") REFERENCES "BasicInfo"("id")
);
INSERT INTO "BasicInfo" VALUES (1,'Winnie Camposeco',29,'LaGrange','winnie.camposeco@oakwood.edu');
INSERT INTO "BasicInfo" VALUES (2,'Sahily Camposeco',29,'LaGrange','sahily.camposeco@oakwood.edu');
INSERT INTO "BasicInfo" VALUES (3,'Hismary Camposeco',20,'LaGrange','hismary.camposeco@oakwood.edu');
INSERT INTO "BasicInfo" VALUES (4,'Eva Hernandez',51,'LaGrange','hysmarita@hotmail.com');
INSERT INTO "BasicInfo" VALUES (5,'Rubelin Camposeco-Lopez',62,'LaGrange','rubelito_18@hotmail.com');
INSERT INTO "Education" VALUES (1,'Oakwood University','B.S. MIS',2026,1);
INSERT INTO "Education" VALUES (2,'LaGrange High School','High School Diploma',2014,1);
INSERT INTO "Education" VALUES (3,'ICAP','Middle School Diploma',2010,1);
INSERT INTO "Education" VALUES (4,'Los Pinos Elementry School','Elementry School Diploma',2007,1);
INSERT INTO "Education" VALUES (5,'Oakwood University','B. S. Accounting',2026,2);
INSERT INTO "Education" VALUES (6,'LaGrange High School','High School Diploma',2014,2);
INSERT INTO "Education" VALUES (7,'ICAP','Middle School Diploma',2010,2);
INSERT INTO "Education" VALUES (8,'Los Pinos Elementry School','Elementry School Diploma',2007,2);
INSERT INTO "Education" VALUES (9,'Oakwood University','Dietetics',2028,3);
INSERT INTO "Education" VALUES (10,'Callaway High School','High School Diploma',2024,3);
INSERT INTO "Education" VALUES (11,'Callaway Middle School','Middle School Diploma',2019,3);
INSERT INTO "Education" VALUES (12,'Ethel Knight Elementry School','Elementry School Diploma',2017,3);
INSERT INTO "Education" VALUES (13,'ICAP','High School Diploma',1990,4);
INSERT INTO "Education" VALUES (14,'ICAP','High School Diploma',1980,5);
INSERT INTO "Interests" VALUES (2,'Reading novels','Intermediate','Leisure',1);
INSERT INTO "Interests" VALUES (3,'Playing piano','Beginner','Music',1);
INSERT INTO "Interests" VALUES (4,'Cooking','Intermediate','Lifestyle',3);
INSERT INTO "Interests" VALUES (5,'Soccer','Intermediate','Sports',3);
INSERT INTO "Interests" VALUES (6,'Truck driving','Advanced','Work',5);
INSERT INTO "Interests" VALUES (7,'C++ programming','Beginner','Tech',1);
INSERT INTO "Interests" VALUES (8,'Microsoft Office 365','Intermediate','Tech',1);
INSERT INTO "Interests" VALUES (9,'Reading novels','Advanced','Leisure',2);
INSERT INTO "Interests" VALUES (10,'Receptionist','Intermediate','Work',1);
COMMIT;
