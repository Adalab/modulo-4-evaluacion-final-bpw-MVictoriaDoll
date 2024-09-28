-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: friends
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `ActoresFriends`
--

DROP TABLE IF EXISTS `ActoresFriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActoresFriends` (
  `idActoresFriends` int NOT NULL AUTO_INCREMENT,
  `nombreActor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fechaNacimiento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nacionalidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idActoresFriends`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActoresFriends`
--

LOCK TABLES `ActoresFriends` WRITE;
/*!40000 ALTER TABLE `ActoresFriends` DISABLE KEYS */;
INSERT INTO `ActoresFriends` VALUES (1,'Jennifer Aniston','11/02/1969','EE.UU'),(2,'Courteney Cox','15/06/1964','EE.UU'),(3,'Lisa Kudrow','30/07/1963','EE.UU'),(4,'David Schwimmer ','02/11/1966','EE.UU'),(5,'Matt LeBlanc','25/07/1967','EE.UU'),(6,'Matthew Perry','19/08/1969','EE.UU');
/*!40000 ALTER TABLE `ActoresFriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActoresFriends_has_PelisSeries`
--

DROP TABLE IF EXISTS `ActoresFriends_has_PelisSeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActoresFriends_has_PelisSeries` (
  `ActoresFriends_idActoresFriends` int NOT NULL,
  `PelisSeries_idPelisSeries` int NOT NULL,
  PRIMARY KEY (`ActoresFriends_idActoresFriends`,`PelisSeries_idPelisSeries`),
  KEY `fk_ActoresFriends_has_PelisSeries_PelisSeries1_idx` (`PelisSeries_idPelisSeries`),
  KEY `fk_ActoresFriends_has_PelisSeries_ActoresFriends1_idx` (`ActoresFriends_idActoresFriends`),
  CONSTRAINT `fk_ActoresFriends_has_PelisSeries_ActoresFriends1` FOREIGN KEY (`ActoresFriends_idActoresFriends`) REFERENCES `ActoresFriends` (`idActoresFriends`),
  CONSTRAINT `fk_ActoresFriends_has_PelisSeries_PelisSeries1` FOREIGN KEY (`PelisSeries_idPelisSeries`) REFERENCES `PelisSeries` (`idPelisSeries`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActoresFriends_has_PelisSeries`
--

LOCK TABLES `ActoresFriends_has_PelisSeries` WRITE;
/*!40000 ALTER TABLE `ActoresFriends_has_PelisSeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActoresFriends_has_PelisSeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PelisSeries`
--

DROP TABLE IF EXISTS `PelisSeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PelisSeries` (
  `idPelisSeries` int NOT NULL AUTO_INCREMENT,
  `título` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `año` int DEFAULT NULL,
  `género` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idPelisSeries`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PelisSeries`
--

LOCK TABLES `PelisSeries` WRITE;
/*!40000 ALTER TABLE `PelisSeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `PelisSeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonajesFriends`
--

DROP TABLE IF EXISTS `PersonajesFriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonajesFriends` (
  `idPersonajesFriends` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ocupación` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `descripción` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `temporadas` int DEFAULT NULL,
  `idActoresFriends` int DEFAULT NULL,
  PRIMARY KEY (`idPersonajesFriends`),
  KEY `fk_PersonajesFriends_ActoresFriends_idx` (`idActoresFriends`),
  CONSTRAINT `fk_PersonajesFriends_ActoresFriends` FOREIGN KEY (`idActoresFriends`) REFERENCES `ActoresFriends` (`idActoresFriends`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonajesFriends`
--

LOCK TABLES `PersonajesFriends` WRITE;
/*!40000 ALTER TABLE `PersonajesFriends` DISABLE KEYS */;
INSERT INTO `PersonajesFriends` VALUES (1,'Rachel Green','camarera',25,'Protagonista',NULL,1),(2,'Monica Geller','Chef',26,'Protagonista',NULL,2),(3,'Phoebe Buffay','Música/Terapista',26,'Protagonista',NULL,3),(4,'Ross Geller','paleontólogo',27,'Protagonista',NULL,4),(5,'Chandler Bing','Analista estadístico',26,'Protagonista',NULL,6),(6,'Joey Tribbiani','Mesero',40,'Protagonista',NULL,5),(7,'Rachel Green','camarera',25,'Protagonista',NULL,NULL);
/*!40000 ALTER TABLE `PersonajesFriends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 12:15:18
