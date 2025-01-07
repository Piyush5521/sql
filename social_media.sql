-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: Social_Media
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Add_Friends`
--

DROP TABLE IF EXISTS `Add_Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Add_Friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `request` tinyint(1) DEFAULT '1',
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `Add_Friends_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Add_Friends_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Add_Friends`
--

LOCK TABLES `Add_Friends` WRITE;
/*!40000 ALTER TABLE `Add_Friends` DISABLE KEYS */;
INSERT INTO `Add_Friends` VALUES (1,1,2,1,'2025-01-07 15:06:51'),(2,1,3,1,'2025-01-07 16:50:59'),(3,2,3,1,'2025-01-07 16:51:19');
/*!40000 ALTER TABLE `Add_Friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_comment` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,1,2,'Nice !');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friends_Request`
--

DROP TABLE IF EXISTS `Friends_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Friends_Request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receiver_id` int NOT NULL,
  `request` tinyint(1) DEFAULT NULL,
  `accepted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `request_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `Friends_Request_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Friends_Request_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `Add_Friends` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends_Request`
--

LOCK TABLES `Friends_Request` WRITE;
/*!40000 ALTER TABLE `Friends_Request` DISABLE KEYS */;
INSERT INTO `Friends_Request` VALUES (1,2,1,'2025-01-07 15:21:28',1),(2,3,1,'2025-01-07 17:18:54',2),(3,3,1,'2025-01-07 17:19:00',3);
/*!40000 ALTER TABLE `Friends_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_type` varchar(255) DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `caption` text,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,1,'Image','post.png','Hello ! This is my first post.'),(2,1,'Reel','video.mp4','Live Concert\r\n#concert'),(3,3,'Image','image.png','Blue Myth on sale !');
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts_Reactions`
--

DROP TABLE IF EXISTS `Posts_Reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posts_Reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reactions` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `reactions` (`reactions`),
  CONSTRAINT `Posts_Reactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Posts_Reactions_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`),
  CONSTRAINT `Posts_Reactions_ibfk_3` FOREIGN KEY (`reactions`) REFERENCES `Reactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts_Reactions`
--

LOCK TABLES `Posts_Reactions` WRITE;
/*!40000 ALTER TABLE `Posts_Reactions` DISABLE KEYS */;
INSERT INTO `Posts_Reactions` VALUES (1,1,2,3),(2,1,3,4);
/*!40000 ALTER TABLE `Posts_Reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reactions`
--

DROP TABLE IF EXISTS `Reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reaction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reactions`
--

LOCK TABLES `Reactions` WRITE;
/*!40000 ALTER TABLE `Reactions` DISABLE KEYS */;
INSERT INTO `Reactions` VALUES (1,'Like'),(2,'Smile'),(3,'Clap'),(4,'Congratulations'),(5,'Wow');
/*!40000 ALTER TABLE `Reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Tony','tony@gmail.com','Online','tony.jpg'),(2,'Jessy','jessy@gmail.com','Online','jessy.jpg'),(3,'Heisenberg','heisenberg@gmail.com','Online','heisenberg.jpg');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 18:36:52
