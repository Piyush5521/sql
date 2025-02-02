-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: chat_application
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
-- Table structure for table `Chat_Members`
--

DROP TABLE IF EXISTS `Chat_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat_Members` (
  `user_id` int NOT NULL,
  `chat_id` int NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `notifications_muted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`,`chat_id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `Chat_Members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Chat_Members_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `Chats` (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat_Members`
--

LOCK TABLES `Chat_Members` WRITE;
/*!40000 ALTER TABLE `Chat_Members` DISABLE KEYS */;
INSERT INTO `Chat_Members` VALUES (1,1,'user',0),(2,2,'admin',0),(2,3,'user',0),(3,2,'member',0),(4,2,'member',1),(5,2,'member',0),(6,4,'admin',0),(7,2,'member',0),(8,2,'member',0);
/*!40000 ALTER TABLE `Chat_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chats`
--

DROP TABLE IF EXISTS `Chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chats` (
  `chat_id` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `time_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chats`
--

LOCK TABLES `Chats` WRITE;
/*!40000 ALTER TABLE `Chats` DISABLE KEYS */;
INSERT INTO `Chats` VALUES (1,'individual','2025-01-03 10:42:40'),(2,'group','2025-01-03 12:46:13'),(3,'individual','2025-01-03 15:58:00'),(4,'group','2025-01-06 14:26:37');
/*!40000 ALTER TABLE `Chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_table`
--

DROP TABLE IF EXISTS `Group_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `chat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `Group_table_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `Chats` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_table`
--

LOCK TABLES `Group_table` WRITE;
/*!40000 ALTER TABLE `Group_table` DISABLE KEYS */;
INSERT INTO `Group_table` VALUES (1,'Matrix','2025-01-03 13:05:22',2),(2,'Food','2025-01-06 14:29:17',4);
/*!40000 ALTER TABLE `Group_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message_Reactions`
--

DROP TABLE IF EXISTS `Message_Reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message_Reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reactions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Message_Reactions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `Messages` (`id`),
  CONSTRAINT `Message_Reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message_Reactions`
--

LOCK TABLES `Message_Reactions` WRITE;
/*!40000 ALTER TABLE `Message_Reactions` DISABLE KEYS */;
INSERT INTO `Message_Reactions` VALUES (1,2,4,'^ - ^ )'),(2,2,3,'0 - 0 )'),(3,2,5,'o > o )'),(4,4,4,'O < O ) '),(5,5,3,'O - O'),(6,4,5,'o _ o');
/*!40000 ALTER TABLE `Message_Reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `user_id` int NOT NULL,
  `messages` text,
  `delete_message` tinyint(1) DEFAULT '0',
  `media_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `parent_message_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `Chats` (`chat_id`),
  CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `Chats` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (1,1,1,'Hii',0,NULL,'2025-01-03 15:25:32',0),(2,2,2,'Hello',0,'welcome.png','2024-12-29 15:25:32',0),(3,3,2,'Hey, what\'s up!',0,NULL,'2025-01-03 15:25:32',0),(4,2,3,'Hii',0,NULL,'2025-01-03 15:25:32',3),(5,2,4,'Hello',0,NULL,'2025-01-06 15:25:32',3),(6,2,5,'Hey',0,NULL,'2025-01-03 15:25:32',3),(7,4,6,'Welcome',0,'meme.jpg','2025-01-06 15:25:32',0),(8,2,7,'Hi',0,NULL,'2025-01-06 17:25:49',3),(9,2,8,'Hey',0,NULL,'2025-01-06 17:26:33',3),(10,2,2,'Thank You ForJoining',0,NULL,'2025-01-07 10:22:24',0);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permissions`
--

DROP TABLE IF EXISTS `Permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_role` varchar(50) DEFAULT NULL,
  `can_add_member` tinyint(1) DEFAULT '0',
  `can_remove_member` tinyint(1) DEFAULT '0',
  `can_send_media` tinyint(1) DEFAULT '0',
  `can_edit_messages` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_role` (`user_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permissions`
--

LOCK TABLES `Permissions` WRITE;
/*!40000 ALTER TABLE `Permissions` DISABLE KEYS */;
INSERT INTO `Permissions` VALUES (1,'admin',1,1,1,1),(2,'member',0,0,1,0),(3,'user',0,0,1,1);
/*!40000 ALTER TABLE `Permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pinned_Messages`
--

DROP TABLE IF EXISTS `Pinned_Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pinned_Messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `message_id` int NOT NULL,
  `pinned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `Pinned_Messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `Group_table` (`id`),
  CONSTRAINT `Pinned_Messages_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `Messages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pinned_Messages`
--

LOCK TABLES `Pinned_Messages` WRITE;
/*!40000 ALTER TABLE `Pinned_Messages` DISABLE KEYS */;
INSERT INTO `Pinned_Messages` VALUES (1,1,2,'2025-01-07 04:46:34'),(2,1,10,'2025-01-07 04:52:54');
/*!40000 ALTER TABLE `Pinned_Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Read_Receipts`
--

DROP TABLE IF EXISTS `Read_Receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Read_Receipts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `message_id` int NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `Read_Receipts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Read_Receipts_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `Messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Read_Receipts`
--

LOCK TABLES `Read_Receipts` WRITE;
/*!40000 ALTER TABLE `Read_Receipts` DISABLE KEYS */;
INSERT INTO `Read_Receipts` VALUES (1,1,1,'2025-01-03 09:30:32'),(2,3,4,NULL),(3,4,5,'2025-01-06 07:32:52'),(4,5,6,NULL),(5,2,2,'2025-01-06 07:46:06');
/*!40000 ALTER TABLE `Read_Receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Typing_Indicators`
--

DROP TABLE IF EXISTS `Typing_Indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Typing_Indicators` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `chat_id` int NOT NULL,
  `is_typing` tinyint(1) DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `Typing_Indicators_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Typing_Indicators_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `Group_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Typing_Indicators`
--

LOCK TABLES `Typing_Indicators` WRITE;
/*!40000 ALTER TABLE `Typing_Indicators` DISABLE KEYS */;
INSERT INTO `Typing_Indicators` VALUES (1,2,2,1,'2025-01-07 05:10:01');
/*!40000 ALTER TABLE `Typing_Indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'sam','sam@gmail.com','Online','image.png'),(2,'Shawn','shawn@gmail.com','Offline','img.jpg'),(3,'Anna','anna@gmail.com','Offline','anna.jpg'),(4,'Juli','juli@gmail.com','Online','juli.jpg'),(5,'Ron','ron@gmail.com','Online','ron@png'),(6,'Ela','ela@gmail.com','Online','ela.jpg'),(7,'Robert','robert@gmail.com','Offline','robert.jpg'),(8,'David','david@gmail.com','Offline','david.png');
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

-- Dump completed on 2025-01-07 10:55:29
