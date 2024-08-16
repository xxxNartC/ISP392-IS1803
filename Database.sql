-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: isp392
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AccountType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UserInfoID` int DEFAULT NULL,
  `forgot` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `UserInfoID` (`UserInfoID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`UserInfoID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'user0','1234','user',1,NULL),(2,'user1','123','user',2,NULL),(3,'user2','1234','user',3,NULL),(4,'user3','123','user',4,NULL),(5,'user4','123','user',5,NULL),(6,'user5','123','user',6,NULL),(7,'user6','123','user',7,NULL),(8,'user7','123','user',8,NULL),(9,'user8','123','user',9,NULL),(10,'manager','123','manager',10,NULL),(21,'quan1','123123','user',16,'Where are you from?hn');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blogid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Stories about restaurants and incentive programs for customers','Stories about restaurants and incentive programs for customers','thiet-ke-nha-hang-5.jpg','2024-06-16'),(2,'Culinary Delights at La Bella Italian Restaurant','Culinary Delights at La Bella Italian Restaurant','OIP.jpg','2024-06-19');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `ChefID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(450) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `Image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ChefID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (11,'Gordon Ramsay',2500.00,'0981234567','123 Ba Trieu, Hai Ba Trung, Ha Noi','Có kinh nghiệm về món Tây - chuyên về món Pháp cao cấp.','chef','GordonRamsay.jpg'),(12,'Guy Fieri',2800.00,'0971234568','456 Tran Duy Hung, Cau Giay, Ha Noi','Có kinh nghiệm về món Tây - chuyên về ẩm thực Ý và mì ống.','chef','GyuFury.jpg'),(13,'Michael Caines',3000.00,'0961234569','789 Hoang Hoa Tham, Ba Dinh, Ha Noi','Có kinh nghiệm về món Tây - nổi tiếng với các món nướng kiểu Anh.','chef','MichaelCaines.jpg'),(14,'Jamie Oliver',3200.00,'0951234570','1010 Kim Ma, Ba Dinh, Ha Noi','Có kinh nghiệm về món Tây - chuyên gia làm các món Tây Ban Nha.','chef','JamieOliver.jpg');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `DishID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DishType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`DishID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (16,'SALADE DE HADDOCK',24.00,'Salade romaine, haddock poché, creme de petits pois menthe, Haricots verts, tzatziki, pickles d\'oignons rouges et croutons de pain','Plats','ISPSALADE.jpg',1),(17,'SANDWICH FACON ROLL',25.00,'Brioche snackée, pinces de tourteaux, mayonnaise, sucrine et estragon, zeste de citron, et pommes pailles','Plats','ISPSANDWICH.jpg',1),(18,'CÔTE DE VEAU EN CROÛTE POUR 2',72.00,'Croûte de parmesan et serrano, pommes pailles, Salade comme une niçoise, jus corsé','Plats','ISPPOUR.jpg',1),(19,'POULPE ET CHORIZO',28.00,'Poulpe rôti, houmous de pois chiche à la creme de sesame, chroizo ibérique, salade de roquette, citron, grenades et salicorne','Plats','ISP3.jpg',1),(20,'SUPREME DE VOLAILLE',29.00,'Suprême de poulet cuit à basse température, asperges vertes, Morilles au vin jaune, fregola sarda et jus corsé','Plats','ISPVOLAILLE.jpg',1),(21,'GNOCCHIS DE POTIMARRON',26.00,'Marrons, chevre, pesto de roquette et condiment au citron','Plats','ISPPOTIMARRON.jpg',1),(22,'FROMAGE A L’ASSIETTE',6.00,'Selection du moment','Desserts','FROMAGE.jpg',1),(23,'PROFITEROLE DE LA MISTINGUETT',15.00,'Glace à la vanille de Madagascar, chocolat noir chaud','Desserts','PROFITEROLE.jpg',1),(24,'COMME UN FRAISIER',13.00,'Fraises gariguettes, mousse au mascarpone, biscuit sablé, poudre et confiture de fraise, pistaches carameliées et Shiso vert','Desserts','COMME.jpg',1),(25,'CREMEUX CITRON',14.00,'Menthe & basilic, meringue italienne et sablé breton','Desserts','CREMEUX.jpg',1),(26,'Mojito',15.00,'Rhum blanc, jus de citron frais, feuilles de menthe','Cocktails','Mojito.jpg',1),(27,'Sangria',14.00,'Vin rouge, brandy ou cognac, jus de citron concentré, fruits frais','Cocktails','Sangria.jpg',1),(28,'Margarita',16.00,'Tequila, liqueur d\'orange, jus de citron vert','Cocktails','Margarita.jpg',1),(29,'Mint julep',14.00,'Whisky Bourbon, sucre, feuilles de menthe','Cocktails','Mintjulep.jpg',1),(30,'Long Island Iced Tea',17.00,'Vodka, rhum blanc, gin, tequila, limonade','Cocktails','LongIsland.jpg',1),(31,'Piña Colada',15.00,'Rhum, jus d\'ananas, lait de coco','Cocktails','Colada.jpg',1),(32,'Chateau Margaux 2007',142.00,'Fabricant : Château Margaux\nRégion : Margaux commune, Médoc, Bordeaux\nSaison : 2007\nClassement : Premier Grand Cru Classe','Wine','Margaux2007.jpg',1),(33,'Chateau La Vieux Serestin Cru Artisan Medoc DOC',187.00,'Fabricant : Château Le Vieux Serestin\nRégion : Médoc, Bordeaux\nSaison : 2012\nClassement : Cru Artisans du Médoc','Wine','Chateau.jpg',1),(34,'Chateau Larose – Trintaudon',160.00,'Fabricant : Château Larose – Trintaudon\nRégion : Haut-Médoc, rive gauche de Bordeaux\nSaison : 2011\nClassement : Cru Bourgeois','Wine','Trintaudon.jpg',1),(35,'Chateau Magnol Haut-Medoc Cru Bourgeois',210.00,'Fabricant : Barton & Guestier\nRégion : Haut Médoc, rive gauche de Bordeaux\nSaison : 2014\nClassement : Cru Bourgeois\n','Wine','Haut-Medoc.jpg',1),(36,'Chateau Tayac – Plaisance Margaux Cru Bourgeois',198.00,'Fabricant : Barton & Guestier\nRégion : Margaux, rive gauche de Bordeaux\nSaison : 2013\nClassement : Cru Bourgeois','Wine','Plaisance.jpg',1),(37,'Chateau Haut Saint-Brice Saint-Emilion Grand Cru',170.00,'Fabricant : Château Haut Saint-Brice\nRégion : Saint-Émilion\nAnnée de récolte : 2011 | 2012\nClassement : Saint-Émilion Grand Cru','Wine','Saint-Brice.jpg',1),(38,'Chateau Peymouton Saint-Emilion Grand Cru',166.00,'Fabricant : Château Peymouton\nRégion : Saint-Émilion\nSaison : 2014\nClassement : Saint-Émilion Grand Cru','Wine','Peymouton.jpg',1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `InvoiceDate` datetime DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetail`
