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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Add_Friends`
--

LOCK TABLES `Add_Friends` WRITE;
/*!40000 ALTER TABLE `Add_Friends` DISABLE KEYS */;
INSERT INTO `Add_Friends` VALUES (1,1,2,1,'2025-01-07 15:06:51'),(2,1,3,1,'2025-01-07 16:50:59'),(3,2,3,1,'2025-01-07 16:51:19'),(4,1,4,1,'2025-01-08 15:25:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends_Request`
--

LOCK TABLES `Friends_Request` WRITE;
/*!40000 ALTER TABLE `Friends_Request` DISABLE KEYS */;
INSERT INTO `Friends_Request` VALUES (1,2,1,'2025-01-07 15:21:28',1),(2,3,1,'2025-01-07 17:18:54',2),(3,3,1,'2025-01-07 17:19:00',3),(4,4,NULL,'2025-01-08 15:26:11',4);
/*!40000 ALTER TABLE `Friends_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pages`
--

DROP TABLE IF EXISTS `Pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `admin_id` int NOT NULL,
  `page_description` varchar(255) DEFAULT NULL,
  `page_visibility` int NOT NULL,
  `page_status` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `page_visiblility` (`page_visibility`),
  KEY `category` (`category`),
  CONSTRAINT `Pages_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Pages_ibfk_2` FOREIGN KEY (`page_visibility`) REFERENCES `page_visibility_permisssions` (`id`),
  CONSTRAINT `Pages_ibfk_3` FOREIGN KEY (`category`) REFERENCES `pages_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pages`
--

LOCK TABLES `Pages` WRITE;
/*!40000 ALTER TABLE `Pages` DISABLE KEYS */;
INSERT INTO `Pages` VALUES (1,'Happy',7,2,'How to be happy in life',1,'Keep smile !','2025-01-08 09:44:42'),(2,'Tuco Life',7,4,'Tuco\'s Life! ',2,'Sometimes you got to rob to keep your riches.','2025-01-08 12:13:32');
/*!40000 ALTER TABLE `Pages` ENABLE KEYS */;
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
  `post_type` int NOT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `caption` text,
  `upload_context` int NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `upload_context` (`upload_context`),
  KEY `post_type` (`post_type`),
  CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Posts_ibfk_2` FOREIGN KEY (`upload_context`) REFERENCES `posts_context` (`id`),
  CONSTRAINT `Posts_ibfk_3` FOREIGN KEY (`post_type`) REFERENCES `posts_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,1,1,'post.png','Hello ! This is my first post.',1),(2,1,3,'video.mp4','Live Concert\r\n#concert',1),(3,3,1,'image.png','Blue Myth on sale !',1),(4,2,1,'van.jpg','My new van',2),(5,4,1,'tuco_teeth.jpg','My new teeth ',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Tony','tony@gmail.com','Online','tony.jpg'),(2,'Jessy','jessy@gmail.com','Online','jessy.jpg'),(3,'Heisenberg','heisenberg@gmail.com','Online','heisenberg.jpg'),(4,'Tuco','tuco@gmail.com','Online','tuco.jpg');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_members`
--

DROP TABLE IF EXISTS `page_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `member_id` int NOT NULL,
  `member_role` int NOT NULL,
  `joined_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `member_id` (`member_id`),
  KEY `member_role` (`member_role`),
  CONSTRAINT `page_members_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `Pages` (`id`),
  CONSTRAINT `page_members_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `page_members_ibfk_3` FOREIGN KEY (`member_role`) REFERENCES `page_members_permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_members`
--

LOCK TABLES `page_members` WRITE;
/*!40000 ALTER TABLE `page_members` DISABLE KEYS */;
INSERT INTO `page_members` VALUES (1,1,1,1,'2025-01-08 10:02:18'),(2,2,4,1,'2025-01-08 12:14:22'),(3,2,3,2,'2025-01-08 12:19:25'),(4,1,3,2,'2025-01-08 13:01:06');
/*!40000 ALTER TABLE `page_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_members_permissions`
--

DROP TABLE IF EXISTS `page_members_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_members_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_role` varchar(255) DEFAULT NULL,
  `can_upload_post` tinyint(1) DEFAULT NULL,
  `can_remove_people` tinyint(1) DEFAULT NULL,
  `can_remove_posts` tinyint(1) DEFAULT NULL,
  `can_edit_page` tinyint(1) DEFAULT NULL,
  `can_delete_page` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_members_permissions`
--

LOCK TABLES `page_members_permissions` WRITE;
/*!40000 ALTER TABLE `page_members_permissions` DISABLE KEYS */;
INSERT INTO `page_members_permissions` VALUES (1,'admin',1,1,1,1,1),(2,'member',0,0,0,0,0),(3,'moderator',1,1,1,0,0);
/*!40000 ALTER TABLE `page_members_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_visibility_permisssions`
--

DROP TABLE IF EXISTS `page_visibility_permisssions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_visibility_permisssions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visibility` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_visibility_permisssions`
--

LOCK TABLES `page_visibility_permisssions` WRITE;
/*!40000 ALTER TABLE `page_visibility_permisssions` DISABLE KEYS */;
INSERT INTO `page_visibility_permisssions` VALUES (1,'public'),(2,'private');
/*!40000 ALTER TABLE `page_visibility_permisssions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_categories`
--

DROP TABLE IF EXISTS `pages_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_categories`
--

LOCK TABLES `pages_categories` WRITE;
/*!40000 ALTER TABLE `pages_categories` DISABLE KEYS */;
INSERT INTO `pages_categories` VALUES (1,'sports'),(2,'fitness'),(3,'movies'),(4,'music'),(5,'food'),(6,'beauty'),(7,'life'),(8,'store'),(9,'business'),(10,'education'),(11,'shopping'),(12,'art_gallery'),(13,'cars'),(14,'blog'),(15,'news'),(16,'organisations'),(17,'services');
/*!40000 ALTER TABLE `pages_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_context`
--

DROP TABLE IF EXISTS `posts_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_context` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_context`
--

LOCK TABLES `posts_context` WRITE;
/*!40000 ALTER TABLE `posts_context` DISABLE KEYS */;
INSERT INTO `posts_context` VALUES (1,'individual'),(2,'page');
/*!40000 ALTER TABLE `posts_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_type`
--

DROP TABLE IF EXISTS `posts_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_type`
--

LOCK TABLES `posts_type` WRITE;
/*!40000 ALTER TABLE `posts_type` DISABLE KEYS */;
INSERT INTO `posts_type` VALUES (1,'image'),(2,'carousel'),(3,'reel'),(4,'story');
/*!40000 ALTER TABLE `posts_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 16:25:08
