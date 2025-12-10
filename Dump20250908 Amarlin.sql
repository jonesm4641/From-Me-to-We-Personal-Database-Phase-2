-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: amarlinsosa_db
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
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `hometown` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicinfo`
--

LOCK TABLES `basicinfo` WRITE;
/*!40000 ALTER TABLE `basicinfo` DISABLE KEYS */;
INSERT INTO `basicinfo` VALUES (1,'Amarlin Sosa',20,'Dominican Republic','San Pedro de Macoris, SPM','amarlingsp@gmail.com'),(2,'Amarlin Sosa',20,'Dominican Republic','San Pedro de Macoris, SPM','amarlingsp@gmail.com');
/*!40000 ALTER TABLE `basicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `edu_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `highschool_name` varchar(100) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  `certification` varchar(100) DEFAULT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `grad_year` year DEFAULT NULL,
  PRIMARY KEY (`edu_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `basicinfo` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,1,'Colegio Adventista Juan Pablo Duarte','Oakwood University','CompTIA Security+','BS Computer Science',2026),(2,1,'Colegio Adventista Juan Pablo Duarte','Oakwood University','CompTIA Security+','BS Computer Science',2026);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interests` (
  `interest_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `hobbies` varchar(200) DEFAULT NULL,
  `skills` varchar(200) DEFAULT NULL,
  `career_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`interest_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `basicinfo` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (1,1,'Running, Weightlifting','AWS, System Design, Cloud Security','Cloud Security Architect / GRC Specialist'),(2,1,'Running, Weightlifting','AWS, System Design, Cloud Security','Cloud Security Architect / GRC Specialist');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08 19:12:04
