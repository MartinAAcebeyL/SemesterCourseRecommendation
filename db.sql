-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: systemRecomendation
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `alumnos_alumnos`
--

DROP TABLE IF EXISTS `alumnos_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos_alumnos` (
  `usuarios_ptr_id` bigint NOT NULL,
  `kardex_id` bigint NOT NULL,
  `carrera_id` bigint NOT NULL,
  `cu` int NOT NULL,
  PRIMARY KEY (`kardex_id`),
  UNIQUE KEY `usuarios_ptr_id` (`usuarios_ptr_id`),
  KEY `alumnos_alumnos_carrera_id_1f95fe17_fk_carreras_carreras_id` (`carrera_id`),
  CONSTRAINT `alumnos_alumnos_carrera_id_1f95fe17_fk_carreras_carreras_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras_carreras` (`id`),
  CONSTRAINT `alumnos_alumnos_kardex_id_6b6c649c_fk_kardex_kadex_id` FOREIGN KEY (`kardex_id`) REFERENCES `kardex_kadex` (`id`),
  CONSTRAINT `alumnos_alumnos_usuarios_ptr_id_709851a8_fk_usuarios_usuarios_id` FOREIGN KEY (`usuarios_ptr_id`) REFERENCES `usuarios_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_alumnos`
--

LOCK TABLES `alumnos_alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos_alumnos` DISABLE KEYS */;
INSERT INTO `alumnos_alumnos` VALUES (68,2,2,111),(69,3,2,111),(67,4,1,111),(71,5,2,111);
/*!40000 ALTER TABLE `alumnos_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_alumnos_horarios`
--

DROP TABLE IF EXISTS `alumnos_alumnos_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos_alumnos_horarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alumnos_id` bigint NOT NULL,
  `horarios_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alumnos_alumnos_horarios_alumnos_id_horarios_id_468162f1_uniq` (`alumnos_id`,`horarios_id`),
  KEY `alumnos_alumnos_hora_horarios_id_099ce1c6_fk_horarios_` (`horarios_id`),
  CONSTRAINT `alumnos_alumnos_hora_alumnos_id_3e49f61a_fk_alumnos_a` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos_alumnos` (`kardex_id`),
  CONSTRAINT `alumnos_alumnos_hora_horarios_id_099ce1c6_fk_horarios_` FOREIGN KEY (`horarios_id`) REFERENCES `horarios_horarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_alumnos_horarios`
--

LOCK TABLES `alumnos_alumnos_horarios` WRITE;
/*!40000 ALTER TABLE `alumnos_alumnos_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_alumnos_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuarios'),(22,'Can change user',6,'change_usuarios'),(23,'Can delete user',6,'delete_usuarios'),(24,'Can view user',6,'view_usuarios'),(25,'Can add user',7,'add_alumnos'),(26,'Can change user',7,'change_alumnos'),(27,'Can delete user',7,'delete_alumnos'),(28,'Can view user',7,'view_alumnos'),(29,'Can add user',8,'add_docentes'),(30,'Can change user',8,'change_docentes'),(31,'Can delete user',8,'delete_docentes'),(32,'Can view user',8,'view_docentes'),(33,'Can add carreras',9,'add_carreras'),(34,'Can change carreras',9,'change_carreras'),(35,'Can delete carreras',9,'delete_carreras'),(36,'Can view carreras',9,'view_carreras'),(37,'Can add horarios',10,'add_horarios'),(38,'Can change horarios',10,'change_horarios'),(39,'Can delete horarios',10,'delete_horarios'),(40,'Can view horarios',10,'view_horarios'),(41,'Can add kadex',11,'add_kadex'),(42,'Can change kadex',11,'change_kadex'),(43,'Can delete kadex',11,'delete_kadex'),(44,'Can view kadex',11,'view_kadex'),(45,'Can add materias',12,'add_materias'),(46,'Can change materias',12,'change_materias'),(47,'Can delete materias',12,'delete_materias'),(48,'Can view materias',12,'view_materias'),(49,'Can add calificaciones',13,'add_calificaciones'),(50,'Can change calificaciones',13,'change_calificaciones'),(51,'Can delete calificaciones',13,'delete_calificaciones'),(52,'Can view calificaciones',13,'view_calificaciones'),(53,'Can add programaciones',14,'add_programaciones'),(54,'Can change programaciones',14,'change_programaciones'),(55,'Can delete programaciones',14,'delete_programaciones'),(56,'Can view programaciones',14,'view_programaciones');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones_calificaciones`
--

DROP TABLE IF EXISTS `calificaciones_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones_calificaciones` (
  `anio` int DEFAULT NULL,
  `gestion` int NOT NULL,
  `final` int NOT NULL,
  `segunda_instancia` int DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `materia_id` bigint NOT NULL,
  `kardex_id` int DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `calificaciones_calificaciones_materia_id_5f128a2a` (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones_calificaciones`
--

LOCK TABLES `calificaciones_calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones_calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones_calificaciones` VALUES (2022,1,80,NULL,'ap',1,2,1),(2022,1,80,NULL,'ap',1,3,2),(2022,1,70,NULL,'ap',4,2,3),(2022,1,90,NULL,'ap',5,2,4),(2022,1,62,NULL,'ap',2,2,5),(2022,1,52,NULL,'ap',6,2,6),(2022,1,70,NULL,'ap',2,3,7),(2022,1,60,NULL,'ap',4,3,8),(2022,1,80,NULL,'ap',5,3,9),(2022,1,58,NULL,'ap',6,3,10),(2022,2,80,NULL,'ap',9,3,11),(2022,2,89,NULL,'ap',10,3,12),(2022,2,7,NULL,'rp',3,3,14),(2022,2,50,NULL,'rp',7,3,15),(2022,2,12,NULL,'rp',8,3,16),(2022,2,45,NULL,'ap',11,3,17),(2022,1,52,NULL,'ap',1,5,18),(2022,1,60,NULL,'ap',4,5,19),(2022,1,30,NULL,'rp',5,5,20),(2022,1,35,NULL,'rp',6,5,21),(2022,1,60,NULL,'ap',2,5,22);
/*!40000 ALTER TABLE `calificaciones_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones_calificaciones_kardex`
--

DROP TABLE IF EXISTS `calificaciones_calificaciones_kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones_calificaciones_kardex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `calificaciones_id` bigint NOT NULL,
  `kadex_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calificaciones_calificac_calificaciones_id_kadex__7f548389_uniq` (`calificaciones_id`,`kadex_id`),
  KEY `calificaciones_calif_kadex_id_a499a2d8_fk_kardex_ka` (`kadex_id`),
  CONSTRAINT `calificaciones_calif_calificaciones_id_8d2b04e3_fk_calificac` FOREIGN KEY (`calificaciones_id`) REFERENCES `calificaciones_calificaciones` (`materia_id`),
  CONSTRAINT `calificaciones_calif_kadex_id_a499a2d8_fk_kardex_ka` FOREIGN KEY (`kadex_id`) REFERENCES `kardex_kadex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones_calificaciones_kardex`
--

LOCK TABLES `calificaciones_calificaciones_kardex` WRITE;
/*!40000 ALTER TABLE `calificaciones_calificaciones_kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificaciones_calificaciones_kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras_carreras`
--

DROP TABLE IF EXISTS `carreras_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras_carreras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras_carreras`
--

LOCK TABLES `carreras_carreras` WRITE;
/*!40000 ALTER TABLE `carreras_carreras` DISABLE KEYS */;
INSERT INTO `carreras_carreras` VALUES (1,'Ing. de Sistemas','Facultad de tecnologia'),(2,'Ing. Ciencias de la computacion','Facultad de tecnologia');
/*!40000 ALTER TABLE `carreras_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_usuarios` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-11-22 05:23:30.321644','1','FIS100',1,'[{\"added\": {}}]',12,1),(2,'2022-11-22 05:23:44.574397','2','MAT101',1,'[{\"added\": {}}]',12,1),(3,'2022-11-22 05:24:03.256606','3','FIS200',1,'[{\"added\": {}}]',12,1),(4,'2022-11-26 20:56:31.447586','4','MAT100',1,'[{\"added\": {}}]',12,1),(5,'2022-11-26 20:56:52.337628','5','SHC100',1,'[{\"added\": {}}]',12,1),(6,'2022-11-26 20:57:28.649918','6','SIS100',1,'[{\"added\": {}}]',12,1),(7,'2022-11-26 20:59:10.423457','7','MAT102',1,'[{\"added\": {}}]',12,1),(8,'2022-11-26 20:59:37.031321','8','MAT103',1,'[{\"added\": {}}]',12,1),(9,'2022-11-26 21:00:10.150222','9','SIS101',1,'[{\"added\": {}}]',12,1),(10,'2022-11-26 21:01:04.825234','10','SIS103',1,'[{\"added\": {}}]',12,1),(11,'2022-11-26 21:03:51.626172','11','SIS308',1,'[{\"added\": {}}]',12,1),(12,'2022-11-27 00:16:37.999760','12','GEN410',1,'[{\"added\": {}}]',12,1),(13,'2022-11-27 00:17:03.580644','13','MAT280',1,'[{\"added\": {}}]',12,1),(14,'2022-11-27 00:17:23.801436','14','SIS107',1,'[{\"added\": {}}]',12,1),(15,'2022-11-27 00:17:43.589923','15','SIS204',1,'[{\"added\": {}}]',12,1),(16,'2022-11-27 00:18:12.269378','16','SIS302',1,'[{\"added\": {}}]',12,1),(17,'2022-11-27 00:18:38.275206','17','SIS457',1,'[{\"added\": {}}]',12,1),(18,'2022-11-27 00:19:00.917867','18','SIS110',1,'[{\"added\": {}}]',12,1),(19,'2022-11-27 00:19:30.374332','19','SIS120',1,'[{\"added\": {}}]',12,1),(20,'2022-11-27 00:19:56.633592','20','SIS125',1,'[{\"added\": {}}]',12,1),(21,'2022-11-27 00:20:31.023789','21','SIS251',1,'[{\"added\": {}}]',12,1),(22,'2022-11-27 00:21:01.061603','22','SIS304',1,'[{\"added\": {}}]',12,1),(23,'2022-11-27 00:21:25.598580','23','SIS407',1,'[{\"added\": {}}]',12,1),(24,'2022-11-27 00:23:33.240854','24','SIS252',1,'[{\"added\": {}}]',12,1),(25,'2022-11-27 00:23:55.349089','25','SIS256',1,'[{\"added\": {}}]',12,1),(26,'2022-11-27 00:24:22.985434','26','SIS313',1,'[{\"added\": {}}]',12,1),(27,'2022-11-27 00:24:43.451986','27','SIS315',1,'[{\"added\": {}}]',12,1),(28,'2022-11-27 00:25:01.968315','28','SIS324',1,'[{\"added\": {}}]',12,1),(29,'2022-11-27 00:25:28.132847','29','SIS420',1,'[{\"added\": {}}]',12,1),(30,'2022-11-27 00:25:54.669980','30','COM350',1,'[{\"added\": {}}]',12,1),(31,'2022-11-27 00:33:24.149122','31','COM460',1,'[{\"added\": {}}]',12,1),(32,'2022-11-27 00:33:52.324155','32','SIS104',1,'[{\"added\": {}}]',12,1),(33,'2022-11-27 00:34:12.448486','33','SIS258',1,'[{\"added\": {}}]',12,1),(34,'2022-11-27 00:34:32.979216','34','SIS421',1,'[{\"added\": {}}]',12,1),(35,'2022-11-27 00:35:00.602870','35','SIS427',1,'[{\"added\": {}}]',12,1),(36,'2022-11-27 00:35:26.252123','36','COM450',1,'[{\"added\": {}}]',12,1),(37,'2022-11-27 00:35:49.963590','37','COM470',1,'[{\"added\": {}}]',12,1),(38,'2022-11-27 00:36:20.518603','38','COM480',1,'[{\"added\": {}}]',12,1),(39,'2022-11-27 00:36:49.800407','39','SHC120',1,'[{\"added\": {}}]',12,1),(40,'2022-11-27 00:37:31.539543','40','SIS254',1,'[{\"added\": {}}]',12,1),(41,'2022-11-27 00:37:59.317436','41','SIS330',1,'[{\"added\": {}}]',12,1),(42,'2022-11-27 00:38:37.661140','42','COM520',1,'[{\"added\": {}}]',12,1),(43,'2022-11-27 00:39:14.038773','43','SHC134',1,'[{\"added\": {}}]',12,1),(44,'2022-11-27 00:39:33.362754','44','SHC140',1,'[{\"added\": {}}]',12,1),(45,'2022-11-27 00:39:48.999062','45','SHC150',1,'[{\"added\": {}}]',12,1),(46,'2022-11-27 00:40:16.063246','46','SIS306',1,'[{\"added\": {}}]',12,1),(47,'2022-11-27 00:40:46.889519','47','SIS316',1,'[{\"added\": {}}]',12,1),(48,'2022-11-27 00:41:11.886230','48','SIS325',1,'[{\"added\": {}}]',12,1),(49,'2022-11-27 00:41:43.287677','49','SHC160',1,'[{\"added\": {}}]',12,1),(50,'2022-11-27 00:42:43.889954','50','SHC170',1,'[{\"added\": {}}]',12,1),(51,'2022-11-27 00:43:41.814938','51','SHC180',1,'[{\"added\": {}}]',12,1),(52,'2022-11-27 00:44:13.743392','52','SHC190',1,'[{\"added\": {}}]',12,1),(53,'2022-11-27 03:10:47.419120','1','Kadex object (1)',1,'[{\"added\": {}}]',11,1),(54,'2022-11-27 13:28:25.036513','1','Kadex object (1)',3,'',11,1),(55,'2022-11-27 13:50:58.774905','2','Kadex object (2)',1,'[{\"added\": {}}]',11,1),(56,'2022-11-27 13:52:57.661088','1','Calificaciones object (1)',1,'[{\"added\": {}}]',13,1),(57,'2022-11-27 13:53:25.868671','2','Calificaciones object (2)',1,'[{\"added\": {}}]',13,1),(58,'2022-11-27 13:53:42.163850','4','Calificaciones object (4)',1,'[{\"added\": {}}]',13,1),(59,'2022-11-27 13:54:01.059054','5','Calificaciones object (5)',1,'[{\"added\": {}}]',13,1),(60,'2022-11-27 13:54:16.897213','6','Calificaciones object (6)',1,'[{\"added\": {}}]',13,1),(61,'2022-11-27 14:00:21.370339','1','Carreras object (1)',1,'[{\"added\": {}}]',9,1),(62,'2022-11-27 14:00:36.799025','2','Carreras object (2)',1,'[{\"added\": {}}]',9,1),(63,'2022-11-27 14:13:44.446654','2','Usuario con nombre: Jarrod Russell Lawrence',1,'[{\"added\": {}}]',7,1),(64,'2022-11-27 14:14:12.966467','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Name\", \"Last name\", \"Phone\", \"Email\", \"Address\"]}}]',7,1),(65,'2022-11-27 15:52:30.560133','7','Usuario con nombre: W Jaldin',1,'[{\"added\": {}}]',8,1),(66,'2022-11-27 16:52:33.338291','14','R. Guitierrez',1,'[{\"added\": {}}]',8,1),(67,'2022-11-27 16:53:09.240732','15','T. Torres',1,'[{\"added\": {}}]',8,1),(68,'2022-11-27 16:53:29.214914','16','N. Coca',1,'[{\"added\": {}}]',8,1),(69,'2022-11-27 16:53:55.417016','17','A. Calvimontes',1,'[{\"added\": {}}]',8,1),(70,'2022-11-27 16:55:22.575294','18','J. Ramos',1,'[{\"added\": {}}]',8,1),(71,'2022-11-27 16:55:47.024519','19','H. Penaranda',1,'[{\"added\": {}}]',8,1),(72,'2022-11-27 16:56:11.472777','20','G. Maita',1,'[{\"added\": {}}]',8,1),(73,'2022-11-27 16:56:28.688690','21','E. Rivero',1,'[{\"added\": {}}]',8,1),(74,'2022-11-27 16:56:46.288565','22','R. Herbas',1,'[{\"added\": {}}]',8,1),(75,'2022-11-27 16:57:08.526560','23','E. Iglesias',1,'[{\"added\": {}}]',8,1),(76,'2022-11-27 16:58:24.044920','24','E. Pacheco',1,'[{\"added\": {}}]',8,1),(77,'2022-11-27 16:58:43.556275','25','O. Velasquez',1,'[{\"added\": {}}]',8,1),(78,'2022-11-27 16:59:23.732614','26','O. Bustamante',1,'[{\"added\": {}}]',8,1),(79,'2022-11-27 17:00:09.774460','27','J. Martines',1,'[{\"added\": {}}]',8,1),(80,'2022-11-27 17:00:28.500686','28','S. Delgado',1,'[{\"added\": {}}]',8,1),(81,'2022-11-27 17:01:20.506322','29','G. Davaloz',1,'[{\"added\": {}}]',8,1),(82,'2022-11-27 17:01:39.252590','30','M. Cuellar',1,'[{\"added\": {}}]',8,1),(83,'2022-11-27 17:01:59.571780','31','W. Pacheco',1,'[{\"added\": {}}]',8,1),(84,'2022-11-27 17:02:26.395592','32','P. Cordero',1,'[{\"added\": {}}]',8,1),(85,'2022-11-27 17:02:42.730059','33','D. Condo',1,'[{\"added\": {}}]',8,1),(86,'2022-11-27 17:03:03.359721','34','F. Zelaya',1,'[{\"added\": {}}]',8,1),(87,'2022-11-27 17:03:23.067124','35','W. Alvarez',1,'[{\"added\": {}}]',8,1),(88,'2022-11-27 17:04:18.229364','36','A. Molina',1,'[{\"added\": {}}]',8,1),(89,'2022-11-27 18:38:26.218087','37','F. Villalpando',1,'[{\"added\": {}}]',8,1),(90,'2022-11-27 18:39:12.471427','38','G. Poquechoque',1,'[{\"added\": {}}]',8,1),(91,'2022-11-27 18:40:42.356098','39','V. Belianskaya',1,'[{\"added\": {}}]',8,1),(92,'2022-11-27 18:41:36.795509','40','S. Ugrinovic',1,'[{\"added\": {}}]',8,1),(93,'2022-11-27 18:42:59.143802','41','R. Quispe',1,'[{\"added\": {}}]',8,1),(94,'2022-11-27 18:43:47.297119','42','R. Villafan',1,'[{\"added\": {}}]',8,1),(95,'2022-11-27 18:48:05.730664','43','J. Zeballos',1,'[{\"added\": {}}]',8,1),(96,'2022-11-27 18:48:26.359977','44','M. Arenas',1,'[{\"added\": {}}]',8,1),(97,'2022-11-27 18:48:50.772553','45','R. Duran',1,'[{\"added\": {}}]',8,1),(98,'2022-11-27 18:49:11.484404','46','C. Montellano',1,'[{\"added\": {}}]',8,1),(99,'2022-11-27 18:49:47.589227','47','O. Galarza',1,'[{\"added\": {}}]',8,1),(100,'2022-11-27 18:50:04.789085','48','M. Arancibia',1,'[{\"added\": {}}]',8,1),(101,'2022-11-27 18:50:39.663264','49','D. Roca',1,'[{\"added\": {}}]',8,1),(102,'2022-11-27 18:51:02.962593','50','J. Bergman',1,'[{\"added\": {}}]',8,1),(103,'2022-11-27 18:53:04.618934','51','A. Baspineiro',1,'[{\"added\": {}}]',8,1),(104,'2022-11-27 18:53:22.842549','52','S. Perez',1,'[{\"added\": {}}]',8,1),(105,'2022-11-27 18:56:58.263436','53','E. Espinoza',1,'[{\"added\": {}}]',8,1),(106,'2022-11-27 18:57:58.968261','54','M. Ovando',1,'[{\"added\": {}}]',8,1),(107,'2022-11-27 19:05:21.566441','55','D. Avila',1,'[{\"added\": {}}]',8,1),(108,'2022-11-27 19:23:22.843942','1','Horarios object (1)',1,'[{\"added\": {}}]',10,1),(109,'2022-11-27 19:23:22.917081','2','Horarios object (2)',1,'[{\"added\": {}}]',10,1),(110,'2022-11-27 19:24:15.257113','3','Horarios object (3)',1,'[{\"added\": {}}]',10,1),(111,'2022-11-27 19:24:58.458960','4','Horarios object (4)',1,'[{\"added\": {}}]',10,1),(112,'2022-11-27 19:25:30.515636','5','Horarios object (5)',1,'[{\"added\": {}}]',10,1),(113,'2022-11-27 19:26:46.384716','6','Horarios object (6)',1,'[{\"added\": {}}]',10,1),(114,'2022-11-27 19:27:22.086380','7','Horarios object (7)',1,'[{\"added\": {}}]',10,1),(115,'2022-11-27 19:27:51.022034','8','Horarios object (8)',1,'[{\"added\": {}}]',10,1),(116,'2022-11-27 19:28:24.773038','9','Horarios object (9)',1,'[{\"added\": {}}]',10,1),(117,'2022-11-27 19:30:23.434344','10','Horarios object (10)',1,'[{\"added\": {}}]',10,1),(118,'2022-11-27 19:31:06.585979','11','Horarios object (11)',1,'[{\"added\": {}}]',10,1),(119,'2022-11-27 19:31:48.402221','12','Horarios object (12)',1,'[{\"added\": {}}]',10,1),(120,'2022-11-28 13:41:43.411289','13','Horarios object (13)',1,'[{\"added\": {}}]',10,1),(121,'2022-11-28 13:42:19.186562','14','Horarios object (14)',1,'[{\"added\": {}}]',10,1),(122,'2022-11-28 13:42:52.895306','15','Horarios object (15)',1,'[{\"added\": {}}]',10,1),(123,'2022-11-28 13:43:33.921303','16','Horarios object (16)',1,'[{\"added\": {}}]',10,1),(124,'2022-11-28 13:46:59.051070','17','Horarios object (17)',1,'[{\"added\": {}}]',10,1),(125,'2022-11-28 13:47:28.648276','18','Horarios object (18)',1,'[{\"added\": {}}]',10,1),(126,'2022-11-28 13:47:38.094343','18','Horarios object (18)',2,'[]',10,1),(127,'2022-11-28 13:50:00.269462','19','Horarios object (19)',1,'[{\"added\": {}}]',10,1),(128,'2022-11-28 13:50:05.382351','20','Horarios object (20)',1,'[{\"added\": {}}]',10,1),(129,'2022-11-28 13:50:52.936308','21','Horarios object (21)',1,'[{\"added\": {}}]',10,1),(130,'2022-11-28 13:51:21.334289','22','Horarios object (22)',1,'[{\"added\": {}}]',10,1),(131,'2022-11-28 13:51:32.993744','23','Horarios object (23)',1,'[{\"added\": {}}]',10,1),(132,'2022-11-28 14:32:46.406566','24','Horarios object (24)',1,'[{\"added\": {}}]',10,1),(133,'2022-11-28 14:33:06.348900','25','Horarios object (25)',1,'[{\"added\": {}}]',10,1),(134,'2022-11-28 14:33:35.938633','26','Horarios object (26)',1,'[{\"added\": {}}]',10,1),(135,'2022-11-28 14:34:29.656668','27','Horarios object (27)',1,'[{\"added\": {}}]',10,1),(136,'2022-11-28 14:35:03.791294','28','Horarios object (28)',1,'[{\"added\": {}}]',10,1),(137,'2022-11-28 14:35:37.734983','29','Horarios object (29)',1,'[{\"added\": {}}]',10,1),(138,'2022-11-28 14:36:13.012674','30','Horarios object (30)',1,'[{\"added\": {}}]',10,1),(139,'2022-11-28 14:36:46.410935','31','Horarios object (31)',1,'[{\"added\": {}}]',10,1),(140,'2022-11-28 14:37:01.769636','32','Horarios object (32)',1,'[{\"added\": {}}]',10,1),(141,'2022-11-28 14:37:15.669770','33','Horarios object (33)',1,'[{\"added\": {}}]',10,1),(142,'2022-11-28 14:37:39.192652','34','Horarios object (34)',1,'[{\"added\": {}}]',10,1),(143,'2022-11-28 14:38:01.226339','35','Horarios object (35)',1,'[{\"added\": {}}]',10,1),(144,'2022-11-28 14:38:30.141360','36','Horarios object (36)',1,'[{\"added\": {}}]',10,1),(145,'2022-11-28 14:39:11.941271','37','Horarios object (37)',1,'[{\"added\": {}}]',10,1),(146,'2022-11-28 14:39:25.002628','38','Horarios object (38)',1,'[{\"added\": {}}]',10,1),(147,'2022-11-28 14:39:58.924917','39','Horarios object (39)',1,'[{\"added\": {}}]',10,1),(148,'2022-11-28 14:40:15.970159','40','Horarios object (40)',1,'[{\"added\": {}}]',10,1),(149,'2022-11-28 14:40:41.714587','41','Horarios object (41)',1,'[{\"added\": {}}]',10,1),(150,'2022-11-28 14:41:16.788431','42','Horarios object (42)',1,'[{\"added\": {}}]',10,1),(151,'2022-11-28 14:41:39.789979','43','Horarios object (43)',1,'[{\"added\": {}}]',10,1),(152,'2022-11-28 14:42:13.221053','44','Horarios object (44)',1,'[{\"added\": {}}]',10,1),(153,'2022-11-28 14:42:31.889252','45','Horarios object (45)',1,'[{\"added\": {}}]',10,1),(154,'2022-11-28 14:42:46.862833','46','Horarios object (46)',1,'[{\"added\": {}}]',10,1),(155,'2022-11-28 14:42:56.651048','47','Horarios object (47)',1,'[{\"added\": {}}]',10,1),(156,'2022-11-28 14:43:15.578190','48','Horarios object (48)',1,'[{\"added\": {}}]',10,1),(157,'2022-11-28 14:44:10.206251','49','Horarios object (49)',1,'[{\"added\": {}}]',10,1),(158,'2022-11-28 14:44:40.274745','50','Horarios object (50)',1,'[{\"added\": {}}]',10,1),(159,'2022-11-28 14:47:50.142080','51','Horarios object (51)',1,'[{\"added\": {}}]',10,1),(160,'2022-11-28 14:48:31.534213','52','Horarios object (52)',1,'[{\"added\": {}}]',10,1),(161,'2022-11-28 14:48:56.550461','53','Horarios object (53)',1,'[{\"added\": {}}]',10,1),(162,'2022-11-28 14:50:27.737454','54','Horarios object (54)',1,'[{\"added\": {}}]',10,1),(163,'2022-11-28 14:50:51.687951','55','Horarios object (55)',1,'[{\"added\": {}}]',10,1),(164,'2022-11-28 14:51:28.241315','56','Horarios object (56)',1,'[{\"added\": {}}]',10,1),(165,'2022-11-28 14:52:32.403923','57','Horarios object (57)',1,'[{\"added\": {}}]',10,1),(166,'2022-11-28 14:53:02.463396','58','Horarios object (58)',1,'[{\"added\": {}}]',10,1),(167,'2022-11-28 14:53:26.087414','59','Horarios object (59)',1,'[{\"added\": {}}]',10,1),(168,'2022-11-28 14:55:33.642475','57','O. Velasco',1,'[{\"added\": {}}]',8,1),(169,'2022-11-28 14:55:46.229182','60','Horarios object (60)',1,'[{\"added\": {}}]',10,1),(170,'2022-11-28 14:56:05.914076','61','Horarios object (61)',1,'[{\"added\": {}}]',10,1),(171,'2022-11-28 14:56:37.573043','62','Horarios object (62)',1,'[{\"added\": {}}]',10,1),(172,'2022-11-28 14:56:54.935314','63','Horarios object (63)',1,'[{\"added\": {}}]',10,1),(173,'2022-11-28 14:57:27.813303','64','Horarios object (64)',1,'[{\"added\": {}}]',10,1),(174,'2022-11-28 14:57:47.567631','65','Horarios object (65)',1,'[{\"added\": {}}]',10,1),(175,'2022-11-28 14:58:57.019214','66','Horarios object (66)',1,'[{\"added\": {}}]',10,1),(176,'2022-11-28 14:59:19.002677','67','Horarios object (67)',1,'[{\"added\": {}}]',10,1),(177,'2022-11-28 14:59:33.404902','68','Horarios object (68)',1,'[{\"added\": {}}]',10,1),(178,'2022-11-28 14:59:43.697311','69','Horarios object (69)',1,'[{\"added\": {}}]',10,1),(179,'2022-11-28 14:59:57.031325','70','Horarios object (70)',1,'[{\"added\": {}}]',10,1),(180,'2022-11-28 15:00:15.245450','71','Horarios object (71)',1,'[{\"added\": {}}]',10,1),(181,'2022-11-28 15:00:47.108856','72','Horarios object (72)',1,'[{\"added\": {}}]',10,1),(182,'2022-11-28 15:02:04.242662','73','Horarios object (73)',1,'[{\"added\": {}}]',10,1),(183,'2022-11-28 15:02:25.820012','74','Horarios object (74)',1,'[{\"added\": {}}]',10,1),(184,'2022-11-28 15:02:43.876438','75','Horarios object (75)',1,'[{\"added\": {}}]',10,1),(185,'2022-11-28 15:03:11.642560','76','Horarios object (76)',1,'[{\"added\": {}}]',10,1),(186,'2022-11-28 15:03:49.730484','77','Horarios object (77)',1,'[{\"added\": {}}]',10,1),(187,'2022-11-28 15:04:13.779313','78','Horarios object (78)',1,'[{\"added\": {}}]',10,1),(188,'2022-11-28 15:04:35.080371','79','Horarios object (79)',1,'[{\"added\": {}}]',10,1),(189,'2022-11-28 15:05:15.806432','80','Horarios object (80)',1,'[{\"added\": {}}]',10,1),(190,'2022-11-28 15:05:35.940205','81','Horarios object (81)',1,'[{\"added\": {}}]',10,1),(191,'2022-11-28 15:06:15.137965','82','Horarios object (82)',1,'[{\"added\": {}}]',10,1),(192,'2022-11-28 15:06:36.674813','83','Horarios object (83)',1,'[{\"added\": {}}]',10,1),(193,'2022-11-28 15:08:06.983087','84','Horarios object (84)',1,'[{\"added\": {}}]',10,1),(194,'2022-11-28 15:08:31.186954','85','Horarios object (85)',1,'[{\"added\": {}}]',10,1),(195,'2022-11-28 15:08:57.570951','86','Horarios object (86)',1,'[{\"added\": {}}]',10,1),(196,'2022-11-28 15:09:37.782374','87','Horarios object (87)',1,'[{\"added\": {}}]',10,1),(197,'2022-11-28 15:10:03.692650','88','Horarios object (88)',1,'[{\"added\": {}}]',10,1),(198,'2022-11-28 15:10:25.619770','89','Horarios object (89)',1,'[{\"added\": {}}]',10,1),(199,'2022-11-28 15:10:52.717605','90','Horarios object (90)',1,'[{\"added\": {}}]',10,1),(200,'2022-11-28 15:11:18.410829','91','Horarios object (91)',1,'[{\"added\": {}}]',10,1),(201,'2022-11-28 15:11:43.973953','92','Horarios object (92)',1,'[{\"added\": {}}]',10,1),(202,'2022-11-28 15:12:16.823899','93','Horarios object (93)',1,'[{\"added\": {}}]',10,1),(203,'2022-11-28 15:12:35.392137','94','Horarios object (94)',1,'[{\"added\": {}}]',10,1),(204,'2022-11-28 15:13:01.450475','95','Horarios object (95)',1,'[{\"added\": {}}]',10,1),(205,'2022-11-28 15:13:21.796926','96','Horarios object (96)',1,'[{\"added\": {}}]',10,1),(206,'2022-11-28 15:13:53.442093','97','Horarios object (97)',1,'[{\"added\": {}}]',10,1),(207,'2022-11-28 15:15:10.207259','98','Horarios object (98)',1,'[{\"added\": {}}]',10,1),(208,'2022-11-28 15:16:08.794108','58','A. Acefalia',1,'[{\"added\": {}}]',8,1),(209,'2022-11-28 15:16:13.549733','99','Horarios object (99)',1,'[{\"added\": {}}]',10,1),(210,'2022-11-28 15:16:49.822945','100','Horarios object (100)',1,'[{\"added\": {}}]',10,1),(211,'2022-11-28 15:21:03.430687','101','Horarios object (101)',1,'[{\"added\": {}}]',10,1),(212,'2022-11-28 15:21:25.308381','102','Horarios object (102)',1,'[{\"added\": {}}]',10,1),(213,'2022-11-28 15:21:42.544723','103','Horarios object (103)',1,'[{\"added\": {}}]',10,1),(214,'2022-11-28 15:22:16.901067','104','Horarios object (104)',1,'[{\"added\": {}}]',10,1),(215,'2022-11-28 15:22:45.358854','105','Horarios object (105)',1,'[{\"added\": {}}]',10,1),(216,'2022-11-28 15:23:09.651134','106','Horarios object (106)',1,'[{\"added\": {}}]',10,1),(217,'2022-11-28 15:23:47.595925','107','Horarios object (107)',1,'[{\"added\": {}}]',10,1),(218,'2022-11-28 15:29:16.693165','108','Horarios object (108)',1,'[{\"added\": {}}]',10,1),(219,'2022-11-28 15:29:45.452149','109','Horarios object (109)',1,'[{\"added\": {}}]',10,1),(220,'2022-11-28 15:30:18.344804','110','Horarios object (110)',1,'[{\"added\": {}}]',10,1),(221,'2022-11-28 15:30:40.445027','111','Horarios object (111)',1,'[{\"added\": {}}]',10,1),(222,'2022-11-28 15:31:09.375660','112','Horarios object (112)',1,'[{\"added\": {}}]',10,1),(223,'2022-11-28 15:31:58.336685','113','Horarios object (113)',1,'[{\"added\": {}}]',10,1),(224,'2022-11-28 15:32:22.023436','114','Horarios object (114)',1,'[{\"added\": {}}]',10,1),(225,'2022-11-28 15:32:52.344386','115','Horarios object (115)',1,'[{\"added\": {}}]',10,1),(226,'2022-11-28 15:33:36.912575','116','Horarios object (116)',1,'[{\"added\": {}}]',10,1),(227,'2022-11-28 15:33:48.753309','117','Horarios object (117)',1,'[{\"added\": {}}]',10,1),(228,'2022-11-28 15:34:27.484626','118','Horarios object (118)',1,'[{\"added\": {}}]',10,1),(229,'2022-11-28 15:35:01.032729','119','Horarios object (119)',1,'[{\"added\": {}}]',10,1),(230,'2022-11-28 15:48:24.319371','120','Horarios object (120)',1,'[{\"added\": {}}]',10,1),(231,'2022-11-28 16:46:35.819853','121','Horarios object (121)',1,'[{\"added\": {}}]',10,1),(232,'2022-11-28 16:50:42.633054','122','Horarios object (122)',1,'[{\"added\": {}}]',10,1),(233,'2022-11-28 16:51:36.588927','123','Horarios object (123)',1,'[{\"added\": {}}]',10,1),(234,'2022-11-28 16:52:17.479324','124','Horarios object (124)',1,'[{\"added\": {}}]',10,1),(235,'2022-11-28 16:52:42.219690','125','Horarios object (125)',1,'[{\"added\": {}}]',10,1),(236,'2022-11-28 16:53:06.509940','126','Horarios object (126)',1,'[{\"added\": {}}]',10,1),(237,'2022-11-28 16:53:44.338836','127','Horarios object (127)',1,'[{\"added\": {}}]',10,1),(238,'2022-11-28 17:12:22.907850','128','Horarios object (128)',1,'[{\"added\": {}}]',10,1),(239,'2022-11-28 17:13:28.768953','129','Horarios object (129)',1,'[{\"added\": {}}]',10,1),(240,'2022-11-28 17:14:14.087809','130','Horarios object (130)',1,'[{\"added\": {}}]',10,1),(241,'2022-11-28 17:24:37.570459','131','Horarios object (131)',1,'[{\"added\": {}}]',10,1),(242,'2022-11-28 17:25:44.954848','132','Horarios object (132)',1,'[{\"added\": {}}]',10,1),(243,'2022-11-28 17:28:19.041453','133','Horarios object (133)',1,'[{\"added\": {}}]',10,1),(244,'2022-11-28 17:28:42.267976','134','Horarios object (134)',1,'[{\"added\": {}}]',10,1),(245,'2022-11-28 17:29:06.356397','135','Horarios object (135)',1,'[{\"added\": {}}]',10,1),(246,'2022-11-28 17:29:40.961909','136','Horarios object (136)',1,'[{\"added\": {}}]',10,1),(247,'2022-11-28 17:30:17.487945','137','Horarios object (137)',1,'[{\"added\": {}}]',10,1),(248,'2022-11-28 17:30:28.308893','138','Horarios object (138)',1,'[{\"added\": {}}]',10,1),(249,'2022-11-28 17:31:11.090181','139','Horarios object (139)',1,'[{\"added\": {}}]',10,1),(250,'2022-11-28 17:31:38.932900','140','Horarios object (140)',1,'[{\"added\": {}}]',10,1),(251,'2022-11-28 17:32:22.144411','141','Horarios object (141)',1,'[{\"added\": {}}]',10,1),(252,'2022-11-28 17:32:45.278831','142','Horarios object (142)',1,'[{\"added\": {}}]',10,1),(253,'2022-11-28 17:33:12.913471','143','Horarios object (143)',1,'[{\"added\": {}}]',10,1),(254,'2022-11-28 17:41:50.017334','144','Horarios object (144)',1,'[{\"added\": {}}]',10,1),(255,'2022-11-28 17:42:35.240317','145','Horarios object (145)',1,'[{\"added\": {}}]',10,1),(256,'2022-11-28 17:43:13.547912','146','Horarios object (146)',1,'[{\"added\": {}}]',10,1),(257,'2022-11-28 17:43:45.486004','147','Horarios object (147)',1,'[{\"added\": {}}]',10,1),(258,'2022-11-28 17:44:21.296872','148','Horarios object (148)',1,'[{\"added\": {}}]',10,1),(259,'2022-11-28 17:44:53.772612','149','Horarios object (149)',1,'[{\"added\": {}}]',10,1),(260,'2022-11-28 17:45:17.670801','150','Horarios object (150)',1,'[{\"added\": {}}]',10,1),(261,'2022-11-28 17:45:34.040182','151','Horarios object (151)',1,'[{\"added\": {}}]',10,1),(262,'2022-11-28 17:46:12.692398','152','Horarios object (152)',1,'[{\"added\": {}}]',10,1),(263,'2022-11-28 17:46:39.011515','153','Horarios object (153)',1,'[{\"added\": {}}]',10,1),(264,'2022-11-28 17:51:04.128643','154','Horarios object (154)',1,'[{\"added\": {}}]',10,1),(265,'2022-11-28 17:51:23.516818','155','Horarios object (155)',1,'[{\"added\": {}}]',10,1),(266,'2022-11-28 17:51:54.853799','156','Horarios object (156)',1,'[{\"added\": {}}]',10,1),(267,'2022-11-28 17:52:27.028882','157','Horarios object (157)',1,'[{\"added\": {}}]',10,1),(268,'2022-11-28 17:52:50.158826','158','Horarios object (158)',1,'[{\"added\": {}}]',10,1),(269,'2022-11-28 17:53:57.061314','159','Horarios object (159)',1,'[{\"added\": {}}]',10,1),(270,'2022-11-28 17:54:22.393527','160','Horarios object (160)',1,'[{\"added\": {}}]',10,1),(271,'2022-11-28 17:54:44.446585','161','Horarios object (161)',1,'[{\"added\": {}}]',10,1),(272,'2022-11-28 17:55:33.160222','162','Horarios object (162)',1,'[{\"added\": {}}]',10,1),(273,'2022-11-28 17:55:57.961215','163','Horarios object (163)',1,'[{\"added\": {}}]',10,1),(274,'2022-11-28 20:33:43.600926','164','Horarios object (164)',1,'[{\"added\": {}}]',10,1),(275,'2022-11-28 20:33:48.980627','165','Horarios object (165)',1,'[{\"added\": {}}]',10,1),(276,'2022-11-28 20:34:02.338128','166','Horarios object (166)',1,'[{\"added\": {}}]',10,1),(277,'2022-11-28 20:34:06.200669','167','Horarios object (167)',1,'[{\"added\": {}}]',10,1),(278,'2022-11-28 20:34:24.842976','168','Horarios object (168)',1,'[{\"added\": {}}]',10,1),(279,'2022-11-28 20:34:43.454847','169','Horarios object (169)',1,'[{\"added\": {}}]',10,1),(280,'2022-11-28 20:35:10.539283','170','Horarios object (170)',1,'[{\"added\": {}}]',10,1),(281,'2022-11-28 20:35:37.760533','171','Horarios object (171)',1,'[{\"added\": {}}]',10,1),(282,'2022-11-28 20:36:07.084495','172','Horarios object (172)',1,'[{\"added\": {}}]',10,1),(283,'2022-11-28 20:36:19.390180','173','Horarios object (173)',1,'[{\"added\": {}}]',10,1),(284,'2022-11-28 20:36:33.632610','174','Horarios object (174)',1,'[{\"added\": {}}]',10,1),(285,'2022-11-28 20:37:06.084952','175','Horarios object (175)',1,'[{\"added\": {}}]',10,1),(286,'2022-11-28 20:37:24.524583','176','Horarios object (176)',1,'[{\"added\": {}}]',10,1),(287,'2022-11-28 20:37:42.509049','177','Horarios object (177)',1,'[{\"added\": {}}]',10,1),(288,'2022-11-28 20:38:04.649567','178','Horarios object (178)',1,'[{\"added\": {}}]',10,1),(289,'2022-11-28 20:39:05.388213','179','Horarios object (179)',1,'[{\"added\": {}}]',10,1),(290,'2022-11-28 20:39:19.641332','180','Horarios object (180)',1,'[{\"added\": {}}]',10,1),(291,'2022-11-28 20:39:42.343275','181','Horarios object (181)',1,'[{\"added\": {}}]',10,1),(292,'2022-11-29 19:33:00.476741','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(293,'2022-11-29 19:40:26.319681','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(294,'2022-11-29 19:40:30.784133','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(295,'2022-11-29 19:41:00.099102','3','id: 3',1,'[{\"added\": {}}]',11,1),(296,'2022-11-29 19:41:01.769454','3','Usuario con nombre: Aline Sutton Benton',1,'[{\"added\": {}}]',7,1),(297,'2022-11-29 19:43:32.276504','3','Usuario con nombre: Aline Sutton Benton',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',7,1),(298,'2022-11-29 20:03:17.139875','3','Usuario con nombre: Aline Sutton Benton',2,'[]',7,1),(299,'2022-11-29 20:17:39.545997','3','Usuario con nombre: Aline Sutton Benton',2,'[]',7,1),(300,'2022-11-29 20:18:09.761826','3','Usuario con nombre: Aline Sutton Benton',2,'[]',7,1),(301,'2022-11-29 20:18:13.842449','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(302,'2022-11-29 21:46:18.010950','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(303,'2022-11-30 01:08:46.443422','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(304,'2022-11-30 01:09:13.086300','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(305,'2022-11-30 01:12:01.190498','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(306,'2022-11-30 01:12:30.889685','4','id: 4',1,'[{\"added\": {}}]',11,1),(307,'2022-11-30 01:12:39.427417','4','Usuario con nombre: Guinevere Reid Jordan',1,'[{\"added\": {}}]',7,1),(308,'2022-11-30 01:14:42.808730','4','Usuario con nombre: Guinevere Reid Jordan',2,'[]',7,1),(309,'2022-11-30 01:27:53.338522','4','Usuario con nombre: Guinevere Reid Jordan',2,'[]',7,1),(310,'2022-11-30 01:28:24.571063','4','Usuario con nombre: Guinevere Reid Jordan',3,'',7,1),(311,'2022-11-30 01:28:35.179290','3','Usuario con nombre: Aline Sutton Benton',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(312,'2022-11-30 01:28:42.427098','3','Usuario con nombre: Aline Sutton Benton',3,'',7,1),(313,'2022-11-30 01:29:02.754840','4','Usuario con nombre: Lara Lee Strickland',1,'[{\"added\": {}}]',7,1),(314,'2022-11-30 01:31:25.490332','4','Usuario con nombre: Lara Lee Strickland',2,'[]',7,1),(315,'2022-11-30 01:31:37.346246','4','Usuario con nombre: Lara Lee Strickland',3,'',7,1),(316,'2022-11-30 01:41:57.165041','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(317,'2022-11-30 01:54:26.321121','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(318,'2022-11-30 01:55:18.357599','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(319,'2022-11-30 01:58:05.042782','4','Usuario con nombre: Nasim Sawyer Ashley',1,'[{\"added\": {}}]',7,1),(320,'2022-11-30 02:04:06.062992','4','Usuario con nombre: Nasim Sawyer Ashley',2,'[]',7,1),(321,'2022-11-30 02:18:37.720189','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(322,'2022-11-30 02:19:52.289122','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(323,'2022-11-30 02:20:04.126611','4','Usuario con nombre: Nasim Sawyer Ashley',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(324,'2022-11-30 02:22:20.252639','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(325,'2022-11-30 02:22:56.348548','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[]',7,1),(326,'2022-11-30 02:23:07.770532','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(327,'2022-11-30 02:25:11.905054','2','Usuario con nombre: Martin Andres Acebey Laime',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(328,'2022-11-30 03:04:43.572219','4','Usuario con nombre: Nasim Sawyer Ashley',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',7,1),(329,'2022-11-30 03:05:12.965555','3','Usuario con nombre: Wynne Donaldson Rocha',1,'[{\"added\": {}}]',7,1),(330,'2022-11-30 03:35:59.085090','56','Usuario con nombre:  ',3,'',6,1),(331,'2022-11-30 03:36:05.359451','65','Usuario con nombre:  ',3,'',6,1),(332,'2022-11-30 03:36:10.023140','64','Usuario con nombre:  ',3,'',6,1),(333,'2022-11-30 03:36:17.741715','63','Usuario con nombre:  ',3,'',6,1),(334,'2022-11-30 11:19:56.156231','4','Usuario con nombre: Nasim Sawyer Ashley',3,'',7,1),(335,'2022-11-30 11:19:56.318492','3','Usuario con nombre: Wynne Donaldson Rocha',3,'',7,1),(336,'2022-11-30 12:03:10.950970','4','Usuario con nombre: Fiona Gould Patel',1,'[{\"added\": {}}]',7,1),(337,'2022-12-01 01:14:10.196344','2','Usuario con nombre: Martin Andres Acebey Laime',3,'',7,1),(338,'2022-12-01 01:18:27.840045','2','Usuario con nombre: Hall Hawkins Shields',1,'[{\"added\": {}}]',7,1),(339,'2022-12-01 01:31:35.402972','4','Usuario con nombre: Fiona Gould Patel',2,'[]',7,1),(340,'2022-12-01 01:52:11.929477','4','Usuario con nombre: Fiona Gould Patel',2,'[]',7,1),(341,'2022-12-04 14:59:11.196499','11','SIS308',2,'[{\"changed\": {\"fields\": [\"Pre requisitos\"]}}]',12,1),(342,'2022-12-04 14:59:16.564742','11','SIS308',2,'[]',12,1),(343,'2022-12-04 16:26:41.637026','1','Horarios object (1)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(344,'2022-12-04 16:33:23.092262','2','Horarios object (2)',3,'',10,1),(345,'2022-12-04 16:33:43.434023','3','Horarios object (3)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(346,'2022-12-04 16:34:08.022734','4','Horarios object (4)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(347,'2022-12-04 16:34:16.556110','1','Horarios object (1)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(348,'2022-12-04 16:34:41.731028','5','Horarios object (5)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(349,'2022-12-04 16:35:08.452862','6','Horarios object (6)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(350,'2022-12-04 16:35:36.129395','7','Horarios object (7)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(351,'2022-12-04 16:36:10.314428','8','Horarios object (8)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(352,'2022-12-04 16:36:52.239066','9','Horarios object (9)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(353,'2022-12-04 16:37:20.157986','10','Horarios object (10)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(354,'2022-12-04 16:37:44.775759','11','Horarios object (11)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(355,'2022-12-04 16:38:22.636923','12','Horarios object (12)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(356,'2022-12-04 16:39:19.340030','13','Horarios object (13)',2,'[]',10,1),(357,'2022-12-04 16:39:40.744729','14','Horarios object (14)',2,'[]',10,1),(358,'2022-12-04 16:40:00.988767','15','Horarios object (15)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(359,'2022-12-04 16:40:53.488465','16','Horarios object (16)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(360,'2022-12-04 16:41:17.057829','17','Horarios object (17)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(361,'2022-12-04 16:42:09.499940','18','Horarios object (18)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(362,'2022-12-04 16:43:56.935577','19','Horarios object (19)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(363,'2022-12-04 16:45:01.039505','20','Horarios object (20)',3,'',10,1),(364,'2022-12-04 16:45:27.219467','21','Horarios object (21)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(365,'2022-12-04 16:45:44.516225','22','Horarios object (22)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(366,'2022-12-04 16:46:40.928047','23','Horarios object (23)',3,'',10,1),(367,'2022-12-04 16:47:18.888187','24','Horarios object (24)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(368,'2022-12-04 16:47:26.904050','25','Horarios object (25)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(369,'2022-12-04 16:47:48.296937','26','Horarios object (26)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(370,'2022-12-04 16:47:58.170118','27','Horarios object (27)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(371,'2022-12-04 16:48:31.676226','28','Horarios object (28)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(372,'2022-12-04 16:48:42.727062','29','Horarios object (29)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(373,'2022-12-04 16:49:07.923346','30','Horarios object (30)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(374,'2022-12-04 16:49:18.752528','31','Horarios object (31)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(375,'2022-12-04 16:49:34.257507','32','Horarios object (32)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(376,'2022-12-04 16:49:42.123434','33','Horarios object (33)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(377,'2022-12-04 16:50:21.124338','34','Horarios object (34)',2,'[{\"changed\": {\"fields\": [\"Tipo\", \"Grupo\"]}}]',10,1),(378,'2022-12-04 16:50:32.774810','35','Horarios object (35)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(379,'2022-12-04 16:50:50.698706','36','Horarios object (36)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(380,'2022-12-04 16:51:28.051581','37','Horarios object (37)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(381,'2022-12-04 16:52:05.750975','38','Horarios object (38)',3,'',10,1),(382,'2022-12-04 16:52:22.867237','39','Horarios object (39)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(383,'2022-12-04 16:52:32.565122','40','Horarios object (40)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(384,'2022-12-04 16:52:52.683154','41','Horarios object (41)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(385,'2022-12-04 16:53:16.218679','42','Horarios object (42)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(386,'2022-12-04 16:53:23.858902','43','Horarios object (43)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(387,'2022-12-04 16:55:46.420673','44','Horarios object (44)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(388,'2022-12-04 16:56:12.776654','45','Horarios object (45)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(389,'2022-12-04 16:56:38.260841','46','Horarios object (46)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(390,'2022-12-04 16:56:49.242528','47','Horarios object (47)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(391,'2022-12-04 16:57:38.056962','46','Horarios object (46)',3,'',10,1),(392,'2022-12-04 17:00:43.262651','48','Horarios object (48)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(393,'2022-12-04 17:01:10.595623','49','Horarios object (49)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(394,'2022-12-04 17:01:23.046855','50','Horarios object (50)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(395,'2022-12-04 17:01:36.659322','51','Horarios object (51)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(396,'2022-12-04 17:04:04.330267','52','Horarios object (52)',2,'[{\"changed\": {\"fields\": [\"Aula\", \"Grupo\"]}}]',10,1),(397,'2022-12-04 17:04:16.822700','53','Horarios object (53)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(398,'2022-12-04 17:05:01.017802','54','Horarios object (54)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(399,'2022-12-04 17:05:19.557333','55','Horarios object (55)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(400,'2022-12-04 17:05:33.220590','56','Horarios object (56)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(401,'2022-12-04 17:06:09.465588','57','Horarios object (57)',2,'[{\"changed\": {\"fields\": [\"Tipo\", \"Grupo\"]}}]',10,1),(402,'2022-12-04 17:06:26.022876','58','Horarios object (58)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(403,'2022-12-04 17:06:45.815255','59','Horarios object (59)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(404,'2022-12-04 17:07:05.276102','60','Horarios object (60)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(405,'2022-12-04 17:07:17.855649','61','Horarios object (61)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(406,'2022-12-04 17:07:46.777127','62','Horarios object (62)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(407,'2022-12-04 17:08:04.131155','63','Horarios object (63)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(408,'2022-12-04 17:08:29.860845','64','Horarios object (64)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(409,'2022-12-04 17:08:52.428113','65','Horarios object (65)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(410,'2022-12-04 17:09:03.432522','66','Horarios object (66)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(411,'2022-12-04 17:09:17.495935','67','Horarios object (67)',2,'[{\"changed\": {\"fields\": [\"Tipo\", \"Grupo\"]}}]',10,1),(412,'2022-12-04 17:09:33.455499','68','Horarios object (68)',2,'[{\"changed\": {\"fields\": [\"Tipo\", \"Grupo\"]}}]',10,1),(413,'2022-12-04 17:10:28.512353','68','Horarios object (68)',3,'',10,1),(414,'2022-12-04 17:11:35.958798','69','Horarios object (69)',3,'',10,1),(415,'2022-12-04 17:11:58.954953','70','Horarios object (70)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(416,'2022-12-04 17:15:27.988226','71','Horarios object (71)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(417,'2022-12-04 17:15:43.581451','72','Horarios object (72)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(418,'2022-12-04 17:15:58.172403','73','Horarios object (73)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(419,'2022-12-04 17:16:19.672966','74','Horarios object (74)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(420,'2022-12-04 17:16:35.977605','75','Horarios object (75)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(421,'2022-12-04 17:16:59.479437','76','Horarios object (76)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(422,'2022-12-04 17:17:15.620894','77','Horarios object (77)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(423,'2022-12-04 17:17:29.074930','78','Horarios object (78)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(424,'2022-12-04 17:17:44.000242','79','Horarios object (79)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(425,'2022-12-04 17:17:57.449660','80','Horarios object (80)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(426,'2022-12-04 17:18:10.631226','81','Horarios object (81)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(427,'2022-12-04 17:18:32.928286','82','Horarios object (82)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(428,'2022-12-04 17:18:40.474117','83','Horarios object (83)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(429,'2022-12-04 17:19:07.720935','84','Horarios object (84)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(430,'2022-12-04 17:19:21.805113','85','Horarios object (85)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(431,'2022-12-04 17:19:34.254797','86','Horarios object (86)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(432,'2022-12-04 17:19:41.564115','87','Horarios object (87)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(433,'2022-12-04 17:21:32.062535','87','Horarios object (87)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(434,'2022-12-04 17:21:45.936418','88','Horarios object (88)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(435,'2022-12-04 17:21:53.919751','89','Horarios object (89)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(436,'2022-12-04 17:22:07.680369','90','Horarios object (90)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(437,'2022-12-04 17:22:24.596157','91','Horarios object (91)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(438,'2022-12-04 17:22:37.682978','92','Horarios object (92)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(439,'2022-12-04 17:22:56.587366','93','Horarios object (93)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(440,'2022-12-04 17:23:07.704347','94','Horarios object (94)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(441,'2022-12-04 17:23:18.142601','95','Horarios object (95)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(442,'2022-12-04 17:23:33.340760','96','Horarios object (96)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(443,'2022-12-04 17:23:47.565278','97','Horarios object (97)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(444,'2022-12-04 17:23:54.940445','98','Horarios object (98)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(445,'2022-12-04 17:24:37.973382','99','Horarios object (99)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(446,'2022-12-04 17:24:49.478742','100','Horarios object (100)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(447,'2022-12-04 17:25:07.061616','101','Horarios object (101)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(448,'2022-12-04 17:25:19.957560','102','Horarios object (102)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(449,'2022-12-04 17:25:31.592199','103','Horarios object (103)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(450,'2022-12-04 17:25:55.331843','104','Horarios object (104)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(451,'2022-12-04 17:26:05.985615','105','Horarios object (105)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(452,'2022-12-04 17:26:26.242028','106','Horarios object (106)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(453,'2022-12-04 17:26:35.342915','107','Horarios object (107)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(454,'2022-12-04 17:26:54.004605','108','Horarios object (108)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(455,'2022-12-04 17:27:00.119605','109','Horarios object (109)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(456,'2022-12-04 17:27:24.054783','110','Horarios object (110)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(457,'2022-12-04 17:27:44.122611','110','Horarios object (110)',2,'[]',10,1),(458,'2022-12-04 17:27:52.152940','111','Horarios object (111)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(459,'2022-12-04 17:28:25.059763','112','Horarios object (112)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(460,'2022-12-04 17:28:31.512276','113','Horarios object (113)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(461,'2022-12-04 17:28:43.318984','114','Horarios object (114)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(462,'2022-12-04 17:28:53.950732','115','Horarios object (115)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(463,'2022-12-04 17:29:03.843642','116','Horarios object (116)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(464,'2022-12-04 17:29:50.359918','117','Horarios object (117)',3,'',10,1),(465,'2022-12-04 17:30:03.696675','118','Horarios object (118)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(466,'2022-12-04 17:30:10.382163','119','Horarios object (119)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(467,'2022-12-04 17:30:27.387316','120','Horarios object (120)',2,'[]',10,1),(468,'2022-12-04 17:31:01.696183','120','Horarios object (120)',3,'',10,1),(469,'2022-12-04 17:31:19.770248','121','Horarios object (121)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(470,'2022-12-04 17:31:26.521640','122','Horarios object (122)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(471,'2022-12-04 17:31:37.068665','123','Horarios object (123)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(472,'2022-12-04 17:31:48.551760','124','Horarios object (124)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(473,'2022-12-04 17:32:32.774782','125','Horarios object (125)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(474,'2022-12-04 17:32:43.054598','126','Horarios object (126)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(475,'2022-12-04 17:32:56.861567','127','Horarios object (127)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(476,'2022-12-04 17:33:08.398808','128','Horarios object (128)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(477,'2022-12-04 17:33:19.538986','129','Horarios object (129)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(478,'2022-12-04 17:33:44.476220','130','Horarios object (130)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(479,'2022-12-04 17:33:53.189284','131','Horarios object (131)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(480,'2022-12-04 17:34:04.621964','132','Horarios object (132)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(481,'2022-12-04 17:34:23.116892','133','Horarios object (133)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(482,'2022-12-04 17:34:36.951534','134','Horarios object (134)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(483,'2022-12-04 17:34:52.572948','135','Horarios object (135)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(484,'2022-12-04 17:35:05.235131','136','Horarios object (136)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(485,'2022-12-04 17:35:15.292136','137','Horarios object (137)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(486,'2022-12-04 17:35:56.790222','138','Horarios object (138)',3,'',10,1),(487,'2022-12-04 17:36:10.128512','139','Horarios object (139)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(488,'2022-12-04 17:36:22.035047','140','Horarios object (140)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(489,'2022-12-04 17:36:38.883533','141','Horarios object (141)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(490,'2022-12-04 17:36:48.810625','142','Horarios object (142)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(491,'2022-12-04 17:36:57.647331','143','Horarios object (143)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(492,'2022-12-04 18:33:22.043828','144','Horarios object (144)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(493,'2022-12-04 18:33:34.692448','145','Horarios object (145)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(494,'2022-12-04 18:33:49.307250','146','Horarios object (146)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(495,'2022-12-04 18:33:57.416879','147','Horarios object (147)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(496,'2022-12-04 18:34:08.762501','148','Horarios object (148)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(497,'2022-12-04 18:34:20.173069','149','Horarios object (149)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(498,'2022-12-04 18:34:36.428182','150','Horarios object (150)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(499,'2022-12-04 18:34:44.105665','151','Horarios object (151)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(500,'2022-12-04 18:34:53.660242','152','Horarios object (152)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(501,'2022-12-04 18:35:05.033477','153','Horarios object (153)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(502,'2022-12-04 18:37:53.297402','154','Horarios object (154)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(503,'2022-12-04 18:38:03.793149','155','Horarios object (155)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(504,'2022-12-04 18:38:20.831605','156','Horarios object (156)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(505,'2022-12-04 18:38:35.034426','157','Horarios object (157)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(506,'2022-12-04 18:38:48.698326','158','Horarios object (158)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(507,'2022-12-04 18:39:01.448813','159','Horarios object (159)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(508,'2022-12-04 18:39:36.409669','160','Horarios object (160)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(509,'2022-12-04 18:39:44.462054','161','Horarios object (161)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(510,'2022-12-04 18:39:55.973233','162','Horarios object (162)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(511,'2022-12-04 18:40:01.097941','163','Horarios object (163)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(512,'2022-12-04 18:40:41.825187','164','Horarios object (164)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(513,'2022-12-04 18:41:24.221842','165','Horarios object (165)',3,'',10,1),(514,'2022-12-04 18:41:38.294612','166','Horarios object (166)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(515,'2022-12-04 18:42:30.643377','167','Horarios object (167)',3,'',10,1),(516,'2022-12-04 18:42:52.817047','168','Horarios object (168)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(517,'2022-12-04 18:43:09.384935','169','Horarios object (169)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(518,'2022-12-04 18:43:19.433175','170','Horarios object (170)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(519,'2022-12-04 18:43:51.060996','171','Horarios object (171)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(520,'2022-12-04 18:44:03.361365','172','Horarios object (172)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(521,'2022-12-04 18:44:13.115556','173','Horarios object (173)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(522,'2022-12-04 18:44:22.748442','174','Horarios object (174)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(523,'2022-12-04 18:48:08.432966','175','Horarios object (175)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(524,'2022-12-04 18:48:15.366919','176','Horarios object (176)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(525,'2022-12-04 18:48:22.923239','177','Horarios object (177)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(526,'2022-12-04 18:48:38.627388','178','Horarios object (178)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(527,'2022-12-04 18:48:44.047712','179','Horarios object (179)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(528,'2022-12-04 18:48:52.128443','180','Horarios object (180)',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(529,'2022-12-04 18:49:40.335269','181','Horarios object (181)',3,'',10,1),(530,'2022-12-04 18:54:47.003608','6','SIS100',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(531,'2022-12-04 18:57:31.779230','34','Horarios object (34)',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',10,1),(532,'2022-12-04 19:01:35.140172','76','Horarios object (76)',2,'[]',10,1),(533,'2022-12-04 19:02:21.271217','16','SIS302',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(534,'2022-12-04 19:02:25.591838','17','SIS457',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(535,'2022-12-04 19:05:42.490779','182','Horarios object (182)',1,'[{\"added\": {}}]',10,1),(536,'2022-12-04 19:06:42.433818','88','Horarios object (88)',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',10,1),(537,'2022-12-04 19:07:48.524619','20','SIS125',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(538,'2022-12-04 19:14:14.786099','183','Horarios object (183)',1,'[{\"added\": {}}]',10,1),(539,'2022-12-04 19:14:43.451254','18','SIS110',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(540,'2022-12-04 19:16:54.092234','99','Horarios object (99)',3,'',10,1),(541,'2022-12-04 19:25:09.890624','108','Horarios object (108)',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',10,1),(542,'2022-12-04 19:25:44.823168','24','SIS252',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(543,'2022-12-04 19:28:30.109909','110','Horarios object (110)',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',10,1),(544,'2022-12-04 19:29:27.625412','110','Horarios object (110)',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',10,1),(545,'2022-12-04 19:29:48.680758','24','SIS252',2,'[]',12,1),(546,'2022-12-04 19:30:02.090533','26','SIS313',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(547,'2022-12-04 19:30:27.668348','29','SIS420',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(548,'2022-12-04 19:32:47.703612','31','COM460',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(549,'2022-12-04 19:32:59.647198','34','SIS421',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(550,'2022-12-04 19:33:56.720592','37','COM470',2,'[{\"changed\": {\"fields\": [\"Tiene lab\"]}}]',12,1),(551,'2022-12-05 11:42:11.652016','6','Calificaciones object (6)',3,'',13,1),(552,'2022-12-05 11:43:53.133896','6','Calificaciones object (6)',1,'[{\"added\": {}}]',13,1),(553,'2022-12-05 11:44:47.522722','6','Calificaciones object (6)',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',13,1),(554,'2022-12-05 11:45:35.935872','6','Calificaciones object (6)',2,'[{\"changed\": {\"fields\": [\"Final\"]}}]',13,1),(555,'2022-12-05 11:50:46.184693','2','Usuario con nombre: Hall Hawkins Shields',2,'[{\"changed\": {\"fields\": [\"Carrera\"]}}]',7,1),(556,'2022-12-05 11:53:17.179110','6','Calificaciones object (6)',2,'[{\"changed\": {\"fields\": [\"Final\", \"Estado\"]}}]',13,1),(557,'2022-12-05 11:54:35.693148','6','Calificaciones object (6)',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',13,1),(558,'2022-12-05 11:54:50.484089','5','Calificaciones object (5)',2,'[{\"changed\": {\"fields\": [\"Final\", \"Estado\"]}}]',13,1),(559,'2022-12-11 23:24:06.791446','39','39 MAT103',2,'[]',10,1),(560,'2022-12-11 23:24:51.563958','184','184 MAT103',1,'[{\"added\": {}}]',10,1),(561,'2022-12-11 23:26:53.690371','27','27 MAT103',3,'',10,1),(562,'2022-12-11 23:27:24.658611','40','40 SIS103',2,'[{\"changed\": {\"fields\": [\"Docente\"]}}]',10,1),(563,'2022-12-11 23:28:28.416504','40','40 SIS103',2,'[{\"changed\": {\"fields\": [\"Posicion horaria\", \"Aula\"]}}]',10,1),(564,'2022-12-11 23:28:52.184269','40','40 SIS103',2,'[{\"changed\": {\"fields\": [\"Posicion horaria\", \"Grupo\"]}}]',10,1),(565,'2022-12-12 12:00:48.393519','3','Calificaciones object (3)',1,'[{\"added\": {}}]',13,1),(566,'2022-12-12 12:01:38.282740','3','Calificaciones object (3)',3,'',13,1),(567,'2022-12-21 19:42:30.808887','32','Calificaciones object (32)',1,'[{\"added\": {}}]',13,1),(568,'2022-12-22 02:35:39.042122','0','Calificaciones object (0)',1,'[{\"added\": {}}]',13,1),(569,'2022-12-22 02:59:39.795301','1','Calificaciones object (1)',1,'[{\"added\": {}}]',13,1),(570,'2022-12-22 02:59:58.426866','2','Calificaciones object (2)',1,'[{\"added\": {}}]',13,1),(571,'2022-12-22 16:23:49.312771','3','Calificaciones object (3)',1,'[{\"added\": {}}]',13,1),(572,'2022-12-22 16:24:11.420187','4','Calificaciones object (4)',1,'[{\"added\": {}}]',13,1),(573,'2022-12-22 16:24:48.423039','5','Calificaciones object (5)',1,'[{\"added\": {}}]',13,1),(574,'2022-12-22 16:25:10.291641','6','Calificaciones object (6)',1,'[{\"added\": {}}]',13,1),(575,'2022-12-22 18:10:34.750214','7','Calificaciones object (7)',1,'[{\"added\": {}}]',13,1),(576,'2022-12-22 18:12:01.107205','8','Calificaciones object (8)',1,'[{\"added\": {}}]',13,1),(577,'2022-12-22 18:12:32.033199','9','Calificaciones object (9)',1,'[{\"added\": {}}]',13,1),(578,'2022-12-23 17:16:24.062733','3','Usuario con nombre: tirado tirado',1,'[{\"added\": {}}]',7,1),(579,'2022-12-23 17:32:21.740814','10','Calificaciones object (10)',1,'[{\"added\": {}}]',13,1),(580,'2022-12-23 20:05:05.883366','10','Calificaciones object (10)',2,'[{\"changed\": {\"fields\": [\"Final\", \"Estado\"]}}]',13,1),(581,'2022-12-23 20:06:02.708953','11','Calificaciones object (11)',1,'[{\"added\": {}}]',13,1),(582,'2022-12-23 21:55:32.270336','12','Calificaciones object (12)',1,'[{\"added\": {}}]',13,1),(583,'2022-12-23 21:56:12.264771','13','Calificaciones object (13)',1,'[{\"added\": {}}]',13,1),(584,'2022-12-23 22:04:32.306312','75','75 SIS457',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(585,'2022-12-24 00:02:10.727145','12','GEN410',2,'[]',12,1),(586,'2022-12-24 03:59:49.210707','77','77 SIS302',2,'[]',10,1),(587,'2022-12-24 04:00:45.626168','76','76 SIS302',2,'[{\"changed\": {\"fields\": [\"Posicion horaria\", \"Grupo\"]}}]',10,1),(588,'2022-12-24 04:01:47.621872','58','58 SIS302',2,'[{\"changed\": {\"fields\": [\"Grupo\"]}}]',10,1),(589,'2022-12-24 04:02:16.912763','57','57 SIS302',2,'[{\"changed\": {\"fields\": [\"Posicion horaria\", \"Grupo\"]}}]',10,1),(590,'2023-01-02 16:46:33.134222','4','Programaciones object (4)',3,'',14,70),(591,'2023-01-02 16:46:33.223740','3','Programaciones object (3)',3,'',14,70),(592,'2023-01-02 16:46:33.290895','2','Programaciones object (2)',3,'',14,70),(593,'2023-01-02 16:46:33.361392','1','Programaciones object (1)',3,'',14,70),(594,'2023-01-02 18:14:27.972970','5','Programaciones object (5)',3,'',14,70),(595,'2023-01-02 18:14:28.056731','6','Programaciones object (6)',3,'',14,70),(596,'2023-01-02 18:14:28.115284','7','Programaciones object (7)',3,'',14,70),(597,'2023-01-02 18:14:28.180426','8','Programaciones object (8)',3,'',14,70),(598,'2023-01-02 18:14:28.248884','9','Programaciones object (9)',3,'',14,70),(599,'2023-01-02 18:14:28.315800','10','Programaciones object (10)',3,'',14,70),(600,'2023-01-02 18:14:28.388724','11','Programaciones object (11)',3,'',14,70),(601,'2023-01-02 18:14:28.466155','12','Programaciones object (12)',3,'',14,70),(602,'2023-01-02 18:33:11.397047','20','Programaciones object (20)',3,'',14,70),(603,'2023-01-02 18:33:11.460334','19','Programaciones object (19)',3,'',14,70),(604,'2023-01-02 18:33:11.526163','18','Programaciones object (18)',3,'',14,70),(605,'2023-01-02 18:33:11.593983','17','Programaciones object (17)',3,'',14,70),(606,'2023-01-02 18:33:11.685862','16','Programaciones object (16)',3,'',14,70),(607,'2023-01-02 18:33:11.809572','15','Programaciones object (15)',3,'',14,70),(608,'2023-01-02 18:33:11.900627','14','Programaciones object (14)',3,'',14,70),(609,'2023-01-02 18:33:11.977889','13','Programaciones object (13)',3,'',14,70),(610,'2023-01-02 18:37:53.524128','28','Programaciones object (28)',3,'',14,70),(611,'2023-01-02 18:37:53.589418','27','Programaciones object (27)',3,'',14,70),(612,'2023-01-02 18:37:53.658797','26','Programaciones object (26)',3,'',14,70),(613,'2023-01-02 18:37:53.725738','25','Programaciones object (25)',3,'',14,70),(614,'2023-01-02 18:37:53.894370','24','Programaciones object (24)',3,'',14,70),(615,'2023-01-02 18:37:53.967995','23','Programaciones object (23)',3,'',14,70),(616,'2023-01-02 18:37:54.068339','22','Programaciones object (22)',3,'',14,70),(617,'2023-01-02 18:37:54.139764','21','Programaciones object (21)',3,'',14,70),(618,'2023-01-02 18:39:24.501912','36','Programaciones object (36)',3,'',14,70),(619,'2023-01-02 18:39:24.561354','35','Programaciones object (35)',3,'',14,70),(620,'2023-01-02 18:39:24.620281','34','Programaciones object (34)',3,'',14,70),(621,'2023-01-02 18:39:24.697641','33','Programaciones object (33)',3,'',14,70),(622,'2023-01-02 18:39:24.922994','32','Programaciones object (32)',3,'',14,70),(623,'2023-01-02 18:39:24.990328','31','Programaciones object (31)',3,'',14,70),(624,'2023-01-02 18:39:25.057605','30','Programaciones object (30)',3,'',14,70),(625,'2023-01-02 18:39:25.116358','29','Programaciones object (29)',3,'',14,70),(626,'2023-01-02 18:40:25.887205','44','Programaciones object (44)',3,'',14,70),(627,'2023-01-02 18:40:25.980474','43','Programaciones object (43)',3,'',14,70),(628,'2023-01-02 18:40:26.051042','42','Programaciones object (42)',3,'',14,70),(629,'2023-01-02 18:40:26.143010','41','Programaciones object (41)',3,'',14,70),(630,'2023-01-02 18:40:26.268431','40','Programaciones object (40)',3,'',14,70),(631,'2023-01-02 18:40:26.353266','39','Programaciones object (39)',3,'',14,70),(632,'2023-01-02 18:40:26.459793','38','Programaciones object (38)',3,'',14,70),(633,'2023-01-02 18:40:26.526712','37','Programaciones object (37)',3,'',14,70),(634,'2023-01-02 18:45:30.756133','52','Programaciones object (52)',3,'',14,70),(635,'2023-01-02 18:45:30.919231','51','Programaciones object (51)',3,'',14,70),(636,'2023-01-02 18:45:30.994224','50','Programaciones object (50)',3,'',14,70),(637,'2023-01-02 18:45:31.073436','49','Programaciones object (49)',3,'',14,70),(638,'2023-01-02 18:45:31.173468','48','Programaciones object (48)',3,'',14,70),(639,'2023-01-02 18:45:31.264869','47','Programaciones object (47)',3,'',14,70),(640,'2023-01-02 18:45:31.337873','46','Programaciones object (46)',3,'',14,70),(641,'2023-01-02 18:45:31.396294','45','Programaciones object (45)',3,'',14,70),(642,'2023-01-02 18:46:12.383144','56','Programaciones object (56)',3,'',14,70),(643,'2023-01-02 18:46:12.479320','55','Programaciones object (55)',3,'',14,70),(644,'2023-01-02 18:46:12.562808','54','Programaciones object (54)',3,'',14,70),(645,'2023-01-02 18:46:12.637964','53','Programaciones object (53)',3,'',14,70),(646,'2023-01-02 18:47:34.840861','60','Programaciones object (60)',3,'',14,70),(647,'2023-01-02 18:47:34.947000','59','Programaciones object (59)',3,'',14,70),(648,'2023-01-02 18:47:35.022268','58','Programaciones object (58)',3,'',14,70),(649,'2023-01-02 18:47:35.097381','57','Programaciones object (57)',3,'',14,70),(650,'2023-01-02 18:49:40.494512','62','Programaciones object (62)',3,'',14,70),(651,'2023-01-02 18:49:40.560144','61','Programaciones object (61)',3,'',14,70),(652,'2023-01-02 18:59:19.605401','64','Programaciones object (64)',3,'',14,70),(653,'2023-01-02 18:59:19.680884','63','Programaciones object (63)',3,'',14,70),(654,'2023-01-02 19:01:03.195947','66','Programaciones object (66)',3,'',14,70),(655,'2023-01-02 19:01:03.388144','65','Programaciones object (65)',3,'',14,70),(656,'2023-01-02 19:06:32.263300','67','Programaciones object (67)',3,'',14,70),(657,'2023-01-02 19:06:32.362552','68','Programaciones object (68)',3,'',14,70),(658,'2023-01-02 19:06:32.445874','69','Programaciones object (69)',3,'',14,70),(659,'2023-01-02 19:06:32.522933','70','Programaciones object (70)',3,'',14,70),(660,'2023-01-02 20:08:34.423065','77','Programaciones object (77)',1,'[{\"added\": {}}]',14,70),(661,'2023-01-02 20:09:01.131395','78','Programaciones object (78)',1,'[{\"added\": {}}]',14,70),(662,'2023-01-02 20:09:53.260176','79','Programaciones object (79)',1,'[{\"added\": {}}]',14,70),(663,'2023-01-02 20:10:25.972745','80','Programaciones object (80)',1,'[{\"added\": {}}]',14,70),(664,'2023-01-02 20:10:53.013400','81','Programaciones object (81)',1,'[{\"added\": {}}]',14,70),(665,'2023-01-02 20:13:39.501038','14','Calificaciones object (14)',1,'[{\"added\": {}}]',13,70),(666,'2023-01-02 20:14:27.550879','15','Calificaciones object (15)',1,'[{\"added\": {}}]',13,70),(667,'2023-01-02 20:14:51.062049','16','Calificaciones object (16)',1,'[{\"added\": {}}]',13,70),(668,'2023-01-02 20:15:32.396053','17','Calificaciones object (17)',1,'[{\"added\": {}}]',13,70),(669,'2023-01-02 20:16:04.773627','13','Calificaciones object (13)',3,'',13,70),(670,'2023-01-02 20:17:02.094821','12','Calificaciones object (12)',2,'[{\"changed\": {\"fields\": [\"Gestion\"]}}]',13,70),(671,'2023-01-02 20:17:13.299079','11','Calificaciones object (11)',2,'[{\"changed\": {\"fields\": [\"Gestion\"]}}]',13,70),(672,'2023-01-02 20:18:02.970552','76','Programaciones object (76)',3,'',14,70),(673,'2023-01-02 20:18:03.100282','75','Programaciones object (75)',3,'',14,70),(674,'2023-01-02 20:18:03.163745','74','Programaciones object (74)',3,'',14,70),(675,'2023-01-02 20:18:03.223994','73','Programaciones object (73)',3,'',14,70),(676,'2023-01-02 20:18:03.289804','72','Programaciones object (72)',3,'',14,70),(677,'2023-01-02 20:18:03.347793','71','Programaciones object (71)',3,'',14,70),(678,'2023-01-02 20:18:48.532807','82','Programaciones object (82)',1,'[{\"added\": {}}]',14,70),(679,'2023-01-02 20:19:21.003239','83','Programaciones object (83)',1,'[{\"added\": {}}]',14,70),(680,'2023-01-02 20:19:41.475790','84','Programaciones object (84)',1,'[{\"added\": {}}]',14,70),(681,'2023-01-02 20:20:09.516588','85','Programaciones object (85)',1,'[{\"added\": {}}]',14,70),(682,'2023-01-02 20:20:30.344971','85','Programaciones object (85)',2,'[{\"changed\": {\"fields\": [\"Horarios\"]}}]',14,70),(683,'2023-01-02 20:21:20.989828','86','Programaciones object (86)',1,'[{\"added\": {}}]',14,70),(684,'2023-01-02 20:21:43.823620','87','Programaciones object (87)',1,'[{\"added\": {}}]',14,70),(685,'2023-01-02 21:22:57.910748','92','Programaciones object (92)',2,'[{\"changed\": {\"fields\": [\"Horarios\"]}}]',14,70),(686,'2023-01-09 10:26:11.171029','5','id: 5',1,'[{\"added\": {}}]',11,70),(687,'2023-01-09 10:27:02.279191','5','Usuario con nombre: tirado 1 tirado 1',1,'[{\"added\": {}}]',7,70),(688,'2023-01-09 10:27:31.778627','18','Calificaciones object (18)',1,'[{\"added\": {}}]',13,70),(689,'2023-01-09 10:27:45.963603','19','Calificaciones object (19)',1,'[{\"added\": {}}]',13,70),(690,'2023-01-09 10:28:01.003517','20','Calificaciones object (20)',1,'[{\"added\": {}}]',13,70),(691,'2023-01-09 10:28:48.375787','21','Calificaciones object (21)',1,'[{\"added\": {}}]',13,70),(692,'2023-01-09 10:29:20.022311','22','Calificaciones object (22)',1,'[{\"added\": {}}]',13,70),(693,'2023-01-09 10:30:27.398555','95','Programaciones object (95)',1,'[{\"added\": {}}]',14,70),(694,'2023-01-09 10:30:46.774573','96','Programaciones object (96)',1,'[{\"added\": {}}]',14,70),(695,'2023-01-09 10:31:13.086373','97','Programaciones object (97)',1,'[{\"added\": {}}]',14,70),(696,'2023-01-09 10:31:36.377164','98','Programaciones object (98)',1,'[{\"added\": {}}]',14,70),(697,'2023-01-09 10:31:57.614465','99','Programaciones object (99)',1,'[{\"added\": {}}]',14,70),(698,'2023-01-09 11:01:29.691000','94','Programaciones object (94)',3,'',14,70),(699,'2023-01-09 11:01:29.834038','93','Programaciones object (93)',3,'',14,70),(700,'2023-01-09 11:01:29.909232','92','Programaciones object (92)',3,'',14,70),(701,'2023-01-09 11:01:29.976050','91','Programaciones object (91)',3,'',14,70),(702,'2023-01-09 11:01:30.042434','90','Programaciones object (90)',3,'',14,70),(703,'2023-01-09 11:01:30.126626','89','Programaciones object (89)',3,'',14,70),(704,'2023-01-09 11:01:30.324831','88','Programaciones object (88)',3,'',14,70);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'alumnos','alumnos'),(3,'auth','group'),(2,'auth','permission'),(13,'calificaciones','calificaciones'),(9,'carreras','carreras'),(4,'contenttypes','contenttype'),(8,'docentes','docentes'),(10,'horarios','horarios'),(11,'kardex','kadex'),(12,'materia','materias'),(14,'programaciones','programaciones'),(5,'sessions','session'),(6,'usuarios','usuarios');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-22 05:21:50.109256'),(2,'contenttypes','0002_remove_content_type_name','2022-11-22 05:21:51.209001'),(3,'auth','0001_initial','2022-11-22 05:21:57.556601'),(4,'auth','0002_alter_permission_name_max_length','2022-11-22 05:21:58.502697'),(5,'auth','0003_alter_user_email_max_length','2022-11-22 05:21:58.608282'),(6,'auth','0004_alter_user_username_opts','2022-11-22 05:21:58.689263'),(7,'auth','0005_alter_user_last_login_null','2022-11-22 05:21:58.759245'),(8,'auth','0006_require_contenttypes_0002','2022-11-22 05:21:59.010824'),(9,'auth','0007_alter_validators_add_error_messages','2022-11-22 05:21:59.130618'),(10,'auth','0008_alter_user_username_max_length','2022-11-22 05:21:59.267227'),(11,'auth','0009_alter_user_last_name_max_length','2022-11-22 05:21:59.389751'),(12,'auth','0010_alter_group_name_max_length','2022-11-22 05:21:59.632862'),(13,'auth','0011_update_proxy_permissions','2022-11-22 05:21:59.708986'),(14,'auth','0012_alter_user_first_name_max_length','2022-11-22 05:21:59.817102'),(15,'usuarios','0001_initial','2022-11-22 05:22:06.896575'),(16,'admin','0001_initial','2022-11-22 05:22:09.411930'),(17,'admin','0002_logentry_remove_auto_add','2022-11-22 05:22:09.486650'),(18,'admin','0003_logentry_add_action_flag_choices','2022-11-22 05:22:09.553192'),(19,'materia','0001_initial','2022-11-22 05:22:11.237951'),(20,'horarios','0001_initial','2022-11-22 05:22:11.888443'),(21,'docentes','0001_initial','2022-11-22 05:22:13.232367'),(22,'horarios','0002_initial','2022-11-22 05:22:15.317893'),(23,'kardex','0001_initial','2022-11-22 05:22:15.964527'),(24,'carreras','0001_initial','2022-11-22 05:22:16.399199'),(25,'alumnos','0001_initial','2022-11-22 05:22:20.636160'),(26,'alumnos','0002_alumnos_horarios','2022-11-22 05:22:24.980602'),(27,'materia','0002_remove_materias_pre_requisitos_and_more','2022-11-22 05:22:30.147847'),(28,'sessions','0001_initial','2022-11-22 05:22:30.982621'),(29,'usuarios','0002_alter_usuarios_last_name_alter_usuarios_name','2022-11-22 05:22:33.987005'),(30,'materia','0003_alter_materias_creditos','2022-11-27 00:22:53.109853'),(31,'materia','0004_materias_tipo','2022-11-27 02:32:24.051997'),(32,'kardex','0002_alter_kadex_gestion_alter_kadex_plan','2022-11-27 02:47:02.923344'),(33,'materia','0005_alter_materias_tipo','2022-11-27 02:47:03.005916'),(34,'kardex','0003_kadex_anio_alter_kadex_gestion','2022-11-27 02:55:14.403860'),(35,'kardex','0004_kadex_materias','2022-11-27 03:08:17.008694'),(36,'kardex','0005_remove_kadex_curso_remove_kadex_nombre_materia_and_more','2022-11-27 03:09:05.839409'),(37,'kardex','0006_alter_kadex_segunda_instancia','2022-11-27 03:10:33.397219'),(38,'kardex','0007_remove_kadex_anio_remove_kadex_estado_and_more','2022-11-27 13:48:32.996062'),(39,'calificaciones','0001_initial','2022-11-27 13:50:07.196855'),(40,'usuarios','0003_alter_usuarios_username','2022-11-27 14:13:39.428441'),(41,'usuarios','0004_alter_usuarios_email','2022-11-27 16:02:21.781792'),(42,'horarios','0003_rename_decente_horarios_docente','2022-11-27 19:34:19.149689'),(43,'usuarios','0005_alter_usuarios_password','2022-11-30 01:37:17.130161'),(44,'usuarios','0006_alter_usuarios_password','2022-11-30 01:54:14.562574'),(45,'alumnos','0003_alter_alumnos_managers','2022-11-30 01:55:03.231676'),(46,'docentes','0002_alter_docentes_managers','2022-11-30 01:55:03.358735'),(47,'usuarios','0007_alter_usuarios_managers','2022-11-30 01:55:03.481483'),(48,'usuarios','0005_alter_usuarios_email_alter_usuarios_is_active_and_more','2022-11-30 03:40:28.529861'),(49,'usuarios','0005_alter_usuarios_is_active_alter_usuarios_is_staff_and_more','2022-11-30 03:51:31.298368'),(50,'usuarios','0002_alter_usuarios_email_alter_usuarios_is_active_and_more','2022-11-30 03:56:09.464568'),(51,'usuarios','0003_alter_usuarios_password','2022-11-30 11:30:56.404104'),(52,'usuarios','0004_auto_20221130_1148','2022-11-30 11:48:51.414545'),(53,'usuarios','0005_alter_usuarios_phone','2022-12-01 01:17:31.844458'),(54,'alumnos','0003_alumnos_cu','2022-12-04 02:24:05.132690'),(55,'calificaciones','0002_alter_calificaciones_estado','2022-12-04 03:12:37.956073'),(56,'calificaciones','0003_alter_calificaciones_estado','2022-12-04 03:15:50.706291'),(57,'calificaciones','0004_alter_calificaciones_estado','2022-12-04 16:18:00.977873'),(58,'horarios','0004_horarios_grupo','2022-12-04 16:18:01.455298'),(59,'materia','0006_materias_tiene_lab','2022-12-04 16:18:48.581408'),(60,'calificaciones','0005_alter_calificaciones_materia','2022-12-05 11:22:29.927673'),(61,'calificaciones','0005_remove_calificaciones_kardex_calificaciones_kardex','2022-12-21 14:49:42.911403'),(62,'alumnos','0004_alter_alumnos_options','2022-12-21 15:20:54.979615'),(63,'calificaciones','0005_alter_calificaciones_options','2022-12-21 15:20:55.095602'),(64,'carreras','0002_alter_carreras_options','2022-12-21 15:20:55.173617'),(65,'docentes','0002_alter_docentes_options','2022-12-21 15:20:55.270602'),(66,'horarios','0005_alter_horarios_options','2022-12-21 15:20:55.357004'),(67,'kardex','0008_alter_kadex_options','2022-12-21 15:20:55.552998'),(68,'materia','0007_alter_materias_options','2022-12-21 15:20:55.639304'),(69,'calificaciones','0003_alter_calificaciones_kardex','2022-12-21 16:14:10.180407'),(70,'calificaciones','0004_alter_calificaciones_kardex','2022-12-21 16:14:10.234539'),(71,'calificaciones','0005_calificaciones_algo','2022-12-21 17:49:11.709835'),(72,'calificaciones','0006_alter_calificaciones_kardex','2022-12-21 18:39:41.746447'),(73,'calificaciones','0005_calificaciones_id_alter_calificaciones_materia','2022-12-22 01:53:38.445910'),(74,'calificaciones','0006_remove_calificaciones_materia','2022-12-22 02:15:14.474502'),(75,'calificaciones','0006_alter_calificaciones_materia','2022-12-22 02:25:44.870685'),(76,'calificaciones','0007_alter_calificaciones_anio','2022-12-22 02:35:17.026554'),(77,'calificaciones','0008_alter_calificaciones_id','2022-12-22 02:38:15.662649'),(78,'calificaciones','0007_alter_calificaciones_anio_alter_calificaciones_id','2022-12-22 02:40:21.772497'),(79,'programaciones','0001_initial','2023-01-02 15:12:27.529627'),(80,'calificaciones','0008_alter_calificaciones_gestion','2023-01-02 22:19:47.157202');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('84yovdjsy1jf6bgn31rwjdkn4amctbt1','.eJxVjMEOwiAQRP-FsyG7C7TFo3e_gSywStXQpLQn47_bJj3oaZJ5b-atAq9LCWuTOYxZnRWq028XOT2l7iA_uN4nnaa6zGPUu6IP2vR1yvK6HO7fQeFWtjWgB_GQyfvs2Gxh0A49OQIbBRMnQbBIvsPeOCIwPmWOcDNDxyBJfb6kfzaX:1p1ene:3T1lxhE6P9QSz2CajaGJ_aJG9PMB7MpbfmNQgxo4O3Q','2022-12-18 02:32:14.474526'),('8d98ztjcs4gb9a7j45hhu5qmbutb63py','.eJxVjEEOwiAQRe_C2hBgJkxw6d4zkAEGqZqSlHZlvLs26UK3_733Xyrytra4DVniVNRZkVGn3zFxfsi8k3Ln-dZ17vO6TEnvij7o0Nde5Hk53L-DxqN9axDwJhFVoOBqDiLOFe8FMTAhQS5gKyGAoCVGMs6SZGeSTcGEyur9AfU8N3w:1pCMOZ:TjHPMPgMitPJRtJsMrtL0UdsPvqDrTslPYYCEMHo6qI','2023-01-16 15:06:35.553975'),('cnp07ykw2rrsdc9fal3tei48znneo9dg','.eJxVjEEOwiAQRe_C2hAQmIJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgILU6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir98awUK22QB6lQJZHM6AQERcfLCKc_GgPaMzGgEUgxmSMyqEYmwAF8T7A-yKN4w:1oxLkb:z6-w95iMFyUsTBBN1oFb6HdqoIuqCJXFhsRZKMOZ-X0','2022-12-06 05:23:17.188614'),('fqre2ml48xmjjs3cb2gyx1ptuku74jip','.eJxVjMEOwiAQRP-FsyG7C7TFo3e_gSywStXQpLQn47_bJj3oaZJ5b-atAq9LCWuTOYxZnRWq028XOT2l7iA_uN4nnaa6zGPUu6IP2vR1yvK6HO7fQeFWtjWgB_GQyfvs2Gxh0A49OQIbBRMnQbBIvsPeOCIwPmWOcDNDxyBJfb6kfzaX:1p80EM:TOXunN0qR81zxXt8IxJk1kZXq_VNHDuH094UKJO8tMM','2023-01-04 14:38:02.670238'),('teyv8mph65l3eiwjm4zwju4krx1ooghq','.eJxVjEEOwiAQRe_C2hAQmIJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgILU6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir98awUK22QB6lQJZHM6AQERcfLCKc_GgPaMzGgEUgxmSMyqEYmwAF8T7A-yKN4w:1p0DOY:bARbnlO4HlMudYYTxcG-jtXCJ8Y6hXSIWXk8EmulFFA','2022-12-14 03:04:22.786984'),('y75v9uib4xak0nlnkpmtvupjvpvn6d1r','e30:1p0ZyD:FMjxug-1hr92zfKMWe7kShNasjZfAQG_yAW8mOqZ2rw','2022-12-15 03:10:41.430164');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes_docentes`
--

DROP TABLE IF EXISTS `docentes_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_docentes` (
  `usuarios_ptr_id` bigint NOT NULL,
  PRIMARY KEY (`usuarios_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes_docentes`
--

LOCK TABLES `docentes_docentes` WRITE;
/*!40000 ALTER TABLE `docentes_docentes` DISABLE KEYS */;
INSERT INTO `docentes_docentes` VALUES (7),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(57),(58);
/*!40000 ALTER TABLE `docentes_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_horarios`
--

DROP TABLE IF EXISTS `horarios_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_horarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `posicion_horaria` int NOT NULL,
  `aula` varchar(50) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `docente_id` bigint NOT NULL,
  `materia_id` bigint NOT NULL,
  `grupo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `horarios_horarios_materia_id_6761fb4d_fk_materia_materias_id` (`materia_id`),
  KEY `horarios_horarios_docente_id_ac04b981_fk_docentes_` (`docente_id`),
  CONSTRAINT `horarios_horarios_docente_id_ac04b981_fk_docentes_` FOREIGN KEY (`docente_id`) REFERENCES `docentes_docentes` (`usuarios_ptr_id`),
  CONSTRAINT `horarios_horarios_materia_id_6761fb4d_fk_materia_materias_id` FOREIGN KEY (`materia_id`) REFERENCES `materia_materias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_horarios`
--

LOCK TABLES `horarios_horarios` WRITE;
/*!40000 ALTER TABLE `horarios_horarios` DISABLE KEYS */;
INSERT INTO `horarios_horarios` VALUES (1,1,'C101','teo',7,2,22),(3,2,'E103','teo',15,4,23),(4,3,'C101','teo',7,2,22),(5,4,'C002','teo',15,4,23),(6,7,'E301','teo',14,1,18),(7,8,'F302','lab',16,6,1),(8,9,'E301','teo',14,1,18),(9,10,'F302','lab',16,6,2),(10,16,'C205','teo',17,5,3),(11,21,'F302','teo',16,6,1),(12,26,'C103','teo',17,5,3),(13,1,'C104','teo',18,8,11),(14,4,'C001','teo',18,8,11),(15,7,'C204','teo',18,8,12),(16,9,'E203','teo',23,7,7),(17,10,'B205','teo',19,9,2),(18,11,'B205','teo',19,9,2),(19,13,'B206','teo',19,9,2),(21,16,'D001','teo',23,7,7),(22,17,'C106','teo',18,8,12),(24,19,'C301','teo',20,3,7),(25,21,'C301','teo',20,3,7),(26,25,'F304','teo',21,10,1),(28,35,'Z','teo',22,11,2),(29,37,'Z','teo',22,11,2),(30,2,'E301','teo',14,3,6),(31,7,'B205','teo',19,9,1),(32,8,'B205','teo',19,9,1),(33,9,'B205','teo',19,9,1),(34,11,'A204','teo',25,9,4),(35,13,'E203','teo',24,7,8),(36,16,'E301','teo',14,3,6),(37,25,'E403','teo',25,9,4),(39,26,'F202','teo',26,8,10),(40,27,'F304','teo',21,10,1),(41,29,'C102','teo',24,7,8),(42,31,'C204','teo',22,11,1),(43,33,'C205','teo',22,11,1),(44,10,'C106','teo',18,7,9),(45,14,'C101','teo',18,7,9),(47,15,'B205','teo',19,9,3),(48,17,'B205','teo',19,9,3),(49,19,'C101','teo',27,3,8),(50,23,'E103','teo',27,3,8),(51,26,'B205','teo',19,9,3),(52,33,'C205','teo',28,11,3),(53,35,'C201','teo',28,11,3),(54,8,'C006','teo',30,13,1),(55,9,'A210','teo',36,17,2),(56,13,'D101','teo',30,13,1),(57,23,'A209','lab',33,16,2),(58,25,'C201','teo',33,16,2),(59,27,'E203','teo',32,15,2),(60,28,'c104','teo',57,12,1),(61,29,'C103','teo',57,12,1),(62,31,'Z','lab',35,17,3),(63,34,'Z','teo',35,17,3),(64,1,'C003','teo',30,13,2),(65,3,'D003','teo',30,13,2),(66,11,'E201','teo',29,14,2),(67,13,'F305','lab',31,17,1),(70,14,'D102','teo',31,17,1),(71,16,'A209','lab',31,17,2),(72,19,'C101','teo',32,15,1),(73,20,'A209','lab',31,17,4),(74,21,'C205','teo',29,14,1),(75,22,'A210','lab',31,17,4),(76,22,'A210','lab',33,16,1),(77,25,'C201','teo',33,16,1),(78,27,'B205','lab',29,14,2),(79,28,'C003','teo',34,12,3),(80,32,'B108','teo',34,12,3),(81,33,'C104','lab',29,14,1),(82,20,'C106','lab',29,14,4),(83,22,'C203','lab',29,14,5),(84,7,'E103','teo',42,22,2),(85,8,'F202','teo',42,22,1),(86,9,'DS03','teo',42,22,2),(87,18,'Z','lab',41,20,2),(88,27,'F302','lab',38,20,1),(89,29,'F302','teo',38,20,1),(90,31,'B205','teo',40,21,2),(91,32,'B205','teo',40,21,1),(92,34,'A210','teo',41,20,2),(93,7,'A204','lab',37,18,1),(94,9,'D002','teo',39,19,1),(95,11,'B206','teo',39,19,1),(96,14,'A204','lab',37,18,2),(97,26,'B206','teo',38,23,1),(98,28,'B205','teo',38,23,1),(100,34,'C106','teo',37,23,1),(101,1,'B205','lab',43,24,2),(102,2,'F304','lab',43,24,5),(103,3,'D001','teo',43,24,2),(104,4,'B205','lab',43,24,6),(105,10,'A204','teo',37,26,1),(106,13,'A204','lab',37,26,2),(107,15,'A204','lab',37,26,1),(108,25,'B108','lab',44,24,1),(109,28,'B108','teo',44,24,1),(110,33,'C201','teo',41,27,1),(111,35,'B205','teo',41,27,1),(112,7,'C203','teo',45,28,1),(113,11,'C204','teo',45,28,1),(114,15,'F305','lab',31,29,2),(115,19,'F305','lab',31,29,1),(116,23,'D101','teo',31,29,1),(118,25,'B205','teo',46,25,1),(119,27,'B206','teo',46,25,1),(121,8,'A209','teo',25,32,1),(122,9,'C106','teo',46,30,1),(123,10,'A210','teo',25,32,1),(124,13,'D003','teo',47,35,1),(125,14,'F304','teo',46,30,1),(126,15,'B206','lab',48,31,1),(127,17,'F304','lab',31,34,1),(128,19,'B205','teo',46,33,1),(129,20,'D101','teo',48,31,1),(130,21,'F305','teo',31,34,1),(131,22,'E403','teo',47,35,1),(132,28,'F304','teo',46,33,1),(133,1,'A210','teo',23,38,1),(134,3,'F305','teo',46,36,1),(135,5,'F305','teo',46,36,1),(136,10,'A209','teo',23,38,1),(137,12,'B205','teo',49,40,1),(139,27,'F305','teo',31,41,1),(140,29,'F304','teo',31,41,1),(141,32,'F304','lab',50,37,1),(142,33,'A209','teo',49,40,1),(143,34,'B205','teo',50,37,1),(144,1,'A210','teo',25,43,1),(145,3,'A210','teo',25,43,1),(146,7,'C106','teo',51,48,1),(147,9,'C002','teo',51,47,1),(148,13,'E101','teo',51,47,1),(149,15,'E103','teo',51,48,1),(150,16,'F202','teo',52,42,1),(151,17,'F103','teo',52,42,1),(152,26,'B108','teo',53,46,1),(153,28,'C004','teo',53,46,1),(154,1,'E403','teo',25,51,2),(155,4,'E403','teo',25,51,2),(156,5,'E303','teo',55,49,2),(157,8,'F305','teo',43,51,3),(158,11,'DS03','teo',43,51,3),(159,28,'C204','teo',55,49,2),(160,7,'B201','teo',54,51,1),(161,19,'C006','teo',54,51,1),(162,34,'C005','teo',54,49,1),(163,35,'DS03','teo',54,49,1),(164,13,'F106','teo',45,52,2),(166,14,'F302','teo',38,52,7),(168,15,'F202','teo',46,52,5),(169,16,'F201','teo',46,52,5),(170,23,'F106','teo',45,52,2),(171,29,'F106','teo',45,52,2),(172,32,'F201','teo',46,52,5),(173,33,'F304','teo',38,52,7),(174,35,'F302','teo',38,52,7),(175,8,'F106','teo',45,52,2),(176,10,'F106','teo',45,52,2),(177,14,'F106','teo',45,52,2),(178,15,'E406','teo',25,52,3),(179,16,'E403','teo',25,52,3),(180,17,'E406','teo',25,52,3),(182,10,'E103','teo',42,22,1),(183,34,'C106','teo',37,18,1),(184,28,'C103','teo',26,8,10);
/*!40000 ALTER TABLE `horarios_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex_kadex`
--

DROP TABLE IF EXISTS `kardex_kadex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex_kadex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex_kadex`
--

LOCK TABLES `kardex_kadex` WRITE;
/*!40000 ALTER TABLE `kardex_kadex` DISABLE KEYS */;
INSERT INTO `kardex_kadex` VALUES (2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `kardex_kadex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_materias`
--

DROP TABLE IF EXISTS `materia_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_materias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `sigla` varchar(8) NOT NULL,
  `curso` int NOT NULL,
  `creditos` int NOT NULL,
  `tipo` varchar(8) NOT NULL,
  `tiene_lab` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_materias`
--

LOCK TABLES `materia_materias` WRITE;
/*!40000 ALTER TABLE `materia_materias` DISABLE KEYS */;
INSERT INTO `materia_materias` VALUES (1,'FISISCA BASICA 1','FIS100',1,3,'N',0),(2,'CALCULO 1','MAT101',1,3,'N',0),(3,'FISISCA BASICA 3','FIS200',2,3,'N',0),(4,'ÁLGEBRA 1','MAT100',1,3,'N',0),(5,'TÉCNICAS DE ESTUDIO Y DESARROLLO DE HABI. COMU.','SHC100',1,3,'N',0),(6,'PROGRAMACIÓN BÁSICA','SIS100',1,3,'N',1),(7,'CÁLCULO 2','MAT102',2,3,'N',0),(8,'ÁLGEBRA 2','MAT103',2,3,'N',0),(9,'PROGRAMACIÓN INTERMEDIA','SIS101',2,3,'N',0),(10,'METODOLOGÍA DE LA PROGRAMACIÓN','SIS103',2,3,'N',0),(11,'TEORÍA DE SISTEMAS','SIS308',2,3,'N',0),(12,'METODOLOGÍA DE LA INVESTIGACIÓN','GEN410',3,3,'N',0),(13,'PROBABILIDAD Y ESTADISTICA','MAT280',3,3,'N',0),(14,'ARQUITECTURA DE COMPUTADORAS','SIS107',3,3,'N',0),(15,'ESTRUCTURA DE DATOS','SIS204',3,3,'N',0),(16,'BASE DE DATOS 1','SIS302',3,3,'N',1),(17,'PROGRAMACIÓN AVANZADA','SIS457',3,3,'N',1),(18,'SISTEMAS OPERATIVOS 1','SIS110',4,3,'N',1),(19,'LENGUAJES FORMALES','SIS120',4,3,'N',0),(20,'INGENIERÍA DE REQUERIMENTOS','SIS125',4,3,'N',1),(21,'REDES DE DATOS 1','SIS251',4,3,'N',0),(22,'BASE DE DATOS 2','SIS304',4,3,'N',0),(23,'INTERACCION HUMANO COMPUTADOR','SIS407',4,3,'N',0),(24,'REDES DE DATOS 2','SIS252',5,3,'N',1),(25,'TECNOLOGÍAS Y DESARROLLO WEB','SIS256',5,3,'N',0),(26,'INFRAESTRUCTURA, PLATAFORMAS TECNOLÓGICAS Y REDES','SIS313',5,3,'N',1),(27,'SISTEMAS DE GESTIÓN EMPRESARIAL','SIS315',5,3,'N',0),(28,'INGENIERIA DE SOFTWARE','SIS324',5,3,'N',0),(29,'INTELIGENCIA ARTIFICIAL 1','SIS420',5,3,'N',1),(30,'ARQUITECTURA DE SOFTWARE','COM350',6,3,'N',0),(31,'SISTEMAS DE TIEMPO REAL','COM460',6,3,'N',1),(32,'DESARROLLO DE APLICACIONES MÓVILES','SIS104',6,3,'N',0),(33,'SISTEMAS DISTRIBUIDOS','SIS258',6,3,'N',0),(34,'INTELIGENCIA ARTIFICIAL 2','SIS421',6,3,'N',1),(35,'TECNOLOGIAS EMERGENTES EN INTERNET','SIS427',6,3,'N',0),(36,'CALIDAD DE SOFTWARE','COM450',7,3,'N',0),(37,'PRUEBA Y MANTENIMIENTO DE SOFTWARE','COM470',7,3,'N',1),(38,'ROBÓTICA 1','COM480',7,3,'N',0),(39,'OPTATIVA 1','SHC120',7,3,'N',0),(40,'SEGURIDAD DE LA INFORMACIÓN','SIS254',7,3,'N',0),(41,'DESARROLLO DE APLICACIONES INTELIGENTES','SIS330',7,3,'N',0),(42,'ROBÓTICA 2','COM520',8,3,'N',0),(43,'TALLER DE ESPECIALIDAD','SHC134',8,3,'N',0),(44,'OPTATIVA 2','SHC140',8,3,'N',0),(45,'OPTATIVA 3','SHC150',8,3,'N',0),(46,'BASE DE DATOS 3','SIS306',8,3,'N',0),(47,'AUDITORÍA DE SISTEMAS','SIS316',8,3,'N',0),(48,'ADMINISTRACIÓN DE PROYECTOS DE SOFTWARE','SIS325',8,3,'N',0),(49,'ÉTICA, INGENIERÍA LEGAL Y EMPRENDEDURISMO','SHC160',9,3,'N',0),(50,'PRÁCTICA LABORAL','SHC170',9,3,'N',0),(51,'TALLER DE GRADO','SHC180',9,3,'N',0),(52,'TRABAJO DE TITULACIÓN','SHC190',10,3,'N',0);
/*!40000 ALTER TABLE `materia_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_materias_pre_requisitos`
--

DROP TABLE IF EXISTS `materia_materias_pre_requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_materias_pre_requisitos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_materias_id` bigint NOT NULL,
  `to_materias_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `materia_materias_pre_req_from_materias_id_to_mate_199ed0a6_uniq` (`from_materias_id`,`to_materias_id`),
  KEY `materia_materias_pre_to_materias_id_df134e8b_fk_materia_m` (`to_materias_id`),
  CONSTRAINT `materia_materias_pre_from_materias_id_d9d3f2ef_fk_materia_m` FOREIGN KEY (`from_materias_id`) REFERENCES `materia_materias` (`id`),
  CONSTRAINT `materia_materias_pre_to_materias_id_df134e8b_fk_materia_m` FOREIGN KEY (`to_materias_id`) REFERENCES `materia_materias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_materias_pre_requisitos`
--

LOCK TABLES `materia_materias_pre_requisitos` WRITE;
/*!40000 ALTER TABLE `materia_materias_pre_requisitos` DISABLE KEYS */;
INSERT INTO `materia_materias_pre_requisitos` VALUES (1,3,1),(2,3,2),(3,7,2),(4,8,4),(5,9,6),(6,10,6),(75,11,5),(7,12,10),(8,12,11),(10,13,7),(9,13,8),(11,14,3),(12,15,9),(13,16,9),(14,17,9),(15,18,14),(17,19,13),(16,19,17),(18,20,12),(19,21,14),(20,22,16),(22,23,15),(21,23,17),(23,24,21),(24,25,22),(25,25,23),(26,26,18),(27,26,21),(28,27,20),(29,28,20),(30,29,19),(31,29,22),(32,30,28),(33,31,24),(34,31,28),(35,32,25),(36,32,26),(37,33,26),(38,33,27),(39,34,29),(40,35,25),(41,35,27),(42,36,30),(44,37,30),(43,37,32),(45,38,34),(47,40,31),(46,40,33),(48,41,34),(49,41,35),(51,42,38),(50,42,41),(52,43,36),(53,43,37),(54,43,38),(55,43,40),(56,43,41),(57,46,41),(59,47,36),(58,47,40),(60,48,36),(61,48,37),(62,49,43),(64,50,43),(65,50,46),(66,50,47),(63,50,48),(67,51,42),(68,51,43),(69,51,46),(70,51,47),(71,51,48),(72,52,49),(73,52,50),(74,52,51);
/*!40000 ALTER TABLE `materia_materias_pre_requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programaciones_programaciones`
--

DROP TABLE IF EXISTS `programaciones_programaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programaciones_programaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anio` int NOT NULL,
  `gestion` int NOT NULL,
  `fecha` date NOT NULL,
  `alumno_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programaciones_progr_alumno_id_5b49ae1d_fk_alumnos_a` (`alumno_id`),
  CONSTRAINT `programaciones_progr_alumno_id_5b49ae1d_fk_alumnos_a` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos_alumnos` (`kardex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programaciones_programaciones`
--

LOCK TABLES `programaciones_programaciones` WRITE;
/*!40000 ALTER TABLE `programaciones_programaciones` DISABLE KEYS */;
INSERT INTO `programaciones_programaciones` VALUES (77,2022,1,'2022-01-05',3),(78,2022,1,'2022-01-05',3),(79,2022,1,'2022-01-05',3),(80,2022,1,'2022-01-05',3),(81,2022,1,'2022-01-05',3),(82,2022,2,'2022-07-05',3),(83,2022,2,'2022-07-05',3),(84,2022,2,'2022-07-05',3),(85,2022,2,'2022-07-05',3),(86,2022,2,'2022-07-05',3),(87,2022,2,'2022-07-05',3),(95,2022,1,'2022-01-05',5),(96,2022,1,'2022-01-05',5),(97,2022,1,'2022-01-05',5),(98,2022,1,'2022-01-05',5),(99,2022,1,'2022-01-05',5);
/*!40000 ALTER TABLE `programaciones_programaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programaciones_programaciones_horarios`
--

DROP TABLE IF EXISTS `programaciones_programaciones_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programaciones_programaciones_horarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `programaciones_id` bigint NOT NULL,
  `horarios_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `programaciones_programac_programaciones_id_horari_e21c2098_uniq` (`programaciones_id`,`horarios_id`),
  KEY `programaciones_progr_horarios_id_f86e64ea_fk_horarios_` (`horarios_id`),
  CONSTRAINT `programaciones_progr_horarios_id_f86e64ea_fk_horarios_` FOREIGN KEY (`horarios_id`) REFERENCES `horarios_horarios` (`id`),
  CONSTRAINT `programaciones_progr_programaciones_id_a0c417e1_fk_programac` FOREIGN KEY (`programaciones_id`) REFERENCES `programaciones_programaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programaciones_programaciones_horarios`
--

LOCK TABLES `programaciones_programaciones_horarios` WRITE;
/*!40000 ALTER TABLE `programaciones_programaciones_horarios` DISABLE KEYS */;
INSERT INTO `programaciones_programaciones_horarios` VALUES (104,77,6),(103,77,8),(105,78,1),(106,78,4),(107,79,3),(108,79,5),(109,80,10),(110,80,12),(112,81,7),(111,81,11),(113,82,24),(114,82,25),(115,83,16),(116,83,21),(117,84,13),(118,84,14),(121,85,17),(122,85,18),(123,85,19),(124,86,26),(125,87,28),(126,87,29),(141,95,1),(142,95,4),(143,96,3),(144,96,5),(146,97,6),(145,97,8),(148,98,7),(147,98,9),(149,99,10),(150,99,12);
/*!40000 ALTER TABLE `programaciones_programaciones_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios`
--

DROP TABLE IF EXISTS `usuarios_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `address` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios`
--

LOCK TABLES `usuarios_usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios` DISABLE KEYS */;
INSERT INTO `usuarios_usuarios` VALUES (1,'2022-12-21 14:38:02.528119',1,'','2022-11-22 05:22:57.447458','','','','martin@gmail.com','pbkdf2_sha256$390000$8Tq6lrJdNgrcR6Q0jeZCbU$ZV8Fgv+f/pEFntxjQmzixY6U/5GApl06tGhkjphJMaQ=','','2022-11-22 05:22:57.651866',1,1),(7,NULL,0,'','2022-11-27 15:52:30.555522','W','Jaldin','','','','','2022-11-27 15:52:30.557207',1,0),(14,NULL,0,'','2022-11-27 16:52:33.325330','R','Guitierrez','','pagi@mailinator.com','','','2022-11-27 16:52:33.335475',1,0),(15,NULL,0,'','2022-11-27 16:53:09.234610','T','Torres','','jomoripo@mailinator.com','','','2022-11-27 16:53:09.238019',1,0),(16,NULL,0,'','2022-11-27 16:53:29.207817','N','Coca','','coca@gmail.com','','','2022-11-27 16:53:29.211602',1,0),(17,NULL,0,'','2022-11-27 16:53:55.411080','A','Calvimontes','','calvimontes@gmail.com','','','2022-11-27 16:53:55.414455',1,0),(18,NULL,0,'','2022-11-27 16:55:22.569273','J','Ramos','','ramos@gmail.com','','','2022-11-27 16:55:22.572522',1,0),(19,NULL,0,'','2022-11-27 16:55:47.018393','H','Penaranda','','penaranda@gmail.com','','','2022-11-27 16:55:47.021651',1,0),(20,NULL,0,'','2022-11-27 16:56:11.466691','G','Maita','','maita@gmail.com','','','2022-11-27 16:56:11.470136',1,0),(21,NULL,0,'','2022-11-27 16:56:28.681969','E','Rivero','','rivero@gmail.com','','','2022-11-27 16:56:28.685877',1,0),(22,NULL,0,'','2022-11-27 16:56:46.281311','R','Herbas','','herbas@gmail.com','','','2022-11-27 16:56:46.285383',1,0),(23,NULL,0,'','2022-11-27 16:57:08.520544','E','Iglesias','','iglesias@gmail.com','','','2022-11-27 16:57:08.523931',1,0),(24,NULL,0,'','2022-11-27 16:58:24.038648','E','Pacheco','','pacheco@gmail.com','','','2022-11-27 16:58:24.042045',1,0),(25,NULL,0,'','2022-11-27 16:58:43.549907','O','Velasquez','','velasquez@gmail.com','','','2022-11-27 16:58:43.553504',1,0),(26,NULL,0,'','2022-11-27 16:59:23.725643','O','Bustamante','','bustamante@gmail.com','','','2022-11-27 16:59:23.729612',1,0),(27,NULL,0,'','2022-11-27 17:00:09.768103','J','Martines','','matines@gmail.com','','','2022-11-27 17:00:09.771903',1,0),(28,NULL,0,'','2022-11-27 17:00:28.494774','S','Delgado','','delgado@gmail.com','','','2022-11-27 17:00:28.498023',1,0),(29,NULL,0,'','2022-11-27 17:01:20.500347','G','Davaloz','','davaloz@gmail.com','','','2022-11-27 17:01:20.503636',1,0),(30,NULL,0,'','2022-11-27 17:01:39.246263','M','Cuellar','','cuellar@gmail.com','','','2022-11-27 17:01:39.249741',1,0),(31,NULL,0,'','2022-11-27 17:01:59.565579','W','Pacheco','','wpacheco@gmail.com','','','2022-11-27 17:01:59.569081',1,0),(32,NULL,0,'','2022-11-27 17:02:26.389647','P','Cordero','','cordero@gmail.com','','','2022-11-27 17:02:26.392993',1,0),(33,NULL,0,'','2022-11-27 17:02:42.724241','D','Condo','','condo@gmail.com','','','2022-11-27 17:02:42.727464',1,0),(34,NULL,0,'','2022-11-27 17:03:03.353529','F','Zelaya','','zelaya@gmail.com','','','2022-11-27 17:03:03.356991',1,0),(35,NULL,0,'','2022-11-27 17:03:23.061215','W','Alvarez','','alvarez@gmail.com','','','2022-11-27 17:03:23.064534',1,0),(36,NULL,0,'','2022-11-27 17:04:18.223073','A','Molina','','molina@gmail.com','','','2022-11-27 17:04:18.226262',1,0),(37,NULL,0,'','2022-11-27 18:38:26.211505','F','Villalpando','','villalpando@gmail.com','','','2022-11-27 18:38:26.215240',1,0),(38,NULL,0,'','2022-11-27 18:39:12.464885','G','Poquechoque','','poque@gmail.com','','','2022-11-27 18:39:12.468409',1,0),(39,NULL,0,'','2022-11-27 18:40:42.350440','V','Belianskaya','','belianskaya@gmail.com','','','2022-11-27 18:40:42.353566',1,0),(40,NULL,0,'','2022-11-27 18:41:36.789406','S','Ugrinovic','','ugrinovic@gmail.com','','','2022-11-27 18:41:36.792828',1,0),(41,NULL,0,'','2022-11-27 18:42:59.135580','R','Quispe','','quispe@gmail.com','','','2022-11-27 18:42:59.140339',1,0),(42,NULL,0,'','2022-11-27 18:43:47.291284','R','Villafan','','villafan@gmail.com','','','2022-11-27 18:43:47.294562',1,0),(43,NULL,0,'','2022-11-27 18:48:05.724021','J','Zeballos','','zeballos@gmail.com','','','2022-11-27 18:48:05.727665',1,0),(44,NULL,0,'','2022-11-27 18:48:26.352893','M','Arenas','','arenas@gmail.com','','','2022-11-27 18:48:26.357114',1,0),(45,NULL,0,'','2022-11-27 18:48:50.766580','R','Duran','','duran@gmail.com','','','2022-11-27 18:48:50.769859',1,0),(46,NULL,0,'','2022-11-27 18:49:11.478206','C','Montellano','','montellano@gmail.com','','','2022-11-27 18:49:11.481723',1,0),(47,NULL,0,'','2022-11-27 18:49:47.582585','O','Galarza','','galarza@gmail.com','','','2022-11-27 18:49:47.586450',1,0),(48,NULL,0,'','2022-11-27 18:50:04.782890','M','Arancibia','','arancibia@gmail.com','','','2022-11-27 18:50:04.786308',1,0),(49,NULL,0,'','2022-11-27 18:50:39.657528','D','Roca','','roca@gmail.com','','','2022-11-27 18:50:39.660699',1,0),(50,NULL,0,'','2022-11-27 18:51:02.956014','J','Bergman','','bergman@gmail.com','','','2022-11-27 18:51:02.959705',1,0),(51,NULL,0,'','2022-11-27 18:53:04.612068','A','Baspineiro','','baspi@gmail.com','','','2022-11-27 18:53:04.616082',1,0),(52,NULL,0,'','2022-11-27 18:53:22.836512','S','Perez','','perez@gmail.com','','','2022-11-27 18:53:22.839901',1,0),(53,NULL,0,'','2022-11-27 18:56:58.257065','E','Espinoza','','espi@gmail.com','','','2022-11-27 18:56:58.260734',1,0),(54,NULL,0,'','2022-11-27 18:57:58.962451','M','Ovando','','ovando@gmail.com','','','2022-11-27 18:57:58.965838',1,0),(55,NULL,0,'','2022-11-27 19:05:21.559760','D','Avila','','avila@gmail.com','','','2022-11-27 19:05:21.563626',1,0),(57,NULL,0,'','2022-11-28 14:55:33.578130','O','Velasco','','velasco@gmail.com','','','2022-11-28 14:55:33.580397',1,0),(58,NULL,0,'','2022-11-28 15:16:08.788039','A','Acefalia','','acefalia@fmail.com','','','2022-11-28 15:16:08.791423',1,0),(67,'2022-12-23 17:14:08.929324',0,'','2022-11-30 12:03:10.793581','Fiona Gould','Patel','+1 (817) 2','junijeci@mailinator.com','pbkdf2_sha256$390000$NwrkfeCm0RstHLAlOd2EDA$rq7U1nHVZwGcHcplE4nLdC2TtmjGbawWlDa6Ax020dM=','Veniam et sit inventore possimus aute eum','2022-11-30 12:03:10.949602',1,0),(68,'2023-01-09 10:24:09.074586',0,'','2022-12-01 01:18:27.461763','Hall Hawkins','Shields','+1 (312) 873-6598','jimy@mailinator.com','pbkdf2_sha256$390000$ZMUKjhi6jT6hmUPyJ8abeu$t1mhs4sIP0UKse+WeZSiDvmKxRclG8tU1oyl+j4JSZg=','Sit eum volu','2022-12-01 01:18:27.838670',1,0),(69,'2023-01-14 14:13:45.270482',0,'','2022-12-23 17:16:23.852865','tirado','tirado','12345678','tirado@gmail.com','pbkdf2_sha256$390000$JgCI9WJCNIrQsKQto1pErf$Y/ZotWnBwbB7T1fDMTVUIfWCKA9gWXGpOs7dL9oswB0=','pa alla','2022-12-23 17:16:24.061956',1,0),(70,'2023-01-02 15:06:35.495168',1,'','2023-01-02 15:06:23.527484','','','','admin@gmail.com','pbkdf2_sha256$390000$hBRzW6QKRTfLk7xl99yybg$/c72jBxv1JRzz29bKosn6ojT3muqRsTXkduCmz5mHjc=','','2023-01-02 15:06:23.714160',1,1),(71,NULL,0,'','2023-01-09 10:27:02.034185','tirado 1','tirado 1','123456','tirado1@gmail.com','pbkdf2_sha256$390000$xXtLhGOUSOEEzM6I41hkah$heKLGh/YfrqWARZ9eL53YvR9R29d4GzCB4afH4bNNGk=','parque','2023-01-09 10:27:02.278080',1,0);
/*!40000 ALTER TABLE `usuarios_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios_groups`
--

DROP TABLE IF EXISTS `usuarios_usuarios_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq` (`usuarios_id`,`group_id`),
  KEY `usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios_usuarios` (`id`),
  CONSTRAINT `usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios_groups`
--

LOCK TABLES `usuarios_usuarios_groups` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuarios_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios_user_permissions`
--

DROP TABLE IF EXISTS `usuarios_usuarios_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq` (`usuarios_id`,`permission_id`),
  KEY `usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios_user_permissions`
--

LOCK TABLES `usuarios_usuarios_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuarios_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 10:19:20
