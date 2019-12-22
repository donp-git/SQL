-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pot_base
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Strain`,
 1 AS `Smell`,
 1 AS `Height`,
 1 AS `THC_level`,
 1 AS `Rating`,
 1 AS `price, $`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pot_effect`
--

DROP TABLE IF EXISTS `pot_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_effect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `effect` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `effect_UNIQUE` (`effect`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_effect`
--

LOCK TABLES `pot_effect` WRITE;
/*!40000 ALTER TABLE `pot_effect` DISABLE KEYS */;
INSERT INTO `pot_effect` VALUES (2,'Calming'),(6,'Euphoric'),(5,'Happy'),(3,'Relaxing'),(1,'Strong'),(0,'Unknown'),(4,'Uplift');
/*!40000 ALTER TABLE `pot_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_flavor`
--

DROP TABLE IF EXISTS `pot_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_flavor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flavor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flavor_UNIQUE` (`flavor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_flavor`
--

LOCK TABLES `pot_flavor` WRITE;
/*!40000 ALTER TABLE `pot_flavor` DISABLE KEYS */;
INSERT INTO `pot_flavor` VALUES (6,'Cheese'),(2,'Lavender'),(4,'Lemon'),(3,'Sour'),(5,'Spicy'),(1,'Tropical'),(0,'Unknown');
/*!40000 ALTER TABLE `pot_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_height`
--

DROP TABLE IF EXISTS `pot_height`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_height` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `height` varchar(255) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_height`
--

LOCK TABLES `pot_height` WRITE;
/*!40000 ALTER TABLE `pot_height` DISABLE KEYS */;
INSERT INTO `pot_height` VALUES (0,'Unknown'),(1,'Short'),(2,'Medium'),(3,'Tall');
/*!40000 ALTER TABLE `pot_height` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_name`
--

DROP TABLE IF EXISTS `pot_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `strain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `smell_id` int(11) unsigned NOT NULL DEFAULT '0',
  `height_id` int(11) unsigned DEFAULT NULL,
  `rating_id` int(11) unsigned DEFAULT NULL,
  `thc_id` int(11) unsigned DEFAULT NULL,
  `price_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_strain_idx` (`strain_id`),
  KEY `id_smell_idx` (`smell_id`),
  KEY `id_height_idx` (`height_id`),
  KEY `id_price_idx` (`price_id`) /*!80000 INVISIBLE */,
  KEY `id_thc_idx` (`thc_id`),
  KEY `id_rating` (`rating_id`),
  CONSTRAINT `id_height` FOREIGN KEY (`height_id`) REFERENCES `pot_height` (`id`),
  CONSTRAINT `id_price` FOREIGN KEY (`price_id`) REFERENCES `pot_price` (`id`),
  CONSTRAINT `id_rating` FOREIGN KEY (`rating_id`) REFERENCES `pot_rating` (`id`),
  CONSTRAINT `id_smell` FOREIGN KEY (`smell_id`) REFERENCES `pot_smell` (`id`),
  CONSTRAINT `id_strain` FOREIGN KEY (`strain_id`) REFERENCES `pot_strain` (`id`),
  CONSTRAINT `id_thc` FOREIGN KEY (`thc_id`) REFERENCES `thc_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_name`
--

