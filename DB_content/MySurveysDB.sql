-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mysurveys
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `survey_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `options` varchar(250) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_id` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Choose product: ',1,'dropdown','\"Product1\", \"Product2\", \"Product3\"'),(2,'Would you recommend the product?',1,'radiobutton','\"Would recommend\", \"Would not recommend\"'),(3,'Which of the following words would you use to describe our products?',1,'checkbox','\"Reliable\",\"High Quality\",\"Usefull\", \"Impractical\",\"Poor quality\"'),(4,'How likely are you to purchase any of our products again?',1,'radiobutton','\"Extremely likely\", \"Somewhat likely\", \"Not likely\"'),(5,'How would you rate the value for money of the product?',1,'radiobutton','\"Excellent\", \"Above average\", \"Average\", \"Below average\", \"Poor\"'),(6,'What\'s your gender?',2,'dropdown','\"Male\",\"Female\",\"Alien\"'),(7,'What\'s your usual way to move around the city?',2,'radiobutton','\"On foot\",\"Public Bicycle\",\"Own a bicycle\"'),(8,'Do you own a bicycle?',2,'checkbox','\"None\", \"1-2\", \"3+\"'),(9,'How often do you use your bicycle?',2,'radiobutton','\"1-3 days a week\",\"4+ days a week\",\"Couple times a month\"'),(10,'What infrastructure do you think the city is lacking?',2,'checkbox','\"Bike-lanes\",\"Public bike stations\",\"Secure bike-parking\"'),(11,'\"Quiz question 1\"',3,'radiobutton','\"Answer1\",\"Answer2\"'),(12,'\"Quiz question 2\"',3,'radiobutton','\"Answer1\",\"Answer2\"'),(13,'\"Quiz question 3\"',3,'radiobutton','\"Answer1\",\"Answer2\"'),(14,'\"Quiz question 4\"',3,'radiobutton','\"Answer1\",\"Answer2\"');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `answer` varchar(200) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `item_date` timestamp NULL DEFAULT NULL,
  `survey_id` int NOT NULL,
  `group_id` varchar(13) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `question_id` (`question_id`),
  KEY `survey_id` (`survey_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (21,1,'Product1',NULL,NULL,1,'1585341266669'),(22,2,'Would recommend',NULL,NULL,1,'1585341266669'),(23,3,'Reliable',NULL,NULL,1,'1585341266669'),(24,4,'Extremely likely',NULL,NULL,1,'1585341266669'),(25,5,'Excellent',NULL,NULL,1,'1585341266669'),(26,1,'Product1',NULL,NULL,1,'1585341532222'),(27,2,'Would recommend',NULL,NULL,1,'1585341532222'),(28,3,'Reliable',NULL,NULL,1,'1585341532222'),(29,4,'Extremely likely',NULL,NULL,1,'1585341532222'),(30,5,'Excellent',NULL,NULL,1,'1585341532222'),(31,1,'Product1',NULL,NULL,1,'1585341686691'),(32,2,'Would recommend',NULL,NULL,1,'1585341686691'),(33,3,'Reliable',NULL,NULL,1,'1585341686691'),(34,4,'Extremely likely',NULL,NULL,1,'1585341686691'),(35,5,'Excellent',NULL,NULL,1,'1585341686691'),(36,1,'Product1',NULL,NULL,1,'1585341829053'),(37,2,'Would recommend',NULL,NULL,1,'1585341829053'),(38,3,'Reliable',NULL,NULL,1,'1585341829053'),(39,4,'Extremely likely',NULL,NULL,1,'1585341829053'),(40,5,'Excellent',NULL,NULL,1,'1585341829053'),(41,1,'Product1',NULL,NULL,1,'1585341917306'),(42,2,'Would recommend',NULL,NULL,1,'1585341917306'),(43,3,'Reliable',NULL,NULL,1,'1585341917306'),(44,4,'Extremely likely',NULL,NULL,1,'1585341917306'),(45,5,'Excellent',NULL,NULL,1,'1585341917306'),(46,1,'Product1',NULL,NULL,1,'1585341917446'),(47,2,'Would recommend',NULL,NULL,1,'1585341917446'),(48,3,'Reliable',NULL,NULL,1,'1585341917446'),(49,4,'Extremely likely',NULL,NULL,1,'1585341917446'),(50,5,'Excellent',NULL,NULL,1,'1585341917446'),(51,1,'Product1',NULL,NULL,1,'1585342060989'),(52,2,'Would recommend',NULL,NULL,1,'1585342060989'),(53,3,'Reliable',NULL,NULL,1,'1585342060989'),(54,4,'Extremely likely',NULL,NULL,1,'1585342060989'),(55,5,'Excellent',NULL,NULL,1,'1585342060989'),(56,1,'Product1',NULL,NULL,1,'1585342061522'),(57,2,'Would recommend',NULL,NULL,1,'1585342061522'),(58,3,'Reliable',NULL,NULL,1,'1585342061522'),(59,4,'Extremely likely',NULL,NULL,1,'1585342061522'),(60,5,'Excellent',NULL,NULL,1,'1585342061522'),(61,1,'Product1',NULL,NULL,1,'1585345654933'),(62,2,'Would recommend',NULL,NULL,1,'1585345654933'),(63,3,'Reliable',NULL,NULL,1,'1585345654933'),(64,4,'Extremely likely',NULL,NULL,1,'1585345654933'),(65,5,'Excellent',NULL,NULL,1,'1585345654933'),(66,1,'Product1',NULL,NULL,1,'1585346079387'),(67,2,'Would recommend',NULL,NULL,1,'1585346079387'),(68,3,'Reliable',NULL,NULL,1,'1585346079387'),(69,4,'Extremely likely',NULL,NULL,1,'1585346079387'),(70,5,'Excellent',NULL,NULL,1,'1585346079387'),(71,1,'Product1',NULL,NULL,1,'1585346234095'),(72,2,'Would recommend',NULL,NULL,1,'1585346234095'),(73,3,'Reliable',NULL,NULL,1,'1585346234095'),(74,4,'Extremely likely',NULL,NULL,1,'1585346234095'),(75,5,'Excellent',NULL,NULL,1,'1585346234095'),(76,1,'Product1',NULL,NULL,1,'1585346234564'),(77,2,'Would recommend',NULL,NULL,1,'1585346234564'),(78,3,'Reliable',NULL,NULL,1,'1585346234564'),(79,4,'Extremely likely',NULL,NULL,1,'1585346234564'),(80,5,'Excellent',NULL,NULL,1,'1585346234564'),(81,1,'Product1',NULL,NULL,1,'1585346396791'),(82,2,'Would recommend',NULL,NULL,1,'1585346396791'),(83,3,'Reliable',NULL,NULL,1,'1585346396791'),(84,4,'Extremely likely',NULL,NULL,1,'1585346396791'),(85,5,'Excellent',NULL,NULL,1,'1585346396791'),(86,1,'Product1',NULL,NULL,1,'1585346520459'),(87,2,'Would recommend',NULL,NULL,1,'1585346520459'),(88,3,'Reliable',NULL,NULL,1,'1585346520459'),(89,4,'Extremely likely',NULL,NULL,1,'1585346520459'),(90,5,'Excellent',NULL,NULL,1,'1585346520459'),(91,1,'Product1',NULL,NULL,1,'1585347180348'),(92,2,'Would recommend',NULL,NULL,1,'1585347180348'),(93,3,'Reliable',NULL,NULL,1,'1585347180348'),(94,4,'Extremely likely',NULL,NULL,1,'1585347180348'),(95,5,'Excellent',NULL,NULL,1,'1585347180348'),(96,1,'Product1',NULL,NULL,1,'1585350917617'),(97,2,'Would recommend',NULL,NULL,1,'1585350917617'),(98,3,'Reliable',NULL,NULL,1,'1585350917617'),(99,4,'Extremely likely',NULL,NULL,1,'1585350917617'),(100,5,'Excellent',NULL,NULL,1,'1585350917617');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `title` varchar(50) NOT NULL,
  `description` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `survey_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES ('Satisfaction','Product satisfaction survey','2020-03-22 07:40:37','2020-03-22 07:40:37',1),('Urban ciclying','Urban cycling survey','2020-03-22 07:40:38','2020-03-22 07:40:38',2),('Cycling quiz','Questions about urban cycling','2020-03-22 07:40:38','2020-03-22 07:40:38',3);
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mysurveys'
--

--
-- Dumping routines for database 'mysurveys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-28  9:44:06