--

DROP TABLE IF EXISTS `invoicedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicedetail` (
  `InvoiceDetailID` int NOT NULL AUTO_INCREMENT,
  `InvoiceID` int DEFAULT NULL,
  `ItemName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`InvoiceDetailID`),
  KEY `InvoiceID` (`InvoiceID`),
  CONSTRAINT `invoicedetail_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetail`
--

LOCK TABLES `invoicedetail` WRITE;
/*!40000 ALTER TABLE `invoicedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `TableID` int DEFAULT NULL,
  `PreOrderID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `TableID` (`TableID`),
  KEY `PreOrderID` (`PreOrderID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`TableID`) REFERENCES `restauranttable` (`TableID`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`PreOrderID`) REFERENCES `preordertable` (`PreOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `DishID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `DishID` (`DishID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`DishID`) REFERENCES `dish` (`DishID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preordertable`
--

DROP TABLE IF EXISTS `preordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preordertable` (
  `PreOrderID` int NOT NULL AUTO_INCREMENT,
  `TableID` int DEFAULT NULL,
  `Name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Book_date` date DEFAULT NULL,
  `NumberOfPeople` int DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
`userid`         INT NULL                                                     
DEFAULT NULL,
  PRIMARY KEY (`PreOrderID`),
  KEY `TableID` (`TableID`),
  CONSTRAINT `preordertable_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `restauranttable` (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preordertable`
--

LOCK TABLES `preordertable` WRITE;
/*!40000 ALTER TABLE `preordertable` DISABLE KEYS */;
INSERT INTO `preordertable` VALUES (4,NULL,'quan',NULL,'0123456789','2024-06-14',3,'20:30:00',NULL),(6,NULL,'Himegawa Toga',NULL,'0961130576','2024-06-29',3,'21:00:00',NULL),(7,NULL,'Himegawa Toga',NULL,'0961130576','2024-06-14',3,'18:00:00',NULL),(8,NULL,'quan',NULL,'0123456789','2024-06-19',3,'20:30:00',NULL),(9,NULL,'Himegawa Toga',NULL,'0961130576','2024-06-21',3,'20:30:00',NULL),(10,NULL,'Himegawa Toga',NULL,'0961130576','2024-06-19',3,'20:00:00',NULL),(11,NULL,'Himegawa Toga',NULL,'0961130576','2024-06-30',9,'21:30:00',NULL),(12,NULL,'Minh Quan',NULL,'0961130576','2024-06-21',12,'20:30:00',NULL),(14,NULL,'Minh Quan',NULL,'0961130576','2024-06-19',3,'21:00:00',NULL),(18,NULL,'Quan',NULL,'0961130576','2024-06-20',8,'21:00:00',NULL),(20,NULL,'Minh Quan',NULL,'0961130576','2024-06-29',7,'20:00:00',NULL),(21,NULL,'Minh Quan',NULL,'0961130576','2024-06-23',8,'18:00:00',NULL),(22,NULL,'xxxNartC',NULL,'+842312323232','2024-06-19',1,'19:00:00',NULL),(23,NULL,'user01',NULL,'2','2024-06-21',1,'20:00:00',NULL),(24,NULL,'user01',NULL,'2','2024-06-22',1,'20:00:00',NULL);
/*!40000 ALTER TABLE `preordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restauranttable`
--

DROP TABLE IF EXISTS `restauranttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restauranttable` (
  `TableID` int NOT NULL AUTO_INCREMENT,
  `TableNumber` int DEFAULT NULL,
  `Seats` int DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`TableID`),
  UNIQUE KEY `TableNumber` (`TableNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauranttable`
--

LOCK TABLES `restauranttable` WRITE;
/*!40000 ALTER TABLE `restauranttable` DISABLE KEYS */;
INSERT INTO `restauranttable` VALUES (1,1,4,'Available'),(2,2,6,'Available'),(3,3,2,'Available'),(4,4,8,'Available'),(5,5,4,'Available'),(6,6,6,'Available'),(7,7,2,'Available'),(8,8,8,'Available'),(9,9,4,'Available'),(10,10,6,'Available');
/*!40000 ALTER TABLE `restauranttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Birthdate` date NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','123456','Hà Nội','user@gmail.com','2000-05-14'),(2,'user1','123678','Hà Nội','user1@gmail.com','2001-07-15'),(3,'user2','123789','Bắc Giang','use2@gmail.com','2003-02-12'),(4,'user3','123567','Hà Nội','use3r@gmail.com','2002-04-02'),(5,'user4','123765','Hà Nội','user4@gmail.com','2003-08-04'),(6,'user5','128654','Hà Nội','user5@gmail.com','2002-07-19'),(7,'user6','129456','Hà Nội','user6@gmail.com','2002-05-23'),(8,'user7','126547','Hà Nội','user7@gmail.com','2003-02-28'),(9,'user8','125345','Hà Nội','user8@gmail.com','2000-04-28'),(10,'manager','125344','Hà Nội','manager8@gmail.com','2000-04-21'),(16,'Minh Quan','0961130576','Đông Anh - Hà Nội','quandmhe172272@fpt.edu.vn','2024-05-29');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 14:47:46
