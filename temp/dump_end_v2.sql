-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: online_retail_store
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `qty` int DEFAULT '0',
  `cost` int DEFAULT '0',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (101,5,2322),(102,10,4025),(103,1,4676),(104,2,4275),(105,4,2020),(106,7,4692),(107,1,3092),(108,3,4765),(109,6,1158),(110,2,4601),(111,2,4927),(112,3,2774),(113,2,1195),(114,7,1218),(115,4,2935),(116,4,2974),(117,3,1906),(118,1,2709),(119,1,3398),(120,3,2490),(121,4,4688),(122,2,198),(123,1,3919),(124,4,580),(125,4,3326),(126,4,3692),(127,3,513),(128,2,3231),(129,1,516),(130,0,0),(131,3,3655),(132,0,0),(133,0,0),(134,0,0),(135,3,1744),(136,6,3937),(137,1,4582),(138,3,749),(139,2,4795),(140,5,2224),(141,0,0),(142,4,2770),(143,1,808),(144,0,0),(145,0,0),(146,0,0),(147,5,1138),(148,0,0),(149,1,1081),(150,4,2526),(155,0,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `item_id` int NOT NULL,
  `cart_id` int NOT NULL,
  `qty` int NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`item_id`,`cart_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`item_id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1159,106,3,138),(1159,109,2,92),(1159,122,2,92),(1637,112,3,195),(1637,140,4,260),(1637,147,1,65),(2146,147,2,112),(2290,102,2,104),(2290,106,4,208),(2290,114,2,104),(2290,136,2,104),(3897,110,2,78),(3897,127,1,39),(3897,137,1,39),(4040,116,1,42),(4040,124,4,168),(4233,102,4,308),(4233,107,1,77),(4233,115,4,308),(4294,113,2,124),(4294,149,1,62),(4987,111,2,126),(5322,102,3,261),(5322,105,4,348),(5322,125,4,348),(5322,129,1,87),(5384,103,1,73),(5384,118,1,73),(5394,127,2,84),(5394,131,3,126),(5394,136,4,168),(5611,139,2,182),(5611,140,1,91),(5611,143,1,91),(6096,142,4,352),(6951,147,2,140),(6951,150,4,280),(7177,102,1,70),(7177,121,4,280),(7802,101,2,68),(7802,108,3,102),(7802,126,4,136),(7802,135,3,102),(7815,114,2,64),(7815,116,3,96),(7815,120,3,96),(7815,138,3,96),(9009,104,2,138),(9009,117,3,207),(9009,123,1,69),(9364,101,3,147),(9364,109,4,196),(9364,119,1,49),(9864,114,3,186),(9864,128,2,124);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_cart_rel`
--

DROP TABLE IF EXISTS `cust_cart_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_cart_rel` (
  `cust_id` int NOT NULL,
  `cart_id` int NOT NULL,
  PRIMARY KEY (`cust_id`,`cart_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cust_cart_rel_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `cust_cart_rel_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_cart_rel`
--