LOCK TABLES `pot_name` WRITE;
/*!40000 ALTER TABLE `pot_name` DISABLE KEYS */;
INSERT INTO `pot_name` VALUES (1,'Afgani',1,2,2,2,1,1),(2,'Amnesia',2,1,2,2,2,1),(3,'Master Kush',1,0,1,3,2,2);
/*!40000 ALTER TABLE `pot_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_name_effect`
--

DROP TABLE IF EXISTS `pot_name_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_name_effect` (
  `name` int(11) unsigned NOT NULL,
  `effect_ids` int(11) unsigned NOT NULL,
  PRIMARY KEY (`effect_ids`,`name`),
  KEY `effect_idx` (`effect_ids`) USING BTREE,
  KEY `id` (`name`),
  CONSTRAINT `effect` FOREIGN KEY (`effect_ids`) REFERENCES `pot_effect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `id` FOREIGN KEY (`name`) REFERENCES `pot_name` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_name_effect`
--

LOCK TABLES `pot_name_effect` WRITE;
/*!40000 ALTER TABLE `pot_name_effect` DISABLE KEYS */;
INSERT INTO `pot_name_effect` VALUES (1,1),(3,1),(2,2),(2,3),(1,5),(3,5),(2,6);
/*!40000 ALTER TABLE `pot_name_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_name_flavor`
--

DROP TABLE IF EXISTS `pot_name_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_name_flavor` (
  `name` int(11) unsigned NOT NULL,
  `flavor_ids` int(11) unsigned NOT NULL,
  PRIMARY KEY (`flavor_ids`,`name`),
  KEY `flavor_idx` (`flavor_ids`),
  KEY `name` (`name`),
  CONSTRAINT `flavor_id` FOREIGN KEY (`flavor_ids`) REFERENCES `pot_flavor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `pot_name` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_name_flavor`
--

LOCK TABLES `pot_name_flavor` WRITE;
/*!40000 ALTER TABLE `pot_name_flavor` DISABLE KEYS */;
INSERT INTO `pot_name_flavor` VALUES (3,1),(1,2),(2,3),(2,4),(1,5),(3,6);
/*!40000 ALTER TABLE `pot_name_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_price`
--

DROP TABLE IF EXISTS `pot_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_price`
--

LOCK TABLES `pot_price` WRITE;
/*!40000 ALTER TABLE `pot_price` DISABLE KEYS */;
INSERT INTO `pot_price` VALUES (1,20),(2,30),(3,25),(4,40);
/*!40000 ALTER TABLE `pot_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_rating`
--

DROP TABLE IF EXISTS `pot_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rating` decimal(2,1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rating_UNIQUE` (`rating`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_rating`
--

LOCK TABLES `pot_rating` WRITE;
/*!40000 ALTER TABLE `pot_rating` DISABLE KEYS */;
INSERT INTO `pot_rating` VALUES (1,4.0),(2,4.5),(3,5.0);
/*!40000 ALTER TABLE `pot_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_smell`
--

DROP TABLE IF EXISTS `pot_smell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_smell` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smell` varchar(255) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_smell`
--

LOCK TABLES `pot_smell` WRITE;
/*!40000 ALTER TABLE `pot_smell` DISABLE KEYS */;
INSERT INTO `pot_smell` VALUES (0,'Unknown'),(1,'low'),(2,'mid'),(3,'high');
/*!40000 ALTER TABLE `pot_smell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot_strain`
--

DROP TABLE IF EXISTS `pot_strain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_strain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strain` varchar(255) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot_strain`
--

LOCK TABLES `pot_strain` WRITE;
/*!40000 ALTER TABLE `pot_strain` DISABLE KEYS */;
INSERT INTO `pot_strain` VALUES (0,'Unknown'),(1,'Indica'),(2,'Sativa'),(3,'Hybrid');
/*!40000 ALTER TABLE `pot_strain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thc_level`
--

DROP TABLE IF EXISTS `thc_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thc_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `THC_level` varchar(45) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thc_level`
--

LOCK TABLES `thc_level` WRITE;
/*!40000 ALTER TABLE `thc_level` DISABLE KEYS */;
INSERT INTO `thc_level` VALUES (1,'10-20%'),(2,'20-40%'),(3,'40-60%');
/*!40000 ALTER TABLE `thc_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `pot_name`.`id` AS `id`,`pot_name`.`name` AS `Name`,`pot_strain`.`strain` AS `Strain`,`pot_smell`.`smell` AS `Smell`,`pot_height`.`height` AS `Height`,`thc_level`.`THC_level` AS `THC_level`,`pot_rating`.`rating` AS `Rating`,`pot_price`.`price` AS `price, $` from (((((((`pot_name` join `pot_strain` on((`pot_name`.`strain_id` = `pot_strain`.`id`))) join `pot_smell` on((`pot_name`.`smell_id` = `pot_smell`.`id`))) join `pot_height` on((`pot_name`.`height_id` = `pot_height`.`id`))) join `pot_rating` on((`pot_name`.`rating_id` = `pot_rating`.`id`))) join `thc_level` on((`pot_name`.`thc_id` = `thc_level`.`id`))) join `pot_price` on((`pot_name`.`price_id` = `pot_price`.`id`))) join `pot_flavor` on((`pot_name`.`id` = `pot_flavor`.`id`))) order by `pot_name`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-23  0:42:15
