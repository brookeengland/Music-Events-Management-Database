-- MySQL dump 10.13  Distrib 9.2.0, for macos15 (arm64)
--
-- Host: localhost    Database: MusicEvents
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist` (
  `artistID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  PRIMARY KEY (`artistID`),
  KEY `artist_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist`
--

LOCK TABLES `Artist` WRITE;
/*!40000 ALTER TABLE `Artist` DISABLE KEYS */;
INSERT INTO `Artist` VALUES (1,'The Rockers','Rock'),(2,'DJ Cool','Electronic'),(3,'Classical Group','Classical');
/*!40000 ALTER TABLE `Artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArtistEvent`
--

DROP TABLE IF EXISTS `ArtistEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArtistEvent` (
  `artistID` int NOT NULL,
  `eventID` int NOT NULL,
  PRIMARY KEY (`artistID`,`eventID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `artistevent_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Event` (`eventID`),
  CONSTRAINT `artistevent_ibfk_2` FOREIGN KEY (`artistID`) REFERENCES `Artist` (`artistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtistEvent`
--

LOCK TABLES `ArtistEvent` WRITE;
/*!40000 ALTER TABLE `ArtistEvent` DISABLE KEYS */;
INSERT INTO `ArtistEvent` VALUES (1,7),(2,8),(3,9),(1,10),(2,11);
/*!40000 ALTER TABLE `ArtistEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendee`
--

DROP TABLE IF EXISTS `Attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendee` (
  `attendeeID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  PRIMARY KEY (`attendeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendee`
--

LOCK TABLES `Attendee` WRITE;
/*!40000 ALTER TABLE `Attendee` DISABLE KEYS */;
INSERT INTO `Attendee` VALUES (7,'jdoe','password123','John Doe','jdoe@example.com'),(8,'asmith','password456','Alice Smith','asmith@example.com'),(9,'bwilliams','password789','Bob Williams','bwilliams@example.com'),(17,'newUser','pass123','New User','newUser@gmail.com'),(19,'attendee456','hello123','Attendee Name','attendee@outlook.com'),(20,'User234','password123','User Name','newuser@gmail.com'),(21,'User123','pass123','New User','newuser@gmail.com');
/*!40000 ALTER TABLE `Attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `venueID` int NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`eventID`),
  KEY `venueID` (`venueID`),
  KEY `event_name_index` (`name`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`venueID`) REFERENCES `Venue` (`venueID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (7,'Rock Night','2025-06-01 19:00:00',1,1),(8,'EDM Blast','2025-06-11 00:00:00',2,0),(9,'Classical Night','2025-06-15 00:00:00',3,0),(10,'Indie Jam','2025-08-25 00:00:00',1,0),(11,'Magical Music Night','2025-09-05 00:00:00',2,0);
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizer`
--

DROP TABLE IF EXISTS `Organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organizer` (
  `organizerID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  PRIMARY KEY (`organizerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizer`
--

LOCK TABLES `Organizer` WRITE;
/*!40000 ALTER TABLE `Organizer` DISABLE KEYS */;
INSERT INTO `Organizer` VALUES (1,'org1','pass1','Event Org 1','org1@example.com'),(2,'org2','pass2','Event Org 2','org2@example.com'),(3,'org3','pass3','Event Org 3','org3@example.com'),(4,'organizer123','pass123','New organizer','newOrganizer@gmail.com'),(5,'brookeengland','bengland3','Brooke England','brengland@chapman.edu'),(6,'raneemR','pass987','Raneem Rahman','rrahman@gmail.com'),(7,'User246','newuser123','User','newUser@gmail.com'),(8,'NewOrg1','org123','New organizer','neworganizer@mgail.com');
/*!40000 ALTER TABLE `Organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizerEvent`
--

DROP TABLE IF EXISTS `OrganizerEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrganizerEvent` (
  `organizerID` int NOT NULL,
  `eventID` int NOT NULL,
  PRIMARY KEY (`organizerID`,`eventID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `organizerevent_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Event` (`eventID`),
  CONSTRAINT `organizerevent_ibfk_2` FOREIGN KEY (`organizerID`) REFERENCES `Organizer` (`organizerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizerEvent`
--

LOCK TABLES `OrganizerEvent` WRITE;
/*!40000 ALTER TABLE `OrganizerEvent` DISABLE KEYS */;
INSERT INTO `OrganizerEvent` VALUES (1,7),(1,8),(2,9);
/*!40000 ALTER TABLE `OrganizerEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `tier` varchar(20) NOT NULL,
  `purchaseDate` date NOT NULL,
  `eventID` int NOT NULL,
  `attendeeID` int NOT NULL,
  PRIMARY KEY (`ticketID`),
  KEY `eventID` (`eventID`),
  KEY `attendeeID` (`attendeeID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Event` (`eventID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`attendeeID`) REFERENCES `Attendee` (`attendeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES (25,59.99,'Standard','2025-04-01',7,7),(26,99.99,'VIP','2025-04-02',8,8),(27,39.99,'Standard','2025-04-03',9,9),(28,29.99,'Student','2025-04-04',7,7),(29,100.00,'GA','2025-05-15',7,7),(30,60.00,'VIP','2025-05-16',8,7),(31,30.00,'VIP','2025-05-17',9,7),(32,60.00,'GA','2025-05-19',7,8),(33,200.00,'VIP','2025-05-19',8,21);
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vartistinfo`
--

DROP TABLE IF EXISTS `vartistinfo`;
/*!50001 DROP VIEW IF EXISTS `vartistinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vartistinfo` AS SELECT 
 1 AS `name`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Venue`
--

DROP TABLE IF EXISTS `Venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venue` (
  `venueID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`venueID`),
  KEY `venue_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venue`
--

LOCK TABLES `Venue` WRITE;
/*!40000 ALTER TABLE `Venue` DISABLE KEYS */;
INSERT INTO `Venue` VALUES (1,'Grand Hall','123 Grand Way','Los Angeles','CA',13000),(2,'Open Air Arena','456 Park Ave','Los Angeles','CA',15000),(3,'Club Vibe','789 Nightlife Rd','Chicago','IL',2000);
/*!40000 ALTER TABLE `Venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `veventinfo`
--

DROP TABLE IF EXISTS `veventinfo`;
/*!50001 DROP VIEW IF EXISTS `veventinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `veventinfo` AS SELECT 
 1 AS `event_name`,
 1 AS `date`,
 1 AS `venue_name`,
 1 AS `city`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vvenueinfo`
--

DROP TABLE IF EXISTS `vvenueinfo`;
/*!50001 DROP VIEW IF EXISTS `vvenueinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vvenueinfo` AS SELECT 
 1 AS `name`,
 1 AS `address`,
 1 AS `city`,
 1 AS `state`,
 1 AS `capacity`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vartistinfo`
--

/*!50001 DROP VIEW IF EXISTS `vartistinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vartistinfo` AS select `artist`.`name` AS `name`,`artist`.`genre` AS `genre` from `artist` order by `artist`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `veventinfo`
--

/*!50001 DROP VIEW IF EXISTS `veventinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `veventinfo` AS select `event`.`name` AS `event_name`,`event`.`date` AS `date`,`venue`.`name` AS `venue_name`,`venue`.`city` AS `city`,`venue`.`state` AS `state` from (`event` join `venue` on((`event`.`venueID` = `venue`.`venueID`))) order by `event`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vvenueinfo`
--

/*!50001 DROP VIEW IF EXISTS `vvenueinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vvenueinfo` AS select `venue`.`name` AS `name`,`venue`.`address` AS `address`,`venue`.`city` AS `city`,`venue`.`state` AS `state`,`venue`.`capacity` AS `capacity` from `venue` order by `venue`.`city` */;
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

-- Dump completed on 2025-05-19 12:53:24
