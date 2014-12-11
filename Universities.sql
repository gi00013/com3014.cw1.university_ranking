CREATE DATABASE  IF NOT EXISTS `UNIVERSITIES` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `UNIVERSITIES`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: UNIVERSITIES
-- ------------------------------------------------------
-- Server version	5.6.21-enterprise-commercial-advanced

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Members` (
  `MembersID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`MembersID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `MembersID_UNIQUE` (`MembersID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `University Ranking Table`
--

DROP TABLE IF EXISTS `University Ranking Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `University Ranking Table` (
  `Rank 2015` int(3) NOT NULL AUTO_INCREMENT,
  `Institution` varchar(30) NOT NULL,
  `Guardian score/100` decimal(4,0) NOT NULL,
  `Satisfied with course` decimal(4,0) NOT NULL,
  `Satisfied with teaching` decimal(4,0) NOT NULL,
  `Satisfied with feedback` decimal(4,0) NOT NULL,
  `Student to staff ratio` decimal(4,0) NOT NULL,
  `Spend per student/10` decimal(3,0) NOT NULL,
  `Average entry tariff` decimal(5,0) NOT NULL,
  `Value added score/10` decimal(3,0) NOT NULL,
  `Career after 6 months` decimal(4,0) NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`Rank 2015`),
  UNIQUE KEY `Rank_UNIQUE` (`Rank 2015`),
  UNIQUE KEY `Institution_UNIQUE` (`Institution`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `University Ranking Table`
--

LOCK TABLES `University Ranking Table` WRITE;
/*!40000 ALTER TABLE `University Ranking Table` DISABLE KEYS */;
INSERT INTO `University Ranking Table` VALUES (1,'Cambridge',100,90,91,72,12,10,616,6,86,'Cambridge'),(2,'Oxford',94,91,93,71,11,10,580,7,79,'Oxford'),(3,'St Andrews',92,92,94,76,12,8,523,8,80,'St Andrews'),(4,'Bath',83,94,93,74,17,6,489,6,83,'Bath'),(5,'Imperial College',83,87,88,69,12,8,576,6,88,'London'),(6,'Surrey',83,91,91,74,15,8,422,7,73,'Guildford'),(7,'London School of Economics',82,88,85,71,12,7,538,5,76,'London'),(8,'Durham',82,90,90,72,16,6,527,6,83,'Durham'),(9,'Warwick',81,87,88,67,14,9,510,6,79,'Coventry'),(10,'Lancaster',81,89,90,72,15,8,449,6,73,'Lancaster');
/*!40000 ALTER TABLE `University Ranking Table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-10 22:15:29
