CREATE DATABASE  IF NOT EXISTS `grade_1_admission` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `grade_1_admission`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: grade_1_admission
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `application_id` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `user_account_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `deadline_id` varchar(10) NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `user_account_id` (`user_account_id`),
  KEY `student_id` (`student_id`),
  KEY `deadline_id` (`deadline_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`account_id`) ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_3` FOREIGN KEY (`deadline_id`) REFERENCES `deadline` (`deadline_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('app_00001','2015-11-10 00:00:00','sandeepa@gmail.com','stu_00001','dd_0001'),('app_00002','2015-11-11 00:00:00','sandeepa@gmail.com','stu_00003','dd_0001'),('app_00003','2015-11-11 00:00:00','sandeepa@gmail.com','stu_00005','dd_0001'),('app_00004','2016-01-06 00:00:00','sandeepa@gmail.com','stu_00004','dd_0001'),('app_00005','2016-01-05 00:00:00','sandeepa@gmail.com','stu_00006','dd_0001'),('app_00006','2016-01-13 00:00:00','sandeepa@gmail.com','stu_00002','dd_0001'),('app_00007','2016-01-20 00:00:00','sandeepa@gmail.com','stu_00007','dd_0001');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_school`
--

DROP TABLE IF EXISTS `application_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_school` (
  `application_id` varchar(20) NOT NULL,
  `school_id` varchar(20) NOT NULL,
  `status` int(1) NOT NULL,
  `location_marks` int(3) DEFAULT NULL,
  `sibling_marks` int(3) DEFAULT NULL,
  KEY `school_id` (`school_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `application_school_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `application_school_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_school`
--

LOCK TABLES `application_school` WRITE;
/*!40000 ALTER TABLE `application_school` DISABLE KEYS */;
INSERT INTO `application_school` VALUES ('app_00001','scl-00001',1,7,0),('app_00001','scl-00007',0,0,0),('app_00002','scl-00008',0,0,0),('app_00001','scl-00006',0,0,0),('app_00001','scl-00008',0,0,0),('app_00002','scl-00001',0,7,0),('app_00003','scl-00001',0,7,0),('app_00003','scl-00008',0,0,0),('app_00004','scl-00003',0,6,2),('app_00007','scl-00003',0,NULL,NULL);
/*!40000 ALTER TABLE `application_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadline`
--

DROP TABLE IF EXISTS `deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deadline` (
  `deadline_id` varchar(10) NOT NULL,
  `year` int(4) NOT NULL,
  `deadline` date NOT NULL,
  PRIMARY KEY (`deadline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadline`
--

LOCK TABLES `deadline` WRITE;
/*!40000 ALTER TABLE `deadline` DISABLE KEYS */;
INSERT INTO `deadline` VALUES ('dd_0001',2016,'2016-05-27');
/*!40000 ALTER TABLE `deadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian` (
  `guardian_id` varchar(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_initials` varchar(20) DEFAULT NULL,
  `surname` varchar(100) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `res_address_line_1` varchar(50) NOT NULL,
  `res_address_line_2` varchar(50) DEFAULT NULL,
  `res_street_name` varchar(100) DEFAULT NULL,
  `res_city` varchar(20) NOT NULL,
  `work_address_line_1` varchar(50) NOT NULL,
  `work_address_line_2` varchar(50) DEFAULT NULL,
  `work_street_name` varchar(100) DEFAULT NULL,
  `work_city` varchar(20) NOT NULL,
  `telephone_home` varchar(13) NOT NULL,
  PRIMARY KEY (`guardian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES ('00001','Liyanage Saman Wijesiri Perera','Liyanage','S.W.','Perera','Teaching','\"Wimalasewana\"','Hingurupanagala','Kotapola','Deniyaya','Deniyaya Centaral College','Kotapola1','Kotapola2','Deniyaya','0412271111'),('00002','Liyanage Athula Wijesiri Perera','Liyanage','A.W.','Perera','Nursing','\"Wimala\"','Hingurupanagala','Kotapola','Deniyaya','Deniyaya Hospital','Deniyaya2','Deniyaya3','Deniyaya','0412272222'),('00003','Don Sisil Greshan','Don','S','Greshan','Carpentry','Uswetakeiyawa','Madampe','Unawatuna','Galle','Diyadawa','Deniyaya','Kotapola','Matara','0432324232'),('00004','Ayesha Jayaweera Perera','Ayesha','J','Perera','Housewife','Mahawa','Kahaduwa','Padiyapelella','Anuradhapura','Diyadawa','Deniyaya','Kotapola','Matara','0499999999'),('00005','Sumanasiri Ajith Pushpakumara','Sumanasiri','A','Pushpakumara','Driver','Bulathkohupitiya','Labuduwa','Labuduwa','Galle','Labuduwa','Labuduwa','Labuduwa','Galle','0999898989'),('00006','Sumanawathi Liyanage Amarawathi','Sumanawathi','L','Amarawathi','Teaching','Galenbindunuwewa','Galenbindunuwewa1','Galenbindunuwewa2','Anuradhapura','A/Theldeniya Central College','Galenbindunuwewa3','Galenbindunuwewa4','Theldeniya','0881234567'),('00007','Upul Chandana Gamage','Upul','C','Gamage','Teaching','Karapitiya','Karapitiya','Karapitiya2','Galle','Karapitiya3','Karapitiya4','Karapitiya5','Karapitiya6','0917865675'),('00008','Kumara Dharmasena Perera','Kumara','D','Perera','Cricketer','Godagama','Godagama2','Godagama3','Matara','Matara2','Matara3','Matara4','Colombo','0413467865'),('00009','Sanath Teran Jayasooriya','Sanath','T','Jayasooriya','Teaching','Beach Road','Beach Road1','Beach Road2','Matara','Beach Road3','Beach Road4','Beach Road5','Beach Road6','0418734987'),('00010','Kusal Janith Perera','Kusal','J','Perera','Doctor','134/B','Mill road','Katubedda','Moratuwa','General Hospital','Moratuwa','Moratuwa2','Colombo','0117640972'),('1234v','dsfdsfsseeerrr','dfdf','eee','eeeerr','dddswsa','ssdasasas','sasasdasd','ssdsffe','ewededss','sddwdwdsd','wdsdwdee','dwwwww','eeereqwds','weewrewr');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_mobile_telephone`
--

DROP TABLE IF EXISTS `guardian_mobile_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_mobile_telephone` (
  `number` varchar(13) NOT NULL,
  `guardian_id` varchar(20) NOT NULL,
  KEY `guardian_id` (`guardian_id`),
  CONSTRAINT `guardian_mobile_telephone_ibfk_1` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_mobile_telephone`
--

LOCK TABLES `guardian_mobile_telephone` WRITE;
/*!40000 ALTER TABLE `guardian_mobile_telephone` DISABLE KEYS */;
INSERT INTO `guardian_mobile_telephone` VALUES ('0112323232','00001'),('0113434343','00002'),('0998787654','00001'),('0702748543','00002'),('0724545454','00003'),('0725656565','00003'),('0726767676','00004'),('0727878787','00004'),('0728989898','00005'),('0731212121','00005'),('0732323232','00006'),('0733434343','00006'),('0734545454','00007'),('0735656565','00007'),('0741212121','00008'),('0742323232','00008'),('0743434343','00009'),('0744545454','00009'),('0745656565','00010'),('0745656565','00010'),('21323334','1234v'),('4343434','1234v');
/*!40000 ALTER TABLE `guardian_mobile_telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_work_telephone`
--

DROP TABLE IF EXISTS `guardian_work_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_work_telephone` (
  `number` varchar(13) NOT NULL,
  `guardian_id` varchar(20) NOT NULL,
  KEY `guardian_id` (`guardian_id`),
  CONSTRAINT `guardian_work_telephone_ibfk_1` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_work_telephone`
--

LOCK TABLES `guardian_work_telephone` WRITE;
/*!40000 ALTER TABLE `guardian_work_telephone` DISABLE KEYS */;
INSERT INTO `guardian_work_telephone` VALUES ('0419999999','00001'),('1210323456','00001'),('0912838483','00002'),('0983848382','00003'),('8762838294','00004'),('9858382849','00004'),('0783828483','00002'),('0712212121','00003'),('0712332323','00005'),('0713434343','00005'),('0714545454','00006'),('0705656565','00006'),('0716767676','00007'),('0717878787','00007'),('0718989898','00008'),('0719898989','00008'),('0721212121','00009'),('0722323232','00009'),('0723434343','00010'),('0724545454','00010'),('2343534555','1234v'),('2323434344','1234v');
/*!40000 ALTER TABLE `guardian_work_telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `school_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `school_type` int(1) NOT NULL,
  `address_line_1` varchar(50) DEFAULT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `coordinate_x` decimal(8,5) NOT NULL,
  `coordinate_y` decimal(8,5) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES ('scl-00001','Rahula',0,'Matara','Matara1','Matara3','Matara2',5.95316,80.53523,'rahula@gmail.com'),('scl-00002','Southlands',1,'Galle1','Galle2','Galle4','Galle3',6.02785,80.21615,'southlands@gmail.com'),('scl-00003','Sujatha Balika',1,'Matara1','Matara2','Matara3','Matara',5.95395,80.53853,'sujatha@gmail.com'),('scl-00004','Devi Balika',1,'Kottawa1','Kottawa2','Kottawa3','Kottawa4',6.91060,79.88238,'devi@gmail.com'),('scl-00005','Anula Balika',1,'Kiribathgoda1','Kiribathgoda2','Kiribathgoda3','Kiribathgoda4',6.87229,79.88490,'anula@gmail.com'),('scl-00006','Vijitha High School',2,'Dikwella1','Dikwella2','Dikwella3','Dikwella4',8.04184,81.07915,'vijitha@gmail.com'),('scl-00007','Royal College',0,'Thum mulla 1','Thum mulla 2','Thum mulla 3','Thum mulla 4',6.90460,79.86088,'royal@gmail.vom'),('scl-00008','Thelijjawila Central',2,'Thelijjawila 1','Thelijjawila 2','Thelijjawila 3','Thelijjawila 4',6.02205,80.49073,'thelijjawila@gmail.com');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_fax`
--

DROP TABLE IF EXISTS `school_fax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_fax` (
  `number` varchar(13) NOT NULL,
  `school_id` varchar(20) NOT NULL,
  KEY `school_id` (`school_id`),
  CONSTRAINT `school_fax_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_fax`
--

LOCK TABLES `school_fax` WRITE;
/*!40000 ALTER TABLE `school_fax` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_fax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_telephone`
--

DROP TABLE IF EXISTS `school_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_telephone` (
  `number` varchar(13) NOT NULL,
  `school_id` varchar(20) NOT NULL,
  KEY `school_id` (`school_id`),
  CONSTRAINT `school_telephone_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_telephone`
--

LOCK TABLES `school_telephone` WRITE;
/*!40000 ALTER TABLE `school_telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sibling`
--

DROP TABLE IF EXISTS `sibling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sibling` (
  `student_id` varchar(20) NOT NULL,
  `elder_sibling_id` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`,`elder_sibling_id`),
  KEY `elder_sibling_id` (`elder_sibling_id`),
  CONSTRAINT `sibling_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sibling_ibfk_2` FOREIGN KEY (`elder_sibling_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sibling`
--

LOCK TABLES `sibling` WRITE;
/*!40000 ALTER TABLE `sibling` DISABLE KEYS */;
/*!40000 ALTER TABLE `sibling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_innitials` varchar(20) DEFAULT NULL,
  `surname` varchar(70) NOT NULL,
  `gender` int(1) NOT NULL,
  `guardian_id` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `address_line_1` varchar(50) DEFAULT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `coordinate_x` decimal(8,5) NOT NULL,
  `coordinate_y` decimal(8,5) NOT NULL,
  `telephone` varchar(13) DEFAULT NULL,
  `school_id` varchar(20) DEFAULT NULL,
  `guardian_relationship` varchar(15) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `guardian_id` (`guardian_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`guardian_id`) ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('stu_00001','Liayange Ajith Suhada Perera','Liyanage','A.S.','Perera',0,'00001','2011-05-27','\"Wimalasewana\"','Hingurupanagala','Kotapola','Deniyaya',79.89000,6.34340,'0412271111',NULL,'father'),('stu_00002','Liayange Sugath Ishara Perera','Liyanage','S.I..','Perera',0,'00002','2011-05-29','\"Wimalasewana\"','Hingurupanagala','Kotapola','Deniyaya',79.99000,6.80000,'0412272222',NULL,'father'),('stu_00003','Liayange Cahaminda Sahan Perera','Liyanage','C.S.','Perera',0,'00001','2011-05-27','\"Wimalasewana\"','Hingurupanagala','Kotapola','Deniyaya',79.89000,6.34340,'0412271111',NULL,'father'),('stu_00004','Hashini Gonagala Pathirana','Hashini','G','Pathirana',1,'00010','2016-01-11','Tangalle1','Tangalle2','Tangalle3','Tangalle4',5.94946,80.62004,'01181283929',NULL,'Father'),('stu_00005','Supun Sankalpa Pathirana','Supun','S','Pathirana',0,'00002','2016-01-09','Mattegoda1','Mattegoda1','Mattegoda1','Mattegoda1',6.81317,79.96877,'0993467234',NULL,'Father'),('stu_00006','Chandima prabha Vithanage','Chandima','P','Vithanage',1,'00003','2016-01-31','Polgasowita1','Polgasowita2','Polgasowita3','Polgasowita4',6.80078,79.97484,'0119329392',NULL,'Father'),('stu_00007','Malsha Prabha Vithanage','Malsha','P','Vithanage',0,'00005','2016-01-13','Katubedda1','Katubedda2','Katubedda3','Katubedda4',6.80176,79.89991,'0773627929',NULL,'Father'),('stu_00008','Isuru Bhanuka Gamage','Isuru','B','Gamage',0,'00002','2016-01-26','Moratuwa1','Moratuwa2','Moratuwa3','Moratuwa4',6.80475,79.88106,'01193883828',NULL,'Father'),('stu_00009','dsdsadsasds','dsdsdass','ss','ssdsd',1,'1234v','2016-01-21','sfsdfsdfsd','sfdsdfsd','fdsfsdfsdf','fsdfsdfdsf',6.34344,79.32324,'343434544',NULL,'Father');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `name` varchar(100) NOT NULL,
  `nic` varchar(11) NOT NULL,
  `telephone` varchar(13) DEFAULT NULL,
  `account_id` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `account_type` int(1) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('admin','123','0715425369','admin@gmail.com','*4ACFE3202A5FF5CF467898FC58AAB1D615029441',0),('hjhj','yuuuu76666','jjjjjjjjjjj','ghhfgfh','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257',2),('hashini','932222222V','0783832134','hashini@gmail.com','*AD0F20F57090BA8EF3D2EE23E44C0A4FB6852D80',2),('Keet Malin','931111111V','0710000000','keet@gmail.com','*3B5A1EB013E6ACDA9DAAE75D08C6C622C7C435B6',2),('lakshan','937777777V','0773782983','lakshan@gmail.com','*A3F32F1EABAAB18894B281708C85081B51B71A1A',2),('Lakshan Gamage','933030270v','0773472649','lakshangamage.13@cse.mrt.ac.lk','*A4B6157319038724E3560894F7F932C8886EBFCF',2),('Rahula','90','0412212121','rahula@gmail.com','*1D595F33F4893717AA96344A2D26B2BB4B73299C',1),('sandeepa','9323456789','0716723456','sandeepa@gmail.com','*00A51F3F48415C7D4E8908980D443C29C69B60C9',2),('yasiru','923032053V','0716010510','yasiru@gmail.com','*273162E1A674997C0F6481B0BB677E62B5065A00',2),('Yasiru Nilan','923545127v','0412253451','yasirun@gmail.com','*A4B6157319038724E3560894F7F932C8886EBFCF',2);
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-21 18:54:39
