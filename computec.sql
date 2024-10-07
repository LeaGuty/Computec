-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: computec
-- ------------------------------------------------------
-- Server version	8.0.39

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

CREATE DATABASE `computec` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `rut` varchar(12) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('15160919-8','Josselin obal','El sauce 50983, MAipú','jobal@duoc.cl','77782230'),('15544211-5','Leandro Gutiérrez','El Sauce 50983, Maipú','lean.gutierrez@duocuc.cl','+56949617188'),('17654321-9','Juan Pablo González','Calle Falsa 123','juan.gonzalez@email.com','9 7654 3219'),('24282944-1','Gabriela Gutiérrez Obal','Romero 2569, Santiago','Gaby.gty@gmail.comq','95556'),('27137478-K','Pedro Obal','Los pitufas 258900','pedrito@gmail.com','23423423423');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `disco_duro` int NOT NULL,
  `ram` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` enum('laptop','desktop') NOT NULL,
  `pantalla` decimal(5,2) DEFAULT NULL,
  `es_tactil` tinyint(1) DEFAULT NULL,
  `puertos_usb` int DEFAULT NULL,
  `potencia_fuente` int DEFAULT NULL,
  `factor_forma` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Laptop Gamer X-treme Pro 5000','Intel Core i7-13700H',1000,16,1299990.00,'laptop',15.60,1,3,NULL,NULL),(2,'Ultrabook Slim Pro 14','Intel Core i5-1335U',512,8,800000.00,'laptop',14.00,0,4,NULL,NULL),(3,'StudyBook 15','AMD Ryzen 5 5500U',256,12,500000.00,'laptop',15.60,0,3,NULL,NULL),(4,'FlexBook 13 2-en-1','Intel Core i3-1215U',128,4,350000.00,'laptop',13.30,1,2,NULL,NULL),(5,'Gaming Rig Destroyer 9000','AMD Ryzen 9 7950X',2000,32,2499990.00,'desktop',NULL,NULL,NULL,850,'Torre'),(6,'Office ProDesk 500','Intel Core i5-12400',1000,8,599990.00,'desktop',NULL,NULL,NULL,500,'Mini Torre'),(7,'SwiftBook Air 13','AMD Ryzen 7 6800U',512,16,999.99,'laptop',13.30,0,2,NULL,NULL),(8,'WorkStation Pro','Intel Core i9-13900K',2000,64,3999990.00,'desktop',NULL,NULL,NULL,1000,'Torre');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `rut_cliente` varchar(12) DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  `fecha_venta` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `rut_cliente` (`rut_cliente`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`rut_cliente`) REFERENCES `clientes` (`rut`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'15160919-8',2,'2024-10-07 04:52:37',800000.00),(2,'15544211-5',4,'2024-10-07 04:52:55',280000.00),(3,'15160919-8',6,'2024-10-07 04:53:59',569990.50),(4,'15160919-8',2,'2024-10-07 04:56:53',800000.00),(5,'15544211-5',5,'2024-10-07 04:58:43',2249991.00),(6,'24282944-1',4,'2024-10-07 05:00:24',315000.00),(7,'24282944-1',3,'2024-10-07 05:49:43',500000.00),(8,'27137478-K',2,'2024-10-07 06:02:28',680000.00),(9,'15544211-5',1,'2024-10-07 06:08:51',1169991.00),(10,'24282944-1',5,'2024-10-07 06:10:04',2499990.00),(11,'15544211-5',2,'2024-10-07 06:11:30',640000.00),(12,'24282944-1',5,'2024-10-07 11:30:46',2249991.00),(13,'15544211-5',6,'2024-10-07 11:51:16',509991.50),(14,'15160919-8',1,'2024-10-07 11:52:06',1299990.00),(15,'17654321-9',7,'2024-10-07 14:50:40',949.99);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07 14:58:12
