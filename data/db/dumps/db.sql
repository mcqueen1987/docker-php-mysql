-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: shoppingDB
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Current Database: `shoppingDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shoppingDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shoppingDB`;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(10) NOT NULL,
  `baseunitprice` decimal(6,2) NOT NULL,
  `unitprice` decimal(6,2) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'NZD',34.99,15.00,3),(2,'NZD',34.99,15.00,5),(3,'NZD',34.99,15.00,8),(4,'NZD',34.99,15.00,9),(5,'NZD',34.99,15.00,10),(6,'NZD',34.99,15.00,12),(7,'NZD',34.99,15.00,13),(8,'NZD',39.99,39.99,14),(9,'NZD',39.99,39.99,15),(10,'NZD',39.99,39.99,16),(11,'NZD',39.99,39.99,17),(12,'NZD',34.99,15.00,18);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL,
  `style` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `extdescription` text,
  `lastupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'BV45561CHK','Cropped Boucle Tweed Top','The sweetest bouclé tweed cami with a round neckline, check print, cropped length and antique button detail.','2021-03-26 08:17:17'),(5,'DS45942POL','Square Neck Ruched Mini Dress','Featuring a slim-fit with ruched material, square neckline and thin spaghetti straps.','2021-03-20 00:06:22'),(8,'JD45788DNM','Diagonal Stitch Tapered Jean','Featuring a cropped length, high-rise fit, tapered leg and diagonal stitch detail.\r\nInside leg length = 70cm.','2021-05-18 13:22:05'),(9,'TS45477WAS','Super Oversized Tee','Featuring an oversized fit, crew neckline and 100% cotton fabric.','2021-04-06 00:06:07'),(10,'KL45962KNT','Boxy Knit Top','Featuring a boxy style longsleeve top in a cotton blend knit material.','2021-05-18 13:10:30'),(12,'TC46959SEA','Seamless Zip Through Top','This longsleeve top features a cropped length, zip through detail, a scoop neckline and seamless ribbed material.','2021-05-18 13:06:55'),(13,'BL45309COR','Longline Cord Shirt','A vintage classic! Featuring a loose-fit, textured corduroy fabric, front pockets and tortoise shell buttons.','2021-05-18 09:57:17'),(14,'JD43761DNM','Super High Rise Straight Jean','Straight leg jean featuring a raw hem and high waisted fit.  Inside leg length = 71.5cm.\r\n\r\nREPREVE denim is designed for our denim lover! My recycled polyester fibres offer an eco friendly superior stretch denim with durability that maintains the authentic look and feel of traditional denim.','2021-05-18 15:30:21'),(15,'PW44707PLN','Pintuck Wide Leg Pant','Featuring a floaty wide leg, elasticated waistband and pintuck detail.','2021-05-18 13:07:50'),(16,'TL44688SEA','Seamless V-Scoop Top','Featuring a longsleeve style with ribbed seamless material, a low neckline and back.','2021-05-18 13:21:38'),(17,'JD41279DNM','Wide Leg Jean','Featuring a high waist, snug through the hip with a straight leg style and ripped detailing on the hem.\r\nInside leg length is 70cm.','2021-05-18 13:23:27'),(18,'TC46959SEA','Seamless Zip Through Top','This longsleeve top features a cropped length, zip through detail, a scoop neckline and seamless ribbed material.','2021-05-18 13:06:55');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-30  8:44:53
