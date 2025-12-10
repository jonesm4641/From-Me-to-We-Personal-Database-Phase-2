-- MySQL 8 compatible dump converted from SQLite
-- Source: MyPersonalDatabase.db
-- Generated: 2025-09-12T17:33:12.085565Z
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `BasicPersonalInfo` (
  `ID` INT AUTO_INCREMENT NOT NULL,
  `Full_Name` TEXT,
  `Age` INT,
  `Hometown` TEXT
) ENGINE=InnoDB;

CREATE TABLE `Education_History` (
  `Edu_ID` INT,
  `Person_ID` INT,
  `School_Name` TEXT,
  `Degree_And_Major` TEXT,
  `Grad_Year` INT,
  PRIMARY KEY (`Edu_ID`),
  CONSTRAINT `fk_Education_History_Person_ID` FOREIGN KEY (`Person_ID`) REFERENCES `BasicPersonalInfo`(`ID`)
) ENGINE=InnoDB;

CREATE TABLE `Skills` (
  `Skill_ID` INT AUTO_INCREMENT,
  `Person_ID` INT,
  `Skill_Name` TEXT,
  `Proficiency` TEXT,
  CONSTRAINT `fk_Skills_Person_ID` FOREIGN KEY (`Person_ID`) REFERENCES `BasicPersonalInfo`(`ID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS=1;

-- Data for `BasicPersonalInfo`
INSERT INTO `BasicPersonalInfo` (`ID`,`Full_Name`,`Age`,`Hometown`) VALUES (1,'Marc-Anthony Jones',24,'Huntsville, AL');
INSERT INTO `BasicPersonalInfo` (`ID`,`Full_Name`,`Age`,`Hometown`) VALUES (2,'John Smith',25,'Fredrick, TN');
INSERT INTO `BasicPersonalInfo` (`ID`,`Full_Name`,`Age`,`Hometown`) VALUES (3,'Alex Wish',58,'Washington, DC');
INSERT INTO `BasicPersonalInfo` (`ID`,`Full_Name`,`Age`,`Hometown`) VALUES (4,'Bye Cry',1,'Fayetteville,TN');
INSERT INTO `BasicPersonalInfo` (`ID`,`Full_Name`,`Age`,`Hometown`) VALUES (5,'Karl Towns',30,'New York, NY');

-- Data for `Education_History`
INSERT INTO `Education_History` (`Edu_ID`,`Person_ID`,`School_Name`,`Degree_And_Major`,`Grad_Year`) VALUES (1,1,'Oakwood University','BS. MIS.',2026);
INSERT INTO `Education_History` (`Edu_ID`,`Person_ID`,`School_Name`,`Degree_And_Major`,`Grad_Year`) VALUES (2,2,'Carl College','AS. Music App.',2030);
INSERT INTO `Education_History` (`Edu_ID`,`Person_ID`,`School_Name`,`Degree_And_Major`,`Grad_Year`) VALUES (3,3,'Southern College','BS. Gen Ed.',2025);
INSERT INTO `Education_History` (`Edu_ID`,`Person_ID`,`School_Name`,`Degree_And_Major`,`Grad_Year`) VALUES (4,4,'North University','MD. Sports Medicine',2024);
INSERT INTO `Education_History` (`Edu_ID`,`Person_ID`,`School_Name`,`Degree_And_Major`,`Grad_Year`) VALUES (5,5,'West College','MD. Physical Therapy',2023);

-- Data for `Skills`
INSERT INTO `Skills` (`Skill_ID`,`Person_ID`,`Skill_Name`,`Proficiency`) VALUES (1,1,'Technical Consultation','Professional');
INSERT INTO `Skills` (`Skill_ID`,`Person_ID`,`Skill_Name`,`Proficiency`) VALUES (2,2,'Music','Intermediate');
INSERT INTO `Skills` (`Skill_ID`,`Person_ID`,`Skill_Name`,`Proficiency`) VALUES (3,3,'Research','Expert');
INSERT INTO `Skills` (`Skill_ID`,`Person_ID`,`Skill_Name`,`Proficiency`) VALUES (4,4,'Music','Beginner');
INSERT INTO `Skills` (`Skill_ID`,`Person_ID`,`Skill_Name`,`Proficiency`) VALUES (5,5,'Medical Documentation','Professional');
