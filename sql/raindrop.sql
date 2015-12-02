-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: raindrop
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

CREATE DATABASE raindrop;
USE raindrop;
--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id_attachment`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`             VARCHAR(150) NOT NULL,
  `creat_la`             DATETIME              DEFAULT NULL,
  `modificat_de`         VARCHAR(150)          DEFAULT NULL,
  `modificat_la`         DATETIME              DEFAULT NULL,
  `accesat_la`           DATETIME              DEFAULT NULL,
  `file_name`            VARCHAR(500) NOT NULL,
  `id_proiect`           BIGINT(20)            DEFAULT NULL,
  `id_stoc`              BIGINT(20)            DEFAULT NULL,
  `id_user`              BIGINT(20)            DEFAULT NULL,
  `is_archive`           INT(1)       NOT NULL DEFAULT '0',
  `is_directory`         INT(1)       NOT NULL DEFAULT '0',
  `is_hidden`            INT(1)       NOT NULL DEFAULT '0',
  `is_readonly`          INT(1)       NOT NULL DEFAULT '0',
  `original_file_name`   VARCHAR(500) NOT NULL,
  `path`                 TEXT         NOT NULL,
  `size`                 BIGINT(20)   NOT NULL,
  `parent_id_attachment` BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_attachment`),
  KEY `FKl68xngsl7m0roceae3ohv1q8d` (`parent_id_attachment`),
  CONSTRAINT `FKl68xngsl7m0roceae3ohv1q8d` FOREIGN KEY (`parent_id_attachment`) REFERENCES `attachment` (`id_attachment`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1, 'bostanc', '2015-11-29 23:10:38', NULL, NULL, NULL, 'attasamente', NULL, 1, NULL, 0, 1, 0, 0, 'atasamente', 'atasamente', 0, NULL);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_proiect`
--

DROP TABLE IF EXISTS `categorie_proiect`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie_proiect` (
  `id_categorie_proiect`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`                    VARCHAR(150) NOT NULL,
  `creat_la`                    DATETIME              DEFAULT NULL,
  `modificat_de`                VARCHAR(150)          DEFAULT NULL,
  `modificat_la`                DATETIME              DEFAULT NULL,
  `nume`                        VARCHAR(150) NOT NULL,
  `parent_id_categorie_proiect` BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_categorie_proiect`),
  KEY `FKpbnsvtkqbvxwq9w2iiy66fkyt` (`parent_id_categorie_proiect`),
  CONSTRAINT `FKpbnsvtkqbvxwq9w2iiy66fkyt` FOREIGN KEY (`parent_id_categorie_proiect`) REFERENCES `categorie_proiect` (`id_categorie_proiect`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_proiect`
--

LOCK TABLES `categorie_proiect` WRITE;
/*!40000 ALTER TABLE `categorie_proiect` DISABLE KEYS */;
INSERT INTO `categorie_proiect` VALUES (1, 'admin', '2015-11-29 23:56:32', NULL, NULL, 'Categorie test', NULL);
/*!40000 ALTER TABLE `categorie_proiect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_stoc`
--

DROP TABLE IF EXISTS `categorie_stoc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie_stoc` (
  `id_categorie_stoc`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`                 VARCHAR(150) NOT NULL,
  `creat_la`                 DATETIME              DEFAULT NULL,
  `modificat_de`             VARCHAR(150)          DEFAULT NULL,
  `modificat_la`             DATETIME              DEFAULT NULL,
  `cod_categorie`            BIGINT(20)            DEFAULT NULL,
  `nume_categorie`           VARCHAR(255) NOT NULL,
  `parent_id_categorie_stoc` BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_categorie_stoc`),
  KEY `FKmcj9gpe160g34h9w38obcm644` (`parent_id_categorie_stoc`),
  CONSTRAINT `FKmcj9gpe160g34h9w38obcm644` FOREIGN KEY (`parent_id_categorie_stoc`) REFERENCES `categorie_stoc` (`id_categorie_stoc`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_stoc`
--

LOCK TABLES `categorie_stoc` WRITE;
/*!40000 ALTER TABLE `categorie_stoc` DISABLE KEYS */;
INSERT INTO `categorie_stoc`
VALUES (1, 'admin', '2015-11-29 23:05:03', NULL, NULL, 200, 'Calculatoare si Periferice', NULL), (2, 'admin', '2015-11-29 23:05:03', NULL, NULL, 100, 'Mobilier', NULL),
  (3, 'admin', '2015-11-29 23:05:03', NULL, NULL, 300, 'Echipamente electrice si electronice', NULL),
  (4, 'admin', '2015-11-29 23:05:03', NULL, NULL, 400, 'Obiecte de inventar', NULL), (5, 'admin', '2015-11-29 23:05:03', NULL, NULL, 500, 'Telefoane', NULL);
/*!40000 ALTER TABLE `categorie_stoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client`    BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `adresa`       VARCHAR(150)          DEFAULT NULL,
  `cod_postal`   VARCHAR(45)           DEFAULT NULL,
  `email`        VARCHAR(150)          DEFAULT NULL,
  `fax`          VARCHAR(20)           DEFAULT NULL,
  `judet`        VARCHAR(150)          DEFAULT NULL,
  `nume_client`  VARCHAR(150) NOT NULL,
  `oras`         VARCHAR(150)          DEFAULT NULL,
  `telefon`      VARCHAR(20)           DEFAULT NULL,
  `website`      VARCHAR(150)          DEFAULT NULL,
  `id_industrie` BIGINT(20)            DEFAULT NULL,
  `id_tara`      BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `FKeqnv8k8cxk9fup99x7ntvt9d0` (`id_industrie`),
  KEY `FK654nedxe9wbdrbgdr06ru9ssq` (`id_tara`),
  CONSTRAINT `FK654nedxe9wbdrbgdr06ru9ssq` FOREIGN KEY (`id_tara`) REFERENCES `lista_tari` (`id_tara`),
  CONSTRAINT `FKeqnv8k8cxk9fup99x7ntvt9d0` FOREIGN KEY (`id_industrie`) REFERENCES `industrie` (`id_industrie`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1, 'bostanc', '2015-11-29 23:53:25', NULL, NULL, 'strada si numar', '666', '', '', 'Buzuresti', 'Test Client', 'bucuresti', '', '', 15, 182);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colet`
--

DROP TABLE IF EXISTS `colet`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colet` (
  `id_colet`     BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `nume_colet`   VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id_colet`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colet`
--

LOCK TABLES `colet` WRITE;
/*!40000 ALTER TABLE `colet` DISABLE KEYS */;
INSERT INTO `colet` VALUES (1, 'bostanc', '2015-11-29 23:10:38', NULL, NULL, '89fa418c-f975-45d5-b970-31e439e2c40d');
/*!40000 ALTER TABLE `colet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grup_stoc`
--

DROP TABLE IF EXISTS `grup_stoc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grup_stoc` (
  `id_grup_stoc`      BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`          VARCHAR(150) NOT NULL,
  `creat_la`          DATETIME              DEFAULT NULL,
  `modificat_de`      VARCHAR(150)          DEFAULT NULL,
  `modificat_la`      DATETIME              DEFAULT NULL,
  `cod_grup`          BIGINT(20)            DEFAULT NULL,
  `nume_grup`         VARCHAR(255) NOT NULL,
  `id_categorie_stoc` BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_grup_stoc`),
  KEY `FK8h1737dlck6li5pr2vftht491` (`id_categorie_stoc`),
  CONSTRAINT `FK8h1737dlck6li5pr2vftht491` FOREIGN KEY (`id_categorie_stoc`) REFERENCES `categorie_stoc` (`id_categorie_stoc`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 191
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grup_stoc`
--

LOCK TABLES `grup_stoc` WRITE;
/*!40000 ALTER TABLE `grup_stoc` DISABLE KEYS */;
INSERT INTO `grup_stoc` VALUES (128, 'admin', '2015-11-29 23:07:31', NULL, NULL, 4, 'Birou', 2), (129, 'admin', '2015-11-29 23:07:31', NULL, NULL, 5, 'Notebook', 1),
  (130, 'admin', '2015-11-29 23:07:31', NULL, NULL, 6, 'Filtru cafea', 3), (131, 'admin', '2015-11-29 23:07:31', NULL, NULL, 7, 'Casca wireless', 4),
  (132, 'admin', '2015-11-29 23:07:31', NULL, NULL, 8, 'Monitor', 1), (133, 'admin', '2015-11-29 23:07:31', NULL, NULL, 9, 'Laptop Field', 1),
  (134, 'admin', '2015-11-29 23:07:31', NULL, NULL, 10, 'Balante electronice', 3), (135, 'admin', '2015-11-29 23:07:31', NULL, NULL, 11, 'DVD Player', 3),
  (136, 'admin', '2015-11-29 23:07:31', NULL, NULL, 12, 'Termometru', 3), (137, 'admin', '2015-11-29 23:07:31', NULL, NULL, 13, 'Fierbator Incalzitor Apa', 3),
  (138, 'admin', '2015-11-29 23:07:31', NULL, NULL, 14, 'Desktop', 1), (139, 'admin', '2015-11-29 23:07:31', NULL, NULL, 15, 'Scaun Simplu', 2),
  (140, 'admin', '2015-11-29 23:07:31', NULL, NULL, 16, 'Canapea', 2), (141, 'admin', '2015-11-29 23:07:31', NULL, NULL, 17, 'Fotoliu', 2),
  (142, 'admin', '2015-11-29 23:07:31', NULL, NULL, 18, 'Alte elemente mobilier', 2), (143, 'admin', '2015-11-29 23:07:31', NULL, NULL, 19, 'Televizor', 3),
  (144, 'admin', '2015-11-29 23:07:31', NULL, NULL, 20, 'Camera Video', 3), (145, 'admin', '2015-11-29 23:07:31', NULL, NULL, 21, 'Mixer Audio', 3),
  (146, 'admin', '2015-11-29 23:07:31', NULL, NULL, 22, 'Telefoane Mobile Personal', 5), (147, 'admin', '2015-11-29 23:07:31', NULL, NULL, 23, 'Modem', 5),
  (148, 'admin', '2015-11-29 23:07:31', NULL, NULL, 24, 'Microfon', 3), (149, 'admin', '2015-11-29 23:07:31', NULL, NULL, 25, 'Rollbox', 2),
  (150, 'admin', '2015-11-29 23:07:31', NULL, NULL, 26, 'Dulap', 2), (151, 'admin', '2015-11-29 23:07:31', NULL, NULL, 27, 'Telefon Fix', 5),
  (152, 'admin', '2015-11-29 23:07:31', NULL, NULL, 28, 'Aer Conditionat', 3), (153, 'admin', '2015-11-29 23:07:31', NULL, NULL, 29, 'FAX', 3),
  (154, 'admin', '2015-11-29 23:07:31', NULL, NULL, 30, 'Masa', 2), (155, 'admin', '2015-11-29 23:07:31', NULL, NULL, 31, 'Cuier', 2),
  (156, 'admin', '2015-11-29 23:07:31', NULL, NULL, 32, 'Scaun Fotoliu Corporate MOV', 2), (157, 'admin', '2015-11-29 23:07:31', NULL, NULL, 34, 'Corpuri depozitare', 2),
  (158, 'admin', '2015-11-29 23:07:31', NULL, NULL, 35, 'Scaun Rotativ Negru', 2), (159, 'admin', '2015-11-29 23:07:31', NULL, NULL, 36, 'Frigider', 3),
  (160, 'admin', '2015-11-29 23:07:31', NULL, NULL, 37, 'Laptop Full Time', 1), (161, 'admin', '2015-11-29 23:07:31', NULL, NULL, 38, 'Telefon Studii - CATI', 5),
  (162, 'admin', '2015-11-29 23:07:31', NULL, NULL, 39, 'Altele (scanner, videoproiector)', 1), (163, 'admin', '2015-11-29 23:07:31', NULL, NULL, 40, 'Tableta', 1),
  (164, 'admin', '2015-11-29 23:07:31', NULL, NULL, 41, 'router GSM', 3), (165, 'admin', '2015-11-29 23:07:31', NULL, NULL, 42, 'MODEM NOU', 5);
