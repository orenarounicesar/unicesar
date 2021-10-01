-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: unicesarappdb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Current Database: `unicesarappdb`
--

/*!40000 DROP DATABASE IF EXISTS `unicesarappdb`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `unicesarappdb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `unicesarappdb`;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `codigo_asignatura` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_asignatura` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`codigo_asignatura`),
  KEY `nombre_asignatura` (`nombre_asignatura`),
  KEY `activo` (`activo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cortes`
--

DROP TABLE IF EXISTS `cortes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cortes` (
  `codigo_corte` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_nombre` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `porcentaje` tinyint NOT NULL,
  `activo` bit(1) NOT NULL,
  PRIMARY KEY (`codigo_corte`),
  KEY `nombre_nombre` (`nombre_nombre`),
  KEY `porcentaje` (`porcentaje`),
  KEY `activo` (`activo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cortes`
--

LOCK TABLES `cortes` WRITE;
/*!40000 ALTER TABLE `cortes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cortes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_personales`
--

DROP TABLE IF EXISTS `datos_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_personales` (
  `codigo_dato_personal` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo_id` enum('CC','CE','PA','PE') COLLATE latin1_spanish_ci NOT NULL,
  `id` varchar(16) COLLATE latin1_spanish_ci NOT NULL,
  `nombre1` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre2` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido1` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `apellido2` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_dato_personal`),
  KEY `tipo_id` (`tipo_id`),
  KEY `id` (`id`),
  KEY `nombre1` (`nombre1`),
  KEY `nombre2` (`nombre2`),
  KEY `apellido1` (`apellido1`),
  KEY `apellido2` (`apellido2`),
  KEY `fecha_nacimiento` (`fecha_nacimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales`
--

LOCK TABLES `datos_personales` WRITE;
/*!40000 ALTER TABLE `datos_personales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `codigo_docente` smallint unsigned NOT NULL AUTO_INCREMENT,
  `codigo_dato_personal` int unsigned NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`codigo_docente`),
  KEY `activo` (`activo`),
  KEY `codigo_dato_personal` (`codigo_dato_personal`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`codigo_dato_personal`) REFERENCES `datos_personales` (`codigo_dato_personal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes_asignaturas`
--

DROP TABLE IF EXISTS `docentes_asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_asignaturas` (
  `codigo_docente_asignatura` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_docente` smallint unsigned NOT NULL,
  `codigo_asignatura` smallint unsigned NOT NULL,
  PRIMARY KEY (`codigo_docente_asignatura`),
  UNIQUE KEY `codigo_docente` (`codigo_docente`,`codigo_asignatura`),
  KEY `codigo_asignatura` (`codigo_asignatura`),
  CONSTRAINT `docentes_asignaturas_ibfk_1` FOREIGN KEY (`codigo_docente`) REFERENCES `docentes` (`codigo_docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `docentes_asignaturas_ibfk_2` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignaturas` (`codigo_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes_asignaturas`
--

LOCK TABLES `docentes_asignaturas` WRITE;
/*!40000 ALTER TABLE `docentes_asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes_asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `codigo_estudiante` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_universitario` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_dato_personal` int unsigned NOT NULL,
  `activo` bit(1) NOT NULL,
  PRIMARY KEY (`codigo_estudiante`),
  KEY `codigo_universitario` (`codigo_universitario`),
  KEY `activo` (`activo`),
  KEY `codigo_dato_personal` (`codigo_dato_personal`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`codigo_dato_personal`) REFERENCES `datos_personales` (`codigo_dato_personal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes_asignaturas`
--

DROP TABLE IF EXISTS `estudiantes_asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes_asignaturas` (
  `codigo_estudiante_asignatura` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_estudiante` int unsigned NOT NULL,
  `codigo_asignatura` smallint unsigned NOT NULL,
  PRIMARY KEY (`codigo_estudiante_asignatura`),
  UNIQUE KEY `codigo_estudiante` (`codigo_estudiante`,`codigo_asignatura`),
  KEY `codigo_asignatura` (`codigo_asignatura`),
  CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`codigo_estudiante`) REFERENCES `estudiantes` (`codigo_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignaturas` (`codigo_asignatura`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes_asignaturas`
--

LOCK TABLES `estudiantes_asignaturas` WRITE;
/*!40000 ALTER TABLE `estudiantes_asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes_asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `codigo_nota` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_estudiante_asignatura` int unsigned NOT NULL,
  `codigo_corte` smallint unsigned NOT NULL,
  `nota` float NOT NULL,
  PRIMARY KEY (`codigo_nota`),
  UNIQUE KEY `codigo_estudiante_asignatura` (`codigo_estudiante_asignatura`,`codigo_corte`),
  KEY `nota` (`nota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'unicesarappdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 20:06:46
