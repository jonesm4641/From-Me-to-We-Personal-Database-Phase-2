-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: my_profile
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basicinfo`
--

DROP TABLE IF EXISTS `basicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basicinfo` (
  `StudentID` int NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Hometown` varchar(255) DEFAULT NULL,
  `ExpectedGraduationYear` int DEFAULT NULL,
  `GitHub` varchar(255) DEFAULT NULL,
  `LinkedIn` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicinfo`
--

LOCK TABLES `basicinfo` WRITE;
/*!40000 ALTER TABLE `basicinfo` DISABLE KEYS */;
INSERT INTO `basicinfo` VALUES (1,'Miriangie Rondon Mota','Dominican Republic',2026,'Miriangierondon','Miriangie Rondon Mota','miriangierondonm@hotmail.com');
/*!40000 ALTER TABLE `basicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `credit_hours` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'IS120','Microcomputer Applications','Fall 2023','A',3.00),(2,'CM210','Computer Science I with C++','Spring 2024','A',3.00),(3,'IS250','Bus Application in Excel & Access','Fall 2024','A',3.00),(4,'IS315','Multimedia Applications','Fall 2024','A',3.00),(5,'IS325','Web Design & Development','Spring 2024','A',3.00),(6,'IS330','Network Mgmt & Telecommunications','Fall 2024','A',3.00),(7,'IS340','Advanced Business Networks','Spring 2025','A',3.00),(8,'IS415','Database Design & Implement','Fall 2025','TBA',3.00),(9,'IS425','Information Security & Policy','Fall 2025','TBA',3.00),(10,'IS440','Systems Analysis & Project Mgmt','Spring 2026','TBA',3.00);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Leveraged Wireshark to analyze Malware','Identified malicious traffic patterns and recommended firewall blocks to mitigate risks.',NULL,NULL,8),(2,'Set up a Secure LAN for File Transfer','Established an isolated Ethernet LAN enabling encrypted file sharing with MD5 hash verification for data integrity.',NULL,NULL,8),(3,'Leveraged Wireshark to analyze and inspect HTTP traffic','Captured and filtered HTTP traffic to analyze headers/payloads, identifying insecure practices.',NULL,NULL,8),(4,'Created an Incident Response Plan for WAW Inc','Developed a structured IRP with severity classifications, containment protocols, and zero-trust policies.',NULL,NULL,8),(5,'Built a Home Malware Detection Lab','Integrated Splunk & Sysmon on Windows 10 to log and analyze malware, detecting IoCs like reverse TCP connections.',NULL,NULL,8);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectskills`
--

DROP TABLE IF EXISTS `projectskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectskills` (
  `project_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`project_id`,`skill_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `projectskills_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `projectskills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectskills`
--

LOCK TABLES `projectskills` WRITE;
/*!40000 ALTER TABLE `projectskills` DISABLE KEYS */;
INSERT INTO `projectskills` VALUES (1,2),(3,2),(2,3),(1,4),(4,4),(5,4),(1,5),(3,5),(4,5),(4,6),(5,6),(4,7),(2,8),(5,8),(5,11),(5,12),(1,13),(2,13),(3,13),(4,13),(5,14);
/*!40000 ALTER TABLE `projectskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(50) NOT NULL,
  `level` enum('Beginner','Intermediate','Advanced') NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_name` (`skill_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Network Security','Beginner'),(2,'Vulnerability Assessment','Beginner'),(3,'Data Encryption','Beginner'),(4,'SIEM','Beginner'),(5,'Wireshark','Beginner'),(6,'Splunk','Beginner'),(7,'Nmap','Beginner'),(8,'Python','Beginner'),(9,'Threat Classification','Beginner'),(10,'Defense in Depth','Beginner'),(11,'Zero Trust','Beginner'),(12,'Virtual Machines','Beginner'),(13,'LAN Setup','Beginner'),(14,'Windows','Beginner'),(15,'Kali Linux','Beginner'),(16,'IDS/IPS Basics','Beginner'),(17,'Sysmon','Beginner'),(18,'TryHackMe','Beginner'),(19,'Suricata','Beginner');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 21:08:17
