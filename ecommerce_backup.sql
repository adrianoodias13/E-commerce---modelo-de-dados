-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `Id_Client` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Mninit` char(2) DEFAULT NULL,
  `Lname` varchar(10) DEFAULT NULL,
  `Cpf` char(19) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Client`),
  UNIQUE KEY `Unique_Cpf_Client` (`Cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','1234678912','rua silva de pratqa 29, Carangola - Cidade das flores'),(2,'Matheus','O','Pimentel','9876542175','rua alameda 289, Centro - cidade das flores'),(3,'Ricardo','F','Silva','47845678913','avenida alameda vinha 109, centro- cidade das flores'),(4,'Julia','S','França','46789123456','rua laranjeiras 861, centro - cidade das flores'),(5,'Roberta','G','Assis','98745631895','Avenidade koller 19, Centro - cidade das flores'),(6,'Isabela','M','Cruz','82654789123','rua alamed das flores 28, centro - cidade das flores');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CLIENT_BACKUP` BEFORE DELETE ON `clients` FOR EACH ROW INSERT INTO clients_deleted (ID_CLIENT, Fname, Mninit,Lname, Cpf, Address, date_deleted)
 select ID_CLIENT, Fname, Mninit,Lname, Cpf, Address, now() from clients
 where cpf = old.cpf */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clients_deleted`
--

DROP TABLE IF EXISTS `clients_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_deleted` (
  `Id_Client` int NOT NULL,
  `Fname` varchar(10) DEFAULT NULL,
  `Mninit` char(2) DEFAULT NULL,
  `Lname` varchar(10) DEFAULT NULL,
  `Cpf` char(19) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `date_deleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_deleted`
--

LOCK TABLES `clients_deleted` WRITE;
/*!40000 ALTER TABLE `clients_deleted` DISABLE KEYS */;
INSERT INTO `clients_deleted` VALUES (9,'Jesus','G','PULTZ','45978614478','Rua corvida, bairro oeste ensolarado, Belim, Flores','2025-03-24 21:55:08');
/*!40000 ALTER TABLE `clients_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id_Order` int NOT NULL AUTO_INCREMENT,
  `Id_Client` int DEFAULT NULL,
  `Order_Status` enum('Cancelado','Confirmar','Em processamento') DEFAULT 'Em processamento',
  `Order_Description` varchar(255) DEFAULT NULL,
  `Send_Value` float DEFAULT '10',
  `Payment_Cash` tinyint(1) DEFAULT '0',
  `Id_Payment_client` int DEFAULT NULL,
  `Deliver_Code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Order`),
  KEY `FK_Orders_Client` (`Id_Client`),
  KEY `FK_Payment_Client` (`Id_Payment_client`),
  CONSTRAINT `FK_Orders_Client` FOREIGN KEY (`Id_Client`) REFERENCES `clients` (`Id_Client`),
  CONSTRAINT `FK_Payment_Client` FOREIGN KEY (`Id_Payment_client`) REFERENCES `payments_client` (`Id_Payment_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em processamento','Compra via aplicativo',NULL,1,1,NULL),(2,2,'Em processamento','compra via aplicativo',50,0,2,NULL),(3,3,'Confirmar',NULL,NULL,1,3,NULL),(4,4,'Em processamento','compra via web site',150,0,4,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_client`
--

DROP TABLE IF EXISTS `payments_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_client` (
  `Id_Payment_Client` int NOT NULL AUTO_INCREMENT,
  `Id_Client` int DEFAULT NULL,
  `Payment_Types` enum('Boleto','Cartao','Cartões') DEFAULT NULL,
  `Credict_Card_Num` varchar(19) DEFAULT NULL,
  `Data_venc` int DEFAULT NULL,
  `CVC` int DEFAULT NULL,
  `Limits` float DEFAULT NULL,
  `Payment_Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Payment_Client`),
  KEY `FK_Client_Payment` (`Id_Client`),
  CONSTRAINT `FK_Client_Payment` FOREIGN KEY (`Id_Client`) REFERENCES `clients` (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_client`
--

LOCK TABLES `payments_client` WRITE;
/*!40000 ALTER TABLE `payments_client` DISABLE KEYS */;
INSERT INTO `payments_client` VALUES (1,1,'Boleto',NULL,NULL,NULL,NULL,'Boleto'),(2,2,'Cartao','3846718364738461259',634,729,5000,'Roxinho'),(3,3,'Boleto',NULL,NULL,NULL,NULL,'Carnêzinho'),(4,4,'Cartões','0927384167830523489',936,293,7000,'Amarelinho'),(5,5,'Cartao','947235475103468304',629,912,2500,'Itaú');
/*!40000 ALTER TABLE `payments_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `Id_Po_Order` int NOT NULL,
  `Id_Po_Product` int NOT NULL,
  `Po_Quantity` int DEFAULT '1',
  `Po_Status` enum('Disponível','Em estoque') DEFAULT NULL,
  PRIMARY KEY (`Id_Po_Order`,`Id_Po_Product`),
  KEY `Fk_Order_Product_Order` (`Id_Po_Product`),
  CONSTRAINT `Fk_Order_Product_Order` FOREIGN KEY (`Id_Po_Product`) REFERENCES `products` (`Id_Product`),
  CONSTRAINT `FK_Product_Product_Order` FOREIGN KEY (`Id_Po_Order`) REFERENCES `orders` (`Id_Order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,1,4,'Disponível'),(1,4,5,'Disponível'),(2,2,6,'Disponível'),(3,1,1,'Disponível'),(3,2,1,'Disponível'),(3,7,3,'Disponível'),(4,5,1,'Disponível'),(4,6,2,'Disponível');
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seller`
--

DROP TABLE IF EXISTS `product_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seller` (
  `Id_Seller` int NOT NULL,
  `Id_Product` int NOT NULL,
  `Prod_Quantity` int DEFAULT '1',
  PRIMARY KEY (`Id_Product`,`Id_Seller`),
  KEY `FK_Product_Seller` (`Id_Seller`),
  CONSTRAINT `FK_Product_Product_Seller` FOREIGN KEY (`Id_Product`) REFERENCES `products` (`Id_Product`),
  CONSTRAINT `FK_Product_Seller` FOREIGN KEY (`Id_Seller`) REFERENCES `sellers` (`Id_Seller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seller`
--

LOCK TABLES `product_seller` WRITE;
/*!40000 ALTER TABLE `product_seller` DISABLE KEYS */;
INSERT INTO `product_seller` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `product_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_storage`
--

DROP TABLE IF EXISTS `product_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_storage` (
  `Id_Product_Storage` int NOT NULL AUTO_INCREMENT,
  `Id_Storage` int DEFAULT NULL,
  `Id_Product` int DEFAULT NULL,
  `Quantity` int DEFAULT '0',
  PRIMARY KEY (`Id_Product_Storage`),
  KEY `FK_Product_Storage` (`Id_Product`),
  KEY `FK_Storage_Product_Storage` (`Id_Storage`),
  CONSTRAINT `FK_Product_Storage` FOREIGN KEY (`Id_Product`) REFERENCES `products` (`Id_Product`),
  CONSTRAINT `FK_Storage_Product_Storage` FOREIGN KEY (`Id_Storage`) REFERENCES `storages` (`Id_Storage`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_storage`
--

LOCK TABLES `product_storage` WRITE;
/*!40000 ALTER TABLE `product_storage` DISABLE KEYS */;
INSERT INTO `product_storage` VALUES (1,1,2,1000),(2,2,1,50);
/*!40000 ALTER TABLE `product_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier` (
  `Id_Supplier` int NOT NULL,
  `Id_Product` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Id_Supplier`,`Id_Product`),
  KEY `FK_Product_Supplier` (`Id_Product`),
  CONSTRAINT `FK_Product_Supplier` FOREIGN KEY (`Id_Product`) REFERENCES `products` (`Id_Product`),
  CONSTRAINT `FK_Supplier_Product` FOREIGN KEY (`Id_Supplier`) REFERENCES `suppliers` (`Id_Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Id_Product` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(50) DEFAULT NULL,
  `Classification_kids` tinyint(1) DEFAULT '0',
  `Category` enum('Eletronico','Vestuário','Alimentos','Brinquedos','Móveis') DEFAULT NULL,
  `Evaluation` float DEFAULT '0',
  `Size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Product`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Fone de Ouvido',0,'Eletronico',4,NULL),(2,'Barbie Elsa',1,'Brinquedos',3,NULL),(3,'Body Carters',1,'Vestuário',5,NULL),(4,'Microfone Veo - youtuber',0,'Eletronico',0,NULL),(5,'Sofa retratil',0,'Móveis',3,'3x57x80'),(6,'Farinha de arroz',0,'Alimentos',2,NULL),(7,'Fire Stick Amazon',0,'Eletronico',3,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `Id_Seller` int NOT NULL AUTO_INCREMENT,
  `Corporative_Name` varchar(225) DEFAULT NULL,
  `Abs_Name` varchar(225) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `Contact` char(11) DEFAULT NULL,
  `Location` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`Id_Seller`),
  UNIQUE KEY `Unique_Cnpj_Seller` (`CNPJ`),
  UNIQUE KEY `Unique_Cpf_Seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Tech eletronics',NULL,'123456789456321',NULL,'21994687','Rio de Janeiro'),(2,'Botique Durgas',NULL,NULL,'123456783','219567895','Rio de Janeiro'),(3,'Kids World',NULL,'456789123654485',NULL,'1198657484','Sâo Paulo');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `Id_Storage` int NOT NULL AUTO_INCREMENT,
  `Adress` varchar(100) DEFAULT NULL,
  `Storage_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Storage`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
INSERT INTO `storages` VALUES (1,'Avenida dos Bobo, 0 , Barra da Tijuca - Rio de Janeiro','Estoque RIO'),(2,'Alameda anhanguera, 786, caracamba - Goiania','Estoque Gyn');
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `Id_Supplier` int NOT NULL AUTO_INCREMENT,
  `Corporative_Name` varchar(225) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `Contact` varchar(11) NOT NULL,
  PRIMARY KEY (`Id_Supplier`),
  UNIQUE KEY `Unique_Cnpj` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Ameida e filhos','123456789123456','21985474'),(2,'Eletronicos Silva','123456789123457','21985475'),(3,'Eletronicos Valma','123456789123458','21985476');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-08  9:21:53
