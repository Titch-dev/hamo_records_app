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
  `load_type_id` int(11) DEFAULT NULL,
  `full_wash_chemical_list` varchar(255) DEFAULT NULL,
  `rinse_wash_tubing_list` varchar(255) DEFAULT NULL,
  `pre_wash_passed` enum('Yes','No') DEFAULT NULL,
  `caustic_wash_passed` enum('Yes','No') DEFAULT NULL,
  `acid_wash_passed` enum('Yes','No') DEFAULT NULL,
  `final_rinse_passed` enum('Yes','No') DEFAULT NULL,
  `drying_stage_passed` enum('Yes','No') DEFAULT NULL,
  `wash_expiration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamo_wash_cycle`
--

LOCK TABLES `hamo_wash_cycle` WRITE;
/*!40000 ALTER TABLE `hamo_wash_cycle` DISABLE KEYS */;
INSERT INTO `hamo_wash_cycle` VALUES (1,'2020-01-10 17:10:12','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-10 17:10:12',''),(2,'2020-01-13 08:52:16','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 08:52:16',''),(3,'2020-01-13 08:55:07','Hamo 01',1,1,0,NULL,NULL,'Rinse Wash',NULL,'NA','lj lj :2020-01-15',NULL,NULL,NULL,NULL,NULL,'2020-01-13 08:55:07',''),(4,'2020-01-13 09:28:51','',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 09:28:51',''),(5,'2020-01-13 10:44:00','Hamo 01',1,1,0,NULL,NULL,'Full Wash',NULL,'test:2020-01-09 | test:2020-01-16','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-13 10:44:00',''),(6,'2020-01-13 10:46:54','Hamo 01',1,1,0,NULL,NULL,'Full Wash',NULL,'test:2020-01-17 | test:2020-01-17','NA',NULL,NULL,NULL,NULL,NULL,'2020-01-13 10:46:54',''),(7,'2020-01-13 10:49:33','Hamo 01',1,1,1,NULL,NULL,'Full Wash',NULL,'test:2020-01-30 | test:2020-01-16','NA','Yes','Yes','Yes','Yes','Yes','2020-01-13 10:49:33',''),(8,'2020-01-13 12:45:39','Hamo 01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-13 12:45:39','');
/*!40000 ALTER TABLE `hamo_wash_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_type`
--

DROP TABLE IF EXISTS `load_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL DEFAULT '',
  `vessel_id` varchar(255) NOT NULL DEFAULT '',
  `manifold_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_type`
--

LOCK TABLES `load_type` WRITE;
/*!40000 ALTER TABLE `load_type` DISABLE KEYS */;
INSERT INTO `load_type` VALUES (1,'SD100','Vessel SD 1','MANIFOLD 1'),(2,'SD100','Vessel SD 1','MANIFOLD 2'),(3,'SD100','Vessel SD 2','MANIFOLD 1'),(4,'SD100','Vessel SD 2','MANIFOLD 2'),(5,'SD200','Vessel SD 3','MANIFOLD 1'),(6,'SD200','Vessel SD 3','MANIFOLD 2'),(7,'SD200','Vessel SD 3','MANIFOLD 3'),(8,'SD300','Vessel SD 4','MANIFOLD 3'),(9,'SD300','Vessel SD 5','MANIFOLD 3'),(10,'SD300','Vessel SD 6','MANIFOLD 3');
/*!40000 ALTER TABLE `load_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-13 17:52:34
