-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: attendance
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `PeopleID` bigint(20) NOT NULL,
  `ClassID` bigint(20) NOT NULL,
  `PlaceID` bigint(20) NOT NULL,
  `Date` date NOT NULL,
  `AttTypeID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PeopleID`,`ClassID`,`PlaceID`,`Date`),
  KEY `R_17` (`AttTypeID`),
  KEY `R_23` (`ClassID`,`PlaceID`,`PeopleID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`AttTypeID`) REFERENCES `attendance_type` (`AttTypeID`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`ClassID`, `PlaceID`, `PeopleID`) REFERENCES `enrollment` (`ClassID`, `PlaceID`, `PeopleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_type`
--

DROP TABLE IF EXISTS `attendance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_type` (
  `AttTypeID` bigint(20) NOT NULL,
  PRIMARY KEY (`AttTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_type`
--

LOCK TABLES `attendance_type` WRITE;
/*!40000 ALTER TABLE `attendance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `ClassID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PlaceID` bigint(20) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `BeginTime` time DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassID`,`PlaceID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `R_12` (`PlaceID`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`PlaceID`) REFERENCES `place` (`PlaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,'T1','20:15:00',60),(2,1,'T2','21:15:00',60),(3,1,'T7','17:40:00',100);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_notes`
--

DROP TABLE IF EXISTS `class_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_notes` (
  `NoteID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ClassID` bigint(20) NOT NULL,
  `PlaceID` bigint(20) NOT NULL,
  `Datetime` datetime NOT NULL,
  `NoteDesc` varchar(20) NOT NULL,
  PRIMARY KEY (`NoteID`,`ClassID`,`PlaceID`),
  KEY `R_29` (`ClassID`,`PlaceID`),
  CONSTRAINT `class_notes_ibfk_1` FOREIGN KEY (`ClassID`, `PlaceID`) REFERENCES `class` (`ClassID`, `PlaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_notes`
--

LOCK TABLES `class_notes` WRITE;
/*!40000 ALTER TABLE `class_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_weekday`
--

DROP TABLE IF EXISTS `class_weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_weekday` (
  `ClassID` bigint(20) NOT NULL,
  `PlaceID` bigint(20) NOT NULL,
  `WeekdayID` int(11) NOT NULL,
  PRIMARY KEY (`ClassID`,`PlaceID`,`WeekdayID`),
  KEY `R_26` (`WeekdayID`),
  CONSTRAINT `class_weekday_ibfk_1` FOREIGN KEY (`ClassID`, `PlaceID`) REFERENCES `class` (`ClassID`, `PlaceID`),
  CONSTRAINT `class_weekday_ibfk_2` FOREIGN KEY (`WeekdayID`) REFERENCES `weekday` (`WeekdayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_weekday`
--

LOCK TABLES `class_weekday` WRITE;
/*!40000 ALTER TABLE `class_weekday` DISABLE KEYS */;
INSERT INTO `class_weekday` VALUES (1,1,1),(2,1,1),(1,1,3),(2,1,3),(3,1,5);
/*!40000 ALTER TABLE `class_weekday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryID` varchar(2) NOT NULL,
  `CountryDesc` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AD','Andorra'),('AE','Emir.Árabes Uni'),('AF','Afeganistão'),('AG','Antígua/Barbuda'),('AI','Anguilla'),('AL','Albânia'),('AM','Armênia'),('AN','Antilhas Holan.'),('AO','Angola'),('AQ','Antártica'),('AR','Argentina'),('AS','Samoa Americana'),('AT','Áustria'),('AU','Austrália'),('AW','Aruba'),('AZ','Azerbaijão'),('BA','Bósnia-Herzego.'),('BB','Barbados'),('BD','Bangladesh'),('BE','Bélgica'),('BF','Burkina Fasso'),('BG','Bulgária'),('BH','Barein'),('BI','Burundi'),('BJ','Benin'),('BM','Bermudas'),('BN','Brunei Darussal'),('BO','Bolívia'),('BR','Brasil'),('BS','Bahamas'),('BT','Butão'),('BV','Ilhas Bouvet'),('BW','Botsuana'),('BY','Bielo-Rússia'),('BZ','Belize'),('CA','Canadá'),('CC','Ilhas Cocos'),('CD','Congo'),('CF','Rep.Centro-Afr.'),('CG','Congo'),('CH','Suíça'),('CI','Costa do Marfim'),('CK','Ilhas Cook'),('CL','Chile'),('CM','Camarões'),('CN','China'),('CO','Colômbia'),('CR','Costa Rica'),('CU','Cuba'),('CV','Cabo Verde'),('CX','Ilhas Christmas'),('CY','Chipre'),('CZ','República Checa'),('DE','Alemanha'),('DJ','Djibuti'),('DK','Dinamarca'),('DM','Dominica'),('DO','Rep.Dominicana'),('DZ','Argélia'),('EC','Equador'),('EE','Estônia'),('EG','Egito'),('EH','Sara ocidental'),('ER','Eritreia'),('ES','Espanha'),('ET','Etiópia'),('FI','Finlândia'),('FJ','Fiji'),('FK','Ilhas Malvinas'),('FM','Micronésia'),('FO','Ilhas Faroe'),('FR','França'),('GA','Gabão'),('GB','Reino Unido'),('GD','Granada'),('GE','Geórgia'),('GF','Guiana Francesa'),('GH','Gana'),('GI','Gibraltar'),('GL','Groenlândia'),('GM','Gâmbia'),('GN','Guiné'),('GP','Guadalupe'),('GQ','Guiné Equator.'),('GR','Grécia'),('GS','Ilhas Sandwich'),('GT','Guatemala'),('GU','Guam'),('GW','Guiné-Bissau'),('GY','Guiana'),('HK','Hong Kong'),('HM','Heard/Ilh.McDon'),('HN','Honduras'),('HR','Croácia'),('HT','Haiti'),('HU','Hungria'),('ID','Indonésia'),('IE','Irlanda'),('IL','Israel'),('IN','Índia'),('IO','Terr.Brit.Oc.In'),('IQ','Iraque'),('IR','Irã'),('IS','Islândia'),('IT','Itália'),('JM','Jamaica'),('JO','Jordânia'),('JP','Japão'),('KE','Quênia'),('KG','Quirguízia'),('KH','Camboja'),('KI','Kiribati'),('KM','Ilhas Comores'),('KN','S.Crist.e Nevis'),('KP','Coréia do Norte'),('KR','Coréia do Sul'),('KW','Kuwait'),('KY','Ilhas Cayman'),('KZ','Cazaquistão'),('LA','Laos'),('LB','Líbano'),('LC','St.Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Libéria'),('LS','Lesoto'),('LT','Lituânia'),('LU','Luxemburgo'),('LV','Letônia'),('LY','Líbia'),('MA','Marrocos'),('MC','Mônaco'),('MD','Moldávia'),('MG','Madagascar'),('MH','Ilhas Marshall'),('MK','Macedônia'),('ML','Mali'),('MM','Myanmar'),('MN','Mongólia'),('MO','Macau'),('MP','I.Mariana Norte'),('MQ','Martinica'),('MR','Mauritânia'),('MS','Montserrat'),('MT','Malta'),('MU','Maurício'),('MV','Maldivas'),('MW','Malavi'),('MX','México'),('MY','Malásia'),('MZ','Moçambique'),('NA','Namíbia'),('NC','Nova Caledônia'),('NE','Níger'),('NF','Ilhas Norfolk'),('NG','Nigéria'),('NI','Nicarágua'),('NL','Países Baixos'),('NO','Noruega'),('NP','Nepal'),('NR','Nauru'),('NU','Ilhas Niue'),('NZ','Nova Zelândia'),('OM','Omã'),('PA','Panamá'),('PE','Peru'),('PF','Polinésia Franc'),('PG','Papua Nov.Guiné'),('PH','Filipinas'),('PK','Paquistão'),('PL','Polônia'),('PM','StPier.,Miquel.'),('PN','Ilhas Pitcairn'),('PR','Porto Rico'),('PT','Portugal'),('PW','Palaus'),('PY','Paraguai'),('QA','Catar'),('RE','Reunião'),('RO','Romênia'),('RU','Federação Russa'),('RW','Ruanda'),('SA','Arábia Saudita'),('SB','Ilhas Salomão'),('SC','Seychelles'),('SD','Sudão'),('SE','Suécia'),('SG','Cingapura'),('SH','Santa Helena'),('SI','Eslovênia'),('SJ','Svalbard'),('SK','Eslováquia'),('SL','Serra Leoa'),('SM','San Marino'),('SN','Senegal'),('SO','Somália'),('SR','Suriname'),('ST','S.Tomé e Prínc.'),('SV','El Salvador'),('SY','Síria'),('SZ','Suazilândia'),('TC','I.Turks, Caicos'),('TD','Chade'),('TF','Territ.franc.S'),('TG','Togo'),('TH','Tailândia'),('TJ','Tadjiquistão'),('TK','Ilhas Tokelau'),('TM','Turcomênia'),('TN','Tunísia'),('TO','Tonga'),('TP','Timor Leste'),('TR','Turquia'),('TT','Trinidad,Tobago'),('TV','Tuvalu'),('TW','Taiwan'),('TZ','Tanzânia'),('UA','Ucrânia'),('UG','Uganda'),('UM','Ilh.Minor Outl.'),('US','EUA'),('UY','Uruguai'),('UZ','Uzbequistão'),('VA','Vaticano'),('VC','São Vicente'),('VE','Venezuela'),('VG','I.Virgens Brit.'),('VI','I.Virgens Amer.'),('VN','Vietnã'),('VU','Vanuatu'),('WF','I.Wallis e Fut.'),('WS','Samoa Ocidental'),('YE','Iêmen'),('YT','Mayotte'),('YU','Iugoslávia'),('ZA','África do Sul'),('ZM','Zâmbia'),('ZW','Zimbábue');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `PeopleID` bigint(20) NOT NULL,
  `ClassID` bigint(20) NOT NULL,
  `PlaceID` bigint(20) NOT NULL,
  `EnrTypeID` int(11) DEFAULT NULL,
  `BeginDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`ClassID`,`PlaceID`,`PeopleID`),
  KEY `R_21` (`PeopleID`),
  KEY `enrollment_ibfk_3` (`EnrTypeID`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`PeopleID`) REFERENCES `people` (`PeopleID`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`ClassID`, `PlaceID`) REFERENCES `class` (`ClassID`, `PlaceID`),
  CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`EnrTypeID`) REFERENCES `enrollmenttype` (`EnrTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,1,1,1,'2017-07-17',NULL),(39,1,1,2,'2017-07-19',NULL),(40,1,1,2,'2017-07-19',NULL),(1,2,1,1,'2017-07-17',NULL),(30,2,1,2,'2017-07-18',NULL),(1,3,1,1,'2017-07-17',NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_people
BEFORE INSERT ON enrollment
FOR EACH ROW
begin
if new.PeopleID = 0 then
set new.PeopleID=LAST_INSERT_ID();
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `enrollmenttype`
--

DROP TABLE IF EXISTS `enrollmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollmenttype` (
  `EnrTypeID` int(11) NOT NULL,
  `EnrTypeDesc` varchar(20) NOT NULL,
  PRIMARY KEY (`EnrTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollmenttype`
--

LOCK TABLES `enrollmenttype` WRITE;
/*!40000 ALTER TABLE `enrollmenttype` DISABLE KEYS */;
INSERT INTO `enrollmenttype` VALUES (1,'Professor'),(2,'Aluno');
/*!40000 ALTER TABLE `enrollmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `GenderID` int(11) NOT NULL,
  `GenderDesc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'desconhecido'),(2,'masculino'),(3,'feminino');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `GradeID` bigint(20) NOT NULL,
  `GradeDesc` varchar(20) DEFAULT NULL,
  `TimeRule` int(11) DEFAULT NULL,
  PRIMARY KEY (`GradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'Branca',NULL),(2,'Amarela',NULL),(3,'Laranja',NULL),(4,'Verde',NULL),(5,'Azul',NULL),(6,'Marrom',NULL),(7,'Preta',NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_history`
--

DROP TABLE IF EXISTS `grade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_history` (
  `GrdHistoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PeopleID` bigint(20) NOT NULL,
  `GradeID` bigint(20) DEFAULT NULL,
  `GradeDate` date DEFAULT NULL,
  PRIMARY KEY (`GrdHistoryID`,`PeopleID`),
  KEY `R_19` (`PeopleID`),
  KEY `R_20` (`GradeID`),
  CONSTRAINT `grade_history_ibfk_1` FOREIGN KEY (`PeopleID`) REFERENCES `people` (`PeopleID`),
  CONSTRAINT `grade_history_ibfk_2` FOREIGN KEY (`GradeID`) REFERENCES `grade` (`GradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_history`
--

LOCK TABLES `grade_history` WRITE;
/*!40000 ALTER TABLE `grade_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `how_discovered`
--

DROP TABLE IF EXISTS `how_discovered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `how_discovered` (
  `WhereID` int(11) NOT NULL,
  `WhereDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`WhereID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `how_discovered`
--

LOCK TABLES `how_discovered` WRITE;
/*!40000 ALTER TABLE `how_discovered` DISABLE KEYS */;
INSERT INTO `how_discovered` VALUES (1,'Por um Aluno ou ex-Aluno'),(2,'Por um amigo(a)'),(3,'Pelo site da Federação Sul Americana'),(4,'Mídias Sociais (Facebook e etc)'),(5,'Panfleto'),(6,'Dentro da Academia'),(7,'Outros');
/*!40000 ALTER TABLE `how_discovered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `looking_for`
--

DROP TABLE IF EXISTS `looking_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `looking_for` (
  `LookID` int(11) NOT NULL,
  `LookDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `looking_for`
--

LOCK TABLES `looking_for` WRITE;
/*!40000 ALTER TABLE `looking_for` DISABLE KEYS */;
INSERT INTO `looking_for` VALUES (1,'Me defender, sentir mais seguro'),(2,'Atividade física'),(3,'Outros');
/*!40000 ALTER TABLE `looking_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `PeopleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CountryID` varchar(2) DEFAULT NULL,
  `RegionID` varchar(4) DEFAULT NULL,
  `GradeID` bigint(20) DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `EnrollmentNumber` varchar(20) DEFAULT NULL,
  `GradeDate` date DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Celphone` varchar(20) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address1` varchar(40) DEFAULT NULL,
  `Address2` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `BloodType` varchar(20) DEFAULT NULL,
  `Allergy` varchar(20) DEFAULT NULL,
  `NextGradeExam` date DEFAULT NULL,
  `GenderID` int(11) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `AllergyDesc` varchar(100) DEFAULT NULL,
  `WhereID` int(11) DEFAULT NULL,
  `WhereOther` varchar(45) DEFAULT NULL,
  `LookID` int(11) DEFAULT NULL,
  `LookOther` varchar(45) DEFAULT NULL,
  `Password` varchar(256) DEFAULT NULL,
  `EnrTypeID` int(11) DEFAULT NULL,
  `OAuth` varchar(36) DEFAULT NULL,
  `OAuthDate` datetime DEFAULT NULL,
  `UserAgent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PeopleID`),
  UNIQUE KEY `people_UNIQUE` (`Email`),
  UNIQUE KEY `OAuth_UNIQUE` (`OAuth`),
  KEY `R_18` (`GradeID`),
  KEY `R_27` (`GenderID`),
  KEY `people_ibfk_4` (`RegionID`,`CountryID`),
  KEY `R_31` (`WhereID`),
  KEY `R_33` (`LookID`),
  KEY `people_ibfk_7` (`EnrTypeID`),
  CONSTRAINT `people_ibfk_2` FOREIGN KEY (`GradeID`) REFERENCES `grade` (`GradeID`),
  CONSTRAINT `people_ibfk_3` FOREIGN KEY (`GenderID`) REFERENCES `gender` (`GenderID`),
  CONSTRAINT `people_ibfk_4` FOREIGN KEY (`RegionID`, `CountryID`) REFERENCES `region` (`RegionID`, `CountryID`),
  CONSTRAINT `people_ibfk_5` FOREIGN KEY (`WhereID`) REFERENCES `how_discovered` (`WhereID`),
  CONSTRAINT `people_ibfk_6` FOREIGN KEY (`LookID`) REFERENCES `looking_for` (`LookID`),
  CONSTRAINT `people_ibfk_7` FOREIGN KEY (`EnrTypeID`) REFERENCES `enrollmenttype` (`EnrTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'BR','RJ',7,'Graziani Bastos Orçai','0015472','2015-04-10','graziani.orcai@gmail.com','021981273522',NULL,'Rua Heber de Boscoli, 160','APT 502','20551110','A+','Não',NULL,2,'1984-08-16',NULL,1,NULL,1,NULL,'78CF2CADC69BAE416D9550148DDB297DA9D1C4FA12011F09EE57AF687800212E',1,'5b6b91d0-3362-41f8-9b8a-53dfefe1b2b7','2017-08-03 14:01:44','Dalvik/2.1.0 (Linux; U; Android 7.0; Android SDK built for x86 Build/NYC)'),(30,'BR','RJ',2,'Abel Junior','15437',NULL,'abel.junior@gmail.com','021981273545',NULL,'Rua Heber de Boscoli, 160','APT 502','20551110','A+','Não',NULL,2,'1984-10-16',NULL,1,NULL,1,NULL,'abel123',2,NULL,NULL,NULL),(39,'BR','RJ',2,'Abel Junior','15437',NULL,'abel.junior2@gmail.com','021981273545',NULL,'Rua Heber de Boscoli, 160','APT 502','20551110','A+','Não',NULL,2,'1984-10-16',NULL,1,NULL,1,NULL,'abel123',2,NULL,NULL,NULL),(40,'BR','RJ',1,'Abel Junior','15437',NULL,'abel.junior23@gmail.com','021981273545',NULL,'Rua Heber de Boscoli, 160','APT 502','20551110','A+','Não',NULL,2,'1984-10-16',NULL,1,NULL,1,NULL,'abel123',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_notes`
--

DROP TABLE IF EXISTS `people_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_notes` (
  `NoteID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PeopleID` bigint(20) NOT NULL,
  `NoteDesc` varchar(20) NOT NULL,
  `Datetime` datetime NOT NULL,
  PRIMARY KEY (`NoteID`,`PeopleID`),
  KEY `R_28` (`PeopleID`),
  CONSTRAINT `people_notes_ibfk_1` FOREIGN KEY (`PeopleID`) REFERENCES `people` (`PeopleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_notes`
--

LOCK TABLES `people_notes` WRITE;
/*!40000 ALTER TABLE `people_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `people_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `PlaceID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `CountryID` varchar(2) DEFAULT NULL,
  `RegionID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`PlaceID`),
  KEY `place_ibfk_1` (`RegionID`,`CountryID`),
  CONSTRAINT `place_ibfk_1` FOREIGN KEY (`RegionID`, `CountryID`) REFERENCES `region` (`RegionID`, `CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'Max Forma (Flamengo)','BR','RJ'),(2,'High Pro (Jardim Botânico)','BR','RJ');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `RegionID` varchar(4) NOT NULL,
  `CountryID` varchar(2) NOT NULL,
  `RegionDesc` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`RegionID`,`CountryID`),
  KEY `R_8` (`CountryID`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('0','AR','Capital Federal'),('1','AR','Buenos Aires'),('1','BE','Antuérpia'),('1','BG','Burgas'),('1','CL','I - Iquique'),('1','CZ','Jihocesky'),('1','DE','Schleswig-Holstein'),('1','DK','Copenhaga Cidade'),('1','ES','Álava'),('1','FI','Ahvenanmaa'),('1','FR','Ain'),('1','GR','Aitolia kai Akarnan.'),('1','HR','Bjelovar-Bilogora'),('1','HU','Bacs-Kiskun'),('1','ID','DKI Jakarta Jakarta'),('1','IL','Central'),('1','IN','Andra Pradesh'),('1','JP','Hokkaido'),('1','KR','Cheju-do'),('1','NL','Drenthe'),('1','NO','Østfold Fylke'),('1','PE','Tumbes'),('1','PH','Ilocos'),('1','PL','Biala Podlaska'),('1','RO','Alba'),('1','RU','República Adyguiea'),('1','SE','Blekinge Län'),('1','SI','Ajdovscina'),('1','SK','Bratislava'),('1','TH','Amnat Charoen'),('1','TR','Adana'),('10','AR','San Juan'),('10','CL','X - Puerto Montt'),('10','CN','Pequim'),('10','DE','Sarre'),('10','DK','Roskilde amt'),('10','ES','Cáceres'),('10','FR','Aube'),('10','GR','Evros'),('10','HR','Pozega-Slavonija'),('10','HU','Eger'),('10','ID','Jambi Jambi'),('10','IN','Karnataka'),('10','JP','Gunma-ken'),('10','KR','Kyongsang-bukto'),('10','NL','Utrecht'),('10','NO','Vest-Agder Fylke'),('10','PE','Tacna'),('10','PH','North Mindanao'),('10','PL','Gorzow'),('10','PT','Minho-Lima'),('10','RO','Bucareste'),('10','RU','República Karélia'),('10','SE','Norrbottens Län'),('10','SI','Idrija'),('10','TH','Chon Buri'),('10','TR','Balikesir'),('100','CN','Jiangsu'),('11','AR','San Luis'),('11','CO','BOGOTÁ'),('11','DE','Berlim'),('11','DK','Sønderjylland amt'),('11','ES','Cádiz'),('11','FR','Aude'),('11','GR','Evvoia'),('11','HR','Primorje-Gorski Kot.'),('11','HU','Fejer'),('11','ID','Sumatera Selatan Sou'),('11','IN','Kerala'),('11','JP','Saitama-ken'),('11','KR','Kyongsang-namdo'),('11','NL','Zeeland'),('11','NO','Rogaland Fylke'),('11','PE','Amazonas'),('11','PH','Cntrl Mindanao'),('11','PL','Jelenia Gora'),('11','PT','Cávado'),('11','RO','Buzau'),('11','RU','República Komi'),('11','SE','Skåne Län'),('11','SI','Ilirska Bistrica'),('11','TH','Chumphon'),('11','TR','Bilecik'),('110','CN','Anhui'),('12','AR','Santa Fé'),('12','CL','XII - Punta Arenas'),('12','DE','Brandenburgo'),('12','DK','Storstrøm amt'),('12','ES','Castellón'),('12','FR','Aveyron'),('12','GR','Florina'),('12','HR','Sibenik'),('12','HU','Gyor'),('12','ID','Bengkulu Bengkulu'),('12','IN','Madhya Pradesh'),('12','JP','Chiba-ken'),('12','KR','Pusan-jikhalsi'),('12','NL','Zuid-Holland'),('12','NO','Hordaland Fylke'),('12','PE','Cajamarca'),('12','PH','South Mindanao'),('12','PL','Kalisz'),('12','PT','Ave'),('12','RO','Calarasi'),('12','RU','República Mari'),('12','SE','Stockholms Län'),('12','SI','Izola'),('12','TH','Kalasin'),('12','TR','Bingöl'),('120','CN','Shandong'),('13','AR','Santiago del Estero'),('13','CL','RM - Santiago'),('13','CO','BOLIVAR'),('13','DE','Meclenburgo-Pomerân.'),('13','DK','Vejle amt'),('13','ES','Ciudad Real'),('13','FR','Bouches-du-Rhône'),('13','GR','Fokis'),('13','HR','Sisak-Moslavina'),('13','HU','Gyor-Moson-Sopron'),('13','ID','Lampung Lampung'),('13','IN','Maharashtra'),('13','JP','Tóquio'),('13','KR','Soul-t-ukpyolsi'),('13','PE','San Martín'),('13','PL','Katowice'),('13','PT','Grande Porto'),('13','RO','Caras-Severin'),('13','RU','República Mordóvia'),('13','SE','Södermanlands Län'),('13','SI','Jesenice'),('13','TH','Kamphaeng Phet'),('13','TR','Bitlis'),('130','CN','Zhejiang'),('14','AR','Tucumán'),('14','DE','Saxónia'),('14','DK','Vestsjælland amt'),('14','ES','Córdova'),('14','FR','Calvados'),('14','GR','Fthiotis'),('14','HR','Slavonski'),('14','HU','Hajdu-Bihar'),('14','ID','Kalimantan Selatan S'),('14','IN','Manipur'),('14','JP','Kanagawa-ken'),('14','KR','Taegu-jikhalsi'),('14','NO','Sogn og Fjordane F.'),('14','PE','Huánuco'),('14','PL','Kielce'),('14','PT','Tâmega'),('14','RO','Cluj'),('14','RU','Rep.Iakútia-Sakha'),('14','SE','Uppsala Län'),('14','SI','Kamnik'),('14','TH','Kanchanaburi'),('14','TR','Bolu'),('140','CN','Jiangxi'),('15','CO','BOYACA'),('15','DE','Saxónia Anhalt'),('15','DK','Viborg amt'),('15','ES','La Coruña'),('15','FR','Cantal'),('15','GR','Grevena'),('15','HR','Brod-Posavina'),('15','HU','Heves'),('15','ID','Kalimantan Barat Wes'),('15','IN','Megalaya'),('15','JP','Niigata-ken'),('15','KR','Taejon-jikhalsi'),('15','NO','Møre og Romsdal F.'),('15','PE','Pasco'),('15','PL','Konin'),('15','PT','Entre Douro e Vouga'),('15','RO','Constanta'),('15','RU','Rep.Ossétia do Norte'),('15','SE','Värmlands Län'),('15','SI','Kocevje'),('15','TH','Khon Kaen'),('15','TR','Burdur'),('150','CN','Fujian'),('16','AR','Chaco'),('16','DE','Turíngia'),('16','DK','Grønlands amt'),('16','ES','Cuenca'),('16','FR','Charente'),('16','GR','Ilia'),('16','HR','Split-Dalmatia'),('16','HU','Hodmezovasarhely'),('16','ID','Kalimantan Tengah Ce'),('16','IN','Mizoram'),('16','JP','Toyama-ken'),('16','NO','Sør-Trøndelag Fylke'),('16','PE','Junín'),('16','PL','Koszalin'),('16','PT','Douro'),('16','RO','Covasna'),('16','RU','República Tartastão'),('16','SE','Västerbottens Län'),('16','SI','Koper'),('16','TH','Krabi'),('16','TR','Bursa'),('160','CN','Hunan'),('17','AR','Chubut'),('17','CO','CALDAS'),('17','ES','Gerona'),('17','FR','Charente-Maritime'),('17','GR','Imathia'),('17','HR','Varazdin'),('17','HU','Jasz-Nagykun-Szolnok'),('17','ID','Kalimantan Timur Eas'),('17','IN','Nagaland'),('17','JP','Ishikawa-ken'),('17','NO','Nord-Trøndelag Fylke'),('17','PE','Huancavelica'),('17','PL','Cracóvia'),('17','PT','Alto Trás-os-Montes'),('17','RO','Dimbovita'),('17','RU','República Tuva'),('17','SE','Västernorrlands Län'),('17','SI','Kranj'),('17','TH','Krung Thep'),('17','TR','Canakkale'),('170','CN','Hubei'),('18','AR','Formosa'),('18','CO','CAQUETA'),('18','ES','Granada'),('18','FR','Cher'),('18','GR','Ioannina'),('18','HR','Virovitica-Podravina'),('18','HU','Kaposvar'),('18','ID','Sulawesi Selatan Sou'),('18','IN','Orissa'),('18','JP','Fukui-ken'),('18','NO','Nordland Fylke'),('18','PE','Ayacucho'),('18','PL','Krosno'),('18','RO','Dolj'),('18','RU','República Udmurtia'),('18','SE','Västmanlands Län'),('18','SI','Krsko'),('18','TH','Mahanakhon'),('18','TR','Cankiri'),('180','CN','Henan'),('19','AR','Misiones'),('19','CO','CAUCA'),('19','ES','Guadalajara'),('19','FR','Corrèze'),('19','GR','Iraklion'),('19','HR','Vukovar-Srijem'),('19','HU','Kecskemet'),('19','ID','Sulawesi Tenggara So'),('19','IN','Punjab'),('19','JP','Yamanashi-ken'),('19','NO','Troms Fylke'),('19','PE','Apurimac'),('19','PL','Legnica'),('19','RO','Galati'),('19','RU','República Khakassia'),('19','SE','Västra Götalands Län'),('19','SI','Lenart'),('19','TH','Lampang'),('19','TR','Corum'),('190','CN','Guangdong'),('2','AR','Catamarca'),('2','BE','Brabant'),('2','BG','Grad Sofiya'),('2','CL','II - Antofagasta'),('2','CZ','Jihomoravsky'),('2','DE','Hamburgo'),('2','DK','Århus amt'),('2','ES','Albacete'),('2','FI','Etelä-Suomi'),('2','FR','Aisne'),('2','GR','Akhaia'),('2','HR','Cidade Zagreb'),('2','HU','Baranya'),('2','ID','Jawa Barat West Java'),('2','IL','Haifa'),('2','IN','Arunachal Pradesh'),('2','JP','Aomori-ken'),('2','KR','Cholla-bukto'),('2','NL','Flevoland'),('2','NO','Akershus Fylke'),('2','PE','Piura'),('2','PH','Cagayan Valley'),('2','PL','Bialystok'),('2','RO','Arad'),('2','RU','República Altai'),('2','SE','Dalarnas Län'),('2','SI','Brezice'),('2','SK','Zapadoslovensky'),('2','TH','Ang Thong'),('2','TR','Adiyaman'),('20','AR','Neuquen'),('20','CN','Xangai'),('20','CO','CESAR'),('20','ES','Guipúscoa'),('20','GR','Kardhitsa'),('20','HR','Zadar-Knin'),('20','HU','Komarom-Esztergom'),('20','ID','Sulawesi Tengah Cent'),('20','IN','Rajasthan'),('20','JP','Nagano-ken'),('20','NO','Finnmark Fylke'),('20','PE','Cuzco'),('20','PL','Leszno'),('20','PT','Baixo Vouga'),('20','RO','Gorj'),('20','RU','República Tchetchéna'),('20','SE','Örebro Län'),('20','SI','Lendava'),('20','TH','Lamphun'),('20','TR','Denizli'),('200','CN','Hainan'),('21','AR','La Pampa'),('21','ES','Huelva'),('21','FR','Côte-d-Or'),('21','GR','Kastoria'),('21','HR','Zagreb'),('21','HU','Miskolc'),('21','ID','Sulawesi Utara North'),('21','IN','Sikkim'),('21','JP','Gifu-ken'),('21','PE','Puno'),('21','PL','Lodz'),('21','PT','Baixo Mondego'),('21','RO','Giurgiu'),('21','RU','República Tchuváquia'),('21','SE','Östergötlands Län'),('21','SI','Litija'),('21','TH','Loei'),('21','TR','Diyarbakir'),('210','CN','Guangxi'),('22','AR','Rio Negro'),('22','ES','Huesca'),('22','FR','Côtes-d-Armor'),('22','GR','Kavala'),('22','HU','Nagykanizsa'),('22','ID','Bali Bali'),('22','IN','Tamil Nadu'),('22','JP','Shizuoka-ken'),('22','PE','Loreto'),('22','PL','Lomza'),('22','PT','Pinhal Litoral'),('22','RO','Harghita'),('22','RU','Território Altai'),('22','SI','Ljubljana-Bezigrad'),('22','TH','Lop Buri'),('22','TR','Edirne'),('220','CN','Guizhou'),('23','AR','Santa Cruz'),('23','CO','CORDOBA'),('23','ES','Jaén'),('23','FR','Creuse'),('23','GR','Kefallinia'),('23','HU','Nograd'),('23','ID','Nusa Tenggara Barat'),('23','IN','Tripura'),('23','JP','Aichi-ken'),('23','PE','Ucayali'),('23','PL','Lublin'),('23','PT','Pinhal Interior N.'),('23','RO','Hunedoara'),('23','RU','Território Krasnodar'),('23','SI','Ljubljana-Center'),('23','TH','Mae Hong Son'),('23','TR','Elazig'),('230','CN','Sichuan'),('24','AR','Tierra de Fuego'),('24','ES','Leão'),('24','FR','Dordogne'),('24','GR','Kerkira'),('24','HU','Nyiregyhaza'),('24','ID','Nusa Tenggara Timur'),('24','IN','Uttar Pradesh'),('24','JP','Mie-ken'),('24','PE','Madre de Díos'),('24','PL','Nowy Sacz'),('24','PT','Pinhal Interior Sul'),('24','RO','Ialomita'),('24','RU','Territ.Krasnoiarsk'),('24','SI','Ljubljana-Moste-Polj'),('24','TH','Maha Sarakham'),('24','TR','Erzincan'),('240','CN','Yunnan'),('25','CO','CUNDINAMARCA'),('25','ES','Lérida'),('25','FR','Doubs'),('25','GR','Khalkidhiki'),('25','HU','Pecs'),('25','ID','Maluku Maluku'),('25','IN','Bengal Ocidental'),('25','JP','Shiga-ken'),('25','PL','Olsztyn'),('25','PT','Dão-Lafões'),('25','RO','Iasi'),('25','RU','Territ.Primorye'),('25','SI','Ljubljana-Siska'),('25','TH','Mukdahan'),('25','TR','Erzurum'),('250','CN','Shaanxi'),('26','ES','La Rioja'),('26','FR','Drôme'),('26','GR','Khania'),('26','HU','Pest'),('26','ID','Irian Jaya Irian Jay'),('26','IN','Andaman e Nico.In.'),('26','JP','Kyoto-fu'),('26','PL','Opole'),('26','PT','Serra da Estrela'),('26','RO','Maramures'),('26','RU','Territ.Estavropol'),('26','SI','Ljubljana-Vic-Rudnik'),('26','TH','Nakhon Nayok'),('26','TR','Eskisehir'),('260','CN','Gansu'),('27','CO','CHOCO'),('27','ES','Lugo'),('27','FR','Eure'),('27','GR','Khios'),('27','HU','Somogy'),('27','ID','Timor Timur East Tim'),('27','IN','Chandigarh'),('27','JP','Osaka-fu'),('27','PL','Ostroleka'),('27','PT','Beira Interior Norte'),('27','RO','Mehedinti'),('27','RU','Territ.Khabarovsk'),('27','SI','Ljutomer'),('27','TH','Nakhon Pathom'),('27','TR','Gaziantep'),('270','CN','Ningxia'),('28','ES','Madri'),('28','FR','Eure-et-Loir'),('28','GR','Kikladhes'),('28','HU','Sopron'),('28','IN','Dadra e Nagar Hav.'),('28','JP','Hyogo-ken'),('28','PL','Pila'),('28','PT','Beira Interior Sul'),('28','RO','Mures'),('28','RU','The Amur Area'),('28','SI','Logatec'),('28','TH','Nakhon Phanom'),('28','TR','Giresun'),('280','CN','Qinghai'),('29','ES','Málaga'),('29','FR','Finistère'),('29','GR','Kilkis'),('29','HU','Szabolcs-Szat.-Bereg'),('29','IN','Daman e Diu'),('29','JP','Nara-ken'),('29','PL','Piotrkow'),('29','PT','Cova da Beira'),('29','RO','Neamt'),('29','RU','The Arkhangelsk Area'),('29','SI','Maribor'),('29','TH','Nakhon Ratchasima'),('29','TR','Gümüshane'),('290','CN','Xinjiang'),('2A','FR','Corse-du-Sud'),('2B','FR','Corse-du-Nord'),('3','AR','Córdova'),('3','BE','Hainaut'),('3','BG','Khaskovo'),('3','CL','III - Copiapo'),('3','CZ','Praga'),('3','DE','Baixa-Saxónia'),('3','DK','Bornholm amt'),('3','ES','Alicante'),('3','FI','Itä-Suomi'),('3','FR','Allier'),('3','GR','Argolis'),('3','HR','Dubrovnik-Neretva'),('3','HU','Bekes'),('3','ID','Jawa Tengah Central'),('3','IL','Jerusalém'),('3','IN','Assam'),('3','JP','Iwate-ken'),('3','KR','Cholla-namdo'),('3','NL','Friesland'),('3','NO','Oslo'),('3','PE','Lambayeque'),('3','PH','Central Luzon'),('3','PL','Bielsko Biala'),('3','RO','Arges'),('3','RU','Rep.Bachkurtustão'),('3','SE','Gotlands Län'),('3','SI','Celje'),('3','SK','Stredoslovensky'),('3','TH','Buriram'),('3','TR','Afyon'),('30','CN','Tianjin'),('30','ES','Murcia'),('30','FR','Gard'),('30','GR','Corinto'),('30','HU','Szeged'),('30','IN','Delhi'),('30','JP','Wakayama-ken'),('30','PL','Plock'),('30','PT','Oeste'),('30','RO','Olt'),('30','RU','The Astrakhan Area'),('30','SI','Metlika'),('30','TH','Nakhon Sawan'),('30','TR','Hakkari'),('300','CN','Xizang'),('31','ES','Navarra'),('31','FR','Garona (Alta)'),('31','GR','Kozani'),('31','HU','Szekesfehervar'),('31','IN','Lakshadweep'),('31','JP','Tottori-ken'),('31','PL','Poznan'),('31','PT','Grande Lisboa'),('31','RO','Prahova'),('31','RU','The Belgorod Area'),('31','SI','Mozirje'),('31','TH','Nakhon Si Thammarat'),('31','TR','Hatay'),('310','CN','Taiwan'),('32','ES','Orense'),('32','FR','Gers'),('32','GR','Lakonia'),('32','HU','Szolnok'),('32','IN','Pondicherry'),('32','JP','Shimane-ken'),('32','PL','Przemysl'),('32','PT','Península de Setúbal'),('32','RO','Salaj'),('32','RU','The Bryansk Area'),('32','SI','Murska Sobota'),('32','TH','Nan'),('32','TR','Isparta'),('33','ES','Astúrias'),('33','FR','Gironda'),('33','GR','Larisa'),('33','HU','Szombathely'),('33','JP','Okayama-ken'),('33','PL','Radom'),('33','PT','Médio Tejo'),('33','RO','Satu Mare'),('33','RU','The Vladimir Area'),('33','SI','Nova Gorica'),('33','TH','Narathiwat'),('33','TR','Icel'),('34','ES','Palência'),('34','FR','Hérault'),('34','GR','Lasithi'),('34','HU','Tatabanya'),('34','JP','Hiroshima-ken'),('34','PL','Rzeszow'),('34','PT','Lezíria do Tejo'),('34','RO','Sibiu'),('34','RU','The Volgograd Area'),('34','SI','Novo Mesto'),('34','TH','Nong Bua Lamphu'),('34','TR','Istambul'),('35','ES','Las Palmas'),('35','FR','Ille-et-Vilaine'),('35','GR','Lesvos'),('35','HU','Tolna'),('35','JP','Yamaguchi-ken'),('35','PL','Siedlce'),('35','RO','Suceava'),('35','RU','The Vologda Area'),('35','SI','Ormoz'),('35','TH','Nong Khai'),('35','TR','Izmir'),('36','ES','Pontevedra'),('36','FR','Indre'),('36','GR','Levkas'),('36','HU','Vas'),('36','JP','Tokushima-ken'),('36','PL','Sieradz'),('36','RO','Teleorman'),('36','RU','The Voronezh Area'),('36','SI','Pesnica'),('36','TH','Nonthaburi'),('36','TR','Kars'),('37','ES','Salamanca'),('37','FR','Indre-et-Loire'),('37','GR','Magnisia'),('37','HU','Veszprem'),('37','JP','Kagawa-ken'),('37','PL','Skierniewice'),('37','RO','Timis'),('37','RU','The Ivanovo Area'),('37','SI','Piran'),('37','TH','Pathum Thani'),('37','TR','Kastamonu'),('38','ES','Sta.Cruz de Tenerife'),('38','FR','Isère'),('38','GR','Messinia'),('38','HU','Zala'),('38','JP','Ehime-ken'),('38','PL','Slupsk'),('38','RO','Tulcea'),('38','RU','The Irkutsk Area'),('38','SI','Postojna'),('38','TH','Pattani'),('38','TR','Kayseri'),('39','ES','Cantábria'),('39','FR','Direito'),('39','GR','Pella'),('39','HU','Zalaegerszeg'),('39','JP','Kochi-ken'),('39','PL','Suwalki'),('39','RO','Vaslui'),('39','RU','The Kaliningrad Area'),('39','SI','Ptuj'),('39','TH','Phangnga'),('39','TR','Kirklareli'),('4','AR','Corrientes'),('4','BE','Liège'),('4','BG','Lovech'),('4','CL','IV - La Serena'),('4','CZ','Severocesky'),('4','DE','Bremen'),('4','DK','Frederiksborg amt'),('4','ES','Almería'),('4','FI','Lapónia'),('4','FR','Alpes (Alta Proven.)'),('4','GR','Arkadhia'),('4','HR','Istra'),('4','HU','Bekescsaba'),('4','ID','Jawa Timur East Java'),('4','IL','Do Norte'),('4','IN','Bihar'),('4','JP','Miyagi-ken'),('4','KR','Ch-ungch-ong-bukto'),('4','NL','Gelderland'),('4','NO','Hedmark Fylke'),('4','PE','La Libertad'),('4','PH','South Luzon'),('4','PL','Bydgoszcz'),('4','RO','Bacau'),('4','RU','República Buriátia'),('4','SE','Gävleborgs Län'),('4','SI','Cerknica'),('4','SK','Vychodoslovensky'),('4','TH','Chachoengsao'),('4','TR','Agri'),('40','CN','Nei Mongol'),('40','ES','Segóvia'),('40','FR','Landes'),('40','GR','Pieria'),('40','JP','Fukuoka-ken'),('40','PL','Szczecin'),('40','PT','Alentejo Litoral'),('40','RO','Vilcea'),('40','RU','The Kaluga Area'),('40','SI','Radlje Ob Dravi'),('40','TH','Phatthalung'),('40','TR','Kirshehir'),('41','CO','HUILA'),('41','ES','Sevilha'),('41','FR','Loir-et-Cher'),('41','GR','Piraievs'),('41','JP','Saga-ken'),('41','PL','Tarnobrzeg'),('41','PT','Alto Alentejo'),('41','RO','Vrancea'),('41','RU','The Kamchatka Area'),('41','SI','Radovljica'),('41','TH','Phayao'),('41','TR','Kocaeli'),('42','ES','Sória'),('42','FR','Loire'),('42','GR','Preveza'),('42','JP','Nagasaki-ken'),('42','PL','Tarnow'),('42','PT','Alentejo Central'),('42','RU','The Kemerovo Area'),('42','SI','Ravne Na Koroskem'),('42','TH','Phetchabun'),('42','TR','Konya'),('43','ES','Tarragona'),('43','FR','Loire (Alto)'),('43','GR','Rethimni'),('43','JP','Kumamoto-ken'),('43','PL','Torun'),('43','PT','Baixo Alentejo'),('43','RU','The Kirov Area'),('43','SI','Ribnica'),('43','TH','Phetchaburi'),('43','TR','Kütahya'),('44','CO','LA GUAJIRA'),('44','ES','Teruel'),('44','FR','Loire Atlântico'),('44','GR','Rodhopi'),('44','JP','Oita-ken'),('44','PL','Walbrzych'),('44','RU','The Kostroma Area'),('44','SI','Ruse'),('44','TH','Phichit'),('44','TR','Malatya'),('45','ES','Toledo'),('45','FR','Loiret'),('45','GR','Samos'),('45','JP','Miyazaki-ken'),('45','PL','Warszawa'),('45','RU','The Kurgan Area'),('45','SI','Sentjur Pri Celju'),('45','TH','Phitsanulok'),('45','TR','Manisa'),('46','ES','Valência'),('46','FR','Lote'),('46','GR','Serrai'),('46','JP','Kagoshima-ken'),('46','PL','Wloclawek'),('46','RU','The Kursk Area'),('46','SI','Sevnica'),('46','TH','Phra Nakhon Si Ayut.'),('46','TR','K.Marash'),('47','CO','MAGDALENA'),('47','ES','Valhadolid'),('47','FR','Lot e Garona'),('47','GR','Thesprotia'),('47','JP','Okinawa-ken'),('47','PL','Wroclaw'),('47','RU','The Leningrad Area'),('47','SI','Sezana'),('47','TH','Phrae'),('47','TR','Mardin'),('48','ES','Biscaia'),('48','FR','Lozère'),('48','GR','Salônica'),('48','PL','Zamosc'),('48','RU','The Lipetsk Area'),('48','SI','Skofja Loka'),('48','TH','Phuket'),('48','TR','Mugla'),('49','ES','Zamora'),('49','FR','Maine-et-Loire'),('49','GR','Trikala'),('49','PL','Zielona Gora'),('49','RU','The Magadan Area'),('49','SI','Slovenj Gradec'),('49','TH','Prachin Buri'),('49','TR','Mush'),('5','AR','Entre Rios'),('5','BE','Limburgo'),('5','BG','Montana'),('5','CL','V - Valparaiso'),('5','CO','ANTIOQUIA'),('5','CZ','Severomoravsky'),('5','DE','Renânia Norte Vestf.'),('5','DK','Fyn amt'),('5','ES','Ávila'),('5','FI','Länsi-Suomi'),('5','FR','Alpes (Altos)'),('5','GR','Arta'),('5','HR','Karlovac'),('5','HU','Borsod-Abauj-Zemplen'),('5','ID','DI Yogyakarta Yogyak'),('5','IL','Do Sul'),('5','IN','Goa'),('5','JP','Akita-ken'),('5','KR','Ch-ungch-ong-namdo'),('5','NL','Groningen'),('5','NO','Oppland Fylke'),('5','PE','Ancash'),('5','PH','Bicol'),('5','PL','Chelm'),('5','RO','Bihor'),('5','RU','República Daguestão'),('5','SE','Hallands Län'),('5','SI','Crnomelj'),('5','TH','Chai Nat'),('5','TR','Amasya'),('50','CN','Shanxi'),('50','CO','META'),('50','ES','Saragoça'),('50','FR','Mancha'),('50','GR','Voiotia'),('50','PT','Algarve'),('50','RU','The Moscow Area'),('50','SI','Slovenska Bistrica'),('50','TR','Nevshehir'),('51','FR','Marne'),('51','GR','Xanthi'),('51','RU','The Murmansk Area'),('51','SI','Slovenske Konjice'),('51','TR','Nigde'),('52','CO','NARIÑO'),('52','FR','Marne (Alto)'),('52','GR','Zakinthos'),('52','RU','The Nizhniy Novgorod'),('52','SI','Smarje Pri Jelsah'),('52','TR','Ordu'),('53','FR','Mayenne'),('53','RU','The Novgorod Area'),('53','SI','Tolmin'),('53','TR','Rize'),('54','CO','NORTE SANTANDER'),('54','FR','Meurthe-et-Moselle'),('54','RU','The Novosibirsk Area'),('54','SI','Trbovlje'),('54','TR','Sakarya'),('55','FR','Meuse'),('55','RU','The Omsk Area'),('55','SI','Trebnje'),('55','TR','Samsun'),('56','FR','Morbihan'),('56','RU','The Orenburg Area'),('56','SI','Trzic'),('56','TR','Siirt'),('57','FR','Moselle'),('57','RU','The Oryol Area'),('57','SI','Velenje'),('57','TR','Sinop'),('58','FR','Nièvre'),('58','RU','The Penza Area'),('58','SI','Vrhnika'),('58','TR','Sivas'),('59','FR','Norte'),('59','RU','The Perm Area'),('59','SI','Zagorje Ob Savi'),('59','TR','Tekirdag'),('6','AR','Jujuy'),('6','BE','Luxemburgo'),('6','BG','Plovdiv'),('6','CL','VI - Rancagua'),('6','CZ','Stredocesky'),('6','DE','Hesse'),('6','DK','København amt'),('6','ES','Badajoz'),('6','FI','Oulu'),('6','FR','Alpes Marítimos'),('6','GR','Attiki'),('6','HR','Koprivnica-Krizevci'),('6','HU','Budapeste'),('6','ID','DI Aceh Aceh'),('6','IL','Tel Aviv'),('6','IN','Gujarat'),('6','JP','Yamagata-ken'),('6','KR','Inch-on-jikhalsi'),('6','NL','Limburgo'),('6','NO','Buskerud Fylke'),('6','PE','Lima y Callao'),('6','PH','West Visayas'),('6','PL','Ciechanow'),('6','RO','Bistrita-Nasaud'),('6','RU','República Ingúchia'),('6','SE','Jämtlands Län'),('6','SI','Dravograd'),('6','TH','Chaiyaphum'),('6','TR','Ancara'),('60','CN','Hebei'),('60','FR','Oise'),('60','PT','Reg.Autón.dos Açores'),('60','RU','The Pskov Area'),('60','SI','Zalec'),('60','TR','Tokat'),('61','FR','Orne'),('61','RU','The Rostov Area'),('61','TR','Trabzon'),('62','FR','Pas-de-Calais'),('62','RU','The Ryazan Area'),('62','TR','Tunceli'),('63','CO','QUINDIO'),('63','FR','Puy-de-Dôme'),('63','RU','The Samara Area'),('63','TR','Shanliurfa'),('64','FR','Pirinéus Atlânticos'),('64','RU','The Saratov Area'),('64','TR','Ushak'),('65','FR','Pirinéus (Altos)'),('65','RU','The Sakhalin Area'),('65','TR','Van'),('66','CO','RISARALDA'),('66','FR','Pirinéus Orientais'),('66','RU','The Sverdlovsk Area'),('66','TR','Yozgat'),('67','FR','Reno (Baixo)'),('67','RU','The Smolensk Area'),('67','TR','Zonguldak'),('68','CO','SANTANDER'),('68','FR','Reno (Alto)'),('68','RU','The Tambov Area'),('68','TR','Aksaray'),('69','FR','Ródano'),('69','RU','The Tver Area'),('69','TR','Bayburt'),('7','AR','Mendoza'),('7','BE','Namur'),('7','BG','Ruse'),('7','CL','VII - Talca'),('7','CZ','Vychodocesky'),('7','DE','Renânia Palatinado'),('7','DK','Nordjylland amt'),('7','ES','Baleares'),('7','FR','Ardeche'),('7','GR','Dhodhekanisos'),('7','HR','Lika-Senj'),('7','HU','Csongrad'),('7','ID','Sumatera Utara North'),('7','IN','Haryana'),('7','JP','Fukushima-ken'),('7','KR','Kangwon-do'),('7','NL','Brabant Norte'),('7','NO','Vestfold Fylke'),('7','PE','Ica'),('7','PH','Cntrl Visayas'),('7','PL','Czestochowa'),('7','RO','Botosani'),('7','RU','Rep.Kabardino-Balkar'),('7','SE','Jönköpings Län'),('7','SI','Gornja Radgona'),('7','TH','Chanthaburi'),('7','TR','Antalya'),('70','CN','Liaoning'),('70','CO','SUCRE'),('70','FR','Saône (Haute)'),('70','PT','Reg.Autón.da Madeira'),('70','RU','The Tomsk Area'),('70','TR','Karaman'),('71','FR','Saône-et-Loire'),('71','RU','The Tula Area'),('71','TR','Kirikkale'),('72','FR','Sarthe'),('72','RU','The Tyumen Area'),('72','TR','Batman'),('73','CO','TOLIMA'),('73','FR','Sabóia'),('73','RU','The Ulyanovsk Area'),('73','TR','Shirnak'),('74','FR','Sabóia (Alta)'),('74','RU','The Chelyabinsk Area'),('74','TR','Bartin'),('75','FR','Paris'),('75','RU','The Chita Area'),('75','TR','Ardahan'),('76','CO','VALLE'),('76','FR','Seine-Maritime'),('76','RU','The Yaroslavl Area'),('76','TR','Igdir'),('77','FR','Seine-et-Marne'),('77','RU','cidade Moscovo'),('77','TR','Yalova'),('78','FR','Yvelines'),('78','RU','c.São-Petersburgo'),('79','FR','Sèvres (Deux)'),('79','RU','Reg.Autónoma Judaica'),('8','AR','La Rioja'),('8','BE','Oost-Vlaanderen'),('8','BG','Sófia'),('8','CL','VIII - Concepción'),('8','CO','ATLÂNTICO'),('8','CZ','Zapadocesky'),('8','DE','Baden-Wuerttemberg'),('8','DK','Ribe amt'),('8','ES','Barcelona'),('8','FR','Ardenas'),('8','GR','Dhrama'),('8','HR','Medimurje'),('8','HU','Debrecen'),('8','ID','Sumatera Barat West'),('8','IN','Himachal Pradesh'),('8','JP','Ibaragi-ken'),('8','KR','Kwangju-jikhalsi'),('8','NL','Holanda Norte'),('8','NO','Telemark Fylke'),('8','PE','Arequipa'),('8','PH','East Visayas'),('8','PL','Elblag'),('8','RO','Braila'),('8','RU','República Kalmáquia'),('8','SE','Kalmar Län'),('8','SI','Grosuplje'),('8','TH','Chiang Mai'),('8','TR','Artvin'),('80','CN','Jilin'),('80','FR','Somme'),('80','RU','RA.Aguinski-Buriat'),('81','CO','ARAUCA'),('81','FR','Tarn'),('81','RU','RA.Komi-Permiat'),('82','FR','Tarn e Garona'),('82','RU','Reg.Autónoma Koriak'),('83','FR','Var.'),('83','RU','Reg.Autónoma Nenets'),('84','FR','Vaucluse'),('84','RU','Reg.Autónoma Taimyr'),('85','CO','CASANARE'),('85','FR','Vendeia'),('85','RU','RA.Ust Ordinskibur.'),('86','CO','PUTUMAYO'),('86','FR','Vienne'),('86','RU','RA.Kanti-Mans'),('87','FR','Vienne (Haute)'),('87','RU','Reg.Autónom.Tchukots'),('88','CO','SAN ANDRES'),('88','FR','Vosges'),('88','RU','Distr.Autón.Evensky'),('89','FR','Yonne'),('89','RU','RA.Iamalo-Nenets'),('9','AR','Salta'),('9','BE','West-Vlaanderen'),('9','BG','Varna'),('9','CL','IX - Temuco'),('9','DE','Baviera'),('9','DK','Ringkøbing amt'),('9','ES','Burgos'),('9','FR','Ariège'),('9','GR','Evritania'),('9','HR','Osijek-Baranja'),('9','HU','Dunaujvaros'),('9','ID','Riau Riau'),('9','IN','Jammu e Cachemira'),('9','JP','Tochigi-ken'),('9','KR','Kyonggi-do'),('9','NL','Overijssel'),('9','NO','Aust-Agder Fylke'),('9','PE','Moquegua'),('9','PH','West Mindanao'),('9','PL','Gdansk'),('9','RO','Brasov'),('9','RU','Rep.Karatch.-Tcherk.'),('9','SE','Kronobergs Län'),('9','SI','Hrastnik Lasko'),('9','TH','Chiang Rai'),('9','TR','Aydin'),('90','CN','Heilongjiang'),('90','FR','Territ.de Belfort'),('91','CO','AMAZONAS'),('91','FR','Essonne'),('92','FR','Hauts-de-Seine'),('93','FR','Seine-Saint-Denis'),('94','CO','GUAINIA'),('94','FR','Val-de-Marne'),('95','CO','GUAVIARE'),('95','FR','Val-d-Oise'),('97','CO','VAUPES'),('97','FR','D.O.M.-T.O.M.'),('971','FR','Guadalupe'),('972','FR','Martinica'),('973','FR','Guiana Francesa'),('974','FR','Reunião'),('975','FR','Saint-Pierre-et-Miq.'),('976','FR','Wallis-et-Futuna'),('99','CO','VICHADA'),('99','FR','Hors-France'),('AB','CA','Alberta'),('AC','BR','Acre'),('ACT','AU','Terr.capital austr.'),('AG','CH','Argóvia'),('AG','IT','Agrigento'),('AGS','MX','Aguascalientes'),('AI','CH','Inner-Rhoden'),('AK','US','Alasca'),('AKL','NZ','Auckland'),('AL','BR','Alagoas'),('AL','IT','Alexandria'),('AL','US','Alabama'),('AM','BR','Amazonas'),('AM','GB','Armagh'),('AMA','VE','Amazonas'),('AN','IT','Ancona'),('ANZ','VE','Anzoategui'),('AO','IT','Aosta'),('AP','BR','Amapá'),('AP','IT','Ascoli Piceno'),('APU','VE','Apure'),('AQ','IT','Áquila'),('AR','CH','Ausser-Rhoden'),('AR','GB','Ards'),('AR','IT','Arécio'),('AR','US','Arkansas'),('ARA','VE','Aragua'),('AS','US','Samoa Americana'),('AT','GB','Antrim'),('AT','IT','Asti'),('AV','IT','Avelino'),('AZ','US','Arizona'),('B','AT','Burgenland'),('BA','BR','Bahia'),('BA','GB','Ballymena'),('BA','IT','Bari'),('BAR','VE','Barinas'),('BB','GB','Blackburn'),('BC','CA','Colúmbia Britânica'),('BC','MX','Baixa Califórnia'),('BCS','MX','Baixa Califórnia S'),('BE','CH','Berna'),('BE','GB','Bedfordshire'),('BF','GB','Bracknell Forest'),('BG','IT','Bérgamo'),('BH','GB','Brighton & Hove'),('BI','IT','Biela'),('BK','GB','Berkshire'),('BL','CH','Basileia Cantão'),('BL','GB','Belfast'),('BL','IT','Beluno'),('BM','GB','Bournemouth'),('BN','GB','Banbridge'),('BN','IT','Benevento'),('BO','GB','Borders'),('BO','IT','Bolonha'),('BOL','VE','Bolívar'),('BOP','NZ','Bay of Plenty'),('BP','GB','Blackpool'),('BR','GB','Bristol'),('BR','IT','Brindisi'),('BS','CH','Basileia Cidade'),('BS','GB','Bath&NthEstSomerset'),('BS','IT','Brescia'),('BU','GB','Buckinghamshire'),('BY','GB','Ballymoney'),('BZ','IT','Bolzano'),('CA','GB','Cambridgeshire'),('CA','IT','Cagliari'),('CA','US','Califórnia'),('CAN','NZ','Cantuária'),('CAR','VE','Carabobo'),('CB','IT','Campobasso'),('CE','BR','Ceará'),('CE','GB','Central'),('CE','IT','Caserta'),('CG','GB','Craigavon'),('CH','GB','Cheshire'),('CH','IT','Chieti'),('CHG','UA','Chernigivs-ka'),('CHI','MX','Chihuahua'),('CHR','UA','Cherkas-ka'),('CHS','MX','Chiapas'),('CHV','UA','Chernovits-ka'),('CI','GB','Coleraine'),('CK','GB','Cookstown'),('CK','IE','Cork'),('CL','GB','Clwyd'),('CL','IE','Clare'),('CL','IT','Caltanissetta'),('CMP','MX','Campeche'),('CN','IT','Cuneo'),('CO','GB','Cornwall'),('CO','IT','Como'),('CO','US','Colorado'),('COA','MX','Coahuila'),('COJ','VE','Cojedes'),('COL','MX','Colima'),('CR','GB','Carrickfergus'),('CR','IT','Cremona'),('CS','GB','Castlereagh'),('CS','IT','Cosenza'),('CT','IT','Catânia'),('CT','US','Connecticut'),('CU','GB','Cumbria'),('CV','GB','Cleveland'),('CV','IE','Cavan'),('CW','IE','Carlow'),('CZ','IT','Catanzaro'),('DA','VE','Delta Amacuro'),('DB','GB','Derbyshire'),('DB','IE','Dublin'),('DC','US','Colúmbia'),('DE','US','Delaware'),('DF','BR','Brasília'),('DF','GB','Dumfries a.Galloway'),('DF','MX','Distrito Federal'),('DF','VE','Distrito Federal'),('DG','GB','Dungannon'),('DG','IE','Donegal'),('DGO','MX','Durango'),('DL','GB','Darlington'),('DN','GB','Down'),('DNP','UA','Dnipropetrovs-ka'),('DO','GB','Dorset'),('DON','UA','Donets-ka'),('DU','GB','Durham'),('DV','GB','Devon'),('DY','GB','Dyfed'),('EC','ZA','Eastern Cape'),('EN','IT','Ena'),('ER','GB','East Riding'),('ES','BR','Espírito San'),('ES','GB','Essex'),('FAL','VE','Falcon'),('FE','IT','Ferrara'),('FG','IT','Foggia'),('FI','GB','Fife'),('FI','IT','Florença'),('FJN','TW','Fu-chien'),('FL','US','Flórida'),('FM','GB','Fermanagh'),('FO','IT','Forli'),('FR','CH','Friburgo'),('FR','IT','Frosinone'),('FS','ZA','Freestate'),('GA','US','Geórgia'),('GE','CH','Genébra'),('GE','IT','Génova'),('GL','CH','Glaris'),('GL','GB','Gloucestershire'),('GM','GB','Greater Manchester'),('GO','BR','Goiás'),('GO','IT','Gorízia'),('GP','ZA','Gauteng'),('GR','CH','Grisões'),('GR','GB','Grampian'),('GR','IT','Grosseto'),('GRO','MX','Guerrero'),('GS','GB','Sth.Gloucestershire'),('GTO','MX','Guanajuato'),('GU','US','Guam'),('GUA','VE','Guarico'),('GW','GB','Gwent'),('GW','IE','Galway'),('GY','GB','Gwynedd'),('HA','GB','Hampshire'),('HAB','NZ','Hawke-s Bay'),('HAR','UA','Harkivs-ka'),('HGO','MX','Hidalgo'),('HI','GB','Highland'),('HI','US','Havai'),('HK','HK','Hong Kong Island'),('HL','GB','Halton'),('HML','UA','Hmel-nits-ka'),('HR','GB','Hartlepool'),('HRS','UA','Hersons-ka'),('HT','GB','Hertfordshire'),('HW','GB','Herefd. and Worcest.'),('IA','US','Iowa'),('ID','US','Idaho'),('IL','US','Ilinóis'),('IM','IT','Impéria'),('IN','US','Indiana'),('IS','IT','Isérnia'),('IVF','UA','Ivano-Frankivs-ka'),('IW','GB','Isle of Wight'),('JAL','MX','Jalisco'),('JOH','MY','Johor'),('JU','CH','Direito'),('K','AT','Caríntia'),('KD','IE','Kildare'),('KE','GB','Kent'),('KED','MY','Kedah'),('KEL','MY','Kelantan'),('KH','GB','Kingston-upon-Hull'),('KIE','UA','Kievs-ka'),('KIR','UA','Kirovograds-ka'),('KK','IE','Kilkenny'),('KLN','HK','Kowloon'),('KR','IT','Crotona'),('KRM','UA','Respublika Krim'),('KS','US','Kansas'),('KSH','TW','Kao-hsiung'),('KUL','MY','Kuala Lumpur'),('KY','IE','Kerry'),('KY','US','Kentucky'),('KZN','ZA','Kwazulu/Natal'),('LA','GB','Lancashire'),('LA','US','Luisiana'),('LAB','MY','Labuan'),('LAR','VE','Lara'),('LC','GB','Leicester City'),('LC','IT','Lecco'),('LD','GB','Londonderry'),('LE','GB','Leicestershire'),('LE','IT','Lecce'),('LF','IE','Longford'),('LI','GB','Lincolnshire'),('LI','IE','Limerick'),('LI','IT','Liorne'),('LM','GB','Limavady'),('LM','IE','Leitrim'),('LO','GB','Greater London'),('LO','IT','Lodi'),('LR','GB','Larne'),('LS','GB','Lisburn'),('LS','IE','Laois'),('LT','GB','Lothian'),('LT','IE','Louth'),('LT','IT','Latina'),('LU','CH','Lucerna'),('LU','GB','Luton'),('LU','IT','Lucca'),('LUG','UA','Lugans-ka'),('L_V','UA','L-vivsbka'),('MA','BR','Maranhão'),('MA','GB','Magherafelt'),('MA','US','Massachusetts'),('MAN','NZ','Manawatu-Wanganui'),('MB','CA','Manitoba'),('MC','IT','Macerata'),('MCH','MX','Michoacán'),('MD','US','Maryland'),('ME','IT','Messina'),('ME','US','Maine'),('MEL','MY','Melaka'),('MER','VE','Merida'),('MEX','MX','Estado de México'),('MG','BR','Minas Gerais'),('MG','GB','Mid Glamorgan'),('MH','IE','Monaghan'),('MI','GB','Middlesborough'),('MI','IT','Milão'),('MI','US','Michigão'),('MIK','UA','Mikolaivs-ka'),('MIR','VE','Miranda'),('MK','GB','Milton Keynes'),('MN','IT','Mantova'),('MN','US','Minesota'),('MO','GB','Moyle'),('MO','IT','Modena'),('MO','US','Missuri'),('MON','VE','Monagas'),('MOR','MX','Morelos'),('MP','US','Ilhas Marianas'),('MP','ZA','Mpumalanga'),('MS','BR','Mato Grosso'),('MS','IT','Massa Carrara'),('MS','US','Mississípi'),('MT','BR','Mato Grosso'),('MT','IE','Meath'),('MT','IT','Matera'),('MT','US','Montana'),('MY','GB','Merseyside'),('MY','IE','Mayo'),('M_K','UA','m.Kiev'),('M_S','UA','m.Sevastopil-'),('NA','GB','Newtownabbey'),('NA','IT','Nápoles'),('NAY','MX','Nayarit'),('NB','CA','Nova Brunswick'),('NB','GB','Newbury'),('NC','GB','Nottingham City'),('NC','US','Carolina do Norte'),('NC','ZA','Northern Cape'),('ND','GB','North Down'),('ND','US','Dacota do Norte'),('NE','CH','Neuchâtel'),('NE','GB','NthEast Lincolnshire'),('NE','US','Nebrasca'),('NE','VE','Nueva Esparta'),('NF','CA','Terra Nova'),('NH','GB','Northamptonshire'),('NH','US','Nova Hampshire'),('NJ','US','Nova Jersey'),('NK','GB','Norfolk'),('NL','GB','North Lincolnshire'),('NL','MX','Nuevo León'),('NM','GB','Newry and Mourne'),('NM','US','Novo México'),('NÖ','AT','Baixa Áustria'),('NO','IT','Novara'),('NP','ZA','Northern Province'),('NS','CA','Nova Escócia'),('NS','GB','North Somerset'),('NSW','AU','Nova Gales do Sul'),('NT','AU','Território do Norte'),('NT','CA','Northwest Terr.'),('NT','GB','Nottinghamshire'),('NT','HK','New Territories'),('NTL','NZ','Northland'),('NU','GB','Northumberland'),('NU','IT','Nuoro'),('NV','US','Nevada'),('NW','CH','Nidwalden'),('NW','ZA','Northwest'),('NY','US','Nova Iorque'),('OAX','MX','Oaxaca'),('ODS','UA','Odes-ka'),('OF','IE','Ossally'),('OH','US','Ohio'),('OK','US','Oklahoma'),('OM','GB','Omagh'),('ON','CA','Ontário'),('OÖ','AT','Alta Áustria'),('OR','GB','Orkney'),('OR','IT','Oristano'),('OR','US','Oregão'),('OTA','NZ','Otago'),('OW','CH','Obwalden'),('OX','GB','Oxfordshire'),('PA','BR','Pará'),('PA','IT','Palermo'),('PA','US','Pensilvânia'),('PAH','MY','Pahang'),('PB','BR','Paraíba'),('PB','GB','Peterborough'),('PC','IT','Piacenza'),('PD','IT','Pádua'),('PE','BR','Pernambuco'),('PE','CA','Ilha PríncipeEduardo'),('PE','IT','Pescara'),('PEL','MY','Perlis'),('PER','MY','Perak'),('PG','IT','Perugia'),('PI','BR','Piauí'),('PI','IT','Pisa'),('PIN','MY','Pulau Pinang'),('PL','GB','Poole'),('PM','GB','Portsmouth'),('PN','IT','Pordenone'),('PO','GB','Powys'),('PO','IT','Prato'),('POL','UA','Poltavs-ka'),('POR','VE','Portuguesa'),('PR','BR','Paraná'),('PR','IT','Parma'),('PR','US','Porto Rico'),('PS','IT','Pesaro'),('PT','IT','Pistóia'),('PUE','MX','Puebla'),('PV','IT','Pavia'),('PY','GB','Plymouth'),('PZ','IT','Potenza'),('QC','CA','Quebeque'),('QLD','AU','Queensland'),('QR','MX','Quintana Roo'),('QRO','MX','Querétaro'),('RA','IT','Ravena'),('RC','IE','Roscommon'),('RC','IT','Reggio Calabria'),('RD','GB','Redcar and Cleveland'),('RE','GB','Reading'),('RE','IT','Régio Emília'),('RG','IT','Ragusa'),('RI','IT','Rieti'),('RI','US','Rhode Island'),('RIV','UA','Rivnens-ka'),('RJ','BR','Rio de Janeiro'),('RM','GB','Rochester up.Medway'),('RM','IT','Roma'),('RN','BR','Rio Grande do Norte'),('RN','IT','Rimini'),('RO','BR','Rondônia'),('RO','IT','Rovigo'),('RR','BR','Roraima'),('RS','BR','Rio Grande do Sul'),('RU','GB','Rutland'),('RV','IT','Rovigo'),('S','AT','Salzburgo'),('SA','AU','Austrália Meridional'),('SA','IT','Salerno'),('SAB','MY','Sabah'),('SAR','MY','Sarawak'),('SC','BR','Santa Catarina'),('SC','GB','Strathclyde'),('SC','US','Carolina do Sul'),('SD','GB','Southend'),('SD','US','Dacota do Sul'),('SE','BR','Sergipe'),('SE','GB','East Sussex'),('SEL','MY','Selangor'),('SER','MY','Negeri Sembilan'),('SG','CH','Saint Gall'),('SG','GB','South Glamorgan'),('SG','IE','Sligo'),('SG','SG','Cingapura'),('SH','CH','Schaffhausen'),('SH','GB','Shropshire'),('SI','IT','Siena'),('SIN','MX','Sinaloa'),('SK','CA','Sascatchevã'),('SK','GB','Suffolk'),('SL','GB','Shetland'),('SLP','MX','San Luis Potosí'),('SN','GB','Stockton-on-Tees'),('SO','CH','Soleure'),('SO','GB','Somerset'),('SO','IT','Sondrio'),('SON','MX','Sonora'),('SP','BR','São Paulo'),('SP','GB','Southampton'),('SP','IT','Spezia'),('SR','GB','Strabane'),('SR','IT','Siracusa'),('SS','IT','Sassari'),('ST','AT','Estíria'),('ST','GB','Staffordshire'),('STL','NZ','Southland'),('SU','GB','Slough'),('SUC','VE','Sucre'),('SUM','UA','Sums-ka'),('SV','IT','Savona'),('SW','GB','West Sussex'),('SY','GB','Surrey'),('SZ','CH','Schwyz'),('T','AT','Tirol'),('TA','GB','Tayside'),('TA','IT','Taranto'),('TAB','MX','Tabasco'),('TAC','VE','Tachira'),('TAR','NZ','Taranaki'),('TAS','AU','Tasmânia'),('TD','GB','Thamesdown'),('TE','IT','Teramo'),('TER','UA','Ternopil-s-ka'),('TG','CH','Turgóvia'),('TH','GB','Thurrock'),('TI','CH','Ticino'),('TLX','MX','Tlaxcala'),('TMS','MX','Tamaulipas'),('TN','IT','Trento'),('TN','US','Tennessee'),('TO','BR','Tocantins'),('TO','GB','Torbay'),('TO','IT','Turim'),('TP','IE','Tipperary'),('TP','IT','Trapani'),('TPE','TW','T-ai-pei'),('TR','IT','Terni'),('TRE','MY','Trengganu'),('TRU','VE','Trujillo'),('TS','IT','Trieste'),('TV','IT','Treviso'),('TW','GB','Tyne and Wear'),('TWN','TW','Taiwan'),('TX','US','Texas'),('UD','IT','Udine'),('UR','CH','Uri'),('UT','US','Utah'),('V','AT','Vorarlberg'),('VA','IT','Varese'),('VA','US','Virgínia'),('VAR','VE','Vargas'),('VC','IT','Verceli'),('VD','CH','Vaud'),('VE','IT','Veneza'),('VER','MX','Veracruz'),('VI','IT','Vicenza'),('VI','US','Ilhas Virgens'),('VIC','AU','Victoria'),('VIN','UA','Vinnits-ka'),('VOL','UA','Volins-ka'),('VR','IT','Verona'),('VS','CH','Valais'),('VT','IT','Viterbo'),('VT','US','Vermont'),('VV','IT','Vibo Valentia'),('W','AT','Viena'),('WA','AU','Austrália Ocidental'),('WA','GB','Warwickshire'),('WA','US','Washington'),('WAI','NZ','Waikato'),('WC','ZA','Western Cape'),('WD','GB','Windsor & Maidenhead'),('WEC','NZ','West Coast'),('WF','IE','Waterford'),('WG','GB','West Glamorgan'),('WI','GB','Wiltshire'),('WI','US','Wisconsin'),('WK','IE','Wicklow'),('WL','GB','Western Isles'),('WLG','NZ','Wellington'),('WM','GB','West Midlands'),('WM','IE','Westmeath'),('WO','GB','Worcestershire'),('WR','GB','Wrekin'),('WT','GB','Warrington'),('WV','US','Virgínia Ocidental'),('WX','IE','Wexford'),('WY','US','Wyoming'),('YAR','VE','Yaracuy'),('YK','GB','York'),('YN','GB','North Yorkshire'),('YS','GB','South Yorkshire'),('YT','CA','Território Yukon'),('YUC','MX','Yucatán'),('YW','GB','West Yorkshire'),('ZAC','MX','Zacatecas'),('ZAK','UA','Zakarpats-ka'),('ZAP','UA','Zaporiz-ka'),('ZG','CH','Zug'),('ZH','CH','Zurique'),('ZHI','UA','Zhitomirs-ka'),('ZUL','VE','Zulia');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekday`
--

DROP TABLE IF EXISTS `weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekday` (
  `WeekdayID` int(11) NOT NULL,
  `WeekDesc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WeekdayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekday`
--

LOCK TABLES `weekday` WRITE;
/*!40000 ALTER TABLE `weekday` DISABLE KEYS */;
INSERT INTO `weekday` VALUES (1,'Segunda-Feira'),(2,'Terça-Feira'),(3,'Quarta-Feira'),(4,'Quinta-Feira'),(5,'Sexta-Feira'),(6,'Sábado'),(7,'Domingo');
/*!40000 ALTER TABLE `weekday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-03 14:10:31