/*!40000 ALTER TABLE `grup_stoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industrie`
--

DROP TABLE IF EXISTS `industrie`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industrie` (
  `id_industrie` BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `nume`         VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_industrie`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 281
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industrie`
--

LOCK TABLES `industrie` WRITE;
/*!40000 ALTER TABLE `industrie` DISABLE KEYS */;
INSERT INTO `industrie` VALUES (1, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Accountants'), (2, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Aerospace & Defense'),
  (3, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Air Craft Charter, Rental, Leasing'), (4, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Airline Companies'),
  (5, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Airports - Aviation'), (6, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Alarm Systems'),
  (7, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Ambulance Service'), (8, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Amusement/Entertainment'),
  (9, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Antiques'), (10, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Apartments'),
  (11, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Appliances - Sales/Service'), (12, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Architects & Planners'),
  (13, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Arts'), (14, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Asset Management'),
  (15, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Assisted Living'), (16, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Associations & Organizations'),
  (17, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Attorneys'), (18, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Auctioneers'),
  (19, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Auctions - Online'), (20, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Audio / Video Equipment Sales'),
  (21, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Audio Visual Design & Sales'), (22, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Audiovisual Production - Film, Video Tape'),
  (23, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Audits - DCAA & Sarbanes-Oxley'), (24, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Automobile'),
  (25, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Bakeries'), (26, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Banks'),
  (27, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Bars & Night Clubs'), (28, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Beauty Shops'),
  (29, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Beverage'), (30, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Biotechnology'),
  (31, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Boat Dealers'), (32, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Bookstores'),
  (33, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Brokers - Investment'), (34, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Builders'),
  (35, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Building Materials'), (36, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Business Brokers'),
  (37, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Business Services'), (38, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cable Television'),
  (39, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Calibration/Instrumentation'), (40, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Carpet & Floor Coverings'),
  (41, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Caterers'), (42, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cellular Telephone'),
  (43, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cemeteries'), (44, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Chamber of Commerce'),
  (45, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Chiropractors'), (46, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Clothing'),
  (47, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Collection Agencies'), (48, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Commercial Design Firm'),
  (49, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Communications'), (50, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Computers'),
  (51, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Concierge'), (52, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Concrete - Ready Mixed'),
  (53, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Conference Facilities'), (54, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Construction'),
  (55, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Consulting'), (56, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Contractors'),
  (57, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Convenience Stores'), (58, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Convention Facilities & Services'),
  (59, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Copying & Copiers - Sales/Service/Supplies'), (60, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Copying Services'),
  (61, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Corporate Facilities & Services'), (62, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cosmetic Treatments'),
  (63, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cosmetics'), (64, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Cotton Gins'),
  (65, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Country Club'), (66, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Credit Unions'),
  (67, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Custom Publishing & Advertising'), (68, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Dairies'),
  (69, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Dance'), (70, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Day Spas'),
  (71, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Defense Contractors'), (72, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Delivery Services'),
  (73, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Dental Lab'), (74, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Dentists'),
  (75, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Department Stores'), (76, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Developers'),
  (77, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Disc Repair'), (78, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Displays'),
  (79, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Distributors'), (80, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Document & Record Destruction'),
  (81, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Document Management'), (82, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Dry Cleaners'),
  (83, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Economic Development'), (84, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Education'),
  (85, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Electrical'), (86, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Electronics'),
  (87, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Emergency Response Systems'), (88, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Employee Food Services'),
  (89, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Employment'), (90, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Engineering'),
  (91, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Engines - Rebuilding & Repair'), (92, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Environmental Services'),
  (93, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Equipment'), (94, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Events & Party Services'),
  (95, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Event Planner'), (96, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Fabricators'),
  (97, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Farms & Ranches - Equipment & Supplies'), (98, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Finance Companies'),
  (99, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Financial - Advisor'), (100, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Financial - Private Equity Fund'),
  (101, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Financial Services'), (102, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Fitness Centers'),
  (103, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Flags'), (104, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Florists'),
  (105, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Florists'), (106, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Foreign Trade Services'),
  (107, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Foster Care'), (108, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Frames / Pictures - Retail'),
  (109, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Franchises'), (110, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Freight'),
  (111, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Fund Raiser '), (112, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Funeral Homes'),
  (113, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Furniture - Home Furnishings'), (114, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Generators - Electric'),
  (115, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Geospatial Services'), (116, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Gift Shops'),
  (117, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Gifts'), (118, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Golf Courses'),
  (119, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Gourmet Foods - Retail'), (120, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Government'),
  (121, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Graphic Design'), (122, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Grocers - Retail'),
  (123, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Gymnastics'), (124, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Hazardous Waste Disposal'),
  (125, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Health Care'), (126, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Heating & Cooling'),
  (127, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'High Tech Piping & Welding'), (128, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Home Building - Custom'),
  (129, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Home Health & Hospice Agency'), (130, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Home Improvements'),
  (131, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Home Theater'), (132, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Hospitals'),
  (133, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Hotels & Motels'), (134, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'House & Building Movers'),
  (135, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Human Resources Outsourcing'), (136, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Ice Cream & Frozen Desserts'),
  (137, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Ice Making Equipment'), (138, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Identity Theft'),
  (139, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Individual Members'), (140, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Industrial Equipment & Sales'),
  (141, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Industrial Real Estate'), (142, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Information Security Management'),
  (143, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Information Technology'), (144, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Insurance'),
  (145, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Interior Design'), (146, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'International Services'),
  (147, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Internet Services'), (148, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Investment Advisor'),
  (149, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Investment Management'), (150, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Investments'),
  (151, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Janitorial'), (152, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Jewelers'),
  (153, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Land Surveyors'), (154, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Landscape Architect'),
  (155, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Landscaping'), (156, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Lawn & Garden'),
  (157, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Leadership'), (158, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Legal Services'),
  (159, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Libraries'), (160, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Life Coach'),
  (161, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Lighting'), (162, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Limousine Services'),
  (163, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Logistics Support Services'), (164, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Machine Shops'),
  (165, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Mailing Services'), (166, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Maintenance'),
  (167, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Manufacturing'), (168, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Marina - Campground (RV) - Recreation'),
  (169, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Marketing'), (170, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Massage Therapists - Licensed'),
  (171, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Material Handling Equipment'), (172, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Meal Assembly'),
  (173, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Media'), (174, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Medical Equipment & Supplies'),
  (175, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Medical Services'), (176, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Medical Spas'),
  (177, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Merchant Services'), (178, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Metals'),
  (179, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Military'), (180, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Missile & Aviation Systems'),
  (181, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Mold Removal'), (182, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Mortgages'),
  (183, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Motorcycle Dealers'), (184, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Movers'),
  (185, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Multimedia'), (186, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Music'),
  (187, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Musical Instruments'), (188, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Nannies'),
  (189, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Network Equipment, Installation, Service'), (190, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Newspaper'),
  (191, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Nurseries - Retail'), (192, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Nursing Homes'),
  (193, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Office Equipment'), (194, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Optical Goods'),
  (195, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Optical Goods'), (196, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Organization Database'),
  (197, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Packaging - Foam Cushioning & Containers'), (198, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Paint Dealers'),
  (199, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Parks & Recreation'), (200, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Party Services & Supplies'),
  (201, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Personal Fitness Trainer'), (202, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Personal Services'),
  (203, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Pest Control'), (204, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Pet Sitting'),
  (205, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Petroleum/Oil Companies'), (206, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Pharmaceutical - Sales & Marketing'),
  (207, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Pharmacies / Drug Stores'), (208, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Photography'),
  (209, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Physical Therapy'), (210, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Physicians & Surgeons'),
  (211, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Plastics - Injection Molding'), (212, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Plumbing'),
  (213, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Poultry Dealers'), (214, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Printing'),
  (215, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Professional & Technical Services'), (216, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Propane/Gases'),
  (217, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Psychological - Counseling'), (218, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Psychologists'),
  (219, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Public Relations'), (220, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Publishers'),
  (221, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Pumps & Pumping Equipment'), (222, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Radio Stations'),
  (223, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Real Estate'), (224, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Records & Information Management'),
  (225, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Recreational Vehicles'), (226, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Recycling/Shredding'),
  (227, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Rehabilitation Services'), (228, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Remodeling'),
  (229, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Research & Development'), (230, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Restaurant Equipment Sales'),
  (231, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Restaurants'), (232, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Restoration'),
  (233, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Retail'), (234, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Retail / Wholesale'),
  (235, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Retirement Communities'), (236, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Robotic Systems'),
  (237, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Rugs'), (238, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Safe Deposit Boxes'),
  (239, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Scales'), (240, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Security & Guard Services'),
  (241, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Shopping Centers'), (242, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Signs & Banners'),
  (243, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Speakers'), (244, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Sporting Goods'),
  (245, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Sports - Professional'), (246, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Stock & Bond Brokers'),
  (247, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Storage Units'), (248, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Storage'),
  (249, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Technology Services'), (250, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Telecommunications'),
  (251, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Telephone Systems/Service/Equipment'), (252, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Television'),
  (253, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Theatre'), (254, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Theatrical Equipment'),
  (255, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Tires'), (256, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Tourism'),
  (257, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Toys - Learning Products'), (258, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Translation'),
  (259, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Transportation'), (260, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Travel Agencies & Services'),
  (261, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Tree Service'), (262, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Trophies & Awards'),
  (263, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Trucking - Local Cartage'), (264, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Trucks - Sales/Repair/Service'),
  (265, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Uniforms'), (266, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Upholstery'),
  (267, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Utilities'), (268, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Vending Services'),
  (269, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Veterinarians'), (270, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Veterinary Hospitals'),
  (271, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Video Production'), (272, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Warehouse - Storage/Distribution'),
  (273, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Waste Management'), (274, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Web Design'),
  (275, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Weddings'), (276, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Wellness Products & Services'),
  (277, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Wholesale'), (278, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Window Cleaning'),
  (279, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Window Treatments'), (280, 'admin', '2015-10-24 11:47:15', NULL, NULL, 'Wireless');
/*!40000 ALTER TABLE `industrie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_tari`
--

DROP TABLE IF EXISTS `lista_tari`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_tari` (
  `id_tara`      BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `nume`         VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_tara`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 247
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_tari`
--

LOCK TABLES `lista_tari` WRITE;
/*!40000 ALTER TABLE `lista_tari` DISABLE KEYS */;
INSERT INTO `lista_tari` VALUES (1, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'United States'), (2, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Canada'),
  (3, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Afghanistan'), (4, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Albania'),
  (5, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Algeria'), (6, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'American Samoa'),
  (7, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Andorra'), (8, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Angola'),
  (9, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Anguilla'), (10, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Antarctica'),
  (11, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Antigua and/or Barbuda'), (12, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Argentina'),
  (13, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Armenia'), (14, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Aruba'),
  (15, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Australia'), (16, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Austria'),
  (17, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Azerbaijan'), (18, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bahamas'),
  (19, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bahrain'), (20, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bangladesh'),
  (21, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Barbados'), (22, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Belarus'),
  (23, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Belgium'), (24, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Belize'),
  (25, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Benin'), (26, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bermuda'),
  (27, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bhutan'), (28, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bolivia'),
  (29, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bosnia and Herzegovina'), (30, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Botswana'),
  (31, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bouvet Island'), (32, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Brazil'),
  (33, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'British Indian Ocean Territory'), (34, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Brunei Darussalam'),
  (35, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Bulgaria'), (36, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Burkina Faso'),
  (37, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Burundi'), (38, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cambodia'),
  (39, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cameroon'), (40, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cape Verde'),
  (41, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cayman Islands'), (42, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Central African Republic'),
  (43, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Chad'), (44, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Chile'), (45, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'China'),
  (46, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Christmas Island'), (47, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cocos (Keeling) Islands'),
  (48, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Colombia'), (49, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Comoros'),
  (50, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Congo'), (51, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cook Islands'),
  (52, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Costa Rica'), (53, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Croatia (Hrvatska)'),
  (54, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cuba'), (55, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Cyprus'),
  (56, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Czech Republic'), (57, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Denmark'),
  (58, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Djibouti'), (59, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Dominica'),
  (60, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Dominican Republic'), (61, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'East Timor'),
  (62, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ecuador'), (63, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Egypt'),
  (64, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'El Salvador'), (65, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Equatorial Guinea'),
  (66, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Eritrea'), (67, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Estonia'),
  (68, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ethiopia'), (69, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Falkland Islands (Malvinas)'),
  (70, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Faroe Islands'), (71, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Fiji'),
  (72, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Finland'), (73, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'France'),
  (74, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'France, Metropolitan'), (75, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'French Guiana'),
  (76, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'French Polynesia'), (77, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'French Southern Territories'),
  (78, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Gabon'), (79, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Gambia'),
  (80, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Georgia'), (81, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Germany'),
  (82, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ghana'), (83, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Gibraltar'),
  (84, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guernsey'), (85, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Greece'),
  (86, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Greenland'), (87, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Grenada'),
  (88, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guadeloupe'), (89, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guam'),
  (90, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guatemala'), (91, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guinea'),
  (92, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guinea-Bissau'), (93, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Guyana'),
  (94, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Haiti'), (95, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Heard and Mc Donald Islands'),
  (96, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Honduras'), (97, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Hong Kong'),
  (98, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Hungary'), (99, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Iceland'),
  (100, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'India'), (101, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Isle of Man'),
  (102, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Indonesia'), (103, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Iran (Islamic Republic of)'),
  (104, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Iraq'), (105, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ireland'),
  (106, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Israel'), (107, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Italy'),
  (108, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ivory Coast'), (109, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Jersey'),
  (110, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Jamaica'), (111, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Japan'),
  (112, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Jordan'), (113, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kazakhstan'),
  (114, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kenya'), (115, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kiribati'),
  (116, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Korea, Democratic People\'s Republic of'), (117, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Korea, Republic of'),
  (118, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kosovo'), (119, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kuwait'),
  (120, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Kyrgyzstan'), (121, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Lao People\'s Democratic Republic'),
  (122, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Latvia'), (123, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Lebanon'),
  (124, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Lesotho'), (125, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Liberia'),
  (126, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Libyan Arab Jamahiriya'), (127, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Liechtenstein'),
  (128, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Lithuania'), (129, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Luxembourg'),
  (130, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Macau'), (131, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Macedonia'),
  (132, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Madagascar'), (133, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Malawi'),
  (134, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Malaysia'), (135, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Maldives'),
  (136, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mali'), (137, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Malta'),
  (138, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Marshall Islands'), (139, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Martinique'),
  (140, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mauritania'), (141, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mauritius'),
  (142, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mayotte'), (143, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mexico'),
  (144, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Micronesia, Federated States of'), (145, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Moldova, Republic of'),
  (146, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Monaco'), (147, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mongolia'),
  (148, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Montenegro'), (149, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Montserrat'),
  (150, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Morocco'), (151, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Mozambique'),
  (152, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Myanmar'), (153, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Namibia'),
  (154, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Nauru'), (155, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Nepal'),
  (156, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Netherlands'), (157, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Netherlands Antilles'),
  (158, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'New Caledonia'), (159, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'New Zealand'),
  (160, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Nicaragua'), (161, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Niger'),
  (162, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Nigeria'), (163, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Niue'),
  (164, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Norfolk Island'), (165, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Northern Mariana Islands'),
  (166, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Norway'), (167, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Oman'),
  (168, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Pakistan'), (169, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Palau'),
  (170, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Palestine'), (171, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Panama'),
  (172, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Papua New Guinea'), (173, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Paraguay'),
  (174, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Peru'), (175, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Philippines'),
  (176, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Pitcairn'), (177, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Poland'),
  (178, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Portugal'), (179, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Puerto Rico'),
  (180, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Qatar'), (181, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Reunion'),
  (182, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Romania'), (183, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Russian Federation'),
  (184, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Rwanda'), (185, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Saint Kitts and Nevis'),
  (186, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Saint Lucia'), (187, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Saint Vincent and the Grenadines'),
  (188, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Samoa'), (189, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'San Marino'),
  (190, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Sao Tome and Principe'), (191, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Saudi Arabia'),
  (192, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Senegal'), (193, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Serbia'),
  (194, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Seychelles'), (195, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Sierra Leone'),
  (196, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Singapore'), (197, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Slovakia'),
  (198, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Slovenia'), (199, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Solomon Islands'),
  (200, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Somalia'), (201, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'South Africa'),
  (202, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'South Georgia South Sandwich Islands'), (203, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Spain'),
  (204, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Sri Lanka'), (205, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'St. Helena'),
  (206, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'St. Pierre and Miquelon'), (207, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Sudan'),
  (208, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Suriname'), (209, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Svalbard and Jan Mayen Islands'),
  (210, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Swaziland'), (211, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Sweden'),
  (212, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Switzerland'), (213, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Syrian Arab Republic'),
  (214, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Taiwan'), (215, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tajikistan'),
  (216, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tanzania, United Republic of'), (217, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Thailand'),
  (218, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Togo'), (219, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tokelau'),
  (220, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tonga'), (221, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Trinidad and Tobago'),
  (222, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tunisia'), (223, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Turkey'),
  (224, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Turkmenistan'), (225, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Turks and Caicos Islands'),
  (226, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Tuvalu'), (227, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Uganda'),
  (228, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Ukraine'), (229, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'United Arab Emirates'),
  (230, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'United Kingdom'), (231, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'United States minor outlying islands'),
  (232, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Uruguay'), (233, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Uzbekistan'),
  (234, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Vanuatu'), (235, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Vatican City State'),
  (236, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Venezuela'), (237, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Vietnam'),
  (238, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Virgin Islands (British)'), (239, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Virgin Islands (U.S.)'),
  (240, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Wallis and Futuna Islands'), (241, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Western Sahara'),
  (242, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Yemen'), (243, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Yugoslavia'),
  (244, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Zaire'), (245, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Zambia'),
  (246, 'admin', '2015-10-24 11:34:06', NULL, NULL, 'Zimbabwe');
/*!40000 ALTER TABLE `lista_tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc`
--

DROP TABLE IF EXISTS `loc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loc` (
  `id_loc`       BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `latitude`     VARCHAR(255) NOT NULL,
  `longitude`    VARCHAR(255) NOT NULL,
  `nume_loc`     VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_loc`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc`
--

LOCK TABLES `loc` WRITE;
/*!40000 ALTER TABLE `loc` DISABLE KEYS */;
INSERT INTO `loc`
VALUES (1, 'admin', '2015-11-29 23:08:53', NULL, NULL, '999', '999', 'Test loc'), (2, 'bostanc', '2015-12-01 22:27:46', NULL, NULL, '44.443217', '26.04321099999993', 'sema');
/*!40000 ALTER TABLE `loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestone` (
  `id_milestone`   BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `nume_milestone` VARCHAR(250) NOT NULL,
  `id_proiect`     BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_milestone`),
  KEY `FKlxp1of0wh5d2hxh1w7dnsrmfs` (`id_proiect`),
  CONSTRAINT `FKlxp1of0wh5d2hxh1w7dnsrmfs` FOREIGN KEY (`id_proiect`) REFERENCES `proiect` (`id_proiect`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obiectiv`
--

DROP TABLE IF EXISTS `obiectiv`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obiectiv` (
  `id_obiectiv`  BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `descriere`    LONGTEXT,
  `nume`         VARCHAR(150) NOT NULL,
  `id_milestone` BIGINT(20)            DEFAULT NULL,
  `id_proiect`   BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_obiectiv`),
  KEY `FKd016j234s08nlcibyuxwiqn2h` (`id_milestone`),
  KEY `FKcesk0x3fthcar6xux4cldijs4` (`id_proiect`),
  CONSTRAINT `FKcesk0x3fthcar6xux4cldijs4` FOREIGN KEY (`id_proiect`) REFERENCES `proiect` (`id_proiect`),
  CONSTRAINT `FKd016j234s08nlcibyuxwiqn2h` FOREIGN KEY (`id_milestone`) REFERENCES `milestone` (`id_milestone`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obiectiv`
--

LOCK TABLES `obiectiv` WRITE;
/*!40000 ALTER TABLE `obiectiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `obiectiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persoane`
--

DROP TABLE IF EXISTS `persoane`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persoane` (
  `id_persoana`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`           VARCHAR(150) NOT NULL,
  `creat_la`           DATETIME              DEFAULT NULL,
  `modificat_de`       VARCHAR(150)          DEFAULT NULL,
  `modificat_la`       DATETIME              DEFAULT NULL,
  `adresa`             VARCHAR(250)          DEFAULT NULL,
  `cnp`                VARCHAR(20)           DEFAULT NULL,
  `cod_postal`         VARCHAR(45)           DEFAULT NULL,
  `data_angajare`      DATE                  DEFAULT NULL,
  `data_nastere`       DATE                  DEFAULT NULL,
  `fax`                VARCHAR(45)           DEFAULT NULL,
  `fullName`           VARCHAR(255)          DEFAULT NULL,
  `home_tel`           VARCHAR(45)           DEFAULT NULL,
  `judet`              VARCHAR(45)           DEFAULT NULL,
  `mobil_tel`          VARCHAR(45)           DEFAULT NULL,
  `nume`               VARCHAR(150) NOT NULL,
  `oras`               VARCHAR(45)           DEFAULT NULL,
  `pozitie`            VARCHAR(150)          DEFAULT NULL,
  `pozitie_anterioara` VARCHAR(150)          DEFAULT NULL,
  `prenume`            VARCHAR(150) NOT NULL,
  `work_tel`           VARCHAR(45)           DEFAULT NULL,
  `zile_concediu`      VARCHAR(45)           DEFAULT NULL,
  `id_client`          BIGINT(20)            DEFAULT NULL,
  `id_tara`            BIGINT(20)            DEFAULT NULL,
  `id_user`            BIGINT(20)            DEFAULT NULL,
  `user_photo`         BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_persoana`),
  KEY `FKc855gvjr1uvd1c38yt9jwg7c7` (`id_client`),
  KEY `FK1ob3yt0l07xpukliorql6ulr0` (`id_tara`),
  KEY `FKe22qm2hbd6alt1jpmgpgete0h` (`id_user`),
  KEY `FKei1ymjpotus2lqir1c94fo1il` (`user_photo`),
  CONSTRAINT `FK1ob3yt0l07xpukliorql6ulr0` FOREIGN KEY (`id_tara`) REFERENCES `lista_tari` (`id_tara`),
  CONSTRAINT `FKc855gvjr1uvd1c38yt9jwg7c7` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FKe22qm2hbd6alt1jpmgpgete0h` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FKei1ymjpotus2lqir1c94fo1il` FOREIGN KEY (`user_photo`) REFERENCES `attachment` (`id_attachment`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persoane`
--

LOCK TABLES `persoane` WRITE;
/*!40000 ALTER TABLE `persoane` DISABLE KEYS */;
INSERT INTO `persoane` VALUES
  (1, 'admin', '2015-11-29 22:16:28', 'bostanc', '2015-11-30 00:08:56', NULL, NULL, NULL, NULL, NULL, NULL, 'Ciprian Bostan', NULL, NULL, NULL, 'Bostan', NULL, 'Lead Dev', NULL,
   'Ciprian', '0723873799', '22', NULL, 182, 1, NULL),
  (2, 'admin', '2015-11-29 22:17:31', 'bostanc', '2015-11-30 21:58:55', NULL, NULL, NULL, NULL, NULL, NULL, 'Ciprian Mihalcescu', NULL, NULL, NULL, 'Mihalcescu', '', 'Lead Tester',
   NULL, 'Ciprian', '0723873799', '22', NULL, 182, 2, NULL),
  (3, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isac', 'Bucuresti', 'Field Executive', NULL, 'Alexandru', NULL, '22',
   NULL, 182, 5, NULL),
  (4, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bostan', 'Bucuresti', 'Operations Director', NULL, 'Adrian', NULL,
   '22', NULL, 182, 4, NULL),
  (5, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cristea', 'Bucuresti', 'Operation Executive', NULL, 'Adelina', NULL,
   '22', NULL, 182, 3, NULL),
  (6, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Stancescu', 'Bucuresti', 'Operation Executive', NULL, 'Stefania',
   NULL, '22', NULL, 182, 11, NULL),
  (7, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Druga', 'Bucuresti', 'Operation Executive', NULL, 'Ioana', NULL,
   '22', NULL, 182, 9, NULL),
  (8, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Constantin', 'Bucuresti', 'Operation Executive', NULL, 'Silvia',
   NULL, '22', NULL, 182, 10, NULL),
  (9, 'admin', '2015-11-29 22:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Georgescu', 'Bucuresti', 'Supervizor', NULL, 'Bianca', NULL, '22',
   NULL, 182, 6, NULL);
/*!40000 ALTER TABLE `persoane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontaj`
--

DROP TABLE IF EXISTS `pontaj`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pontaj` (
  `id_pontaj`     BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`      VARCHAR(150) NOT NULL,
  `creat_la`      DATETIME              DEFAULT NULL,
  `modificat_de`  VARCHAR(150)          DEFAULT NULL,
  `modificat_la`  DATETIME              DEFAULT NULL,
  `an`            VARCHAR(45)           DEFAULT NULL,
  `data`          DATE                  DEFAULT NULL,
  `luna`          VARCHAR(45)           DEFAULT NULL,
  `zi`            VARCHAR(45)           DEFAULT NULL,
  `id_persoana`   BIGINT(20)            DEFAULT NULL,
  `id_u_m_pontaj` BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_pontaj`),
  KEY `FKb5dpwocwt0iyby5ia1chbayyr` (`id_persoana`),
  KEY `FKtjqm3q7f6geb0m2y61qcrfnx1` (`id_u_m_pontaj`),
  CONSTRAINT `FKb5dpwocwt0iyby5ia1chbayyr` FOREIGN KEY (`id_persoana`) REFERENCES `persoane` (`id_persoana`),
  CONSTRAINT `FKtjqm3q7f6geb0m2y61qcrfnx1` FOREIGN KEY (`id_u_m_pontaj`) REFERENCES `u_m_pontaj` (`id_u_m_pontaj`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontaj`
--

LOCK TABLES `pontaj` WRITE;
/*!40000 ALTER TABLE `pontaj` DISABLE KEYS */;
/*!40000 ALTER TABLE `pontaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proiect`
--

DROP TABLE IF EXISTS `proiect`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proiect` (
  `id_proiect`           BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`             VARCHAR(150) NOT NULL,
  `creat_la`             DATETIME              DEFAULT NULL,
  `modificat_de`         VARCHAR(150)          DEFAULT NULL,
  `modificat_la`         DATETIME              DEFAULT NULL,
  `cod_proiect`          VARCHAR(255) NOT NULL,
  `data_end_estimativa`  DATE                  DEFAULT NULL,
  `data_start`           DATE                  DEFAULT NULL,
  `deleted`              INT(1)       NOT NULL DEFAULT '0',
  `descriere`            LONGTEXT,
  `nume_proiect`         VARCHAR(150) NOT NULL,
  `id_categorie_proiect` BIGINT(20)            DEFAULT NULL,
  `id_client`            BIGINT(20)            DEFAULT NULL,
  `id_status_proiect`    BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_proiect`),
  KEY `FKqrtyl69osc5rfk2qla9f39rrk` (`id_categorie_proiect`),
  KEY `FK2jno8tp4apmqrwwx7h5b8dlqr` (`id_client`),
  KEY `FKlr037echotai4pal33g0ygdmv` (`id_status_proiect`),
  CONSTRAINT `FK2jno8tp4apmqrwwx7h5b8dlqr` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FKlr037echotai4pal33g0ygdmv` FOREIGN KEY (`id_status_proiect`) REFERENCES `status_proiect` (`id_status_proiect`),
  CONSTRAINT `FKqrtyl69osc5rfk2qla9f39rrk` FOREIGN KEY (`id_categorie_proiect`) REFERENCES `categorie_proiect` (`id_categorie_proiect`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiect`
--

LOCK TABLES `proiect` WRITE;
/*!40000 ALTER TABLE `proiect` DISABLE KEYS */;
INSERT INTO `proiect` VALUES (1, 'bostanc', '2015-11-29 23:57:37', NULL, NULL, '360I', '2016-01-03', '2015-10-26', 0, '', '360insights', 1, 1, 2);
/*!40000 ALTER TABLE `proiect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risc`
--

DROP TABLE IF EXISTS `risc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risc` (
  `id_risc`      BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `descriere`    LONGTEXT,
  `nume`         VARCHAR(150) NOT NULL,
  `id_proiect`   BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_risc`),
  KEY `FK57tprh0h6vdxpd72ky63e5lqd` (`id_proiect`),
  CONSTRAINT `FK57tprh0h6vdxpd72ky63e5lqd` FOREIGN KEY (`id_proiect`) REFERENCES `proiect` (`id_proiect`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risc`
--

LOCK TABLES `risc` WRITE;
/*!40000 ALTER TABLE `risc` DISABLE KEYS */;
/*!40000 ALTER TABLE `risc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_role`      BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `role`         VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_role`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stare_stoc`
--

DROP TABLE IF EXISTS `stare_stoc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stare_stoc` (
  `id_stare`     BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `nume_stare`   VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_stare`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stare_stoc`
--

LOCK TABLES `stare_stoc` WRITE;
/*!40000 ALTER TABLE `stare_stoc` DISABLE KEYS */;
INSERT INTO `stare_stoc` VALUES (1, 'admin', '2015-10-22 22:06:26', NULL, NULL, 'În stoc'), (2, 'admin', '2015-10-22 22:06:52', NULL, NULL, 'Recuperat / În stoc'),
  (3, 'admin', '2015-10-22 22:07:51', NULL, NULL, 'În folosinta'), (4, 'admin', '2015-10-22 22:11:26', NULL, NULL, 'În tranzit'),
  (5, 'admin', '2015-10-22 22:12:27', NULL, NULL, 'Deteriorat'), (6, 'admin', '2015-10-22 22:27:28', NULL, NULL, 'În service'),
  (7, 'admin', '2015-10-22 22:27:52', NULL, NULL, 'Disparut'), (8, 'admin', '2015-10-22 22:28:21', NULL, NULL, 'Casat');
/*!40000 ALTER TABLE `stare_stoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_proiect`
--

DROP TABLE IF EXISTS `status_proiect`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_proiect` (
  `id_status_proiect` BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`          VARCHAR(150) NOT NULL,
  `creat_la`          DATETIME              DEFAULT NULL,
  `modificat_de`      VARCHAR(150)          DEFAULT NULL,
  `modificat_la`      DATETIME              DEFAULT NULL,
  `nume_status`       VARCHAR(50)  NOT NULL,
  PRIMARY KEY (`id_status_proiect`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_proiect`
--

LOCK TABLES `status_proiect` WRITE;
/*!40000 ALTER TABLE `status_proiect` DISABLE KEYS */;
INSERT INTO `status_proiect` VALUES (1, 'admin', '2015-10-24 11:22:15', NULL, NULL, 'Planificat'), (2, 'admin', '2015-10-24 11:24:26', NULL, NULL, 'In derulare'),
  (3, 'admin', '2015-10-24 11:24:52', NULL, NULL, 'Finalizat'), (4, 'admin', '2015-10-24 11:25:41', NULL, NULL, 'Anulat');
/*!40000 ALTER TABLE `status_proiect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_task`
--

DROP TABLE IF EXISTS `status_task`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_task` (
  `id_status_task` BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`       VARCHAR(150) NOT NULL,
  `creat_la`       DATETIME              DEFAULT NULL,
  `modificat_de`   VARCHAR(150)          DEFAULT NULL,
  `modificat_la`   DATETIME              DEFAULT NULL,
  `nume`           VARCHAR(255) NOT NULL,
  `ordine`         INT(11)      NOT NULL,
  PRIMARY KEY (`id_status_task`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_task`
--

LOCK TABLES `status_task` WRITE;
/*!40000 ALTER TABLE `status_task` DISABLE KEYS */;
INSERT INTO `status_task` VALUES (1, 'admin', '2015-12-01 21:44:44', NULL, NULL, 'Planificat', 1), (2, 'admin', '2015-12-01 21:45:15', NULL, NULL, 'In derulare', 2),
  (3, 'admin', '2015-12-01 21:45:30', NULL, NULL, 'Finalizat', 3), (4, 'admin', '2015-12-01 21:45:47', NULL, NULL, 'Anulat', 4);
/*!40000 ALTER TABLE `status_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stoc`
--

DROP TABLE IF EXISTS `stoc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stoc` (
  `id_stoc`           BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`          VARCHAR(150) NOT NULL,
  `creat_la`          DATETIME              DEFAULT NULL,
  `modificat_de`      VARCHAR(150)          DEFAULT NULL,
  `modificat_la`      DATETIME              DEFAULT NULL,
  `cod_stoc`          VARCHAR(255) NOT NULL,
  `deleted`           INT(1)       NOT NULL DEFAULT '0',
  `detalii`           VARCHAR(255)          DEFAULT NULL,
  `nume_stoc`         VARCHAR(255) NOT NULL,
  `factura`           BIGINT(20)            DEFAULT NULL,
  `id_categorie_stoc` BIGINT(20)            DEFAULT NULL,
  `id_grup_stoc`      BIGINT(20)            DEFAULT NULL,
  `id_loc`            BIGINT(20)            DEFAULT NULL,
  `id_persoana`       BIGINT(20)            DEFAULT NULL,
  `id_stare`          BIGINT(20)            DEFAULT NULL,
  `imagine`           BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_stoc`),
  KEY `FK90khbbiqhmum9qtvvrgv0gahq` (`factura`),
  KEY `FKgwuaia0dt07k9b9g0iqxkx19c` (`id_categorie_stoc`),
  KEY `FKaff5xbkqmd85h5mxacutroa1i` (`id_grup_stoc`),
  KEY `FKa9xifom2v9t0kun2pcsk6iaw3` (`id_loc`),
  KEY `FK4t5nvjt7lwti6eo3o2ry9rh5j` (`id_persoana`),
  KEY `FKmsa9yrd5gfs626gh0q13ihbps` (`id_stare`),
  KEY `FKd1giofvg222mrtax5h1ctttgt` (`imagine`),
  CONSTRAINT `FK4t5nvjt7lwti6eo3o2ry9rh5j` FOREIGN KEY (`id_persoana`) REFERENCES `persoane` (`id_persoana`),
  CONSTRAINT `FK90khbbiqhmum9qtvvrgv0gahq` FOREIGN KEY (`factura`) REFERENCES `attachment` (`id_attachment`),
  CONSTRAINT `FKa9xifom2v9t0kun2pcsk6iaw3` FOREIGN KEY (`id_loc`) REFERENCES `loc` (`id_loc`),
  CONSTRAINT `FKaff5xbkqmd85h5mxacutroa1i` FOREIGN KEY (`id_grup_stoc`) REFERENCES `grup_stoc` (`id_grup_stoc`),
  CONSTRAINT `FKd1giofvg222mrtax5h1ctttgt` FOREIGN KEY (`imagine`) REFERENCES `attachment` (`id_attachment`),
  CONSTRAINT `FKgwuaia0dt07k9b9g0iqxkx19c` FOREIGN KEY (`id_categorie_stoc`) REFERENCES `categorie_stoc` (`id_categorie_stoc`),
  CONSTRAINT `FKmsa9yrd5gfs626gh0q13ihbps` FOREIGN KEY (`id_stare`) REFERENCES `stare_stoc` (`id_stare`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2048
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stoc`
--

LOCK TABLES `stoc` WRITE;
/*!40000 ALTER TABLE `stoc` DISABLE KEYS */;
INSERT INTO `stoc` VALUES (1025, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00006', 0, NULL, 'Notebook Acer eME350-21G25ikk1GB WIN7', NULL, 1, 129, 2, NULL, 1, NULL),
  (1026, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00007', 0, 'SNID: 04004929916+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1027, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00008', 0, 'SNID: 04004813316+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1028, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00009', 0, 'SNID: 04004934316+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1029, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00010', 0, 'SNID: 04002718216+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1030, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00011', 0, 'SNID: 04005091816+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1031, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00012', 0, 'SNID: 04004762716+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1032, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00013', 0, 'SNID: 04004929016+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1033, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00014', 0, 'SNID: 04002707616+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1034, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00015', 0, 'SNID: 04004760016+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1035, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00016', 0, 'SNID: 04004941616+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1036, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00017', 0, 'SNID: 04005099416+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1037, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00018', 0, 'SNID: 04004831016+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1038, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00019', 0, 'SNID: 04004921816+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1039, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00020', 0, 'SNID: 04004888916+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1040, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00021', 0, 'SNID: 04005097216+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1041, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00022', 0, 'SNID: 04002835016+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1042, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00023', 0, 'SNID: 04004764916+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1043, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00024', 0, 'SNID: 04005098416+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1044, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00025', 0, 'SNID: 04003189316+ Husa Canyon + Windows 7 Starter', 'Notebook Acer eME350-21G25ikk', NULL, 1, 129, 2, NULL, 1, NULL),
  (1045, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00026', 0, 'SNID:04002642885', 'Monitor Acer 18.5 \'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1046, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00027', 0, 'SN : 00043-118-301-102', 'Notebook MSI - U135', NULL, 1, 129, 2, NULL, 1, NULL),
  (1047, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00028', 0, 'SNID: 03400087625', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1048, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00029', 0, 'SNID: 83701420716', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1049, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00030', 0, 'SNID: 03302771525', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1050, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00031', 0, 'SNID: 92215939516', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1051, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00032', 0, 'SNID: 82603808316', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1052, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00033', 0, 'SNID: 03302763825', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1053, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00034', 0, 'SNID: 94307451325', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1054, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00035', 0, 'SNID: 82603873716', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1055, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00036', 0, 'SNID: 92215662916', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1056, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00037', 0, 'SNID: 82603906716', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1057, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00038', 0, 'SNID: 03302760452', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1058, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00039', 0, 'SNID: 94307471725', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1059, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00040', 0, 'SNID: 03302767225', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1060, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00041', 0, 'SNID: 03302748925', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1061, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00042', 0, 'SNID: 82603809816', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1062, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00043', 0, 'SNID: 83701438716', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1063, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00044', 0, 'SNID: 03304407125', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1064, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00045', 0, 'SNID: 92215659116', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1065, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00046', 0, 'SNID: 94307477525', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1066, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00047', 0, 'SNID:94307476525', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1067, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00048', 0, 'SNID : 82603802816', 'Laptop eMachines', NULL, 1, 160, 2, NULL, 1, NULL),
  (1068, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00049', 0, 'SNID: 03302749625', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1069, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00050', 0, 'SNID : 82603821816', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1070, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00051', 0, 'SNID: 83701437716', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1071, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00052', 0, 'SNID: 83701425916', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1072, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00053', 0, '-', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1073, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00054', 0, '-', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1074, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00055', 0, 'SNID : 82603853316', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1075, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00056', 0, 'SNID: 94307475825', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1076, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00057', 0, 'SNID: 94307474425', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1077, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00058', 0, 'SNID: 03304411525', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1078, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00059', 0, 'SNID: 03315844625', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1079, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00060', 0, 'SNID: 94307478125', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1080, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00061', 0, 'SNID: 82603712316', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1081, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00062', 0, 'SNID: 94307451925', 'Laptop eMachines', NULL, 1, 160, 2, NULL, 1, NULL),
  (1082, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00063', 0, 'SNID: -03302748825', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1083, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00064', 0, 'SNID: 83701413816', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1084, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00065', 0, '-', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1085, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00066', 0, 'SNID : CNU806373v', 'Laptop HP', NULL, 1, 133, 2, NULL, 1, NULL),
  (1086, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00067', 0, 'SNID: 94307474525', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1087, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00068', 0, 'SNID: 94307448825', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1088, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00069', 0, 'SNID:  01235596316', 'Notebook ASUS Vodafone', NULL, 1, 129, 2, NULL, 1, NULL),
  (1089, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00070', 0, 'SNID:', 'Notebook ASUS Vodafone', NULL, 1, 129, 2, NULL, 1, NULL),
  (1090, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00071', 0, 'SNID:', 'Notebook ASUS Vodafone', NULL, 1, 129, 2, NULL, 1, NULL),
  (1091, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-10-00072', 0, '-', 'Balanta BS3000A', NULL, 3, 134, 2, NULL, 1, NULL),
  (1092, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-10-00073', 0, '-', 'Balanta BS3000A', NULL, 3, 134, 2, NULL, 1, NULL),
  (1093, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-10-00074', 0, '-', 'Balanta BS3000A', NULL, 3, 134, 2, NULL, 1, NULL),
  (1094, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00075', 0, 'SNID: 03302769225', 'Laptop eMachines', NULL, 1, 133, 2, NULL, 1, NULL),
  (1095, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-11-00076', 0, 'Iasi', 'DVD Recorder Samsung', NULL, 3, 135, 2, NULL, 1, NULL),
  (1096, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-12-00077', 0, 'Ser. No. : 50016221', 'Termometru Digital TTX 110', NULL, 3, 136, 2, NULL, 1, NULL),
  (1097, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-12-00078', 0, 'Ser. No. : 50016450', 'Termometru Digital TTX 110', NULL, 3, 136, 2, NULL, 1, NULL),
  (1098, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-12-00079', 0, 'Ser. No. : 50016447', 'Termometru Digital TTX 110', NULL, 3, 136, 2, NULL, 1, NULL),
  (1099, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-6-00080', 0, 'in BUC SEMA', 'Filtru cafea', NULL, 3, 130, 2, NULL, 1, NULL),
  (1100, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-13-00081', 0, '-', 'Fierbator Phillips', NULL, 3, 137, 2, NULL, 1, NULL),
  (1101, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-13-00082', 0, '-', 'Fierbator Phillips', NULL, 3, 137, 2, NULL, 1, NULL),
  (1102, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-13-00083', 0, '-', 'Fierbator Phillips', NULL, 3, 137, 2, NULL, 1, NULL),
  (1103, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-13-00084', 0, '-', 'Fierbator Phillips', NULL, 3, 137, 2, NULL, 1, NULL),
  (1104, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-13-00085', 0, '-', 'Fierbator Phillips', NULL, 3, 137, 2, NULL, 1, NULL),
  (1105, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00086', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1106, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00087', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1107, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00088', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1108, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00089', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1109, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00090', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1110, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00091', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1111, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00092', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1112, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00093', 0, 'MDR-RF800R', 'Casca wireless Sony', NULL, 4, 131, 2, NULL, 1, NULL),
  (1113, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00094', 0, 'SN : 00043-118-301-012', 'Notebook MSI - U135', NULL, 1, 129, 2, NULL, 1, NULL),
  (1114, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00095', 0, 'Alex Isac SN: CZC8270M6K', 'Desktop HP Compaq DX2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1115, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00096', 0, 'Alex Isac SN : 916GU3XY03788', 'Monitor HANNSG 19\'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1116, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00097', 0, 'Vera Voicu SN: CZC8270M2F', 'Desktop HP Compaq DX2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1117, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00098', 0, 'Vera Voicu SN: 901DY3XY01512', 'Monitor HANNS G 19\'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1118, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00099', 0, 'Ioana Druga SN: 26062009-001', 'Kinetix V8l Dual Care E1400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1119, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00100', 0, 'Ioana DrugaSN : 916GU3XY03790', 'Monitor HANNS G 19\'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1120, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00101', 0, 'Adelina Cristea SN: 15042009-001', 'Kinetix', NULL, 1, 138, 2, NULL, 1, NULL),
  (1121, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00102', 0, 'Adelina Cristea SN: 916GU3XY03085', 'Monitor HANNS G 19\'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1122, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00103', 0, 'Cristiana Mercioiu SN: 00144-051-693-426', 'Desktop HP Compaq DX2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1123, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00104', 0, 'Cristiana Mercioiu', '\"BIROU 10213 FILDES			 80 x 140 Prince Int\"', NULL, 2, 128, 2, NULL, 1, NULL),
  (1124, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00105', 0, 'Vera Voicu', '\"BIROU 10213 FILDES			 80 x 140 Prince Int\"', NULL, 2, 128, 2, NULL, 1, NULL),
  (1125, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00106', 0, 'Ioana Druga', '\"BIROU 10213 FILDES			 80 x 140 Prince Int\"', NULL, 2, 128, 2, NULL, 1, NULL),
  (1126, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00107', 0, 'Adelina Cristea', '\"BIROU 10213 FILDES			 80 x 140 Prince Int\"', NULL, 2, 128, 2, NULL, 1, NULL),
  (1127, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00108', 0, 'Alex Isac', '\"BIROU 10213 FILDES			 80 x 140 Prince Int\"', NULL, 2, 128, 2, NULL, 1, NULL),
  (1128, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00109', 0, 'Adrian Bostan', 'Birou Ikea 140 x 65', NULL, 2, 128, 2, NULL, 1, NULL),
  (1129, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00110', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1130, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00111', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1131, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00112', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1132, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00113', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1133, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00114', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1134, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00115', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1135, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00116', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1136, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00117', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1137, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00118', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1138, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00119', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1139, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00120', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1140, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00121', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1141, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00122', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1142, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00123', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1143, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00124', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1144, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00125', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1145, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00126', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1146, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00127', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1147, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00128', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1148, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00129', 0, '-', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1149, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00130', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1150, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00131', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1151, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00132', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1152, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00133', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1153, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00134', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1154, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00135', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1155, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00136', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1156, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00137', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1157, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00138', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1158, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00139', 0, '-', 'Birou IKEA 73x 50 CATI - tip 2', NULL, 2, 128, 2, NULL, 1, NULL),
  (1159, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00140', 0, 'Cristiana Mercioiu', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1160, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00141', 0, 'Vera Voicu', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1161, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00142', 0, 'Ioana Druga', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1162, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00143', 0, 'Adelina Cristea', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1163, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00144', 0, 'Alex Isac', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1164, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-26-00145', 0, 'SEMA', 'DULAP 20014 FILDES', NULL, 2, 150, 2, NULL, 1, NULL),
  (1165, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-26-00146', 0, 'SEMA', 'DULAP 20014 FILDES', NULL, 2, 150, 2, NULL, 1, NULL),
  (1166, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00147', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1167, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00148', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1168, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00149', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1169, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00150', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1170, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00151', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1171, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00152', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1172, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00153', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1173, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00154', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1174, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00155', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1175, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00156', 0, 'SEMA', 'Scaun Negru cu Masuta', NULL, 2, 139, 2, NULL, 1, NULL),
  (1176, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00157', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1177, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00158', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1178, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00159', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1179, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00160', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1180, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00161', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1181, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00162', 0, 'SEMA', 'Scaun Negru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1182, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00163', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1183, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00164', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1184, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00165', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1185, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00166', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1186, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00167', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1187, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00168', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1188, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00169', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1189, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00170', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1190, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00171', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1191, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00172', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1192, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00173', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1193, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00174', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1194, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00175', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1195, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00176', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1196, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00177', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1197, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00178', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1198, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00179', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1199, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00180', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1200, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00181', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1201, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00182', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1202, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00183', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1203, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00184', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1204, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00185', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1205, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00186', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1206, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00187', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1207, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00188', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1208, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00189', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1209, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00190', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1210, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00191', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1211, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00192', 0, 'SEMA', 'Scaun Albastru', NULL, 2, 139, 2, NULL, 1, NULL),
  (1212, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00193', 0, 'Focus SEMA', 'Canapea IKEA Verde', NULL, 2, 140, 2, NULL, 1, NULL),
  (1213, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00194', 0, 'Focus SEMA', 'Canapea IKEA Verde', NULL, 2, 140, 2, NULL, 1, NULL),
  (1214, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00195', 0, 'Focus SEMA', 'Canapea IKEA Rosu', NULL, 2, 140, 2, NULL, 1, NULL),
  (1215, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00197', 0, 'Focus SEMA', 'Fotoliu IKEA Verde', NULL, 2, 141, 2, NULL, 1, NULL),
  (1216, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00198', 0, 'Focus SEMA', 'Fotoliu IKEA Verde', NULL, 2, 141, 2, NULL, 1, NULL),
  (1217, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00199', 0, 'Focus SEMA', 'Fotoliu IKEA Verde', NULL, 2, 141, 2, NULL, 1, NULL),
  (1218, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-18-00200', 0, 'SEMA', 'Chiuveta Bucatariu cu Masa', NULL, 2, 142, 2, NULL, 1, NULL),
  (1219, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00201', 0, 'SEMA', 'Desktop CATI 1', NULL, 1, 138, 2, NULL, 1, NULL),
  (1220, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00202', 0, 'SEMA', 'Desktop CATI 2', NULL, 1, 138, 2, NULL, 1, NULL),
  (1221, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00203', 0, 'SEMA', 'Desktop CATI 3', NULL, 1, 138, 2, NULL, 1, NULL),
  (1222, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00204', 0, 'SEMA', 'Desktop CATI 4', NULL, 1, 138, 2, NULL, 1, NULL),
  (1223, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00205', 0, 'SEMA', 'Desktop CATI 5', NULL, 1, 138, 2, NULL, 1, NULL),
  (1224, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00206', 0, 'SEMA', 'Desktop CATI 6', NULL, 1, 138, 2, NULL, 1, NULL),
  (1225, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00207', 0, 'SEMA', 'Desktop CATI 7', NULL, 1, 138, 2, NULL, 1, NULL),
  (1226, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00208', 0, 'SEMA', 'Desktop CATI 8', NULL, 1, 138, 2, NULL, 1, NULL),
  (1227, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00209', 0, 'SEMA', 'Desktop CATI 9', NULL, 1, 138, 2, NULL, 1, NULL),
  (1228, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00210', 0, 'SEMA', 'Desktop CATI 10', NULL, 1, 138, 2, NULL, 1, NULL),
  (1229, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00211', 0, 'SEMA', 'Desktop CATI 11', NULL, 1, 138, 2, NULL, 1, NULL),
  (1230, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00212', 0, 'SEMA', 'Desktop CATI 12', NULL, 1, 138, 2, NULL, 1, NULL),
  (1231, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00213', 0, 'SEMA', 'Desktop CATI 13', NULL, 1, 138, 2, NULL, 1, NULL),
  (1232, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00214', 0, 'SEMA', 'Desktop CATI 14', NULL, 1, 138, 2, NULL, 1, NULL),
  (1233, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00215', 0, 'SEMA', 'Desktop CATI 15', NULL, 1, 138, 2, NULL, 1, NULL),
  (1234, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00216', 0, 'SEMA', 'Desktop CATI 16', NULL, 1, 138, 2, NULL, 1, NULL),
  (1235, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00217', 0, 'SEMA', 'Desktop CATI 17', NULL, 1, 138, 2, NULL, 1, NULL),
  (1236, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00218', 0, 'SEMA', 'Desktop CATI 18', NULL, 1, 138, 2, NULL, 1, NULL),
  (1237, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00219', 0, 'SEMA', 'Monitor CATI 1', NULL, 1, 132, 2, NULL, 1, NULL),
  (1238, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00220', 0, 'SEMA', 'Monitor CATI 2', NULL, 1, 132, 2, NULL, 1, NULL),
  (1239, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00221', 0, 'SEMA', 'Monitor CATI 3', NULL, 1, 132, 2, NULL, 1, NULL),
  (1240, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00222', 0, 'SEMA', 'Monitor CATI 4', NULL, 1, 132, 2, NULL, 1, NULL),
  (1241, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00223', 0, 'SEMA', 'Monitor CATI 5', NULL, 1, 132, 2, NULL, 1, NULL),
  (1242, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00224', 0, 'SEMA', 'Monitor CATI 6', NULL, 1, 132, 2, NULL, 1, NULL),
  (1243, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00225', 0, 'SEMA', 'Monitor CATI 7', NULL, 1, 132, 2, NULL, 1, NULL),
  (1244, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00226', 0, 'SEMA', 'Monitor CATI 8', NULL, 1, 132, 2, NULL, 1, NULL),
  (1245, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00227', 0, 'SEMA', 'Monitor CATI 9', NULL, 1, 132, 2, NULL, 1, NULL),
  (1246, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00228', 0, 'SEMA', 'Monitor CATI 10', NULL, 1, 132, 2, NULL, 1, NULL),
  (1247, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00229', 0, 'SEMA', 'Monitor CATI 11', NULL, 1, 132, 2, NULL, 1, NULL),
  (1248, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00230', 0, 'SEMA', 'Monitor CATI 12', NULL, 1, 132, 2, NULL, 1, NULL),
  (1249, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00231', 0, 'SEMA', 'Monitor CATI 13', NULL, 1, 132, 2, NULL, 1, NULL),
  (1250, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00232', 0, 'SEMA', 'Monitor CATI 14', NULL, 1, 132, 2, NULL, 1, NULL),
  (1251, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00233', 0, 'SEMA', 'Monitor CATI 15', NULL, 1, 132, 2, NULL, 1, NULL),
  (1252, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00234', 0, 'SEMA', 'Monitor CATI 16', NULL, 1, 132, 2, NULL, 1, NULL),
  (1253, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00235', 0, 'SEMA', 'Monitor CATI 17', NULL, 1, 132, 2, NULL, 1, NULL),
  (1254, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00236', 0, 'SEMA', 'Monitor CATI 18', NULL, 1, 132, 2, NULL, 1, NULL),
  (1255, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00237', 0, 'SEMA', 'Monitor Server', NULL, 1, 132, 2, NULL, 1, NULL),
  (1256, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-11-00238', 0, 'SEMA - Delegatii SN: XQLC66SDQ400697V', 'DVD RecSamsung HR753', NULL, 3, 135, 2, NULL, 1, NULL),
  (1257, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-19-00239', 0, 'SEMA Focus SN: 948G10P8215L1', 'Toshiba Regza 82\'', NULL, 3, 143, 2, NULL, 1, NULL),
  (1258, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-20-00240', 0, 'SN: 286129 SEMA Focus', 'Sony DCR HC51E', NULL, 3, 144, 2, NULL, 1, NULL),
  (1259, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-20-00241', 0, 'Delegatii SEMA SN: ZATZ6V2SB00148X', 'Samsung F30', NULL, 3, 144, 2, NULL, 1, NULL),
  (1260, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-21-00242', 0, 'SEMA SN: HCOJ01776', 'Mixer Yamaha MG102C', NULL, 3, 145, 2, NULL, 1, NULL),
  (1261, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00243', 0, 'Panicos', '0740095678 - BB Z10', NULL, 5, 146, 2, NULL, 1, NULL),
  (1262, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00244', 0, 'Ciprian Zamfirescu+ Blackberry', '0756080000- BBZ10', NULL, 5, 146, 2, NULL, 1, NULL),
  (1263, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00245', 0, 'Alecsandra Fulga+ Blackberry', '0756080001- BBZ10', NULL, 5, 146, 2, NULL, 1, NULL),
  (1264, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00246', 0, 'Corneaciu Iulian', '0756080002 -  BB9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1265, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00247', 0, 'Bostan Adrian', '0756080003- BB Z10', NULL, 5, 146, 2, NULL, 1, NULL),
  (1266, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00248', 0, 'Peptan Cristina', '0756080004- BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1267, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00249', 0, 'Alex Isac', '0756080005', NULL, 5, 146, 2, NULL, 1, NULL),
  (1268, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00250', 0, 'Anghelache Iuliana', '0756080006', NULL, 5, 146, 2, NULL, 1, NULL),
  (1269, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00251', 0, 'Mihaela Alexandru+ Blackberry', '0749220007- BB Z10', NULL, 5, 146, 2, NULL, 1, NULL),
  (1270, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00252', 0, 'Manuela Danila', '0756088070 - BB9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1271, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00253', 0, 'Cluj - Razvan Georgescu', '0756088071', NULL, 5, 146, 2, NULL, 1, NULL),
  (1272, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00254', 0, 'Iasi - Maria Melenciuc', '0756088072', NULL, 5, 146, 2, NULL, 1, NULL),
  (1273, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00255', 0, 'Constanta - Anca Lujan', '0756088073', NULL, 5, 146, 2, NULL, 1, NULL),
  (1274, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00256', 0, 'Mercioiu Cristiana', 'Nokia 2330 - 0756088074', NULL, 5, 146, 2, NULL, 1, NULL),
  (1275, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00257', 0, 'Adelina Cristea', '0756088079', NULL, 5, 146, 2, NULL, 1, NULL),
  (1276, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00258', 0, 'Brasov - Tutui Cristina', '0758086870', NULL, 5, 146, 2, NULL, 1, NULL),
  (1277, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00259', 0, 'Timisoara - Cristea Arthur', '0758086871', NULL, 5, 146, 2, NULL, 1, NULL),
  (1278, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00260', 0, 'Ioana Druga', '0758086872', NULL, 5, 146, 2, NULL, 1, NULL),
  (1279, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00261', 0, 'Deva - Varga Anton Platon', '0758086873', NULL, 5, 146, 2, NULL, 1, NULL),
  (1280, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00262', 0, 'Vera Voicu', '0758086874 - BB9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1281, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00263', 0, 'Alina Cernusca', '0758086875-BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1282, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00264', 0, 'Qualitative - Travel', '0758086876', NULL, 5, 146, 2, NULL, 1, NULL),
  (1283, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00265', 0, 'Qualitative - Research', '0758086877', NULL, 5, 146, 2, NULL, 1, NULL),
  (1284, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00266', 0, 'SEMA', '0758086878', NULL, 5, 146, 2, NULL, 1, NULL),
  (1285, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00267', 0, 'Claudia Marinescu', '0758086879', NULL, 5, 146, 2, NULL, 1, NULL),
  (1286, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00268', 0, 'SEMA', '0758234349', NULL, 5, 146, 2, NULL, 1, NULL),
  (1287, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00269', 0, 'Blackberry Panicos', '0758234348- doar SIM', NULL, 5, 146, 2, NULL, 1, NULL),
  (1288, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00273', 0, 'Bucuresti - Stefania Stancescu SIM: 807200048516', '0756051955', NULL, 5, 147, 2, NULL, 1, NULL),
  (1289, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00274', 0, 'Mihaela Alexandru SIM:  807200048524', '0756051956', NULL, 5, 147, 2, NULL, 1, NULL),
  (1290, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00275', 0, 'Ciprian Zamfirescu SIM:807190018362', '0752088045', NULL, 5, 147, 2, NULL, 1, NULL),
  (1291, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00276', 0, 'Panicos Christopoulos SIM : 809050230970+ VOCE', '0756088075', NULL, 5, 147, 2, NULL, 1, NULL),
  (1292, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00277', 0, 'Timisoara - Cristea Arthur- SIM:809050230988+ VOCE', '0756088076', NULL, 5, 147, 2, NULL, 1, NULL),
  (1293, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00278', 0, 'Cluj - Georgescu Razvan - SIM: 809050230616+ VOCE', '0756088077', NULL, 5, 147, 2, NULL, 1, NULL),
  (1294, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00279', 0, 'Buc - -SIM : 809050231002 + VOCE', '0756088078', NULL, 5, 147, 2, NULL, 1, NULL),
  (1295, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00280', 0, 'Iasi - Maria Melenciuc -SIM:1010140339058J02G16', '0758084776', NULL, 5, 147, 2, NULL, 1, NULL),
  (1296, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00281', 0, 'Craiova- Loredana Popa SIM:903130193397', '0758084778', NULL, 5, 147, 2, NULL, 1, NULL),
  (1297, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00282', 0, 'Deva- VargaAnton SIM:903130193405', '0758084779', NULL, 5, 147, 2, NULL, 1, NULL),
  (1298, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00283', 0, 'Buc - Alina Gifu SIM:', '0758088152', NULL, 5, 147, 2, NULL, 1, NULL),
  (1299, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00284', 0, 'Constanta - Anca Lujan', 'Vodafone 1', NULL, 5, 147, 2, NULL, 1, NULL),
  (1300, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00285', 0, 'Ploiesti - Adi Cirlan', 'Vodafone 2', NULL, 5, 147, 2, NULL, 1, NULL),
  (1301, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00286', 0, 'Iasi - Maria Melenciuc', 'Vodafone 3', NULL, 5, 147, 2, NULL, 1, NULL),
  (1302, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-23-00287', 0, 'Pitesti - 903130193389', '0758084777', NULL, 5, 147, 2, NULL, 1, NULL),
  (1303, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-19-00288', 0, 'Delegatii : T5V0000000 SN:81000145', 'Westwood 19LWC61', NULL, 3, 143, 2, NULL, 1, NULL),
  (1304, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-21-00289', 0, 'Delegatii : HCOZ02207', 'Mixer Yamaha MG82CX', NULL, 3, 145, 2, NULL, 1, NULL),
  (1305, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-24-00290', 0, 'Delegatii SN:5517', 'Microfon Beyer Dynamic SHM203', NULL, 3, 148, 2, NULL, 1, NULL),
  (1306, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-24-00291', 0, 'SEMA', 'Microfon Beyer Dynamic SHM203', NULL, 3, 148, 2, NULL, 1, NULL),
  (1307, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00292', 0, 'Cristiana Mercioiu SN: ETLC108052923084494213', 'Monitor Acer 19\'', NULL, 1, 132, 2, NULL, 1, NULL),
  (1308, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00293', 0, 'SNID: DUMO020895', 'Laptop Fujitsu', NULL, 1, 133, 2, NULL, 1, NULL),
  (1309, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00294', 0, 'SNID: 2CE03400C0', 'Laptop HP ProBook 4520s', NULL, 1, 160, 2, NULL, 1, NULL),
  (1310, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00295', 0, 'SN: CZC827QM90 - Mora Sala mica conferinte', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1311, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00296', 0, 'SN: CZC8270M7W - Receptie', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1312, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00297', 0, 'SN: CZC9265XRW - DP Dana', 'Desktop Hp Compaq dx2420', NULL, 1, 138, 2, NULL, 1, NULL),
  (1313, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00298', 0, 'SN: CZC8260DFL - DP Andrei', 'Desktop Hp Compaq dx 7400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1314, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00299', 0, 'SN: CZC0276RWC - DP Catalin', 'Desktop Hp 500B MT', NULL, 1, 138, 2, NULL, 1, NULL),
  (1315, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00300', 0, 'SN: CZC8270M6V - Qn Alina', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1316, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00301', 0, 'SN: CZC8270M93 - Qn iulia', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1317, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00302', 0, 'SN: CX8270M8S - Claudia', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1318, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00303', 0, 'SN: CZC9507NSX - QL Monica', 'Desktop HP 500BMT', NULL, 1, 138, 2, NULL, 1, NULL),
  (1319, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00304', 0, 'SN: CZC8270M2Y QL Adelina', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1320, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00305', 0, 'SN: CZC8270M72 Ql Iulia A', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1321, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00306', 0, 'SN: CZC82700M7Q - Ql Cristina P', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1322, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00307', 0, 'SN: CZC8270M6N- QL Field', 'Desktop HP Compaq dx2400', NULL, 1, 138, 2, NULL, 1, NULL),
  (1323, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00308', 0, 'QL Field', 'Desktop Kinetix', NULL, 1, 138, 2, NULL, 1, NULL),
  (1324, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00309', 0, 'SN: ETL72680811554427C - Sala Mica Conf', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1325, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00310', 0, 'SN: ETL720818680812 - Receptie', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1326, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00311', 0, 'SN: ETE10D07193404E668502  DP Dana', 'Monitor Acer V173 8', NULL, 1, 132, 2, NULL, 1, NULL),
  (1327, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00312', 0, 'SN: 8JBMC117678 DP Andrei', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1328, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00313', 0, 'SN: 611957-001 DP Catalin', 'Monitor HP S2031a', NULL, 1, 132, 2, NULL, 1, NULL),
  (1329, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00314', 0, 'SN: ETLRODOO60400673C8501 Qn Ciprian', 'Monitor Acer V193HQV', NULL, 1, 132, 2, NULL, 1, NULL),
  (1330, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00315', 0, 'SN: 506250002200R - Qn Alina', 'Monitor Hanns G HSG1033', NULL, 1, 132, 2, NULL, 1, NULL),
  (1331, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00316', 0, 'SN: ETL720818680811567427C - Qn Iulia', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1332, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00317', 0, 'SN: ETL108052923085984213 - Claudia', 'Monitor Acer V193WB', NULL, 1, 132, 2, NULL, 1, NULL),
  (1333, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00318', 0, 'SN: ETL72081868081154F427C - Ql Monica', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1334, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00319', 0, 'SN: ETL720818680811588427C - Ql Adelina', 'Moniror Acer  AL1717F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1335, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00320', 0, 'SN: ETLBNOCO03824018434001 - Ql Iulia A', 'Monitor Acer V173', NULL, 1, 132, 2, NULL, 1, NULL),
  (1336, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00321', 0, 'SN: CNT9464037 - Ql Cristina P', 'Monitor HP Compaq CQ18595', NULL, 1, 132, 2, NULL, 1, NULL),
  (1337, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00322', 0, 'SN: ETLBNOC003824018484001 - QL', 'Monitor Acer V173', NULL, 1, 132, 2, NULL, 1, NULL),
  (1338, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-8-00323', 0, 'SN: ETL7208186880811560427C - QL', 'Monitor Acer AL171F', NULL, 1, 132, 2, NULL, 1, NULL),
  (1339, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00326', 0, 'Manuela D', 'Laptop Acer Aspire 5738', NULL, 1, 133, 2, NULL, 1, NULL),
  (1340, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00327', 0, 'Bogdan Bucur - ex. Amelia P', 'Laptop Acer Aspire 5738', NULL, 1, 133, 2, NULL, 1, NULL),
  (1341, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00328', 0, 'SN: 93811272220 Ql - Laura Golet', 'Laptop Acer Aspire 5738', NULL, 1, 133, 2, NULL, 1, NULL),
  (1342, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00329', 0, 'SN: LXPF80C0129381B8402000 Ql- Andrei Niculae', 'Laptop Acer Aspire 5738', NULL, 1, 133, 2, NULL, 1, NULL),
  (1343, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00330', 0, 'Intel Core i5-430M', 'Notebook Acer Aspire AS5741-434G50Mn', NULL, 1, 160, 2, NULL, 1, NULL),
  (1344, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00331', 0, '-', 'Laptop HP Compaq 67206', NULL, 1, 133, 2, NULL, 1, NULL),
  (1345, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00332', 0, 'Sala Mica Conf', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1346, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00333', 0, 'Receptie', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1347, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00334', 0, 'Sala mica conferinte', 'AC Panasonic', NULL, 3, 152, 2, NULL, 1, NULL),
  (1348, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-29-00335', 0, 'E64234F7F949318', 'Fax Brother 1360', NULL, 3, 153, 2, NULL, 1, NULL),
  (1349, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00336', 0, 'Birou DP', 'AC Akontek', NULL, 3, 152, 2, NULL, 1, NULL),
  (1350, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-19-00337', 0, 'Focus', 'Samsung LE32S62B', NULL, 3, 143, 2, NULL, 1, NULL),
  (1351, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-19-00338', 0, 'Balcon', 'Philips', NULL, 3, 143, 2, NULL, 1, NULL),
  (1352, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00339', 0, 'Focus Mora', 'AC Focus Mora', NULL, 3, 152, 2, NULL, 1, NULL),
  (1353, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00340', 0, 'Viewing Mora', 'AC View', NULL, 3, 152, 2, NULL, 1, NULL),
  (1354, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00341', 0, 'QN Mora', 'AC Akontek', NULL, 3, 152, 2, NULL, 1, NULL),
  (1355, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00342', 0, 'ET 2 Camera Libera', 'AC NorthStar', NULL, 3, 152, 2, NULL, 1, NULL),
  (1356, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00343', 0, 'Et 2 Claudia', 'AC Eschimo', NULL, 3, 152, 2, NULL, 1, NULL),
  (1357, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00344', 0, 'Et2 QL', 'AC Akontek', NULL, 3, 152, 2, NULL, 1, NULL),
  (1358, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-28-00345', 0, 'Et 2 Mansarda', 'AC NorthStar', NULL, 3, 152, 2, NULL, 1, NULL),
  (1359, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00346', 0, 'Panicos', 'Telefon KX ???', NULL, 5, 151, 2, NULL, 1, NULL),
  (1360, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00347', 0, 'DP', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1361, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00348', 0, 'DP', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1362, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00349', 0, 'DP', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1363, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00350', 0, 'Mora Et 1 Ciprian', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1364, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00351', 0, 'Mora Et 1 QN', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1365, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00352', 0, 'Mora Et 1 QN', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1366, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00353', 0, 'Mora Et 1 QN', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1367, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00354', 0, 'Mora Et 1 QN', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1368, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00355', 0, 'Mora Et 2 Claudia', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1369, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00356', 0, 'Mora et 2 QL', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1370, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00357', 0, 'Mora et 2 QL', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1371, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00358', 0, 'Mora et 2 QL', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1372, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00359', 0, 'Mora et 2 QL', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1373, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00360', 0, 'Mora Et 2 - Mansarda', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1374, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-27-00361', 0, 'Mora Et 2 - Mansarda', 'Telefon KX-TS500RMW', NULL, 5, 151, 2, NULL, 1, NULL),
  (1375, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-19-00362', 0, 'Hol QL', 'Neo TF 1901', NULL, 3, 143, 2, NULL, 1, NULL),
  (1376, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-21-00363', 0, 'Mora SN:', 'Mixer Yamaha MG82CX', NULL, 3, 145, 2, NULL, 1, NULL),
  (1377, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-24-00364', 0, 'Mora', 'Microfon Beyer Dynamic SHM203', NULL, 3, 148, 2, NULL, 1, NULL),
  (1378, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-11-00366', 0, 'CNU8063739', 'DVD Recorder Panasonic DMREH57', NULL, 3, 135, 2, NULL, 1, NULL),
  (1379, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00367', 0, 'Mesteacan, Sala mica conf', 'Masa Rotunda', NULL, 2, 154, 2, NULL, 1, NULL),
  (1380, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00368', 0, 'Mesteacan, Sala mica conf', 'Masuta Cafea Ikea Neagra', NULL, 2, 154, 2, NULL, 1, NULL),
  (1381, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-31-00369', 0, 'Sala Mica Conf', 'Cuier gri IKEA 5 Brate', NULL, 2, 155, 2, NULL, 1, NULL),
  (1382, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-32-00370', 0, 'Sala Mica Conf', 'Scaun Fotoliu Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1383, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-32-00371', 0, 'Sala Mica Conf', 'Scaun Fotoliu Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1384, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-32-00372', 0, 'Sala Mica Conf', 'Scaun Fotoliu Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1385, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00373', 0, 'Receptie', 'Birou receptie gri', NULL, 2, 128, 2, NULL, 1, NULL),
  (1386, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00374', 0, 'Receptie', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1387, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00375', 0, 'Receptie', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1388, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00376', 0, 'Receptie', 'Canapea Corporate MOV 2 locuri', NULL, 2, 140, 2, NULL, 1, NULL),
  (1389, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-18-00377', 0, '1.7 m', 'Dulap Plastic Negru - Baie Parter Mora', NULL, 2, 142, 2, NULL, 1, NULL),
  (1390, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00378', 0, 'IKEA', 'Birou cu sertar , maron', NULL, 2, 128, 2, NULL, 1, NULL),
  (1391, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00379', 0, 'Panicos', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1392, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-15-00380', 0, 'Panicos', 'Scaun IKEA, multicolor, floral', NULL, 2, 139, 2, NULL, 1, NULL),
  (1393, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00381', 0, 'Panicos', 'Canapea IKEA Piele, 2.5 locuri', NULL, 2, 140, 2, NULL, 1, NULL),
  (1394, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-18-00382', 0, 'Focus Mora', 'Covor Verde', NULL, 2, 142, 2, NULL, 1, NULL),
  (1395, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00383', 0, 'Panicos', 'Corp depozitare 3 sertare IKEA', NULL, 2, 157, 2, NULL, 1, NULL),
  (1396, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00384', 0, 'Panicos', 'Corp depozitare 2 usi, Wenge, 2 usi, IKEA', NULL, 2, 157, 2, NULL, 1, NULL),
  (1397, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00385', 0, '60 x 90 cm Panicos', 'Whiteboard magnetic', NULL, 4, 131, 2, NULL, 1, NULL),
  (1398, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00386', 0, 'DP', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1399, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00387', 0, 'DP', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1400, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00388', 0, 'DP', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1401, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00389', 0, 'DP', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1402, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00390', 0, 'DP', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1403, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00391', 0, 'DP', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1404, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00392', 0, 'DP', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1405, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00393', 0, 'DP', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1406, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00394', 0, 'DP', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1407, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00395', 0, '60 x 90 cm DP', 'Whiteboard magnetic', NULL, 4, 131, 2, NULL, 1, NULL),
  (1408, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00396', 0, 'server', 'Masuta Cafea Ikea Neagra', NULL, 2, 154, 2, NULL, 1, NULL),
  (1409, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00397', 0, 'Focus', 'Masuta Cafea Ikea Alba', NULL, 2, 154, 2, NULL, 1, NULL),
  (1410, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00398', 0, 'Focus', 'Masuta Cafea Ikea Alba', NULL, 2, 154, 2, NULL, 1, NULL),
  (1411, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00399', 0, 'Focus', 'Masuta Cafea Ikea Alba', NULL, 2, 154, 2, NULL, 1, NULL),
  (1412, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00400', 0, 'Focus Mora', 'Canapea IKEA , gri cu portocaliu', NULL, 2, 140, 2, NULL, 1, NULL),
  (1413, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00401', 0, 'Focus Mora', 'Canapea IKEA , gri cu portocaliu', NULL, 2, 140, 2, NULL, 1, NULL),
  (1414, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-16-00402', 0, 'Focus Mora', 'Canapea IKEA , gri cu portocaliu', NULL, 2, 140, 2, NULL, 1, NULL),
  (1415, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00403', 0, 'Focus Mora', 'Fotoliu IKEA Poang', NULL, 2, 141, 2, NULL, 1, NULL),
  (1416, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00404', 0, 'Focus Mora', 'Corp depozitare rotile, 6 sertare IKEA', NULL, 2, 157, 2, NULL, 1, NULL),
  (1417, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00405', 0, 'Focus Mora', 'Masa LCD 2 rafturi IKEA', NULL, 2, 154, 2, NULL, 1, NULL),
  (1418, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-18-00406', 0, 'Focus Mora', 'Covor Verde', NULL, 2, 142, 2, NULL, 1, NULL),
  (1419, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00407', 0, 'View Mora', 'Masa alba, 1 picior, IKEA', NULL, 2, 154, 2, NULL, 1, NULL),
  (1420, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00408', 0, 'View Mora', 'Masa alba, 1 picior, IKEA', NULL, 2, 154, 2, NULL, 1, NULL),
  (1421, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00409', 0, 'View Mora', 'Masa alba, 1 picior, IKEA', NULL, 2, 154, 2, NULL, 1, NULL),
  (1422, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00411', 0, 'View Mora', 'Fotoliu Mov inchis', NULL, 2, 141, 2, NULL, 1, NULL),
  (1423, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00412', 0, 'View Mora', 'Fotoliu Mov inchis', NULL, 2, 141, 2, NULL, 1, NULL),
  (1424, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00413', 0, 'View Mora', 'Fotoliu Mov inchis', NULL, 2, 141, 2, NULL, 1, NULL),
  (1425, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00414', 0, 'View Mora', 'Fotoliu Mov inchis', NULL, 2, 141, 2, NULL, 1, NULL),
  (1426, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-17-00415', 0, 'View Mora', 'Fotoliu Mov inchis', NULL, 2, 141, 2, NULL, 1, NULL),
  (1427, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00416', 0, 'View Mora', 'Masa fier, verde', NULL, 2, 154, 2, NULL, 1, NULL),
  (1428, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00417', 0, 'View Mora', 'Masuta Cafea Ikea Neagra', NULL, 2, 154, 2, NULL, 1, NULL),
  (1429, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-31-00418', 0, 'View', 'Cuier gri IKEA 5 Brate', NULL, 2, 155, 2, NULL, 1, NULL),
  (1430, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00419', 0, 'Et 1, Mora, Ciprian', 'Masuta Cafea Ikea Neagra', NULL, 2, 154, 2, NULL, 1, NULL),
  (1431, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00420', 0, 'Ciprian', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1432, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00421', 0, 'Mora et 1, Ciprian', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1433, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00422', 0, 'Mora et 1, Ciprian', 'BIROU 10213 FILDES', NULL, 2, 128, 2, NULL, 1, NULL),
  (1434, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00423', 0, 'Mora ET 1 Ciprian', 'ROLLBOX 20000A', NULL, 2, 149, 2, NULL, 1, NULL),
  (1435, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00424', 0, 'Mora ET 1 Ciprian', 'ROLLBOX 20000A', NULL, 2, 149, 2, NULL, 1, NULL),
  (1436, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-35-00425', 0, 'Mora et 1 Ciprian', 'SCAUN HOME CHAIR 60', NULL, 2, 158, 2, NULL, 1, NULL),
  (1437, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-35-00426', 0, 'Mora et 1 Ciprian', 'SCAUN HOME CHAIR 60', NULL, 2, 158, 2, NULL, 1, NULL),
  (1438, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00427', 0, 'Mora Et 1, QN', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1439, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00428', 0, 'Mora Et 1, QN', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1440, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00429', 0, 'Mora Et 1, QN', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1441, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00430', 0, 'Mora Et 1, QN', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1442, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00431', 0, 'Mora Et 1, QN', 'Birou Ikea 140 x 65', NULL, 2, 128, 2, NULL, 1, NULL),
  (1443, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00432', 0, 'Mora Et 1, QN', 'Birou Ikea 140 x 65', NULL, 2, 128, 2, NULL, 1, NULL),
  (1444, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00433', 0, 'Mora Et 1 , QN', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1445, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00434', 0, 'Mora Et 1 , QN', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1446, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00435', 0, 'Mora Et 1 , QN', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1447, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00436', 0, 'Mora Et 1 , QN', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1448, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00437', 0, 'Mora Et 1 , QN', 'Extensie Birou Mare, Semicerc', NULL, 2, 128, 2, NULL, 1, NULL),
  (1449, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-26-00438', 0, 'Mora Et 1, QN', 'DULAP 20014 FILDES', NULL, 2, 150, 2, NULL, 1, NULL),
  (1450, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00439', 0, 'Mora Et1 QN', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1451, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00440', 0, 'Mora Et1 QN', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1452, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00441', 0, 'Mora Et1 QN', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1453, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00442', 0, 'Mora Et1 QN', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1454, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00443', 0, 'Mora Et1 QN', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1455, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-35-00444', 0, 'Mora Et 1, QN', 'SCAUN HOME CHAIR 60', NULL, 2, 158, 2, NULL, 1, NULL),
  (1456, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00445', 0, '60 x 90 cm Mora Et 1, QN', 'Whiteboard magnetic', NULL, 4, 131, 2, NULL, 1, NULL),
  (1457, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00446', 0, 'HOL et 1, Mora', 'Corp depozitare mare - Echip QUAL', NULL, 2, 157, 2, NULL, 1, NULL),
  (1458, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00447', 0, 'HOL et 1 , Mora', 'Corp depozitare cires', NULL, 2, 157, 2, NULL, 1, NULL),
  (1459, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00448', 0, 'Mora, Bucatarie', 'Masa sticla 4 locuri IKEA', NULL, 2, 154, 2, NULL, 1, NULL),
  (1460, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-36-00449', 0, 'Mora, Bucatarie', 'Frigider Vitrina', NULL, 3, 159, 2, NULL, 1, NULL),
  (1461, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00450', 0, 'Mora, Bucatarie', 'Corp depozitare IKEA 5 rafturi', NULL, 2, 157, 2, NULL, 1, NULL),
  (1462, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00451', 0, 'Mora Bucatarie', 'Etajera lemn, 5 rafturi', NULL, 2, 157, 2, NULL, 1, NULL),
  (1463, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00452', 0, 'Mora Et 2, cam libera', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1464, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-26-00453', 0, 'Mora Et 2 Claudia', 'DULAP 20014 FILDES', NULL, 2, 150, 2, NULL, 1, NULL),
  (1465, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00454', 0, 'Mora Et 2, Claudia', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1466, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-35-00455', 0, 'Mora Et 2 Claudia', 'SCAUN negru rotativ', NULL, 2, 158, 2, NULL, 1, NULL),
  (1467, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00456', 0, 'Mora Et 2 , QL', 'Birou Ikea 140 x 65', NULL, 2, 128, 2, NULL, 1, NULL),
  (1468, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00457', 0, 'Mora Et 2 , QL', 'Birou Ikea 140 x 65', NULL, 2, 128, 2, NULL, 1, NULL),
  (1469, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00458', 0, 'Mora Et 2 , QL', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1470, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00459', 0, 'Mora Et 2 , QL', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1471, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00460', 0, 'Mora Et 2 , QL', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1472, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00461', 0, 'Mora Et 2 , QL', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1473, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00462', 0, 'Mora Et 2 , QL', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1474, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00463', 0, 'Mora Et 2 , QL', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1475, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00464', 0, 'Mora Et 2 QL', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1476, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00465', 0, 'Mora Et 2 QL', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1477, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00466', 0, 'Mora Et 2 QL', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1478, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-33-00467', 0, 'Mora Et 2 QL', 'Scaun Rotativ  Corporate MOV', NULL, 2, 156, 2, NULL, 1, NULL),
  (1479, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-34-00468', 0, 'Mora Et 2 QL', 'Corp depozitare IKEA gri, 1 usa sticla', NULL, 2, 157, 2, NULL, 1, NULL),
  (1480, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-31-00469', 0, 'Mora Et 2 QL', 'Cuier gri IKEA 5 Brate', NULL, 2, 155, 2, NULL, 1, NULL),
  (1481, 'admin', '2015-11-29 23:07:31', NULL, NULL, '400-7-00470', 0, '60 x 90 cm Mora Et 2, QL', 'Whiteboard magnetic', NULL, 4, 131, 2, NULL, 1, NULL),
  (1482, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00471', 0, 'Mora, Mansarda', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1483, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00472', 0, 'Mora, Mansarda', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1484, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00473', 0, 'Mora, Mansarda', 'Birou mare, mesteacan', NULL, 2, 128, 2, NULL, 1, NULL),
  (1485, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00474', 0, 'Mora, Mansarda', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1486, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00475', 0, 'Mora, Mansarda', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1487, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00476', 0, 'Mora, Mansarda', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1488, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-25-00477', 0, 'Mora, Mansarda', 'ROLLBOX 20000A FILDES Prince int', NULL, 2, 149, 2, NULL, 1, NULL),
  (1489, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-4-00478', 0, 'Mora, Mansarda', 'Birou IKEA 77x 50 CATI - tip 1', NULL, 2, 128, 2, NULL, 1, NULL),
  (1490, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00479', 0, 'Mora, Mansarda', 'Masuta Cafea Ikea Neagra', NULL, 2, 154, 2, NULL, 1, NULL),
  (1491, 'admin', '2015-11-29 23:07:31', NULL, NULL, '100-30-00480', 0, 'Mora, Mansarda', 'Masuta Cafea Ikea Alba', NULL, 2, 154, 2, NULL, 1, NULL),
  (1492, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00481', 0, '1 - SN:355953041388878, SIM No:101024040101, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1493, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00482', 0, '2 - SN:355953043633677, SIM No:101024040102, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1494, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00483', 0, '3 - SN:355953043633750, SIM No:101024040103, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1495, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00484', 0, '4 - SN:355953043634402, SIM No:101024040104, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1496, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00485', 0, '5 - SN:355953043634428, SIM No:101024040105, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1497, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00486', 0, '6 - SN:355953043635755, SIM No:101024040106, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1498, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00487', 0, '7 - SN:355953043636704, SIM No:101024040107, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1499, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00488', 0, '8 - SN:355953043637470, SIM No:101024040108, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1500, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00489', 0, '9 - SN:355953043637819, SIM No:101024040109, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1501, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00490', 0, '10 - SN:355953043638163, SIM No:101024040110, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1502, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00491', 0, '11 - SN:355953043639005, SIM No:101024040111, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1503, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00492', 0, '12 - SN:355953043639971, SIM No:101024040112, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1504, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00493', 0, '13 - SN:355953043640557, SIM No:101024040113, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1505, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00494', 0, '14 - SN:355953043640706, SIM No:101024040114, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1506, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00495', 0, '15 - SN:355953043641225, SIM No:101024040115, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1507, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00496', 0, '16 - SN:355953043641662, SIM No:101024040116, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1508, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00497', 0, '17 - SN:355953043642165, SIM No:101024040117, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1509, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00498', 0, '18 - SN:355953043642215, SIM No:101024040118, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1510, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00499', 0, '19 - SN:355953043655670, SIM No:101024040119, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1511, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00500', 0, '20 - SN:355953043655688, SIM No:101024040120, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1512, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00501', 0, '21 - SN:355953043655720, SIM No:101024040121, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1513, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00502', 0, '22 - SN:355953043656975, SIM No:101024040122, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1514, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00503', 0, '23 - SN:355953043657031, SIM No:101024040123, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1515, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00504', 0, '24 - SN:355953043657775, SIM No:101024040124, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1516, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00505', 0, '25 - SN:355953043657965, SIM No:101024040125, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1517, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00506', 0, '26 - SN:355953043659144, SIM No:101024040126, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1518, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00507', 0, '27 - SN:355953043659151, SIM No:101024040127, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1519, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00508', 0, '28 - SN:355953043660092, SIM No:101024040128, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1520, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00509', 0, '29 - SN:355953043660944, SIM No:101024040129, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1521, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00510', 0, '30 - SN:355953043660951, SIM No:101024040130, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1522, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00511', 0, '31 - SN:355953043661553, SIM No:101024040131, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1523, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00512', 0, '32 - SN:355953043661611, SIM No:101024040132, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1524, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00513', 0, '33 - SN:355953043661876, SIM No:101024040133, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1525, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00514', 0, '34 - SN:355953043661959, SIM No:101024040134, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1526, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00515', 0, '35 - SN:355953043662007, SIM No:101024040135, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1527, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00516', 0, '36 - SN:355953043662783, SIM No:101024040136, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1528, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00517', 0, '37 - SN:355953043662841, SIM No:101024040137, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1529, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00518', 0, '38 - SN:355953043662932, SIM No:101024040138, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1530, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00519', 0, '39 - SN:355953043662981, SIM No:101024040139, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1531, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00520', 0, '40 - SN:355953043664953, SIM No:101024040140, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1532, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00521', 0, '41 - SN:355953043665067, SIM No:101024040141, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1533, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00522', 0, '42 - SN:355953043665281, SIM No:101024040142, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1534, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00523', 0, '43 - SN:355953043665877, SIM No:101024040143, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1535, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00524', 0, '44 - SN:355953043666347, SIM No:101024040144, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1536, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00525', 0, '45 - SN:355953043668400, SIM No:101024040145, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1537, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00526', 0, '46 - SN:355953043668632, SIM No:101024040146, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1538, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00527', 0, '47 - SN:355953043669580, SIM No:101024040147, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1539, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00528', 0, '48 - SN:355953043670463, SIM No:101024040148, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1540, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00529', 0, '49 - SN:355953043670604, SIM No:101024040149, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1541, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00530', 0, '50 - SN:355953043671255, SIM No:101024040150, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1542, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00531', 0, '51 - SN:355953043671339, SIM No:101024040151, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1543, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00532', 0, '52 - SN:355953043671354, SIM No:101024040152, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1544, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00533', 0, '53 - SN:355953043671362, SIM No:101024040153, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1545, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00534', 0, '54 - SN:355953043671404, SIM No:101024040154, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1546, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00535', 0, '55 - SN:355953043671420, SIM No:101024040155, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1547, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00536', 0, '56 - SN:355953043671446, SIM No:101024040156, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1548, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00537', 0, '57 - SN:355953043671461, SIM No:101024040157, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1549, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00538', 0, '58 - SN:355953043671784, SIM No:101024040158, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1550, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00539', 0, '59 - SN:355953043672626, SIM No:101024040159, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1551, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00540', 0, '60 - SN:355953043672659, SIM No:101024040160, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1552, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00541', 0, '61 - SN:355953043672832, SIM No:101024040161, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1553, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00542', 0, '62 - SN:355953043672857, SIM No:101024040162, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1554, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00543', 0, '63 - SN:355953043672972, SIM No:101024040163, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1555, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00544', 0, '64 - SN:355953043673061, SIM No:101024040164, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1556, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00545', 0, '65 - SN:355953043673624, SIM No:101024040165, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1557, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00546', 0, '66 - SN:355953043677039, SIM No:101024040166, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1558, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00547', 0, '67 - SN:355953043677096, SIM No:101024040167, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1559, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00548', 0, '68 - SN:355953043677211, SIM No:101024040168, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1560, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00549', 0, '69 - SN:355953043677849, SIM No:101024040169, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1561, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00550', 0, '70 - SN:355953043677997, SIM No:101024040170, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1562, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00551', 0, '71 - SN:355953043678003, SIM No:101024040171, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1563, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00552', 0, '72 - SN:355953043678110, SIM No:101024040172, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1564, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00553', 0, '73 - SN:355953043678300, SIM No:101024040173, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1565, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00554', 0, '74 - SN:355953043678359, SIM No:101024040174, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1566, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00555', 0, '75 - SN:355953043678508, SIM No:101024040175, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1567, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00556', 0, '76 - SN:355953043678565, SIM No:101024040176, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1568, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00557', 0, '77 - SN:355953043681114, SIM No:101024040177, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1569, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00558', 0, '78 - SN:355953043682419, SIM No:101024040178, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1570, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00559', 0, '79 - SN:355953043683599, SIM No:101024040179, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1571, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00560', 0, '80 - SN:355953043684043, SIM No:101024040180, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1572, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00561', 0, '81 - SN:355953043684290, SIM No:101024040181, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1573, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00562', 0, '82 - SN:355953043685198, SIM No:101024040182, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1574, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00563', 0, '83 - SN:355953043685404, SIM No:101024040183, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1575, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00564', 0, '84 - SN:355953043685511, SIM No:101024040184, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1576, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00565', 0, '85 - SN:355953043685560, SIM No:101024040185, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1577, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00566', 0, '86 - SN:355953043686766, SIM No:101024040186, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1578, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00567', 0, '87 - SN:355953043686816, SIM No:101024040187, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1579, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00568', 0, '88 - SN:355953043687079, SIM No:101024040188, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1580, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00569', 0, '89 - SN:355953043690107, SIM No:101024040189, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1581, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00570', 0, '90 - SN:355953043690164, SIM No:101024040190, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1582, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00571', 0, '91 - SN:355953043690214, SIM No:101024040191, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1583, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00572', 0, '92 - SN:355953043690859, SIM No:101024040192, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1584, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00573', 0, '93 - SN:355953043691642, SIM No:101024040193, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1585, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00574', 0, '94 - SN:355953043691733, SIM No:101024040194, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1586, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00575', 0, '95 - SN:355953043692137, SIM No:101024040195, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1587, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00576', 0, '96 - SN:355953043692293, SIM No:101024040196, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1588, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00577', 0, '97 - SN:355953043693135, SIM No:101024040197, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1589, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00578', 0, '98 - SN:355953043693150, SIM No:101024040198, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1590, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00579', 0, '99 - SN:355953043693200, SIM No:101024040199, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1591, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00580', 0, '100 - SN:355953043693549, SIM No:101024040200, Min Incluse:10000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1592, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00581', 0, '101 - SN:355953043694356, SIM No:101008009506, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1593, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00582', 0, '102 - SN:355953043694398, SIM No:101008009507, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1594, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00583', 0, '103 - SN:355953043694455, SIM No:101008009508, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1595, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00584', 0, '104 - SN:355953043694505, SIM No:101008009509, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1596, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00585', 0, '105 - SN:355953043694752, SIM No:101008009510, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1597, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00586', 0, '106 - SN:355953043694828, SIM No:101008009511, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1598, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00587', 0, '107 - SN:355953043698290, SIM No:101008009512, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1599, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00588', 0, '108 - SN:355953043698340, SIM No:101008009513, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1600, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00589', 0, '109 - SN:355953043698381, SIM No:101008009514, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1601, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00590', 0, '110 - SN:355953043698571, SIM No:101008009515, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1602, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00591', 0, '111 - SN:355953043700450, SIM No:101008009516, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1603, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00592', 0, '112 - SN:355953043700534, SIM No:101008009517, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1604, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00593', 0, '113 - SN:355953043700617, SIM No:101008009518, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1605, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00594', 0, '114 - SN:355953043700658, SIM No:101008009519, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1606, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00595', 0, '115 - SN:355953043702266, SIM No:101008009520, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1607, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00596', 0, '116 - SN:355953043702423, SIM No:101008009521, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1608, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00597', 0, '117 - SN:355953043702449, SIM No:101008009522, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1609, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00598', 0, '118 - SN:355953043702837, SIM No:101008009523, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1610, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00599', 0, '119 - SN:355953043702894, SIM No:101008009524, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1611, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-38-00600', 0, '120 - SN:355953043702936, SIM No:101008009525, Min Incluse:3000', 'Telefon Nokia 1616', NULL, 5, 161, 2, NULL, 1, NULL),
  (1612, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00601', 0, 'SNID: 04004827716', 'Notebook emachines', NULL, 1, 129, 2, NULL, 1, NULL),
  (1613, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00602', 0, 'SNID: 4004792316', 'Notebook emachines', NULL, 1, 129, 2, NULL, 1, NULL),
  (1614, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00603', 0, 'SNID: 04004846816', 'Notebook emachines', NULL, 1, 129, 2, NULL, 1, NULL),
  (1615, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00604', 0, 'SNID: 04004791716', 'Notebook emachines', NULL, 1, 129, 2, NULL, 1, NULL),
  (1616, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00605', 0, 'SNID: CNU806370R', 'Laptop HP', NULL, 1, 133, 2, NULL, 1, NULL),
  (1617, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00606', 0, 'SNID: 10509628616 Avion', 'Laptop Acer AS5349', NULL, 1, 160, 2, NULL, 1, NULL),
  (1618, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00607', 0, 'CNU 8062BML - ex Iulian Corneaciu', 'Laptop HP', NULL, 1, 133, 2, NULL, 1, NULL),
  (1619, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-39-00608', 0, '-', 'Scanner LIDE110 Canon', NULL, 1, 162, 2, NULL, 1, NULL),
  (1620, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00609', 0, 'ThinkPad EDG 13,3” 1,3GHz 500GB W7P (NUD39RI) SN: SLRLEDZY', 'Laptop LENOVO', NULL, 1, 133, 2, NULL, 1, NULL),
  (1621, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00610', 0, 'Thinkpad Edge E420 (NZ1ALRI) SN: R9HNYBZ', 'Laptop LENOVO', NULL, 1, 160, 2, NULL, 1, NULL),
  (1622, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00611', 0, 'Cristina Peptan', 'Laptop Notebook HP 620 T4500', NULL, 1, 160, 2, NULL, 1, NULL),
  (1623, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00612', 0, '-', 'Dell PP2SL (Laptop Asus Ciprian)', NULL, 1, 133, 2, NULL, 1, NULL),
  (1624, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00613', 0, '-', 'Laptop Asus Alina', NULL, 1, 133, 2, NULL, 1, NULL),
  (1625, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00614', 0, '-', 'Laptop Acer Raluca', NULL, 1, 133, 2, NULL, 1, NULL),
  (1626, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00615', 0, '-', 'Laptop Sony Vaio Panicos', NULL, 1, 160, 2, NULL, 1, NULL),
  (1627, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-14-00616', 0, 'Claudia Marinescu', 'Desktop HP 500 B Micro Tower E5500+Monitor', NULL, 1, 138, 2, NULL, 1, NULL),
  (1628, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-39-00617', 0, '-', 'Proiector BENq', NULL, 1, 162, 2, NULL, 1, NULL),
  (1629, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00618', 0, 'SNID:CNU80780635fy', 'Laptop HP', NULL, 1, 133, 2, NULL, 1, NULL),
  (1630, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00619', 0, 'SNID : 20510829376', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1631, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00620', 0, 'SNID : 20510874876', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1632, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00621', 0, 'SNID : 20510805376', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1633, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00622', 0, 'SNID : 20512580476', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1634, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00623', 0, 'SNID : 20510884976', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1635, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00624', 0, 'SNID : 20510904176', 'Laptop Acer AS5349', NULL, 1, 160, 2, NULL, 1, NULL),
  (1636, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00625', 0, 'SNID : 20510878576', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1637, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-9-00626', 0, 'SNID : 20512581576', 'Laptop Acer AS5349', NULL, 1, 133, 2, NULL, 1, NULL),
  (1638, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-40-00627', 0, 'AllDroSS 120400187', 'Alldro Speed S', NULL, 1, 163, 2, NULL, 1, NULL),
  (1639, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00628', 0, 'SNID : 518111-01R2101957', 'Laptop Fujitsu Lifebook A series AH531', NULL, 1, 160, 2, NULL, 1, NULL),
  (1640, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00629', 0, 'SN : C3OAAS118633 VN : 3289', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1641, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00630', 0, 'SN : C3OAAS118628 VN : 1196', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1642, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00631', 0, 'SN : C30AAS118668 VN : 4784', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1643, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00632', 0, 'SN : C30AAS118690 VN : 8723', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1644, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00633', 0, 'SN : C30AAS118685 VN : 5584', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1645, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00634', 0, 'SN : C30AAS118606 VN : 7088', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1646, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00635', 0, 'SN : C30AAS118641 VN : 4200', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1647, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00636', 0, 'SN : C30AAS118677 VN : 6993', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1648, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00637', 0, 'SN : C30AAS118650 VN : 6250', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1649, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00638', 0, 'SN : C30AAS118675 VN : 1342', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1650, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00639', 0, 'SN : C30AAS118660 VN : 9492', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1651, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00640', 0, 'SN : C30AAS118614 VN : 8051', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1652, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00641', 0, 'SN : C30AAS118651 VN : 7424', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1653, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00642', 0, 'SN : C30AAS118640 VN : 4592', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1654, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00643', 0, 'SN : C30AAS118611 VN : 4032', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1655, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00644', 0, 'SN : C30AAS118674 VN : 0840', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1656, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00645', 0, 'SN : C30AAS118694 VN : 7776', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1657, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00646', 0, 'SN : C30AAS118678 VN : 2142', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1658, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00647', 0, 'SN : C30AAS118645 VN : 8120', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1659, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00648', 0, 'SN : C30AAS118684 VN : 3516', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1660, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00649', 0, 'SN : C30AAS118637 VN : 3334', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1661, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00650', 0, 'SN : C30AAS118662 VN : 6522', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1662, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00651', 0, 'SN : C30AAS118693 VN : 5690', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1663, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00652', 0, 'SN : C30AAS118670 VN : 4318', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1664, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00653', 0, 'SN : C30AAS118649 VN : 6820', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1665, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00654', 0, 'SN : C30AAS118609 VN : 9640', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1666, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00655', 0, 'SN : C30AAS118673 VN : 1886', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1667, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00656', 0, 'SN : C30AAS118647 VN : 4372', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1668, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-5-00657', 0, 'SN : C30AAS118655 VN : 7610', 'Notebook ASUS Eee PC 1025C', NULL, 1, 129, 2, NULL, 1, NULL),
  (1669, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00658', 0, 'Bucur Bogdan - ex Amelia Podariu', '0754035507 - BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1670, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00659', 0, 'Raluca Isac', '0754035506 - BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1671, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00660', 0, 'Simina Popescu', '0755047486  - BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1672, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-22-00661', 0, 'Laura Golet', '0754035508 - BB 9790', NULL, 5, 146, 2, NULL, 1, NULL),
  (1673, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00662', 0, 'mac id: 78542E9505FB', 'Router D-link DWR 116', NULL, 3, 164, 2, NULL, 1, NULL),
  (1674, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00663', 0, 'mac id:  78542E95069F', 'Router D-link DWR 116', NULL, 3, 164, 2, NULL, 1, NULL),
  (1675, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00664', 0, 'QN - Anda Tita', 'Laptop HP + W8', NULL, 1, 160, 2, NULL, 1, NULL),
  (1676, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00666', 0, 'mac ID: E894F6CAC41E - 360r3 - 360r3360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1677, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00667', 0, 'imei: 862570022388895', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1678, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00668', 0, 'imei: 862570022354715', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1679, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00669', 0, 'imei: 862570021784318', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1680, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00670', 0, 'imei: 862570022384571', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1681, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00671', 0, 'imei: 862570022378417', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1682, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00672', 0, 'imei: 862570022352883', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1683, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00673', 0, 'imei: 862570022373483', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1684, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00674', 0, 'imei: 862570021785117', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1685, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00675', 0, 'imei: 862570022384514', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1686, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00676', 0, 'imei: 862570022378896', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1687, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00677', 0, 'imei: 862570021786529', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1688, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00678', 0, 'imei: 862570022355142', 'Orange 3131', NULL, 5, 165, 2, NULL, 1, NULL),
  (1689, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00679', 0, 'mac id: E894F628F3F2 - 360r4 - 360r4360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1690, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00682', 0, 'mac id: E894F628DD2A- 360r7 - 360r7360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1691, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00683', 0, 'mac id: E894F628F3BA- 360r8 - 360r8360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1692, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00684', 0, 'mac id: E894F628F3DA- 360r9 - 360r9360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1693, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00685', 0, 'mac id: E894F628F3A2- 360r10 - 360r10360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1694, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00686', 0, 'mac id: E894F628BF74- 360r11 - 360r11360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1695, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00687', 0, 'mac id: E894F628BB1A- 360r12 - 360r12360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1696, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00688', 0, 'mac id: E894F628BF64- 360r13 - 360r13360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1697, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00689', 0, 'mac id: E894F628F3EC- 360r14 - 360r14360', 'Router TP-Link TL-MR3420', NULL, 3, 164, 2, NULL, 1, NULL),
  (1698, 'admin', '2015-11-29 23:07:31', NULL, NULL, '500-42-00690', 0, 'imei: 865205021042790', 'Air Net 3G+E5220', NULL, 5, 165, 2, NULL, 1, NULL),
  (1699, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00691', 0, 'SNID: 1S59428938CB322610941S59428938CB32261094', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1700, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00692', 0, 'SNID: 1S59428938CB32261170', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1701, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00693', 0, 'SNID: 1S59428938CB32261196', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1702, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00696', 0, 'SNID: 1S59428938CB32261531', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1703, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00697', 0, 'SNID: 1S59428938CB32261536', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1704, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00698', 0, 'SNID: 1S59428938CB32261543', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1705, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00699', 0, 'SNID: 1S59428938CB32261547', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1706, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00700', 0, 'SNID: 1S59428938CB32261550', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1707, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00701', 0, 'SNID: 1S59428938CB32261551', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1708, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00702', 0, 'SNID: 1S59428938CB32261554', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1709, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00703', 0, 'SNID: 1S59428938CB32261559', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1710, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00704', 0, 'SNID: 1S59428938CB32261560', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1711, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00705', 0, 'SNID: 1S59428938CB32261562', 'Laptop Lenovo I3 B5070', NULL, 1, 160, 2, NULL, 1, NULL),
  (1712, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00706', 0, 'SNID: 1S59393712WB15141457', 'Laptop Lenovo I5 3230M', NULL, 1, 160, 2, NULL, 1, NULL),
  (1713, 'admin', '2015-11-29 23:07:31', NULL, NULL, '200-37-00707', 0, 'SNID: 1S59393712WB15141465', 'Laptop Lenovo I5 3230M', NULL, 1, 160, 2, NULL, 1, NULL),
  (1714, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00710', 0, '2c2d', 'Router Orange', NULL, 3, 164, 2, NULL, 1, NULL),
  (1715, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00711', 0, '2c2a', 'Router Orange', NULL, 3, 164, 2, NULL, 1, NULL),
  (1716, 'admin', '2015-11-29 23:07:31', NULL, NULL, '300-41-00712', 0, '2be4', 'Router Orange', NULL, 3, 164, 2, NULL, 1, NULL);
/*!40000 ALTER TABLE `stoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id_task`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`       VARCHAR(150) NOT NULL,
  `creat_la`       DATETIME              DEFAULT NULL,
  `modificat_de`   VARCHAR(150)          DEFAULT NULL,
  `modificat_la`   DATETIME              DEFAULT NULL,
  `cod`            VARCHAR(255) NOT NULL,
  `complet`        INT(11)      NOT NULL,
  `deleted`        INT(11)      NOT NULL,
  `descriere`      VARCHAR(255) NOT NULL,
  `estimare`       BIGINT(20)   NOT NULL,
  `nume`           VARCHAR(255) NOT NULL,
  `ordine`         INT(11)      NOT NULL,
  `id_assignee`    BIGINT(20)            DEFAULT NULL,
  `id_proiect`     BIGINT(20)            DEFAULT NULL,
  `id_status_task` BIGINT(20)            DEFAULT NULL,
  `id_reporter`    BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `FKdmkbt5eiak2vscghal2lpxhgr` (`id_assignee`),
  KEY `FKogshbdkh6sqcmktl0fdyp9r71` (`id_proiect`),
  KEY `FKmdr1m42cj6j4fdxawtt1u2v8s` (`id_status_task`),
  KEY `FKmebpgt8sge8hg0xi4jv7hemni` (`id_reporter`),
  CONSTRAINT `FKdmkbt5eiak2vscghal2lpxhgr` FOREIGN KEY (`id_assignee`) REFERENCES `persoane` (`id_persoana`),
  CONSTRAINT `FKmdr1m42cj6j4fdxawtt1u2v8s` FOREIGN KEY (`id_status_task`) REFERENCES `status_task` (`id_status_task`),
  CONSTRAINT `FKmebpgt8sge8hg0xi4jv7hemni` FOREIGN KEY (`id_reporter`) REFERENCES `persoane` (`id_persoana`),
  CONSTRAINT `FKogshbdkh6sqcmktl0fdyp9r71` FOREIGN KEY (`id_proiect`) REFERENCES `proiect` (`id_proiect`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1, 'bostanc', '2015-11-30 21:58:55', 'bostanc', '2015-12-01 22:26:15', '360I-1', 0, 0, 'descriere', 3, 'Test1', 0, 2, 1, 2, 1),
  (2, 'bostanc', '2015-12-01 21:46:35', NULL, NULL, '360I-2', 0, 0, 'test', 4, 'Test', 0, 2, 1, 1, 1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_do`
--

DROP TABLE IF EXISTS `to_do`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `to_do` (
  `id_to_do`     BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `nume`         VARCHAR(150) NOT NULL,
  `valoare`      VARCHAR(255) NOT NULL,
  `id_user`      BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_to_do`),
  KEY `FK48b17pwgdat3fcjnk29600xxc` (`id_user`),
  CONSTRAINT `FK48b17pwgdat3fcjnk29600xxc` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do`
--

LOCK TABLES `to_do` WRITE;
/*!40000 ALTER TABLE `to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `to_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tranzactie_stoc`
--

DROP TABLE IF EXISTS `tranzactie_stoc`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tranzactie_stoc` (
  `id_tranzactie_stoc`  BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`            VARCHAR(150) NOT NULL,
  `creat_la`            DATETIME              DEFAULT NULL,
  `modificat_de`        VARCHAR(150)          DEFAULT NULL,
  `modificat_la`        DATETIME              DEFAULT NULL,
  `data_tranzactie`     DATETIME     NOT NULL,
  `detalii`             VARCHAR(255) NOT NULL,
  `id_colet`            BIGINT(20)            DEFAULT NULL,
  `id_loc`              BIGINT(20)            DEFAULT NULL,
  `id_resurse_umnane`   BIGINT(20)            DEFAULT NULL,
  `id_stare`            BIGINT(20)            DEFAULT NULL,
  `id_stare_anterioara` BIGINT(20)            DEFAULT NULL,
  `id_stoc`             BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_tranzactie_stoc`),
  KEY `FKdsr1wvbxab347yipcjijhkknk` (`id_colet`),
  KEY `FKfe025uufa33u2j6v6msl3nnkc` (`id_loc`),
  KEY `FKsqj4aw03ems1t6xamkot81jfk` (`id_resurse_umnane`),
  KEY `FKbkc5sfmkkw5cy7pkt5phfj664` (`id_stare`),
  KEY `FKontehp409g9yeiuf49jdov8ie` (`id_stare_anterioara`),
  KEY `FK1f69oxj7yoq6k53bx4r6g3xyc` (`id_stoc`),
  CONSTRAINT `FK1f69oxj7yoq6k53bx4r6g3xyc` FOREIGN KEY (`id_stoc`) REFERENCES `stoc` (`id_stoc`),
  CONSTRAINT `FKbkc5sfmkkw5cy7pkt5phfj664` FOREIGN KEY (`id_stare`) REFERENCES `stare_stoc` (`id_stare`),
  CONSTRAINT `FKdsr1wvbxab347yipcjijhkknk` FOREIGN KEY (`id_colet`) REFERENCES `colet` (`id_colet`),
  CONSTRAINT `FKfe025uufa33u2j6v6msl3nnkc` FOREIGN KEY (`id_loc`) REFERENCES `loc` (`id_loc`),
  CONSTRAINT `FKontehp409g9yeiuf49jdov8ie` FOREIGN KEY (`id_stare_anterioara`) REFERENCES `stare_stoc` (`id_stare`),
  CONSTRAINT `FKsqj4aw03ems1t6xamkot81jfk` FOREIGN KEY (`id_resurse_umnane`) REFERENCES `persoane` (`id_persoana`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1028
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranzactie_stoc`
--

LOCK TABLES `tranzactie_stoc` WRITE;
/*!40000 ALTER TABLE `tranzactie_stoc` DISABLE KEYS */;
INSERT INTO `tranzactie_stoc` VALUES (4, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, NULL),
  (5, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1025),
  (6, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1026),
  (7, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1027),
  (8, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1028),
  (9, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1029),
  (10, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1030),
  (11, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1031),
  (12, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1032),
  (13, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1033),
  (14, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1034),
  (15, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1035),
  (16, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1036),
  (17, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1037),
  (18, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1038),
  (19, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1039),
  (20, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1040),
  (21, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1041),
  (22, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1042),
  (23, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1043),
  (24, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1044),
  (25, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1045),
  (26, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1046),
  (27, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1047),
  (28, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1048),
  (29, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1049),
  (30, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1050),
  (31, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1051),
  (32, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1052),
  (33, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1053),
  (34, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1054),
  (35, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1055),
  (36, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1056),
  (37, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1057),
  (38, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1058),
  (39, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1059),
  (40, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1060),
  (41, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1061),
  (42, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1062),
  (43, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1063),
  (44, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1064),
  (45, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1065),
  (46, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1066),
  (47, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1067),
  (48, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1068),
  (49, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1069),
  (50, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1070),
  (51, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1071),
  (52, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1072),
  (53, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1073),
  (54, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1074),
  (55, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1075),
  (56, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1076),
  (57, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1077),
  (58, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1078),
  (59, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1079),
  (60, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1080),
  (61, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1081),
  (62, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1082),
  (63, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1083),
  (64, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1084),
  (65, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1085),
  (66, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1086),
  (67, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1087),
  (68, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1088),
  (69, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1089),
  (70, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1090),
  (71, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1091),
  (72, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1092),
  (73, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1093),
  (74, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1094),
  (75, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1095),
  (76, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1096),
  (77, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1097),
  (78, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1098),
  (79, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1099),
  (80, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1100),
  (81, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1101),
  (82, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1102),
  (83, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1103),
  (84, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1104),
  (85, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1105),
  (86, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1106),
  (87, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1107),
  (88, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1108),
  (89, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1109),
  (90, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1110),
  (91, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1111),
  (92, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1112),
  (93, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1113),
  (94, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1114),
  (95, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1115),
  (96, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1116),
  (97, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1117),
  (98, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1118),
  (99, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1119),
  (100, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1120),
  (101, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1121),
  (102, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1122),
  (103, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1123),
  (104, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1124),
  (105, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1125),
  (106, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1126),
  (107, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1127),
  (108, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1128),
  (109, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1129),
  (110, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1130),
  (111, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1131),
  (112, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1132),
  (113, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1133),
  (114, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1134),
  (115, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1135),
  (116, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1136),
  (117, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1137),
  (118, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1138),
  (119, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1139),
  (120, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1140),
  (121, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1141),
  (122, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1142),
  (123, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1143),
  (124, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1144),
  (125, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1145),
  (126, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1146),
  (127, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1147),
  (128, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1148),
  (129, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1149),
  (130, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1150),
  (131, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1151),
  (132, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1152),
  (133, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1153),
  (134, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1154),
  (135, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1155),
  (136, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1156),
  (137, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1157),
  (138, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1158),
  (139, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1159),
  (140, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1160),
  (141, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1161),
  (142, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1162),
  (143, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1163),
  (144, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1164),
  (145, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1165),
  (146, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1166),
  (147, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1167),
  (148, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1168),
  (149, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1169),
  (150, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1170),
  (151, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1171),
  (152, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1172),
  (153, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1173),
  (154, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1174),
  (155, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1175),
  (156, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1176),
  (157, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1177),
  (158, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1178),
  (159, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1179),
  (160, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1180),
  (161, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1181),
  (162, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1182),
  (163, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1183),
  (164, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1184),
  (165, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1185),
  (166, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1186),
  (167, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1187),
  (168, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1188),
  (169, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1189),
  (170, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1190),
  (171, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1191),
  (172, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1192),
  (173, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1193),
  (174, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1194),
  (175, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1195),
  (176, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1196),
  (177, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1197),
  (178, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1198),
  (179, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1199),
  (180, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1200),
  (181, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1201),
  (182, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1202),
  (183, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1203),
  (184, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1204),
  (185, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1205),
  (186, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1206),
  (187, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1207),
  (188, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1208),
  (189, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1209),
  (190, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1210),
  (191, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1211),
  (192, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1212),
  (193, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1213),
  (194, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1214),
  (195, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1215),
  (196, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1216),
  (197, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1217),
  (198, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1218),
  (199, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1219),
  (200, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1220),
  (201, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1221),
  (202, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1222),
  (203, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1223),
  (204, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1224),
  (205, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1225),
  (206, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1226),
  (207, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1227),
  (208, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1228),
  (209, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1229),
  (210, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1230),
  (211, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1231),
  (212, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1232),
  (213, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1233),
  (214, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1234),
  (215, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1235),
  (216, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1236),
  (217, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1237),
  (218, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1238),
  (219, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1239),
  (220, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1240),
  (221, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1241),
  (222, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1242),
  (223, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1243),
  (224, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1244),
  (225, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1245),
  (226, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1246),
  (227, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1247),
  (228, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1248),
  (229, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1249),
  (230, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1250),
  (231, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1251),
  (232, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1252),
  (233, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1253),
  (234, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1254),
  (235, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1255),
  (236, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1256),
  (237, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1257),
  (238, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1258),
  (239, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1259),
  (240, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1260),
  (241, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1261),
  (242, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1262),
  (243, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1263),
  (244, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1264),
  (245, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1265),
  (246, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1266),
  (247, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1267),
  (248, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1268),
  (249, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1269),
  (250, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1270),
  (251, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1271),
  (252, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1272),
  (253, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1273),
  (254, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1274),
  (255, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1275),
  (256, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1276),
  (257, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1277),
  (258, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1278),
  (259, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1279),
  (260, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1280),
  (261, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1281),
  (262, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1282),
  (263, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1283),
  (264, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1284),
  (265, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1285),
  (266, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1286),
  (267, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1287),
  (268, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1288),
  (269, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1289),
  (270, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1290),
  (271, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1291),
  (272, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1292),
  (273, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1293),
  (274, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1294),
  (275, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1295),
  (276, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1296),
  (277, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1297),
  (278, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1298),
  (279, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1299),
  (280, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1300),
  (281, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1301),
  (282, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1302),
  (283, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1303),
  (284, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1304),
  (285, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1305),
  (286, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1306),
  (287, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1307),
  (288, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1308),
  (289, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1309),
  (290, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1310),
  (291, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1311),
  (292, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1312),
  (293, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1313),
  (294, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1314),
  (295, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1315),
  (296, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1316),
  (297, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1317),
  (298, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1318),
  (299, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1319),
  (300, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1320),
  (301, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1321),
  (302, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1322),
  (303, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1323),
  (304, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1324),
  (305, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1325),
  (306, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1326),
  (307, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1327),
  (308, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1328),
  (309, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1329),
  (310, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1330),
  (311, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1331),
  (312, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1332),
  (313, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1333),
  (314, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1334),
  (315, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1335),
  (316, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1336),
  (317, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1337),
  (318, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1338),
  (319, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1339),
  (320, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1340),
  (321, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1341),
  (322, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1342),
  (323, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1343),
  (324, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1344),
  (325, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1345),
  (326, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1346),
  (327, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1347),
  (328, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1348),
  (329, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1349),
  (330, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1350),
  (331, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1351),
  (332, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1352),
  (333, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1353),
  (334, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1354),
  (335, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1355),
  (336, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1356),
  (337, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1357),
  (338, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1358),
  (339, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1359),
  (340, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1360),
  (341, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1361),
  (342, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1362),
  (343, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1363),
  (344, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1364),
  (345, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1365),
  (346, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1366),
  (347, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1367),
  (348, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1368),
  (349, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1369),
  (350, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1370),
  (351, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1371),
  (352, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1372),
  (353, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1373),
  (354, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1374),
  (355, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1375),
  (356, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1376),
  (357, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1377),
  (358, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1378),
  (359, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1379),
  (360, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1380),
  (361, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1381),
  (362, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1382),
  (363, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1383),
  (364, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1384),
  (365, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1385),
  (366, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1386),
  (367, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1387),
  (368, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1388),
  (369, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1389),
  (370, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1390),
  (371, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1391),
  (372, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1392),
  (373, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1393),
  (374, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1394),
  (375, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1395),
  (376, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1396),
  (377, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1397),
  (378, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1398),
  (379, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1399),
  (380, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1400),
  (381, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1401),
  (382, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1402),
  (383, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1403),
  (384, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1404),
  (385, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1405),
  (386, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1406),
  (387, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1407),
  (388, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1408),
  (389, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1409),
  (390, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1410),
  (391, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1411),
  (392, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1412),
  (393, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1413),
  (394, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1414),
  (395, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1415),
  (396, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1416),
  (397, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1417),
  (398, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1418),
  (399, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1419),
  (400, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1420),
  (401, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1421),
  (402, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1422),
  (403, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1423),
  (404, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1424),
  (405, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1425),
  (406, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1426),
  (407, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1427),
  (408, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1428),
  (409, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1429),
  (410, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1430),
  (411, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1431),
  (412, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1432),
  (413, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1433),
  (414, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1434),
  (415, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1435),
  (416, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1436),
  (417, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1437),
  (418, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1438),
  (419, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1439),
  (420, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1440),
  (421, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1441),
  (422, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1442),
  (423, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1443),
  (424, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1444),
  (425, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1445),
  (426, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1446),
  (427, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1447),
  (428, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1448),
  (429, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1449),
  (430, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1450),
  (431, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1451),
  (432, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1452),
  (433, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1453),
  (434, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1454),
  (435, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1455),
  (436, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1456),
  (437, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1457),
  (438, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1458),
  (439, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1459),
  (440, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1460),
  (441, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1461),
  (442, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1462),
  (443, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1463),
  (444, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1464),
  (445, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1465),
  (446, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1466),
  (447, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1467),
  (448, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1468),
  (449, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1469),
  (450, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1470),
  (451, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1471),
  (452, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1472),
  (453, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1473),
  (454, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1474),
  (455, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1475),
  (456, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1476),
  (457, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1477),
  (458, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1478),
  (459, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1479),
  (460, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1480),
  (461, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1481),
  (462, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1482),
  (463, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1483),
  (464, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1484),
  (465, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1485),
  (466, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1486),
  (467, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1487),
  (468, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1488),
  (469, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1489),
  (470, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1490),
  (471, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1491),
  (472, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1492),
  (473, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1493),
  (474, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1494),
  (475, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1495),
  (476, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1496),
  (477, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1497),
  (478, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1498),
  (479, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1499),
  (480, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1500),
  (481, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1501),
  (482, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1502),
  (483, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1503),
  (484, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1504),
  (485, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1505),
  (486, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1506),
  (487, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1507),
  (488, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1508),
  (489, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1509),
  (490, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1510),
  (491, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1511),
  (492, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1512),
  (493, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1513),
  (494, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1514),
  (495, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1515),
  (496, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1516),
  (497, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1517),
  (498, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1518),
  (499, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1519),
  (500, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1520),
  (501, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1521),
  (502, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1522),
  (503, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1523),
  (504, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1524),
  (505, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1525),
  (506, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1526),
  (507, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1527),
  (508, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1528),
  (509, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1529),
  (510, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1530),
  (511, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1531),
  (512, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1532),
  (513, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1533),
  (514, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1534),
  (515, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1535),
  (516, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1536),
  (517, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1537),
  (518, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1538),
  (519, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1539),
  (520, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1540),
  (521, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1541),
  (522, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1542),
  (523, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1543),
  (524, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1544),
  (525, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1545),
  (526, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1546),
  (527, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1547),
  (528, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1548),
  (529, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1549),
  (530, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1550),
  (531, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1551),
  (532, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1552),
  (533, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1553),
  (534, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1554),
  (535, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1555),
  (536, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1556),
  (537, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1557),
  (538, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1558),
  (539, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1559),
  (540, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1560),
  (541, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1561),
  (542, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1562),
  (543, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1563),
  (544, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1564),
  (545, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1565),
  (546, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1566),
  (547, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1567),
  (548, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1568),
  (549, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1569),
  (550, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1570),
  (551, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1571),
  (552, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1572),
  (553, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1573),
  (554, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1574),
  (555, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1575),
  (556, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1576),
  (557, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1577),
  (558, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1578),
  (559, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1579),
  (560, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1580),
  (561, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1581),
  (562, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1582),
  (563, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1583),
  (564, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1584),
  (565, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1585),
  (566, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1586),
  (567, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1587),
  (568, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1588),
  (569, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1589),
  (570, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1590),
  (571, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1591),
  (572, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1592),
  (573, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1593),
  (574, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1594),
  (575, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1595),
  (576, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1596),
  (577, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1597),
  (578, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1598),
  (579, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1599),
  (580, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1600),
  (581, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1601),
  (582, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1602),
  (583, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1603),
  (584, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1604),
  (585, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1605),
  (586, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1606),
  (587, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1607),
  (588, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1608),
  (589, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1609),
  (590, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1610),
  (591, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1611),
  (592, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1612),
  (593, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1613),
  (594, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1614),
  (595, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1615),
  (596, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1616),
  (597, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1617),
  (598, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1618),
  (599, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1619),
  (600, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1620),
  (601, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1621),
  (602, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1622),
  (603, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1623),
  (604, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1624),
  (605, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1625),
  (606, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1626),
  (607, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1627),
  (608, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1628),
  (609, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1629),
  (610, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1630),
  (611, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1631),
  (612, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1632),
  (613, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1633),
  (614, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1634),
  (615, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1635),
  (616, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1636),
  (617, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1637),
  (618, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1638),
  (619, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1639),
  (620, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1640),
  (621, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1641),
  (622, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1642),
  (623, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1643),
  (624, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1644),
  (625, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1645),
  (626, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1646),
  (627, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1647),
  (628, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1648),
  (629, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1649),
  (630, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1650),
  (631, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1651),
  (632, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1652),
  (633, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1653),
  (634, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1654),
  (635, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1655),
  (636, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1656),
  (637, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1657),
  (638, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1658),
  (639, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1659),
  (640, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1660),
  (641, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1661),
  (642, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1662),
  (643, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1663),
  (644, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1664),
  (645, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1665),
  (646, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1666),
  (647, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1667),
  (648, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1668),
  (649, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1669),
  (650, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1670),
  (651, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1671),
  (652, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1672),
  (653, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1673),
  (654, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1674),
  (655, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1675),
  (656, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1676),
  (657, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1677),
  (658, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1678),
  (659, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1679),
  (660, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1680),
  (661, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1681),
  (662, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1682),
  (663, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1683),
  (664, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1684),
  (665, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1685),
  (666, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1686),
  (667, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1687),
  (668, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1688),
  (669, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1689),
  (670, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1690),
  (671, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1691),
  (672, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1692),
  (673, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1693),
  (674, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1694),
  (675, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1695),
  (676, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1696),
  (677, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1697),
  (678, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1698),
  (679, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1699),
  (680, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1700),
  (681, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1701),
  (682, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1702),
  (683, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1703),
  (684, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1704),
  (685, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1705),
  (686, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1706),
  (687, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1707),
  (688, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1708),
  (689, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1709),
  (690, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1710),
  (691, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1711),
  (692, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1712),
  (693, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1713),
  (694, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1714),
  (695, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1715),
  (696, 'admin', '2015-12-03 00:02:44', NULL, NULL, '2015-12-03 00:02:48', 'Adaugat', 1, 2, NULL, 1, NULL, 1716);
/*!40000 ALTER TABLE `tranzactie_stoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_m_pontaj`
--

DROP TABLE IF EXISTS `u_m_pontaj`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_m_pontaj` (
  `id_u_m_pontaj` BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`      VARCHAR(150) NOT NULL,
  `creat_la`      DATETIME              DEFAULT NULL,
  `modificat_de`  VARCHAR(150)          DEFAULT NULL,
  `modificat_la`  DATETIME              DEFAULT NULL,
  `nume`          VARCHAR(150) NOT NULL,
  `valoare`       VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id_u_m_pontaj`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_m_pontaj`
--

LOCK TABLES `u_m_pontaj` WRITE;
/*!40000 ALTER TABLE `u_m_pontaj` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_m_pontaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user`          BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`         VARCHAR(150) NOT NULL,
  `creat_la`         DATETIME              DEFAULT NULL,
  `modificat_de`     VARCHAR(150)          DEFAULT NULL,
  `modificat_la`     DATETIME              DEFAULT NULL,
  `enabled`          INT(11)      NOT NULL,
  `last_login`       DATETIME              DEFAULT NULL,
  `last_pass_change` DATETIME              DEFAULT NULL,
  `password`         VARCHAR(255) NOT NULL,
  `username`         VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id_user`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1, 'admin', '2015-11-29 22:00:03', 'bostanc', '2015-12-02 23:33:56', 1, '2015-12-02 23:33:56', NULL, 'admin', 'bostanc'),
  (2, 'admin', '2015-11-29 22:00:35', 'user', '2015-11-30 22:00:00', 1, '2015-11-30 22:00:00', NULL, 'user', 'user'),
  (3, 'admin', '2015-11-29 22:00:03', NULL, NULL, 1, NULL, NULL, '$2a$04$UZxAvOlt0ETxCOXgVIXECugnbZsRtCuAKlHlQnkAFsx5ZR4zslCwO', 'adelina.cristea'),
  (4, 'admin', '2015-11-29 22:00:03', NULL, NULL, 1, NULL, NULL, '$2a$04$LlejlDpH2VrDwQvMneTfGuFHPOYOhsjy/4T4Hxqabg0TXUbcWlX2i', 'adi'),
  (5, 'admin', '2015-11-29 22:00:03', 'alex.isac', '2015-12-03 00:40:13', 1, '2015-12-03 00:40:13', NULL, '$2a$04$dIoLmMLkrG7563aAla77OOgOrGttshTFYDhOqpBScfwawlKsmuN6C',
   'alex.isac'), (6, 'admin', '2015-11-29 22:00:03', NULL, NULL, 1, NULL, NULL, '$2a$04$WNHCz2l6HbTs5kNnUG0Ea.lR.ZiBPabkx48RLgfhmqG3bokpL/OLi', 'bianca.georgescu'),
  (9, 'admin', '2015-11-29 22:00:03', NULL, NULL, 1, NULL, NULL, '$2a$04$p56y2NxADGlgStHBpQPpJu0v4BbQtGFxdpPS9tTgmXdLTCNkT3MnW', 'ioana.druga'),
  (10, 'admin', '2015-11-29 22:00:03', NULL, NULL, 1, NULL, NULL, '$2a$04$7bJamf1h.buafQgb0RX3TuunGqzNi3gcYctWUJbxMi1MUXRnmh9T.', 'silvia.constantin'),
  (11, 'admin', '2015-11-29 22:00:03', 'stefania.stancescu', '2015-12-03 00:43:46', 1, '2015-12-03 00:43:46', NULL, '$2a$04$dIoLmMLkrG7563aAla77OOgOrGttshTFYDhOqpBScfwawlKsmuN6C',
   'stefania.stancescu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id_role`      BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`     VARCHAR(150) NOT NULL,
  `creat_la`     DATETIME              DEFAULT NULL,
  `modificat_de` VARCHAR(150)          DEFAULT NULL,
  `modificat_la` DATETIME              DEFAULT NULL,
  `role`         VARCHAR(150) NOT NULL,
  `username`     VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_role`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1, 'admin', '2015-10-22 21:52:08', NULL, NULL, 'ROLE_ADMIN', 'bostanc'), (2, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_DEV', 'bostanc'),
  (3, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_HR', 'user'), (4, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_TIME', 'user'),
  (5, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'user'), (6, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_REPORTS', 'user'),
  (7, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_FILES', 'user'), (8, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'user'),
  (11, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'adelina.cristea'), (12, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_ADMIN', 'adi'),
  (13, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'alex.isac'), (14, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'bianca.georgescu'),
  (15, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'ioana.druga'), (16, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'silvia.constantin'),
  (17, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_USER', 'stefania.stancescu'), (26, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'adelina.cristea'),
  (28, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'alex.isac'), (29, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'bianca.georgescu'),
  (30, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'ioana.druga'), (31, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'silvia.constantin'),
  (32, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_INVENTAR', 'stefania.stancescu'), (33, 'admin', '2015-10-22 21:52:23', NULL, NULL, 'ROLE_SUPERUSER', 'stefania.stancescu');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_on_projects`
--

DROP TABLE IF EXISTS `users_on_projects`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_on_projects` (
  `id_user_on_project` BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `creat_de`           VARCHAR(150) NOT NULL,
  `creat_la`           DATETIME              DEFAULT NULL,
  `modificat_de`       VARCHAR(150)          DEFAULT NULL,
  `modificat_la`       DATETIME              DEFAULT NULL,
  `id_persoana`        BIGINT(20)            DEFAULT NULL,
  `id_proiect`         BIGINT(20)            DEFAULT NULL,
  PRIMARY KEY (`id_user_on_project`),
  KEY `FKgsfvhh7k4jx9td6k06m324pdy` (`id_persoana`),
  KEY `FKjhy53n351102d4jqvqgkpcrn3` (`id_proiect`),
  CONSTRAINT `FKgsfvhh7k4jx9td6k06m324pdy` FOREIGN KEY (`id_persoana`) REFERENCES `persoane` (`id_persoana`),
  CONSTRAINT `FKjhy53n351102d4jqvqgkpcrn3` FOREIGN KEY (`id_proiect`) REFERENCES `proiect` (`id_proiect`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_on_projects`
--

LOCK TABLES `users_on_projects` WRITE;
/*!40000 ALTER TABLE `users_on_projects` DISABLE KEYS */;
INSERT INTO `users_on_projects` VALUES (5, 'bostanc', '2015-11-30 00:15:45', NULL, NULL, NULL, 1), (6, 'bostanc', '2015-11-30 00:17:53', NULL, NULL, 1, 1);
/*!40000 ALTER TABLE `users_on_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03  1:12:11