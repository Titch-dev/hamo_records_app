-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: hamo_records_db
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `hamo_stage_one_status`
--

DROP TABLE IF EXISTS `hamo_stage_one_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamo_stage_one_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Pending','Passed','Failed') NOT NULL DEFAULT 'Pending',
  `failure_message` varchar(255) NOT NULL DEFAULT '',
  `datetime_processed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamo_stage_one_status`
--

LOCK TABLES `hamo_stage_one_status` WRITE;
/*!40000 ALTER TABLE `hamo_stage_one_status` DISABLE KEYS */;
INSERT INTO `hamo_stage_one_status` VALUES (8,'Pending','','2019-11-30 06:03:49'),(9,'Pending','','2019-11-30 06:04:41'),(10,'Pending','','2019-12-02 06:34:00'),(11,'Pending','','2019-12-09 05:47:05'),(12,'Pending','','2020-01-03 13:55:16');
/*!40000 ALTER TABLE `hamo_stage_one_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamo_stage_three_status`
--

DROP TABLE IF EXISTS `hamo_stage_three_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamo_stage_three_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Pending','Passed','Failed') NOT NULL DEFAULT 'Pending',
  `failure_message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamo_stage_three_status`
--

LOCK TABLES `hamo_stage_three_status` WRITE;
/*!40000 ALTER TABLE `hamo_stage_three_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `hamo_stage_three_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamo_stage_two_status`
--

DROP TABLE IF EXISTS `hamo_stage_two_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamo_stage_two_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Pending','Passed','Failed') NOT NULL DEFAULT 'Pending',
  `failure_message` varchar(255) NOT NULL DEFAULT '',
  `datetime_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_checked` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamo_stage_two_status`
--

LOCK TABLES `hamo_stage_two_status` WRITE;
/*!40000 ALTER TABLE `hamo_stage_two_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `hamo_stage_two_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamo_wash_cycle`
--

DROP TABLE IF EXISTS `hamo_wash_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamo_wash_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hamo_machine_id` varchar(12) NOT NULL DEFAULT '',
  `hamo_stage_one_status_id` int(11) DEFAULT NULL,
  `hamo_stage_two_status_id` int(11) DEFAULT NULL,
  `hamo_stage_three_status_id` int(11) DEFAULT NULL,
  `calibration_expiry_date` date DEFAULT NULL,
  `daily_test_confirmation` enum('Yes','No') DEFAULT NULL,
  `wash_type` enum('Full Wash','Rinse Wash') DEFAULT NULL,
  `full_wash_chemical_list` varchar(255) DEFAULT NULL,
  `rinse_wash_tubing_list` varchar(255) DEFAULT NULL,
  `pre_wash_passed` enum('Yes','No','N/A') DEFAULT 'N/A',
  `caustic_wash_passed` enum('Yes','No','N/A') DEFAULT 'N/A',
  `acid_wash_passed` enum('Yes','No','N/A') DEFAULT 'N/A',
  `final_rinse_passed` enum('Yes','No') DEFAULT NULL,
  `drying_stage_passed` enum('Yes','No') DEFAULT NULL,
  `wash_expiration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_hidden` int(11) DEFAULT '0',
  `load_type` varchar(255) NOT NULL DEFAULT '',
  `cycle_result` enum('Pass','Fail','Pending') NOT NULL DEFAULT 'Pending',
  `comments` varchar(500) NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamo_wash_cycle`
--

LOCK TABLES `hamo_wash_cycle` WRITE;
/*!40000 ALTER TABLE `hamo_wash_cycle` DISABLE KEYS */;
INSERT INTO `hamo_wash_cycle` VALUES (1,'2020-01-10 17:10:12','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-10 17:10:12',0,'','Pending','N/A'),(2,'2020-01-13 08:52:16','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 08:52:16',1,'','Pending','N/A'),(3,'2020-01-13 08:55:07','Hamo 01',1,1,0,NULL,NULL,'Rinse Wash','NA','lj lj :2020-01-15',NULL,NULL,NULL,NULL,NULL,'2020-01-13 08:55:07',1,'','Pending','N/A'),(4,'2020-01-13 09:28:51','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 09:28:51',1,'','Pending','N/A'),(5,'2020-01-13 10:44:00','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-09 | test:2020-01-16','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-13 10:44:00',1,'','Pending','N/A'),(6,'2020-01-13 10:46:54','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-17 | test:2020-01-17','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-13 10:46:54',0,'','Pending','N/A'),(7,'2020-01-13 10:49:33','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-30 | test:2020-01-16','NA','Yes','Yes','Yes','Yes','Yes','2020-01-13 10:49:33',0,'','Pending','N/A'),(8,'2020-01-13 12:45:39','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 12:45:39',0,'','Pending','N/A'),(9,'2020-01-14 17:35:06','Hamo 02',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-19','Yes','Yes','Yes','Yes','Yes','2020-01-14 17:35:06',0,'','Pending','N/A'),(10,'2020-01-14 17:54:36','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','test:2020-01-31','Yes','Yes','Yes','Yes','Yes','2020-01-14 17:54:36',0,'','Pending','N/A'),(11,'2020-01-14 18:00:51','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-31 | test:2020-01-17','NA','Yes','Yes','Yes','Yes','Yes','2020-01-14 18:00:51',0,'','Pending','N/A'),(12,'2020-01-14 18:09:35','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-31 | test:2020-01-24','NA','Yes','Yes','Yes','Yes','Yes','2020-01-14 18:09:35',0,'','Pending','N/A'),(13,'2020-01-14 18:13:26','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-14 18:13:26',0,'','Pending','N/A'),(14,'2020-01-14 18:27:42','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-14 18:27:42',0,'','Pending','N/A'),(15,'2020-01-14 18:37:03','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-24','Yes','Yes','Yes','Yes','Yes','2020-01-14 18:37:03',0,'SD200: Vessel 3 | Manifold 4','Pending','N/A'),(16,'2020-01-15 08:33:47','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-25 | test:2020-01-25','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-15 08:33:47',0,'SD500: Vessel 4 | Manifold 1','Pending','N/A'),(17,'2020-01-15 08:38:18','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-31','Yes','Yes','Yes','Yes','Yes','2020-01-15 08:38:18',0,'SD100: Vessel 1 | Manifold 2','Pass','N/A'),(18,'2020-01-15 09:10:35','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-17 | test:2020-01-17','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-15 09:10:35',0,'SD100: Vessel 2 | Manifold 2','Pending','N/A'),(19,'2020-01-15 09:43:11','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-31 | test:2020-01-11','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-15 09:43:11',0,'SD200: Vessel 3 | Manifold 3','Pending','N/A'),(20,'2020-01-15 09:44:50','Hamo 02',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-31','Yes','Yes','Yes','Yes','Yes','2020-01-25 09:45:23',0,'SD100: Vessel 1 | Manifold 1','Pass','N/A'),(21,'2020-01-15 11:46:00','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-31 | test:2020-01-31','NA','Yes','Yes','Yes','Yes','Yes','2020-01-25 11:46:35',0,'SD200: Vessel 3 | Manifold 5','Pass','N/A'),(22,'2020-01-15 11:48:35','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 11:48:35',0,'','Pending','N/A'),(23,'2020-01-15 11:48:46','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-23','Yes','Yes','Yes','No','Yes','2020-01-25 11:49:18',0,'SD100: Vessel 1 | Manifold 1','Pass','N/A'),(24,'2020-01-15 11:50:09','Hamo 02',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-23','Yes','Yes','Yes','Yes','Yes','2020-01-25 11:50:40',0,'SD200: Vessel 3 | Manifold 5','Pass','N/A'),(25,'2020-01-15 11:51:22','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-31','Yes','Yes','Yes','Yes','Yes','2020-01-25 11:52:20',0,'SD200: Vessel 3 | Manifold 3','Pass','N/A'),(26,'2020-01-15 11:58:05','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-30','Yes','Yes','Yes','Yes','Yes','2020-01-25 11:58:36',0,'SD100: Vessel 2 | Manifold 2','Pass','N/A'),(27,'2020-01-15 12:14:59','Hamo 01',1,1,0,NULL,NULL,'Rinse Wash','NA','test:2020-01-17',NULL,NULL,NULL,NULL,NULL,'2020-01-15 12:14:59',0,'SD200: Vessel 3 | Manifold 4','Pending','N/A'),(28,'2020-01-15 12:16:51','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-31','Yes','Yes','Yes','Yes','Yes','2020-01-25 12:17:29',0,'SD200: Vessel 3 | Manifold 5','Pass','N/A'),(29,'2020-01-15 12:18:19','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 12:18:19',0,'','Pending','N/A'),(30,'2020-01-15 12:28:51','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','test:2020-01-23','Yes','Yes','Yes','Yes','Yes','2020-01-25 12:30:11',0,'SD100: Vessel 1 | Manifold 1','Pass','N/A'),(31,'2020-01-15 13:13:14','Hamo 02',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:13:14',0,'','Pending','N/A'),(32,'2020-01-15 13:22:17','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:22:17',0,'','Pending','N/A'),(33,'2020-01-15 13:24:50','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:24:50',0,'','Pending','N/A'),(34,'2020-01-15 13:27:44','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:27:44',0,'','Pending','N/A'),(35,'2020-01-15 13:29:55','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:29:55',0,'','Pending','N/A'),(36,'2020-01-15 13:31:28','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:31:28',0,'','Pending','N/A'),(37,'2020-01-15 13:33:38','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:33:38',0,'','Pending','N/A'),(38,'2020-01-15 13:34:24','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-15 13:34:24',0,'','Pending','N/A'),(39,'2020-01-15 13:41:55','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-24','No','Yes','No','Yes','Yes','2020-01-25 13:44:09',0,'SD200: Vessel 3 | Manifold 5','Pass','N/A'),(40,'2020-01-15 13:47:55','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-31 | test:2020-01-24','NA','Yes','Yes','Yes','Yes','Yes','2020-01-25 13:49:02',0,'SD100: Vessel 2 | Manifold 2','Pass','Test TestTestTestTestTestTestTestTestTestTestTestTest'),(41,'2020-01-16 22:54:18','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','NA','Test:2020-01-24','Yes','Yes','Yes','Yes','Yes','2020-01-26 22:57:42',0,'SD200: Vessel 3 | Manifold 3','Pass',''),(42,'2020-01-17 02:12:21','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-17 02:12:21',0,'','Pending','N/A'),(43,'2020-01-17 03:06:25','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-17 03:06:25',0,'','Pending','N/A'),(44,'2020-01-17 03:14:02','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-17 03:14:02',0,'','Pending','N/A'),(45,'2020-01-19 00:03:34','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-19 00:03:34',0,'','Pending','N/A'),(46,'2020-01-19 00:08:32','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-19 00:08:32',0,'','Pending','N/A'),(47,'2020-01-19 07:18:04','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test: | :','NA','Yes','Yes','Yes','Yes','Yes','2020-01-29 07:19:50',0,'SD200: Vessel 3 | Manifold 4','Pass','test'),(48,'2020-01-20 02:58:01','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-17 | test:2020-01-25','NA','Yes','Yes','Yes','Yes','Yes','2020-01-30 02:59:07',0,'SD100: Vessel 1 | Manifold 1','Pass',',jx kjbdfljvnldfn'),(49,'2020-01-21 01:18:10','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:18:10',0,'','Pending','N/A'),(50,'2020-01-21 01:46:37','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:46:37',0,'','Pending','N/A'),(51,'2020-01-21 01:46:48','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:46:48',0,'','Pending','N/A'),(52,'2020-01-21 01:48:07','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:48:07',0,'','Pending','N/A'),(53,'2020-01-21 01:50:20','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:50:20',0,'','Pending','N/A'),(54,'2020-01-21 01:52:49','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:52:49',0,'','Pending','N/A'),(55,'2020-01-21 01:53:58','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 01:53:58',0,'','Pending','N/A'),(56,'2020-01-21 09:57:15','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 09:57:15',0,'','Pending','N/A'),(57,'2020-01-21 09:58:56','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 09:58:56',0,'','Pending','N/A'),(58,'2020-01-21 17:02:59','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:02:59',0,'','Pending','N/A'),(59,'2020-01-21 17:05:04','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:05:04',0,'','Pending','N/A'),(60,'2020-01-21 17:10:17','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:10:17',0,'','Pending','N/A'),(61,'2020-01-21 17:13:27','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-10 | test:2020-01-25','N/A',NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:13:27',0,'SD200: Vessel 3 | Manifold 3','Pending','N/A'),(62,'2020-01-21 17:23:00','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-03 | test:2020-01-31','N/A',NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:23:00',0,'SD100: Vessel 2 | Manifold 1','Pending','N/A'),(63,'2020-01-21 17:31:54','Hamo 01',1,1,0,NULL,NULL,'Full Wash','test:2020-01-17 | test:2020-01-31','N/A',NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:31:54',0,'SD100: Vessel 1 | Manifold 1','Pending','N/A'),(64,'2020-01-21 17:41:10','Hamo 01',1,1,1,NULL,NULL,'Full Wash','test:2020-01-24 | test:2020-01-31','N/A','Yes','Yes','Yes','Yes','Yes','2020-01-31 17:42:04',1,'SD500: Vessel 4 | Manifold 1','Pass','full wash test'),(65,'2020-01-21 17:42:09','Hamo 01',1,1,0,NULL,NULL,'Rinse Wash','N/A','Test:2020-01-31',NULL,NULL,NULL,NULL,NULL,'2020-01-21 17:42:09',1,'SD200: Vessel 3 | Manifold 5','Pending','N/A'),(66,'2020-01-21 18:14:26','Hamo 01',1,1,0,NULL,NULL,'Rinse Wash','N/A','Test:2020-01-17','N/A','N/A','N/A',NULL,NULL,'2020-01-21 18:14:26',1,'SD100: Vessel 2 | Manifold 1','Pending','N/A'),(67,'2020-01-21 18:16:23','Hamo 01',1,1,1,NULL,NULL,'Rinse Wash','N/A','Test:2020-01-24','N/A','N/A','N/A','Yes','Yes','2020-01-31 18:16:59',1,'SD500: Vessel 4 | Manifold 1','Pass','rinse wash test'),(68,'2020-01-21 22:30:28','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-21 22:30:28',0,'','Pending','N/A'),(69,'2020-01-22 08:57:33','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 08:57:33',0,'','Pending','N/A'),(70,'2020-01-22 08:59:44','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 08:59:44',0,'','Pending','N/A'),(71,'2020-01-22 10:40:49','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 10:40:49',0,'','Pending','N/A'),(72,'2020-01-22 10:42:03','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 10:42:03',0,'','Pending','N/A'),(73,'2020-01-22 10:47:58','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 10:47:58',1,'','Pending','N/A'),(74,'2020-01-22 10:52:44','',0,0,0,NULL,NULL,NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 10:52:44',0,'','Pending','N/A'),(75,'2020-01-22 11:17:35','Hamo 01',1,0,0,'2020-01-24','Yes',NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 11:17:35',0,'','Pending','N/A'),(76,'2020-01-22 12:59:56','Hamo 01',1,0,0,'2020-01-31','Yes',NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 12:59:56',0,'','Pending','N/A'),(77,'2020-01-22 13:44:00','Hamo 01',1,1,1,'2020-01-24','Yes','Full Wash','test:2020-01-24 | test:2020-01-31','N/A','Yes','Yes','Yes','Yes','Yes','2020-02-01 13:45:01',0,'SD200: Vessel 3 | Manifold 4','Pass','Test Test Test Test Test Test Test Test Test TestTest TestTest TestTest Test'),(78,'2020-01-22 13:52:41','Hamo 01',1,1,1,'2020-01-24','Yes','Rinse Wash','N/A','test:2020-01-30','N/A','N/A','N/A','Yes','Yes','2020-02-01 13:53:21',0,'SD200: Vessel 3 | Manifold 4','Pass',''),(79,'2020-01-22 14:11:51','Hamo 01',1,0,0,'2020-01-17','Yes',NULL,NULL,NULL,'N/A','N/A','N/A',NULL,NULL,'2020-01-22 14:11:51',1,'','Pending','N/A'),(80,'2020-01-22 15:15:28','Hamo 01',1,1,0,'2020-01-17','Yes','Full Wash','test:2020-01-24 | test:2020-01-31','N/A','N/A','N/A','N/A',NULL,NULL,'2020-01-22 15:15:28',0,'SD100: Vessel 2 | Manifold 2','Pending','N/A'),(81,'2020-01-22 15:18:41','Hamo 01',1,1,1,'2020-01-10','Yes','Rinse Wash','N/A','test:2020-01-24','N/A','N/A','N/A','Yes','Yes','2020-02-01 15:20:36',0,'SD100: Vessel 2 | Manifold 2','Pass',''),(82,'2020-01-22 15:21:38','Hamo 01',1,1,0,'2020-01-23','Yes','Full Wash','test:2020-01-11 | test:2020-01-24','N/A','N/A','N/A','N/A',NULL,NULL,'2020-01-22 15:21:38',1,'SD200: Vessel 3 | Manifold 3','Pending','N/A'),(83,'2020-01-22 15:22:42','Hamo 01',1,1,1,'2020-01-17','Yes','Full Wash','test:2020-01-23 | test:2020-01-31','N/A','Yes','Yes','Yes','Yes','Yes','2020-02-01 15:23:34',0,'SD200: Vessel 3 | Manifold 3','Pass','');
/*!40000 ALTER TABLE `hamo_wash_cycle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 15:43:43