LOCK TABLES `cust_cart_rel` WRITE;
/*!40000 ALTER TABLE `cust_cart_rel` DISABLE KEYS */;
INSERT INTO `cust_cart_rel` VALUES (1,101),(2,102),(3,103),(4,104),(5,105),(6,106),(7,107),(8,108),(9,109),(10,110),(11,111),(12,112),(13,113),(14,114),(15,115),(16,116),(17,117),(18,118),(19,119),(20,120),(21,121),(22,122),(23,123),(24,124),(25,125),(26,126),(27,127),(28,128),(29,129),(30,130),(31,131),(32,132),(33,133),(34,134),(35,135),(36,136),(37,137),(38,138),(39,139),(40,140),(41,141),(42,142),(43,143),(44,144),(45,145),(46,146),(47,147),(48,148),(49,149),(50,150),(55,155);
/*!40000 ALTER TABLE `cust_cart_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_order_rel`
--

DROP TABLE IF EXISTS `cust_order_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_order_rel` (
  `cust_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`cust_id`,`order_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `cust_order_rel_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `cust_order_rel_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order_rel`
--

LOCK TABLES `cust_order_rel` WRITE;
/*!40000 ALTER TABLE `cust_order_rel` DISABLE KEYS */;
INSERT INTO `cust_order_rel` VALUES (8,18841826),(14,23565811),(10,26016568),(1,27082611),(7,29880373),(13,43812146),(6,45405666),(11,48608181),(15,51893283),(2,54874630),(9,57363311),(3,60338287),(12,75339763),(4,76892876),(5,98326750),(55,98326752);
/*!40000 ALTER TABLE `cust_order_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone_no` bigint NOT NULL,
  `email` varchar(40) NOT NULL,
  `house_no` int NOT NULL,
  `locality` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `pin_code` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `valid_pc` CHECK ((`pin_code` between 100000 and 999999)),
  CONSTRAINT `valid_ph` CHECK ((`phone_no` between 1000000000 and 9999999999))
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Melinde','Cammacke',7193342713,'mcammacke0@examiner.com',19323,'8th','Colorado Springs','Colorado','United States',809351,'mcammacke0','ymknkeQ'),(2,'Minna','Westgate',7024360965,'mwestgate1@infoseek.co.jp',1,'Dapin','Las Vegas','Nevada','United States',891101,'mwestgate1','TgtwTEb2'),(3,'Hewe','Tolputt',8597161335,'htolputt2@paypal.com',90352,'Red Cloud','Lexington','Kentucky','United States',405241,'htolputt2','tFT2qaR'),(4,'Ekaterina','Ivancevic',5867671636,'eivancevic3@nbcnews.com',8,'Bunting','Warren','Michigan','United States',480921,'eivancevic3','a02JhVeBgEHj'),(5,'Georgiana','Goadby',9184128870,'ggoadby4@cnn.com',0,'Surrey','Tulsa','Oklahoma','United States',741841,'ggoadby4','L82TvrV3nQh'),(6,'Aurie','Hubatsch',8086380469,'ahubatsch5@google.it',13,'Raven','Honolulu','Hawaii','United States',968501,'ahubatsch5','cQfaCZshfRbn'),(7,'Minny','Brightwell',5052218912,'mbrightwell6@bbc.co.uk',9869,'Grayhawk','Santa Fe','New Mexico','United States',875051,'mbrightwell6','r0udqVvE'),(8,'Christoffer','Klemensiewicz',4103609411,'cklemensiewicz7@europa.eu',494,'Atwood','Baltimore','Maryland','United States',212811,'cklemensiewicz7','t4RSoHt966wf'),(9,'Jaye','Lehmann',8132205203,'jlehmann8@weather.com',60115,'Eastwood','Tampa','Florida','United States',336101,'jlehmann8','Ltr5ptzfB3S'),(10,'Renard','Simmonite',7019151971,'rsimmonite9@com.com',48,'Redwing','Fargo','North Dakota','United States',581061,'rsimmonite9','k6EUBtCOB'),(11,'Marchelle','Schwander',5176484002,'mschwandera@xing.com',64859,'Glacier Hill','Lansing','Michigan','United States',489301,'mschwandera','c6VmLiT1w'),(12,'Olivier','Sam',4146905898,'osamb@ebay.co.uk',9958,'Hollow Ridge','Milwaukee','Wisconsin','United States',532851,'osamb','wKjQSuEFkmH'),(13,'Elfrieda','Scurman',2402343310,'escurmanc@google.com.au',31375,'South','Gaithersburg','Maryland','United States',208831,'escurmanc','iwmdH45va'),(14,'Allyce','Kleinlerer',5595331144,'akleinlererd@cornell.edu',70755,'Redwing','Fresno','California','United States',937731,'akleinlererd','frvF3BBa'),(15,'Rosalind','Kremer',7187032803,'rkremere@paypal.com',4,'East','Bronx','New York','United States',104741,'rkremere','QGMcUrsZ'),(16,'Eleni','Karby',3103042086,'ekarbyf@google.com.br',3337,'Talmadge','Santa Monica','California','United States',904101,'ekarbyf','gXV4j1qSh'),(17,'Charmine','Pudden',7862024664,'cpuddeng@guardian.co.uk',78490,'3rd','Miami','Florida','United States',332451,'cpuddeng','96lbiSd2wesg'),(18,'Enrika','Bartomeu',5014769885,'ebartomeuh@e-recht24.de',93417,'Golden Leaf','Little Rock','Arkansas','United States',722221,'ebartomeuh','Zmz7ImDq'),(19,'Kristyn','Stabbins',6028335184,'kstabbinsi@earthlink.net',5,'Prairie Rose','Phoenix','Arizona','United States',850671,'kstabbinsi','prk4cOi08V'),(20,'Washington','Grayham',7138739198,'wgrayhamj@ask.com',3358,'Grayhawk','Houston','Texas','United States',772501,'wgrayhamj','pittdZ2U'),(21,'Goddard','Toderbrugge',3158846137,'gtoderbruggek@un.org',79,'Armistice','Syracuse','New York','United States',132051,'gtoderbruggek','guCroZrhz'),(22,'Heinrik','Ygoe',3234539246,'hygoel@storify.com',0,'Lighthouse Bay','Los Angeles','California','United States',900201,'hygoel','yBxPezW'),(23,'Sandy','Gallety',5048271297,'sgalletym@mac.com',9,'Goodland','New Orleans','Louisiana','United States',701871,'sgalletym','lISoRrMed'),(24,'Kerry','Beardmore',6785769259,'kbeardmoren@nih.gov',14,'Pond','Atlanta','Georgia','United States',303401,'kbeardmoren','Bi6566Wbf'),(25,'Ilaire','Coleridge',6505676348,'icoleridgeo@bbb.org',72360,'Sauthoff','Palo Alto','California','United States',943021,'icoleridgeo','BmW1WRDIUnK'),(26,'Joshia','Give',5717242247,'jgivep@naver.com',86,'Milwaukee','Vienna','Virginia','United States',221841,'jgivep','qhjEdUVg'),(27,'Enrika','Lambdin',7133382154,'elambdinq@delicious.com',95,'Esch','Houston','Texas','United States',772231,'elambdinq','YwwzSJ7Si4n'),(28,'Allianora','L\'Archer',2603881257,'alarcherr@sogou.com',642,'Jenna','Fort Wayne','Indiana','United States',468141,'alarcherr','xqwbo2y8nF'),(29,'Felic','Gawler',8601982559,'fgawlers@oakley.com',145,'Texas','Hartford','Connecticut','United States',616011,'fgawlers','YFseVHYIjkrx'),(30,'Raina','Myderscough',9893160289,'rmyderscought@google.it',84,'Stang','Saginaw','Michigan','United States',486091,'rmyderscought','tjYtCwqH37'),(31,'Wood','Figiovanni',6087811650,'wfigiovanniu@auda.org.au',5,'Monterey','Madison','Wisconsin','United States',537161,'wfigiovanniu','xMKqA1xPiyle'),(32,'Malena','Chiddy',6263476220,'mchiddyv@acquirethisname.com',8,'Surrey','Pasadena','California','United States',911171,'mchiddyv','mUyBdWlR'),(33,'Yanaton','Swatten',3142315180,'yswattenw@spotify.com',96,'Messerschmidt','Saint Louis','Missouri','United States',631161,'yswattenw','WGp7vWP'),(34,'Micah','Athersmith',8509699156,'mathersmithx@google.co.jp',4,'Warbler','Tallahassee','Florida','United States',323091,'mathersmithx','gl6kvXZEt'),(35,'Marie','Doram',9151375074,'mdoramy@blogs.com',4,'Fisk','El Paso','Texas','United States',885351,'mdoramy','3CU4Asn'),(36,'Alec','Kimbling',9097028920,'akimblingz@irs.gov',125,'Northwestern','Pomona','California','United States',917971,'akimblingz','PgPCE4W'),(37,'Oliy','Sharp',7181399492,'osharp10@cyberchimps.com',7960,'Dorton','Brooklyn','New York','United States',112361,'osharp10','5ji0o3F'),(38,'Annalee','Faich',7195455086,'afaich11@plala.or.jp',8490,'Lawn','Colorado Springs','Colorado','United States',809951,'afaich11','QVHjOA'),(39,'Corella','Wones',7082023548,'cwones12@theatlantic.com',3466,'Lien','Schaumburg','Illinois','United States',601931,'cwones12','6jkw03nq8'),(40,'Nero','Baraclough',4136697977,'nbaraclough13@goo.gl',80,'Sunbrook','Springfield','Massachusetts','United States',112911,'nbaraclough13','4WPVKnCz'),(41,'Shauna','Shovlin',8473391081,'sshovlin14@cyberchimps.com',2585,'Briar Crest','Chicago','Illinois','United States',606301,'sshovlin14','DhzRCaHv'),(42,'Jobyna','Milbank',8166700398,'jmilbank15@yellowbook.com',27,'Meadow Ridge','Kansas City','Missouri','United States',641421,'jmilbank15','uS3PcZT'),(43,'Hesther','McArt',9186261242,'hmcart16@who.int',5,'Oxford','Tulsa','Oklahoma','United States',741701,'hmcart16','PLdxJm6uP'),(44,'Jessie','Stubbley',2161956965,'jstubbley17@arstechnica.com',9,'Nancy','Cleveland','Ohio','United States',441301,'jstubbley17','7VDds5cV'),(45,'Norrie','Scroyton',2695000091,'nscroyton18@slate.com',432,'Iowa','Battle Creek','Michigan','United States',490181,'nscroyton18','oPnsoXk8SvKP'),(46,'Simona','Jowers',3194690753,'sjowers19@cpanel.net',801,'Nobel','Cedar Rapids','Iowa','United States',524051,'sjowers19','C8ViO5k'),(47,'Karina','Godby',9132454091,'kgodby1a@patch.com',4066,'Coolidge','Shawnee Mission','Kansas','United States',662201,'kgodby1a','6ICLhHtO'),(48,'Rubetta','Flett',5049506892,'rflett1b@unc.edu',8,'Lawn','Metairie','Louisiana','United States',700051,'rflett1b','jTlwIt5K7Sx'),(49,'Jelene','Clementet',2179181304,'jclementet1c@jimdo.com',824,'Birchwood','Springfield','Illinois','United States',627051,'jclementet1c','m4etagSpjYWW'),(50,'Sayre','Gundry',4044264552,'sgundry1d@washingtonpost.com',906,'Charing Cross','Lawrenceville','Georgia','United States',302451,'sgundry1d','9KKvE4F5eT'),(51,'sample_name','sample_last_name',1234567890,'sample@email.com',43,'slf','ffgj','fifgr','diuf',375545,'uname','pwd'),(55,'fname1','lname1',3948454422,'mail@mail.com',495,'vfjn','iofgn','fjgrnhk','dkoj',359532,'uname1','pwd');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone_no` bigint NOT NULL,
  `email_id` varchar(40) NOT NULL,
  `doj` date NOT NULL,
  `house_no` int NOT NULL,
  `locality` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `pin_code` int NOT NULL,
  `dob` date NOT NULL,
  `department` varchar(30) NOT NULL,
  `salary` int NOT NULL,
  `gender` char(1) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `pass_word` varchar(64) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `minsalary` CHECK ((`salary` >= 10000)),
  CONSTRAINT `valid_gen` CHECK ((`gender` in (_utf8mb4'm',_utf8mb4'f',_utf8mb4'o'))),
  CONSTRAINT `valid_pce` CHECK ((`pin_code` between 100000 and 999999)),
  CONSTRAINT `valid_phe` CHECK ((`phone_no` between 1000000000 and 9999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (10528,'Cristiano','Malinowski',7433676902,'cmalinowskiz@shoppx24.com','2017-09-19',799,'Linden','Bowie','Maryland','USA',997758,'1999-08-06','Marketing',4168301,'f','cmalinowskiz','735792bbf0027d0a048e5d59ed2ab9b178f366d36b9cd4caad43b29885b93d70'),(10615,'Alexandr','Stut',3555459788,'astut4@shoppx24.com','2015-04-02',744,'Truax','Tampa','Florida','USA',254832,'1987-03-10','Warehouse',3443569,'m','astut4','b66e1f9155f765a5906e3d6e96ddcb9ecbbba7a70b6c877f01139519d7dc0b05'),(12541,'Jacquenetta','Ballantine',9761776788,'jballantine1b@shoppx24.com','1999-08-08',381,'Forest Run','Scottsdale','Arizona','USA',759521,'1981-04-13','IT',3511443,'m','jballantine1b','0b2f90f66de3701ac90703f981a0c4d602f527babdcb3762b5bebf6de65197dd'),(12650,'Lilly','Jobbings',8772412474,'ljobbingse@shoppx24.com','2011-04-10',143,'Annamark','Washington','District of Columbia','USA',854775,'1973-11-07','Management',1756648,'f','ljobbingse','38462944ff3745cfac3c1928419850fcc1eb9cee57e3ba577e14612d90221d4a'),(14576,'Andy','Conibere',8926147571,'aconibere13@shoppx24.com','2021-03-04',275,'Talisman','Washington','District of Columbia','USA',848273,'1982-08-11','IT',1629213,'f','aconibere13','d0211497bffab1b4a5668f725325b0afc2cba851eebbc10541d2973b1e68a987'),(16029,'Gayla','Rogan',8477311168,'grogan2@shoppx24.com','2002-10-27',730,'Kim','Seattle','Washington','USA',793476,'1964-08-14','Marketing',2386872,'m','grogan2','6053efd6bf3f701d55122c743092b4bff6704d3340c1eaf4a239e4e8222425a7'),(18567,'Abba','Godbold',2618654722,'agodbold17@shoppx24.com','1990-02-18',832,'Karstens','Peoria','Illinois','USA',625846,'1975-12-05','IT',3581262,'m','agodbold17','a1fc4b4ccdd74bfc7077a23ba597caf2cef66163b2e3d035ef221c939f137cf0'),(21499,'Ashbey','Curnow',8531318978,'acurnowk@shoppx24.com','2000-07-07',566,'Reinke','Bronx','New York','USA',734957,'1961-12-26','IT',2377464,'m','acurnowk','707c8b8c0daca3d652be4f438eb728f422ca701ea2d9cc8d40491b6d96ce1c84'),(21783,'Jeannette','Garbett',1821951566,'jgarbetti@shoppx24.com','2009-04-15',681,'Caliangt','Houston','Texas','USA',985722,'1961-07-09','IT',3749792,'m','jgarbetti','8d77b7ad72889a6da981d07f3fe3cb66b06ef7c8f8ea5d3ce5a101a81bfe532d'),(22285,'Sandie','Pimlock',8673175340,'spimlock1a@shoppx24.com','2018-04-04',532,'Hermina','Detroit','Michigan','USA',585923,'1991-03-28','Management',3569763,'m','spimlock1a','5865d874ff8e757e1b40f990b191832e5da6cb42debcba9fac7ecc14e0cf312c'),(26200,'Gonzales','Cartmell',5289465975,'gcartmell12@shoppx24.com','2020-07-08',724,'Cherokee','El Paso','Texas','USA',804351,'1963-09-25','Customer_service',409560,'f','gcartmell12','f713cc6c0efea0bf347de0762ef1438ce4f87bf0e31f04ef2e7ea2b15c4c5cec'),(27184,'Janaya','Dimbylow',1052265258,'jdimbylow16@shoppx24.com','2015-08-10',765,'Forster','Fort Wayne','Indiana','USA',834656,'1986-03-19','IT',2549190,'m','jdimbylow16','d31d82de62f5dc33ce1aea354b2957b70118c75756b117569a21c8b15ce1bf27'),(29203,'Nerita','Mountfort',1582963534,'nmountfortm@shoppx24.com','2009-10-20',849,'Kim','Saint Louis','Missouri','USA',836608,'1970-12-09','Customer_service',3566119,'f','nmountfortm','18a9671944b1f38218df3223c21d4d2e39c1dac16b7d20da69c28b55dd45f7c9'),(31515,'Elly','Lease',6831069277,'elease7@shoppx24.com','2018-01-17',767,'Toban','Columbus','Ohio','USA',560452,'1973-01-08','IT',1242319,'f','elease7','b4a454e36d1438c0501f0f90d28fe523b76484ce7c71519d04c7774e557bce77'),(32767,'Dionysus','Begent',8221804152,'dbegent1@shoppx24.com','2010-09-24',914,'Lunder','Boca Raton','Florida','USA',903079,'1969-05-25','IT',2579216,'m','dbegent1','5ed657559793695b89bccb0363a30f557d2f4e8e39f61b4f3c00ea9de47b03d9'),(35951,'Kikelia','Harraway',1877548995,'kharraway0@shoppx24.com','2020-01-29',290,'Helena','San Antonio','Texas','USA',836649,'1991-01-11','Accounts',4393547,'m','kharraway0','c0f98ab67a0bf315d84c5f626475eb26577090bd9801858c1ed01d8537e0cb11'),(39977,'Babb','Bugg',1727739800,'bbugg9@shoppx24.com','2004-04-24',971,'Warner','Kalamazoo','Michigan','USA',884958,'1983-09-09','Accounts',4429210,'m','bbugg9','7b32a492afdbe4f1a1bd70deb0e69f46b4f226583bb689839ad3f9316f97b6e6'),(43664,'Willi','Ousley',7083784084,'wousleya@shoppx24.com','2009-06-09',56,'Jenifer','Amarillo','Texas','USA',501732,'1988-01-30','Warehouse',1780393,'f','wousleya','be264e6394568d82b3c5a248000b95d6750a8790a0a95f2236565d45b6bdb6ab'),(46167,'Perle','Clews',3162408614,'pclewsn@shoppx24.com','2000-02-19',717,'Commercial','New Orleans','Louisiana','USA',586701,'1968-06-07','IT',3724673,'m','pclewsn','960483172261ec2c3b3cf87b1246750259a3206ebc6174166fb4fe79024c16ea'),(52643,'Alphonse','Maggiore',2574602363,'amaggiore8@shoppx24.com','2004-05-22',852,'Melvin','Longview','Texas','USA',568041,'1967-12-14','Marketing',1909539,'m','amaggiore8','2fe1edb183843115a31bc8e240469f5e064c1b6308cc3e53d9d71c5066a8398f'),(55419,'Peter','Persich',1157364192,'ppersichv@shoppx24.com','2013-10-28',688,'Thierer','Topeka','Kansas','USA',951896,'1984-08-15','Warehouse',2308141,'f','ppersichv','cc6117ceac031cdbca32238d658c4aa2a2e7e9e37b1828f2531187d99f771a8a'),(57388,'Osbourn','Wyldbore',9354839752,'owyldborey@shoppx24.com','1997-10-05',975,'Merrick','Tampa','Florida','USA',827447,'1980-11-23','Warehouse',2894406,'m','owyldborey','aeeef5806386069d3ac1363221c95d3cac4fd9a11c44fba678132d7fdaa09116'),(59571,'Conni','Brend',3914417424,'cbrendc@shoppx24.com','2007-06-26',138,'Waxwing','Topeka','Kansas','USA',513696,'1965-05-27','IT',3966393,'m','cbrendc','a38c9c34d32c74a053aa07ba3dc19a7cabc0c2a1e70a4340c14fb5ddcdac6df2'),(62151,'Roderick','Guichard',6343022381,'rguichards@shoppx24.com','1990-12-26',217,'Toban','Sacramento','California','USA',622352,'1968-11-30','Customer_service',706667,'m','rguichards','5e47ad433c4db25509b20c68c7a5bb0f2daea6e5b56118a3e9bed667fcef7f06'),(64517,'Abba','O\' Flaherty',4038724163,'aoflaherty3@shoppx24.com','2021-06-06',384,'Memorial','Tampa','Florida','USA',716820,'1984-01-23','Customer_service',1768351,'f','aoflaherty3','27b07a02acea8d0ea12533755aaf1475e71848d5ee9e6c71733a192655c2881c'),(64715,'Chery','Grzelak',4029950037,'cgrzelakb@shoppx24.com','2011-05-16',856,'Pine View','Cincinnati','Ohio','USA',924505,'1984-05-26','Management',4685334,'m','cgrzelakb','e2716fbf31611382de5b14bf30127b0755b5e79e948d193c0e4c8c348846bbc5'),(65103,'Alexis','Nafzger',6302872692,'anafzgerx@shoppx24.com','2008-10-04',822,'Continental','Hartford','Connecticut','USA',170407,'1981-08-19','Accounts',2885158,'m','anafzgerx','408b1c8626b8e916bae789f98a3117877d5640d36d675b8e7b535f3231e28d6a'),(68676,'Berti','Jeandin',7961253239,'bjeandin6@shoppx24.com','2007-07-28',140,'Carey','Aurora','Colorado','USA',422849,'1972-01-28','IT',2009403,'m','bjeandin6','64cb4eb37982b3d0c7ff2fc253dc671a50ece827580df05353d69b61429012e8'),(70093,'Lynelle','McTavy',7964676759,'lmctavyg@shoppx24.com','2003-09-19',714,'Delladonna','Minneapolis','Minnesota','USA',645895,'1968-02-28','Management',3843821,'m','lmctavyg','d42f8692d6aea1a73c1c30b9d44b16375c51f8fadb1f093eeeb9d814a7d9e2ee'),(73649,'Kacey','Maultby',3991037583,'kmaultbyt@shoppx24.com','1993-08-10',437,'Melrose','Daytona Beach','Florida','USA',958209,'1971-07-23','Accounts',677085,'f','kmaultbyt','4da90a073870353d1f0774dbf6ba09c233518e0919cc3a4ebc48f8eeacc1cef8'),(73925,'Yancey','MacCosty',4685795145,'ymaccostyq@shoppx24.com','1999-12-06',173,'Oak','Saint Louis','Missouri','USA',470625,'1976-03-07','Management',3994905,'f','ymaccostyq','2532141345d0d46ef03ad6fc134d4e2b6e55e70b6b749679d5a0d86a9b46a2ee'),(73939,'Banky','Wooldridge',5182617799,'bwooldridge1c@shoppx24.com','2017-12-21',251,'Ridgeway','San Bernardino','California','USA',119688,'1995-11-01','Management',384546,'f','bwooldridge1c','d87a736a7eaf5615d802d666bb3eaba0d1bf315b90c778ecbcb47f390ab65fd6'),(74623,'Wes','Tortis',3394016881,'wtortis1d@shoppx24.com','1996-11-28',254,'South','Houston','Texas','USA',194716,'1982-06-19','Marketing',625789,'f','wtortis1d','ad2fa9c2c683c5bad6acd483fd3b8ddd863783dbc650778dbc6296a9815c4481'),(77104,'Way','Justice',2822507703,'wjustice14@shoppx24.com','2000-08-27',437,'Sherman','Pompano Beach','Florida','USA',974260,'1978-11-03','Customer_service',2883761,'m','wjustice14','cc12990f405f2ff70ac814ff7896eb32cb6f8ada881698490ed676c0a14b094a'),(79002,'Aindrea','O\'Duane',8656483893,'aoduanef@shoppx24.com','1996-11-22',101,'Mandrake','Denver','Colorado','USA',993314,'1970-02-08','Customer_service',4502473,'m','aoduanef','118ea9b160cea2cd1c2e6cbd7f26cfbfac0e788eee88c11c37dc0d6687ea0bfc'),(79829,'Ave','Plumbe',3781024581,'aplumber@shoppx24.com','2005-07-01',162,'Bluejay','Los Angeles','California','USA',481898,'1992-08-23','Warehouse',3162993,'m','aplumber','cb708a62c9b1303641e09383afddbe2f881386431932cc746216e34ebf7ec03e'),(82731,'Archibold','Rappport',5008782538,'arappport19@shoppx24.com','2013-04-24',629,'Kim','Saint Petersburg','Florida','USA',323051,'1960-06-22','Warehouse',4026386,'m','arappport19','9514184fc19163e436d15d87c5321fad903c7dad0f4192d8098b0d868f014570'),(83353,'Wang','Pollitt',5619376996,'wpollittu@shoppx24.com','2009-03-26',956,'Farragut','Chicago','Illinois','USA',302618,'1986-06-25','Accounts',4215928,'m','wpollittu','79dcc61d94b43bf1ff54ad313da234e245562a4630d497d40c8d74a50953cbaf'),(84473,'Rosalind','Ditchett',7379741034,'rditchettl@shoppx24.com','2008-12-03',259,'Park Meadow','Rochester','New York','USA',923208,'1974-09-23','Management',781305,'m','rditchettl','85b7cdd40c886f84afadd0bdae414260244899e2b9fc107bb008dec08763bb5c'),(90057,'Marie-jeanne','Arstingall',2289176096,'marstingallw@shoppx24.com','2005-05-16',176,'Corscot','Arlington','Texas','USA',903594,'1975-06-26','Management',1914728,'f','marstingallw','c732786a51ddbc35327838aca8c4fff1d218615574781098d88757702354bed4'),(90105,'Aidan','McGarrie',4201333284,'amcgarrie11@shoppx24.com','2001-04-15',360,'Pearson','Kansas City','Missouri','USA',416471,'1991-07-17','Accounts',2106847,'f','amcgarrie11','81ea4975d5ae38bbbed91adeac87941302b6f5aeb2aa63e5b501b093d4b0f9ee'),(91024,'Matilde','De Witt',9835295796,'mdewittj@shoppx24.com','1991-12-11',26,'Arapahoe','Jefferson City','Missouri','USA',262621,'1962-03-15','Management',2245261,'m','mdewittj','60cca9b00fca4254ee36de698ee4500c5c5eb5091d7f1449f8707de6698d4b3d'),(91069,'Emmie','Sunnex',4274670476,'esunnexp@shoppx24.com','2005-11-12',888,'Kipling','Cincinnati','Ohio','USA',849509,'1976-12-24','Customer_service',4243202,'m','esunnexp','87f013e7fda5bca3c598aca11d376c2734245818596e0d8f6881ec3e9eade853'),(91089,'Lionello','Baake',4475144192,'lbaake5@shoppx24.com','2008-09-11',579,'Merrick','Wilmington','North Carolina','USA',759238,'1975-08-11','Management',3634989,'m','lbaake5','b75bc3328eede56c4818863a9a1cf9729fd827020c6d179fed28321f8cd048d5'),(91869,'Kyrstin','Crockley',8963581130,'kcrockleyh@shoppx24.com','1995-12-26',180,'Crownhardt','Berkeley','California','USA',537977,'1990-10-05','Customer_service',4097391,'f','kcrockleyh','829b2d7044a4765beaa54c27bec4519ae498f101eca5f5a6cff8657962fba53e'),(92063,'Sheena','Cragoe',8057807697,'scragoeo@shoppx24.com','2017-05-01',712,'Trailsway','Riverside','California','USA',295271,'1975-09-24','Management',2495989,'m','scragoeo','3b875a963228ae3daaccd7fb61d472f557cab50db38990d0cbd337c9b044b3b2'),(92913,'Paolina','Van Brug',6072571563,'pvanbrug10@shoppx24.com','2011-08-15',166,'Green Ridge','Saint Paul','Minnesota','USA',124631,'1980-12-03','Customer_service',1974811,'m','pvanbrug10','9b2e812bbdc7b5005340636d7c14e1bc03ebd443f54befb2e9c64414dd870bab'),(94775,'Sib','Clapperton',9592037963,'sclapperton15@shoppx24.com','2012-11-12',341,'Gina','New York City','New York','USA',709952,'1996-03-13','Management',4046263,'m','sclapperton15','40663a921e01371d60cdd114571911c54ff532b587cfd0ab734a03ed1bb3e403'),(98441,'Noland','Bullcock',6154625166,'nbullcockd@shoppx24.com','2019-04-04',328,'Mayer','Evansville','Indiana','USA',573477,'1978-12-05','Accounts',2903810,'m','nbullcockd','c1ca8becf04cd7ac4b6052bbc3d99f983c0a0e36d57ef8295a7f4ef66e63792a'),(99759,'Aubree','Beavors',9076336408,'abeavors18@shoppx24.com','2019-02-01',912,'Dovetail','Chicago','Illinois','USA',909752,'1977-11-15','IT',2549678,'f','abeavors18','6361fdb7701dd3e7fa5890682ae225da423708e8ffd02620cc286dddc2597123');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `item_id` int NOT NULL DEFAULT '0',
  `company_name` varchar(30) NOT NULL,
  `item_name` varchar(30) NOT NULL DEFAULT 'abc',
  `qty` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '1',
  `category` varchar(30) NOT NULL DEFAULT 'abc',
  `discount` int DEFAULT '0',
  PRIMARY KEY (`item_id`),
  CONSTRAINT `valid_discount` CHECK ((`discount` between 0 and 30)),
  CONSTRAINT `valid_price` CHECK ((`price` > 0)),
  CONSTRAINT `valid_qty` CHECK ((`qty` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1159,'abc','Orange_juice_500ml',68,49,'Grocery',5),(1232,'abc','Window_AC',12,34,'Electronics',5),(1637,'abc','1kg_bananas',58,70,'Grocery',7),(1746,'abc','BP_Monitor',34,39,'Health',0),(2146,'abc','1kg_Tomatoes',44,61,'Grocery',7),(2221,'abc','The_Alchemist',68,48,'Books',5),(2290,'abc','Drill_Machine',33,52,'Tools',0),(2552,'abc','Parasite',29,54,'Movies',10),(3305,'abc','Dark_blue_blazer',48,62,'Fashion',8),(3897,'abc','Laptop_8GB',78,43,'Electronics',10),(4040,'abc','Football',45,47,'Sports',10),(4233,'abc','Lemonade_500ml',44,85,'Grocery',10),(4287,'abc','Mobile_phone',13,88,'Electronics',8),(4288,'abc','Black_shoes',28,51,'Shoes',6),(4294,'abc','Toy_car',64,68,'Kids',8),(4410,'abc','Play_station_5',88,94,'Games',0),(4467,'abc','Windows_11',55,48,'Software',9),(4648,'abc','Kids_t_shirt',29,58,'Kids',10),(4987,'abc','Paint',42,66,'Home',5),(5068,'abc','Mens_watch',28,45,'Fashion',10),(5322,'abc','1kg_apples',58,87,'Grocery',0),(5376,'abc','DFF_Toy',80,32,'Kids',7),(5384,'abc','Black_trousers',14,78,'Fashion',6),(5394,'abc','Half_sleeve_tshirt',42,47,'Fashion',9),(5420,'abc','Laptop_16GB',49,35,'Electronics',6),(5537,'abc','Tennis_racket',87,46,'Sports',6),(5611,'abc','55_inch_TV',2,97,'Electronics',6),(6096,'abc','Womens_watch',68,96,'Fashion',8),(6396,'abc','CDS_Toy',89,33,'Kids',9),(6622,'abc','Tomato_ketchup',79,33,'Grocery',5),(6627,'abc','Metal_Sheet',97,48,'Industrial',7),(6648,'abc','Eggs_250g',65,72,'Grocery',9),(6899,'abc','Headphones',98,82,'Electronics',10),(6951,'abc','Antiseptic',36,79,'Health',10),(7177,'abc','Bread_250g',10,70,'Grocery',0),(7214,'abc','Diamond_ring',98,71,'Jewelry',10),(7529,'abc','AXZ_Medicine',65,35,'Health',10),(7802,'abc','Door_lock',82,34,'Home',0),(7815,'abc','Cricket_bat',41,35,'Sports',7),(8003,'abc','Lipstick',31,71,'Fashion',10),(8129,'abc','White_Shirt',11,71,'Fashion',7),(8171,'abc','Screwdriver',29,75,'Tools',9),(8942,'abc','CX_Machine',76,83,'Industrial',7),(9009,'abc','1.5ton_AC',9,73,'Electronics',5),(9147,'abc','Brown_shoes',54,82,'Shoes',6),(9364,'abc','XCD_Album',70,53,'Music',7),(9368,'abc','Cricket_bat',53,76,'Sports',10),(9385,'abc','Kids_shoes',27,99,'Kids',6),(9484,'abc','XYZ_Toy',45,92,'Kids',10),(9864,'abc','Fitness_band',88,68,'Electronics',6);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `qty` int NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`item_id`,`order_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`item_id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1159,12334545,18,2300),(1159,98326752,3,49),(1232,12334545,18,2300),(1637,26016568,20,1400),(1746,27082611,1,39),(2221,18841826,1,48),(2290,60338287,4,208),(2552,23565811,1,54),(4288,76892876,1,51),(5384,43812146,1,78),(5420,54874630,2,70),(5611,51893283,1,97),(6627,57363311,9,630),(7529,98326750,10,350),(7802,48608181,2,68),(7815,75339763,2,70),(8129,45405666,3,213),(9364,29880373,1,53);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `red_qty_on_ord` AFTER INSERT ON `order_item` FOR EACH ROW begin update inventory set qty = qty - (select qty from order_item where order_id = new.order_id and item_id = new.item_id) where item_id = new.item_id ; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `cost` int NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `payment_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `payment_id` (`payment_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  CONSTRAINT `valid_status` CHECK ((`order_status` in (_utf8mb4'delivered',_utf8mb4'shipped',_utf8mb4'confirmed')))
) ENGINE=InnoDB AUTO_INCREMENT=98326753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (12334545,'2022-01-23',230,'delivered',232323),(18841826,'2021-09-10',419,'delivered',41408364),(23565811,'2021-10-22',497,'delivered',59071692),(26016568,'2020-06-27',518,'confirmed',65797678),(27082611,'2021-11-28',872,'delivered',32311132),(29880373,'2019-10-25',935,'delivered',56750302),(43812146,'2019-10-18',959,'delivered',69103155),(45405666,'2022-02-20',323,'delivered',77762833),(48608181,'2019-12-10',934,'delivered',46772154),(51893283,'2019-11-16',567,'delivered',32649471),(54874630,'2020-01-17',353,'shipped',19100477),(57363311,'2019-10-06',793,'shipped',69657135),(60338287,'2021-06-01',643,'delivered',76408994),(75339763,'2020-01-08',736,'delivered',64972297),(76892876,'2021-04-14',403,'shipped',95548904),(98326750,'2021-10-29',505,'delivered',13456521),(98326752,'2022-04-21',1000,'confirmed',95548907);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(30) NOT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `valid_paymethod` CHECK ((`payment_method` in (_utf8mb4'cod',_utf8mb4'credit_card',_utf8mb4'debit_card',_utf8mb4'neft')))
) ENGINE=InnoDB AUTO_INCREMENT=95548908 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (232323,'credit_card'),(13456521,'debit_card'),(19100477,'credit_card'),(32311132,'cod'),(32649471,'credit_card'),(41408364,'credit_card'),(46772154,'credit_card'),(56750302,'debit_card'),(59071692,'debit_card'),(64972297,'neft'),(65797678,'neft'),(69103155,'debit_card'),(69657135,'credit_card'),(76408994,'debit_card'),(77762833,'credit_card'),(95548904,'cod'),(95548907,'credit_card');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 15:37:38
