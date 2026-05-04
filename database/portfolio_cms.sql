-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio_cms
-- ------------------------------------------------------
-- Server version	8.0.44

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(1,'Moderators');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,1),(7,1,102),(8,1,103),(6,1,104),(10,1,105),(14,1,106),(15,1,107),(16,1,108),(18,1,109),(1,2,1),(4,2,102),(5,2,103),(3,2,104),(9,2,105),(11,2,106),(12,2,107),(13,2,108),(17,2,109);
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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can access Wagtail admin',3,'access_admin'),(2,'Can add locale',5,'add_locale'),(3,'Can change locale',5,'change_locale'),(4,'Can delete locale',5,'delete_locale'),(5,'Can view locale',5,'view_locale'),(6,'Can add site',6,'add_site'),(7,'Can change site',6,'change_site'),(8,'Can delete site',6,'delete_site'),(9,'Can view site',6,'view_site'),(10,'Can add model log entry',7,'add_modellogentry'),(11,'Can change model log entry',7,'change_modellogentry'),(12,'Can delete model log entry',7,'delete_modellogentry'),(13,'Can view model log entry',7,'view_modellogentry'),(14,'Can add collection view restriction',8,'add_collectionviewrestriction'),(15,'Can change collection view restriction',8,'change_collectionviewrestriction'),(16,'Can delete collection view restriction',8,'delete_collectionviewrestriction'),(17,'Can view collection view restriction',8,'view_collectionviewrestriction'),(18,'Can add collection',9,'add_collection'),(19,'Can change collection',9,'change_collection'),(20,'Can delete collection',9,'delete_collection'),(21,'Can view collection',9,'view_collection'),(22,'Can add group collection permission',10,'add_groupcollectionpermission'),(23,'Can change group collection permission',10,'change_groupcollectionpermission'),(24,'Can delete group collection permission',10,'delete_groupcollectionpermission'),(25,'Can view group collection permission',10,'view_groupcollectionpermission'),(26,'Can add uploaded file',11,'add_uploadedfile'),(27,'Can change uploaded file',11,'change_uploadedfile'),(28,'Can delete uploaded file',11,'delete_uploadedfile'),(29,'Can view uploaded file',11,'view_uploadedfile'),(30,'Can add reference index',12,'add_referenceindex'),(31,'Can change reference index',12,'change_referenceindex'),(32,'Can delete reference index',12,'delete_referenceindex'),(33,'Can view reference index',12,'view_referenceindex'),(34,'Can add page',1,'add_page'),(35,'Can change page',1,'change_page'),(36,'Can delete page',1,'delete_page'),(37,'Can view page',1,'view_page'),(38,'Delete pages with children',1,'bulk_delete_page'),(39,'Lock/unlock pages you\'ve locked',1,'lock_page'),(40,'Publish any page',1,'publish_page'),(41,'Unlock any page',1,'unlock_page'),(42,'Can add revision',13,'add_revision'),(43,'Can change revision',13,'change_revision'),(44,'Can delete revision',13,'delete_revision'),(45,'Can view revision',13,'view_revision'),(46,'Can add group page permission',14,'add_grouppagepermission'),(47,'Can change group page permission',14,'change_grouppagepermission'),(48,'Can delete group page permission',14,'delete_grouppagepermission'),(49,'Can view group page permission',14,'view_grouppagepermission'),(50,'Can add page view restriction',15,'add_pageviewrestriction'),(51,'Can change page view restriction',15,'change_pageviewrestriction'),(52,'Can delete page view restriction',15,'delete_pageviewrestriction'),(53,'Can view page view restriction',15,'view_pageviewrestriction'),(54,'Can add workflow page',16,'add_workflowpage'),(55,'Can change workflow page',16,'change_workflowpage'),(56,'Can delete workflow page',16,'delete_workflowpage'),(57,'Can view workflow page',16,'view_workflowpage'),(58,'Can add workflow content type',17,'add_workflowcontenttype'),(59,'Can change workflow content type',17,'change_workflowcontenttype'),(60,'Can delete workflow content type',17,'delete_workflowcontenttype'),(61,'Can view workflow content type',17,'view_workflowcontenttype'),(62,'Can add workflow task order',18,'add_workflowtask'),(63,'Can change workflow task order',18,'change_workflowtask'),(64,'Can delete workflow task order',18,'delete_workflowtask'),(65,'Can view workflow task order',18,'view_workflowtask'),(66,'Can add task',19,'add_task'),(67,'Can change task',19,'change_task'),(68,'Can delete task',19,'delete_task'),(69,'Can view task',19,'view_task'),(70,'Can add workflow',20,'add_workflow'),(71,'Can change workflow',20,'change_workflow'),(72,'Can delete workflow',20,'delete_workflow'),(73,'Can view workflow',20,'view_workflow'),(74,'Can add Group approval task',4,'add_groupapprovaltask'),(75,'Can change Group approval task',4,'change_groupapprovaltask'),(76,'Can delete Group approval task',4,'delete_groupapprovaltask'),(77,'Can view Group approval task',4,'view_groupapprovaltask'),(78,'Can add Workflow state',21,'add_workflowstate'),(79,'Can change Workflow state',21,'change_workflowstate'),(80,'Can delete Workflow state',21,'delete_workflowstate'),(81,'Can view Workflow state',21,'view_workflowstate'),(82,'Can add Task state',22,'add_taskstate'),(83,'Can change Task state',22,'change_taskstate'),(84,'Can delete Task state',22,'delete_taskstate'),(85,'Can view Task state',22,'view_taskstate'),(86,'Can add page log entry',23,'add_pagelogentry'),(87,'Can change page log entry',23,'change_pagelogentry'),(88,'Can delete page log entry',23,'delete_pagelogentry'),(89,'Can view page log entry',23,'view_pagelogentry'),(90,'Can add comment',24,'add_comment'),(91,'Can change comment',24,'change_comment'),(92,'Can delete comment',24,'delete_comment'),(93,'Can view comment',24,'view_comment'),(94,'Can add comment reply',25,'add_commentreply'),(95,'Can change comment reply',25,'change_commentreply'),(96,'Can delete comment reply',25,'delete_commentreply'),(97,'Can view comment reply',25,'view_commentreply'),(98,'Can add page subscription',26,'add_pagesubscription'),(99,'Can change page subscription',26,'change_pagesubscription'),(100,'Can delete page subscription',26,'delete_pagesubscription'),(101,'Can view page subscription',26,'view_pagesubscription'),(102,'Can add document',27,'add_document'),(103,'Can change document',27,'change_document'),(104,'Can delete document',27,'delete_document'),(105,'Can choose document',27,'choose_document'),(106,'Can add image',28,'add_image'),(107,'Can change image',28,'change_image'),(108,'Can delete image',28,'delete_image'),(109,'Can choose image',28,'choose_image'),(110,'Can add home page',2,'add_homepage'),(111,'Can change home page',2,'change_homepage'),(112,'Can delete home page',2,'delete_homepage'),(113,'Can view home page',2,'view_homepage'),(114,'Can add form submission',29,'add_formsubmission'),(115,'Can change form submission',29,'change_formsubmission'),(116,'Can delete form submission',29,'delete_formsubmission'),(117,'Can view form submission',29,'view_formsubmission'),(118,'Can add redirect',30,'add_redirect'),(119,'Can change redirect',30,'change_redirect'),(120,'Can delete redirect',30,'delete_redirect'),(121,'Can view redirect',30,'view_redirect'),(122,'Can add embed',31,'add_embed'),(123,'Can change embed',31,'change_embed'),(124,'Can delete embed',31,'delete_embed'),(125,'Can view embed',31,'view_embed'),(126,'Can add user profile',32,'add_userprofile'),(127,'Can change user profile',32,'change_userprofile'),(128,'Can delete user profile',32,'delete_userprofile'),(129,'Can view user profile',32,'view_userprofile'),(130,'Can view document',27,'view_document'),(131,'Can view image',28,'view_image'),(132,'Can add rendition',33,'add_rendition'),(133,'Can change rendition',33,'change_rendition'),(134,'Can delete rendition',33,'delete_rendition'),(135,'Can view rendition',33,'view_rendition'),(136,'Can add index entry',34,'add_indexentry'),(137,'Can change index entry',34,'change_indexentry'),(138,'Can delete index entry',34,'delete_indexentry'),(139,'Can view index entry',34,'view_indexentry'),(140,'Can add editing session',35,'add_editingsession'),(141,'Can change editing session',35,'change_editingsession'),(142,'Can delete editing session',35,'delete_editingsession'),(143,'Can view editing session',35,'view_editingsession'),(144,'Can add tag',36,'add_tag'),(145,'Can change tag',36,'change_tag'),(146,'Can delete tag',36,'delete_tag'),(147,'Can view tag',36,'view_tag'),(148,'Can add tagged item',37,'add_taggeditem'),(149,'Can change tagged item',37,'change_taggeditem'),(150,'Can delete tagged item',37,'delete_taggeditem'),(151,'Can view tagged item',37,'view_taggeditem'),(152,'Can add log entry',38,'add_logentry'),(153,'Can change log entry',38,'change_logentry'),(154,'Can delete log entry',38,'delete_logentry'),(155,'Can view log entry',38,'view_logentry'),(156,'Can add permission',39,'add_permission'),(157,'Can change permission',39,'change_permission'),(158,'Can delete permission',39,'delete_permission'),(159,'Can view permission',39,'view_permission'),(160,'Can add group',40,'add_group'),(161,'Can change group',40,'change_group'),(162,'Can delete group',40,'delete_group'),(163,'Can view group',40,'view_group'),(164,'Can add user',41,'add_user'),(165,'Can change user',41,'change_user'),(166,'Can delete user',41,'delete_user'),(167,'Can view user',41,'view_user'),(168,'Can add content type',42,'add_contenttype'),(169,'Can change content type',42,'change_contenttype'),(170,'Can delete content type',42,'delete_contenttype'),(171,'Can view content type',42,'view_contenttype'),(172,'Can add session',43,'add_session'),(173,'Can change session',43,'change_session'),(174,'Can delete session',43,'delete_session'),(175,'Can view session',43,'view_session'),(176,'Can add hero counter',44,'add_herocounter'),(177,'Can change hero counter',44,'change_herocounter'),(178,'Can delete hero counter',44,'delete_herocounter'),(179,'Can view hero counter',44,'view_herocounter'),(180,'Can add Service Page',45,'add_servicepage'),(181,'Can change Service Page',45,'change_servicepage'),(182,'Can delete Service Page',45,'delete_servicepage'),(183,'Can view Service Page',45,'view_servicepage'),(184,'Can add service list orderable',46,'add_servicelistorderable'),(185,'Can change service list orderable',46,'change_servicelistorderable'),(186,'Can delete service list orderable',46,'delete_servicelistorderable'),(187,'Can view service list orderable',46,'view_servicelistorderable'),(188,'Can add resume tag',47,'add_resumetag'),(189,'Can change resume tag',47,'change_resumetag'),(190,'Can delete resume tag',47,'delete_resumetag'),(191,'Can view resume tag',47,'view_resumetag'),(192,'Can add language tag',48,'add_languagetag'),(193,'Can change language tag',48,'change_languagetag'),(194,'Can delete language tag',48,'delete_languagetag'),(195,'Can view language tag',48,'view_languagetag'),(196,'Can add resume orderable',49,'add_resumeorderable'),(197,'Can change resume orderable',49,'change_resumeorderable'),(198,'Can delete resume orderable',49,'delete_resumeorderable'),(199,'Can view resume orderable',49,'view_resumeorderable'),(200,'Can add resume category',50,'add_resumecategory'),(201,'Can change resume category',50,'change_resumecategory'),(202,'Can delete resume category',50,'delete_resumecategory'),(203,'Can view resume category',50,'view_resumecategory'),(204,'Can add Resume Page',51,'add_resumeindexpage'),(205,'Can change Resume Page',51,'change_resumeindexpage'),(206,'Can delete Resume Page',51,'delete_resumeindexpage'),(207,'Can view Resume Page',51,'view_resumeindexpage'),(208,'Can add resume item category',52,'add_resumeitemcategory'),(209,'Can change resume item category',52,'change_resumeitemcategory'),(210,'Can delete resume item category',52,'delete_resumeitemcategory'),(211,'Can view resume item category',52,'view_resumeitemcategory'),(212,'Can add resume item tag',53,'add_resumeitemtag'),(213,'Can change resume item tag',53,'change_resumeitemtag'),(214,'Can delete resume item tag',53,'delete_resumeitemtag'),(215,'Can view resume item tag',53,'view_resumeitemtag'),(216,'Can add resume item language',54,'add_resumeitemlanguage'),(217,'Can change resume item language',54,'change_resumeitemlanguage'),(218,'Can delete resume item language',54,'delete_resumeitemlanguage'),(219,'Can view resume item language',54,'view_resumeitemlanguage'),(220,'Can add work item tag',55,'add_workitemtag'),(221,'Can change work item tag',55,'change_workitemtag'),(222,'Can delete work item tag',55,'delete_workitemtag'),(223,'Can view work item tag',55,'view_workitemtag'),(224,'Can add Work Tag',56,'add_worktag'),(225,'Can change Work Tag',56,'change_worktag'),(226,'Can delete Work Tag',56,'delete_worktag'),(227,'Can view Work Tag',56,'view_worktag'),(228,'Can add work orderable',57,'add_workorderable'),(229,'Can change work orderable',57,'change_workorderable'),(230,'Can delete work orderable',57,'delete_workorderable'),(231,'Can view work orderable',57,'view_workorderable'),(232,'Can add Work Page',58,'add_workindexpage'),(233,'Can change Work Page',58,'change_workindexpage'),(234,'Can delete Work Page',58,'delete_workindexpage'),(235,'Can view Work Page',58,'view_workindexpage'),(236,'Can add Site Setting',59,'add_sitesetting'),(237,'Can change Site Setting',59,'change_sitesetting'),(238,'Can delete Site Setting',59,'delete_sitesetting'),(239,'Can view Site Setting',59,'view_sitesetting'),(240,'Can add Contact Submission',60,'add_contactsubmission'),(241,'Can change Contact Submission',60,'change_contactsubmission'),(242,'Can delete Contact Submission',60,'delete_contactsubmission'),(243,'Can view Contact Submission',60,'view_contactsubmission');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$jvuAOI1iFOfkh89H7HjLKB$gmppOWHZVyQkE9hY3G80gzA+fBJbP4FlgITn2wLa9Oo=','2026-04-05 18:43:51.087645',1,'omen','','','shefat.global@gmail.com',1,1,'2026-03-25 18:24:46.692995');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_contactsubmission`
--

DROP TABLE IF EXISTS `contact_contactsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_contactsubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `service_category` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_contactsubmission_created_at_8d23eda0` (`created_at`),
  KEY `contact_contactsubmission_status_ee1ded26` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_contactsubmission`
--

LOCK TABLES `contact_contactsubmission` WRITE;
/*!40000 ALTER TABLE `contact_contactsubmission` DISABLE KEYS */;
INSERT INTO `contact_contactsubmission` VALUES (1,'Test User','test@example.com','Hello','This is a proper test message','01700000000','2026-04-04 12:50:46.335197','new','',''),(2,'Kawsarul Islam','kawsar@example.com','Need Website','I need a portfolio website','01789862904','2026-04-05 19:04:49.699608','contacted','Rajshahi, Bangladesh','Web Development'),(3,'Shefat','ishefat@gmail.com','Charity Website','call me on my number','01816940095','2026-04-14 19:20:11.162566','contacted','Rajshahi','Web Development');
/*!40000 ALTER TABLE `contact_contactsubmission` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (38,'admin','logentry'),(40,'auth','group'),(39,'auth','permission'),(41,'auth','user'),(60,'contact','contactsubmission'),(42,'contenttypes','contenttype'),(44,'home','herocounter'),(2,'home','homepage'),(48,'resume','languagetag'),(50,'resume','resumecategory'),(51,'resume','resumeindexpage'),(52,'resume','resumeitemcategory'),(54,'resume','resumeitemlanguage'),(53,'resume','resumeitemtag'),(49,'resume','resumeorderable'),(47,'resume','resumetag'),(46,'service','servicelistorderable'),(45,'service','servicepage'),(43,'sessions','session'),(59,'site_setting','sitesetting'),(36,'taggit','tag'),(37,'taggit','taggeditem'),(3,'wagtailadmin','admin'),(35,'wagtailadmin','editingsession'),(9,'wagtailcore','collection'),(8,'wagtailcore','collectionviewrestriction'),(24,'wagtailcore','comment'),(25,'wagtailcore','commentreply'),(4,'wagtailcore','groupapprovaltask'),(10,'wagtailcore','groupcollectionpermission'),(14,'wagtailcore','grouppagepermission'),(5,'wagtailcore','locale'),(7,'wagtailcore','modellogentry'),(1,'wagtailcore','page'),(23,'wagtailcore','pagelogentry'),(26,'wagtailcore','pagesubscription'),(15,'wagtailcore','pageviewrestriction'),(12,'wagtailcore','referenceindex'),(13,'wagtailcore','revision'),(6,'wagtailcore','site'),(19,'wagtailcore','task'),(22,'wagtailcore','taskstate'),(11,'wagtailcore','uploadedfile'),(20,'wagtailcore','workflow'),(17,'wagtailcore','workflowcontenttype'),(16,'wagtailcore','workflowpage'),(21,'wagtailcore','workflowstate'),(18,'wagtailcore','workflowtask'),(27,'wagtaildocs','document'),(31,'wagtailembeds','embed'),(29,'wagtailforms','formsubmission'),(28,'wagtailimages','image'),(33,'wagtailimages','rendition'),(30,'wagtailredirects','redirect'),(34,'wagtailsearch','indexentry'),(32,'wagtailusers','userprofile'),(58,'work','workindexpage'),(55,'work','workitemtag'),(57,'work','workorderable'),(56,'work','worktag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-25 18:22:51.687305'),(2,'auth','0001_initial','2026-03-25 18:22:52.681428'),(3,'admin','0001_initial','2026-03-25 18:22:52.930314'),(4,'admin','0002_logentry_remove_auto_add','2026-03-25 18:22:52.939362'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-25 18:22:52.949417'),(6,'contenttypes','0002_remove_content_type_name','2026-03-25 18:22:53.094416'),(7,'auth','0002_alter_permission_name_max_length','2026-03-25 18:22:53.185310'),(8,'auth','0003_alter_user_email_max_length','2026-03-25 18:22:53.215411'),(9,'auth','0004_alter_user_username_opts','2026-03-25 18:22:53.224414'),(10,'auth','0005_alter_user_last_login_null','2026-03-25 18:22:53.294526'),(11,'auth','0006_require_contenttypes_0002','2026-03-25 18:22:53.301248'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-25 18:22:53.312738'),(13,'auth','0008_alter_user_username_max_length','2026-03-25 18:22:53.403545'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-25 18:22:53.530969'),(15,'auth','0010_alter_group_name_max_length','2026-03-25 18:22:53.554537'),(16,'auth','0011_update_proxy_permissions','2026-03-25 18:22:53.560671'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-25 18:22:53.664095'),(18,'wagtailcore','0001_initial','2026-03-25 18:22:54.840249'),(19,'wagtailcore','0002_initial_data','2026-03-25 18:22:54.845224'),(20,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2026-03-25 18:22:54.851244'),(21,'wagtailcore','0004_page_locked','2026-03-25 18:22:54.851244'),(22,'wagtailcore','0005_add_page_lock_permission_to_moderators','2026-03-25 18:22:54.857642'),(23,'wagtailcore','0006_add_lock_page_permission','2026-03-25 18:22:54.864834'),(24,'wagtailcore','0007_page_latest_revision_created_at','2026-03-25 18:22:54.869448'),(25,'wagtailcore','0008_populate_latest_revision_created_at','2026-03-25 18:22:54.875512'),(26,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2026-03-25 18:22:54.881661'),(27,'wagtailcore','0010_change_page_owner_to_null_on_delete','2026-03-25 18:22:54.887684'),(28,'wagtailcore','0011_page_first_published_at','2026-03-25 18:22:54.887684'),(29,'wagtailcore','0012_extend_page_slug_field','2026-03-25 18:22:54.897207'),(30,'wagtailcore','0013_update_golive_expire_help_text','2026-03-25 18:22:54.899845'),(31,'wagtailcore','0014_add_verbose_name','2026-03-25 18:22:54.905802'),(32,'wagtailcore','0015_add_more_verbose_names','2026-03-25 18:22:54.912019'),(33,'wagtailcore','0016_change_page_url_path_to_text_field','2026-03-25 18:22:54.918141'),(34,'wagtailcore','0017_change_edit_page_permission_description','2026-03-25 18:22:54.928123'),(35,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2026-03-25 18:22:54.960552'),(36,'wagtailcore','0019_verbose_names_cleanup','2026-03-25 18:22:54.990674'),(37,'wagtailcore','0020_add_index_on_page_first_published_at','2026-03-25 18:22:55.087652'),(38,'wagtailcore','0021_capitalizeverbose','2026-03-25 18:22:55.226941'),(39,'wagtailcore','0022_add_site_name','2026-03-25 18:22:55.263398'),(40,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2026-03-25 18:22:55.275837'),(41,'wagtailcore','0024_collection','2026-03-25 18:22:55.317915'),(42,'wagtailcore','0025_collection_initial_data','2026-03-25 18:22:55.329967'),(43,'wagtailcore','0026_group_collection_permission','2026-03-25 18:22:55.692274'),(44,'wagtailcore','0027_fix_collection_path_collation','2026-03-25 18:22:55.714141'),(45,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2026-03-25 18:22:55.724094'),(46,'wagtailcore','0028_merge','2026-03-25 18:22:55.724094'),(47,'wagtailcore','0029_unicode_slugfield_dj19','2026-03-25 18:22:55.746174'),(48,'wagtailcore','0030_index_on_pagerevision_created_at','2026-03-25 18:22:55.771970'),(49,'wagtailcore','0031_add_page_view_restriction_types','2026-03-25 18:22:56.088702'),(50,'wagtailcore','0032_add_bulk_delete_page_permission','2026-03-25 18:22:56.106779'),(51,'wagtailcore','0033_remove_golive_expiry_help_text','2026-03-25 18:22:56.122885'),(52,'wagtailcore','0034_page_live_revision','2026-03-25 18:22:56.343284'),(53,'wagtailcore','0035_page_last_published_at','2026-03-25 18:22:56.381407'),(54,'wagtailcore','0036_populate_page_last_published_at','2026-03-25 18:22:56.397291'),(55,'wagtailcore','0037_set_page_owner_editable','2026-03-25 18:22:56.408464'),(56,'wagtailcore','0038_make_first_published_at_editable','2026-03-25 18:22:56.417615'),(57,'wagtailcore','0039_collectionviewrestriction','2026-03-25 18:22:56.787499'),(58,'wagtailcore','0040_page_draft_title','2026-03-25 18:22:56.865998'),(59,'home','0001_initial','2026-03-25 18:22:56.997648'),(60,'home','0002_create_homepage','2026-03-25 18:22:57.024544'),(61,'sessions','0001_initial','2026-03-25 18:22:57.085344'),(62,'taggit','0001_initial','2026-03-25 18:22:57.373840'),(63,'taggit','0002_auto_20150616_2121','2026-03-25 18:22:57.411431'),(64,'taggit','0003_taggeditem_add_unique_index','2026-03-25 18:22:57.437058'),(65,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2026-03-25 18:22:57.462856'),(66,'taggit','0005_auto_20220424_2025','2026-03-25 18:22:57.468499'),(67,'taggit','0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx','2026-03-25 18:22:57.499888'),(68,'wagtailadmin','0001_create_admin_access_permissions','2026-03-25 18:22:57.531630'),(69,'wagtailadmin','0002_admin','2026-03-25 18:22:57.531630'),(70,'wagtailadmin','0003_admin_managed','2026-03-25 18:22:57.563328'),(71,'wagtailadmin','0004_editingsession','2026-03-25 18:22:57.832661'),(72,'wagtailadmin','0005_editingsession_is_editing','2026-03-25 18:22:57.930722'),(73,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2026-03-25 18:22:57.943572'),(74,'wagtailcore','0042_index_on_pagerevision_approved_go_live_at','2026-03-25 18:22:57.981333'),(75,'wagtailcore','0043_lock_fields','2026-03-25 18:22:58.167178'),(76,'wagtailcore','0044_add_unlock_grouppagepermission','2026-03-25 18:22:58.185111'),(77,'wagtailcore','0045_assign_unlock_grouppagepermission','2026-03-25 18:22:58.213681'),(78,'wagtailcore','0046_site_name_remove_null','2026-03-25 18:22:58.417944'),(79,'wagtailcore','0047_add_workflow_models','2026-03-25 18:23:00.343150'),(80,'wagtailcore','0048_add_default_workflows','2026-03-25 18:23:00.410011'),(81,'wagtailcore','0049_taskstate_finished_by','2026-03-25 18:23:00.540826'),(82,'wagtailcore','0050_workflow_rejected_to_needs_changes','2026-03-25 18:23:00.580798'),(83,'wagtailcore','0051_taskstate_comment','2026-03-25 18:23:00.693469'),(84,'wagtailcore','0052_pagelogentry','2026-03-25 18:23:00.962421'),(85,'wagtailcore','0053_locale_model','2026-03-25 18:23:01.010277'),(86,'wagtailcore','0054_initial_locale','2026-03-25 18:23:01.026962'),(87,'wagtailcore','0055_page_locale_fields','2026-03-25 18:23:01.358856'),(88,'wagtailcore','0056_page_locale_fields_populate','2026-03-25 18:23:01.390348'),(89,'wagtailcore','0057_page_locale_fields_notnull','2026-03-25 18:23:02.106139'),(90,'wagtailcore','0058_page_alias_of','2026-03-25 18:23:02.375870'),(91,'wagtailcore','0059_apply_collection_ordering','2026-03-25 18:23:02.391705'),(92,'wagtailcore','0060_fix_workflow_unique_constraint','2026-03-25 18:23:02.423550'),(93,'wagtailcore','0061_change_promote_tab_helpt_text_and_verbose_names','2026-03-25 18:23:02.439467'),(94,'wagtailcore','0062_comment_models_and_pagesubscription','2026-03-25 18:23:03.627836'),(95,'wagtailcore','0063_modellogentry','2026-03-25 18:23:03.901214'),(96,'wagtailcore','0064_log_timestamp_indexes','2026-03-25 18:23:04.021330'),(97,'wagtailcore','0065_log_entry_uuid','2026-03-25 18:23:04.244564'),(98,'wagtailcore','0066_collection_management_permissions','2026-03-25 18:23:04.276249'),(99,'wagtailcore','0067_alter_pagerevision_content_json','2026-03-25 18:23:04.435215'),(100,'wagtailcore','0068_log_entry_empty_object','2026-03-25 18:23:04.450911'),(101,'wagtailcore','0069_log_entry_jsonfield','2026-03-25 18:23:04.863943'),(102,'wagtailcore','0070_rename_pagerevision_revision','2026-03-25 18:23:05.896204'),(103,'wagtailcore','0071_populate_revision_content_type','2026-03-25 18:23:05.928103'),(104,'wagtailcore','0072_alter_revision_content_type_notnull','2026-03-25 18:23:06.499464'),(105,'wagtailcore','0073_page_latest_revision','2026-03-25 18:23:06.785481'),(106,'wagtailcore','0074_revision_object_str','2026-03-25 18:23:06.896366'),(107,'wagtailcore','0075_populate_latest_revision_and_revision_object_str','2026-03-25 18:23:06.944376'),(108,'wagtailcore','0076_modellogentry_revision','2026-03-25 18:23:07.086940'),(109,'wagtailcore','0077_alter_revision_user','2026-03-25 18:23:07.103075'),(110,'wagtailcore','0078_referenceindex','2026-03-25 18:23:07.467689'),(111,'wagtailcore','0079_rename_taskstate_page_revision','2026-03-25 18:23:07.722410'),(112,'wagtailcore','0080_generic_workflowstate','2026-03-25 18:23:08.293752'),(113,'wagtailcore','0081_populate_workflowstate_content_type','2026-03-25 18:23:08.309551'),(114,'wagtailcore','0082_alter_workflowstate_content_type_notnull','2026-03-25 18:23:09.119918'),(115,'wagtailcore','0083_workflowcontenttype','2026-03-25 18:23:09.341986'),(116,'wagtailcore','0084_add_default_page_permissions','2026-03-25 18:23:09.363328'),(117,'wagtailcore','0085_add_grouppagepermission_permission','2026-03-25 18:23:09.642815'),(118,'wagtailcore','0086_populate_grouppagepermission_permission','2026-03-25 18:23:09.716348'),(119,'wagtailcore','0087_alter_grouppagepermission_unique_together_and_more','2026-03-25 18:23:10.069714'),(120,'wagtailcore','0088_fix_log_entry_json_timestamps','2026-03-25 18:23:10.117295'),(121,'wagtailcore','0089_log_entry_data_json_null_to_object','2026-03-25 18:23:10.133007'),(122,'wagtailcore','0090_remove_grouppagepermission_permission_type','2026-03-25 18:23:10.521401'),(123,'wagtailcore','0091_remove_revision_submitted_for_moderation','2026-03-25 18:23:10.719066'),(124,'wagtailcore','0092_alter_collectionviewrestriction_password_and_more','2026-03-25 18:23:10.796898'),(125,'wagtailcore','0093_uploadedfile','2026-03-25 18:23:11.036827'),(126,'wagtailcore','0094_alter_page_locale','2026-03-25 18:23:11.058783'),(127,'wagtaildocs','0001_initial','2026-03-25 18:23:11.192137'),(128,'wagtaildocs','0002_initial_data','2026-03-25 18:23:11.213064'),(129,'wagtaildocs','0003_add_verbose_names','2026-03-25 18:23:11.262992'),(130,'wagtaildocs','0004_capitalizeverbose','2026-03-25 18:23:11.320884'),(131,'wagtaildocs','0005_document_collection','2026-03-25 18:23:11.430964'),(132,'wagtaildocs','0006_copy_document_permissions_to_collections','2026-03-25 18:23:11.462752'),(133,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2026-03-25 18:23:11.478853'),(134,'wagtaildocs','0007_merge','2026-03-25 18:23:11.494608'),(135,'wagtaildocs','0008_document_file_size','2026-03-25 18:23:11.621880'),(136,'wagtaildocs','0009_document_verbose_name_plural','2026-03-25 18:23:11.637566'),(137,'wagtaildocs','0010_document_file_hash','2026-03-25 18:23:11.764200'),(138,'wagtaildocs','0011_add_choose_permissions','2026-03-25 18:23:11.875016'),(139,'wagtaildocs','0012_uploadeddocument','2026-03-25 18:23:12.001803'),(140,'wagtaildocs','0013_delete_uploadeddocument','2026-03-25 18:23:12.017735'),(141,'wagtaildocs','0014_alter_document_file_size','2026-03-25 18:23:12.160178'),(142,'wagtailembeds','0001_initial','2026-03-25 18:23:12.228773'),(143,'wagtailembeds','0002_add_verbose_names','2026-03-25 18:23:12.228773'),(144,'wagtailembeds','0003_capitalizeverbose','2026-03-25 18:23:12.239466'),(145,'wagtailembeds','0004_embed_verbose_name_plural','2026-03-25 18:23:12.249768'),(146,'wagtailembeds','0005_specify_thumbnail_url_max_length','2026-03-25 18:23:12.255249'),(147,'wagtailembeds','0006_add_embed_hash','2026-03-25 18:23:12.334442'),(148,'wagtailembeds','0007_populate_hash','2026-03-25 18:23:12.369392'),(149,'wagtailembeds','0008_allow_long_urls','2026-03-25 18:23:12.712728'),(150,'wagtailembeds','0009_embed_cache_until','2026-03-25 18:23:12.807552'),(151,'wagtailforms','0001_initial','2026-03-25 18:23:12.949916'),(152,'wagtailforms','0002_add_verbose_names','2026-03-25 18:23:12.965792'),(153,'wagtailforms','0003_capitalizeverbose','2026-03-25 18:23:12.987596'),(154,'wagtailforms','0004_add_verbose_name_plural','2026-03-25 18:23:12.998678'),(155,'wagtailforms','0005_alter_formsubmission_form_data','2026-03-25 18:23:13.089394'),(156,'wagtailimages','0001_initial','2026-03-25 18:23:13.599886'),(157,'wagtailimages','0002_initial_data','2026-03-25 18:23:13.599886'),(158,'wagtailimages','0003_fix_focal_point_fields','2026-03-25 18:23:13.615522'),(159,'wagtailimages','0004_make_focal_point_key_not_nullable','2026-03-25 18:23:13.631568'),(160,'wagtailimages','0005_make_filter_spec_unique','2026-03-25 18:23:13.631568'),(161,'wagtailimages','0006_add_verbose_names','2026-03-25 18:23:13.647376'),(162,'wagtailimages','0007_image_file_size','2026-03-25 18:23:13.647376'),(163,'wagtailimages','0008_image_created_at_index','2026-03-25 18:23:13.663266'),(164,'wagtailimages','0009_capitalizeverbose','2026-03-25 18:23:13.663266'),(165,'wagtailimages','0010_change_on_delete_behaviour','2026-03-25 18:23:13.679035'),(166,'wagtailimages','0011_image_collection','2026-03-25 18:23:13.679035'),(167,'wagtailimages','0012_copy_image_permissions_to_collections','2026-03-25 18:23:13.679035'),(168,'wagtailimages','0013_make_rendition_upload_callable','2026-03-25 18:23:13.695070'),(169,'wagtailimages','0014_add_filter_spec_field','2026-03-25 18:23:13.695070'),(170,'wagtailimages','0015_fill_filter_spec_field','2026-03-25 18:23:13.695070'),(171,'wagtailimages','0016_deprecate_rendition_filter_relation','2026-03-25 18:23:13.711184'),(172,'wagtailimages','0017_reduce_focal_point_key_max_length','2026-03-25 18:23:13.711184'),(173,'wagtailimages','0018_remove_rendition_filter','2026-03-25 18:23:13.711184'),(174,'wagtailimages','0019_delete_filter','2026-03-25 18:23:13.727036'),(175,'wagtailimages','0020_add-verbose-name','2026-03-25 18:23:13.727036'),(176,'wagtailimages','0021_image_file_hash','2026-03-25 18:23:13.727036'),(177,'wagtailimages','0022_uploadedimage','2026-03-25 18:23:13.869764'),(178,'wagtailimages','0023_add_choose_permissions','2026-03-25 18:23:14.060903'),(179,'wagtailimages','0024_index_image_file_hash','2026-03-25 18:23:14.108319'),(180,'wagtailimages','0025_alter_image_file_alter_rendition_file','2026-03-25 18:23:14.135458'),(181,'wagtailimages','0026_delete_uploadedimage','2026-03-25 18:23:14.164793'),(182,'wagtailimages','0027_image_description','2026-03-25 18:23:14.297076'),(183,'wagtailredirects','0001_initial','2026-03-25 18:23:14.566720'),(184,'wagtailredirects','0002_add_verbose_names','2026-03-25 18:23:14.616123'),(185,'wagtailredirects','0003_make_site_field_editable','2026-03-25 18:23:14.637838'),(186,'wagtailredirects','0004_set_unique_on_path_and_site','2026-03-25 18:23:14.741264'),(187,'wagtailredirects','0005_capitalizeverbose','2026-03-25 18:23:14.820504'),(188,'wagtailredirects','0006_redirect_increase_max_length','2026-03-25 18:23:14.836316'),(189,'wagtailredirects','0007_add_autocreate_fields','2026-03-25 18:23:15.169681'),(190,'wagtailredirects','0008_add_verbose_name_plural','2026-03-25 18:23:15.196882'),(191,'wagtailsearch','0001_initial','2026-03-25 18:23:15.709374'),(192,'wagtailsearch','0002_add_verbose_names','2026-03-25 18:23:15.756961'),(193,'wagtailsearch','0003_remove_editors_pick','2026-03-25 18:23:15.756961'),(194,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2026-03-25 18:23:15.772879'),(195,'wagtailsearch','0005_create_indexentry','2026-03-25 18:23:15.946894'),(196,'wagtailsearch','0006_customise_indexentry','2026-03-25 18:23:16.882384'),(197,'wagtailsearch','0007_delete_editorspick','2026-03-25 18:23:16.914036'),(198,'wagtailsearch','0008_remove_query_and_querydailyhits_models','2026-03-25 18:23:17.120645'),(199,'wagtailusers','0001_initial','2026-03-25 18:23:17.303202'),(200,'wagtailusers','0002_add_verbose_name_on_userprofile','2026-03-25 18:23:17.345048'),(201,'wagtailusers','0003_add_verbose_names','2026-03-25 18:23:17.361016'),(202,'wagtailusers','0004_capitalizeverbose','2026-03-25 18:23:17.402566'),(203,'wagtailusers','0005_make_related_name_wagtail_specific','2026-03-25 18:23:17.422027'),(204,'wagtailusers','0006_userprofile_prefered_language','2026-03-25 18:23:17.517153'),(205,'wagtailusers','0007_userprofile_current_time_zone','2026-03-25 18:23:17.645731'),(206,'wagtailusers','0008_userprofile_avatar','2026-03-25 18:23:17.748380'),(207,'wagtailusers','0009_userprofile_verbose_name_plural','2026-03-25 18:23:17.807971'),(208,'wagtailusers','0010_userprofile_updated_comments_notifications','2026-03-25 18:23:17.896623'),(209,'wagtailusers','0011_userprofile_dismissibles','2026-03-25 18:23:18.007907'),(210,'wagtailusers','0012_userprofile_theme','2026-03-25 18:23:18.102645'),(211,'wagtailusers','0013_userprofile_density','2026-03-25 18:23:18.213648'),(212,'wagtailusers','0014_userprofile_contrast','2026-03-25 18:23:18.324257'),(213,'wagtailimages','0001_squashed_0021','2026-03-25 18:23:18.324257'),(214,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2026-03-25 18:23:18.339948'),(215,'home','0003_homepage_hero_description_homepage_hero_image_and_more','2026-03-26 11:34:55.937346'),(216,'home','0004_alter_homepage_options','2026-03-27 18:28:14.023584'),(217,'service','0001_initial','2026-03-27 18:28:14.575511'),(218,'resume','0001_initial','2026-03-29 15:37:04.139949'),(219,'resume','0002_alter_languagetag_options_and_more','2026-03-29 15:45:22.465348'),(220,'home','0005_alter_herocounter_id','2026-03-29 16:36:25.631214'),(221,'resume','0003_remove_resumeorderable_language_tags_and_more','2026-03-29 16:53:12.618257'),(222,'work','0001_initial','2026-03-30 19:09:13.578604'),(223,'site_setting','0001_initial','2026-04-01 18:58:20.589937'),(224,'contact','0001_initial','2026-04-04 12:44:39.901114'),(225,'contact','0002_delete_servicecategory','2026-04-04 12:44:39.983922'),(226,'contact','0003_contactsubmission_address_and_more','2026-04-05 18:33:12.922636');
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
INSERT INTO `django_session` VALUES ('6rrlle0t7wwc7x7ek8bcbm8tya446yco','.eJxVjMsOwiAQRf-FtSEDLS-X7v0GQmHGogZMaRON8d9tky50e8-55818WObRLw0nnxM7MsEOv9sQ4g3LBtI1lEvlsZZ5ygPfFL7Txs814f20u3-BMbRxfUcDKI22RkqriMB0IJzqyZmke1AaBsKOIq5Q2BBcjES9oM6qoAgcbtGGreVaPD4feXqxo5DgNMDnC-cZQC4:1w5izs:GNSKtODDDOT1qvEGRagK5jUeQ23Q4JZrbAySTwInyQo','2026-04-09 11:35:32.363156'),('kq8wwfj18swzos4346ufpnbv9ahoxiu1','.eJxVjMsOwiAQRf-FtSEDLS-X7v0GQmHGogZMaRON8d9tky50e8-55818WObRLw0nnxM7MsEOv9sQ4g3LBtI1lEvlsZZ5ygPfFL7Txs814f20u3-BMbRxfUcDKI22RkqriMB0IJzqyZmke1AaBsKOIq5Q2BBcjES9oM6qoAgcbtGGreVaPD4feXqxo5DgNMDnC-cZQC4:1w5T03:AhvxUD1wUR83fgfYk2ga2UUu4anbTVzlWcsfWkvVjg8','2026-04-08 18:30:39.611293'),('mp1k8rk86e2v1vmspdg2nczg5u9ydbv4','.eJxVjMsOwiAQRf-FtSEDLS-X7v0GQmHGogZMaRON8d9tky50e8-55818WObRLw0nnxM7MsEOv9sQ4g3LBtI1lEvlsZZ5ygPfFL7Txs814f20u3-BMbRxfUcDKI22RkqriMB0IJzqyZmke1AaBsKOIq5Q2BBcjES9oM6qoAgcbtGGreVaPD4feXqxo5DgNMDnC-cZQC4:1w90P6:luHPdBSxyikBmzx8sG8QtiA0kP0JRasnGOctd8YAP6A','2026-04-18 12:47:08.867214'),('ta0jcso5ays2zw3lescz3eloqyftd825','.eJxVjMsOwiAQRf-FtSEDLS-X7v0GQmHGogZMaRON8d9tky50e8-55818WObRLw0nnxM7MsEOv9sQ4g3LBtI1lEvlsZZ5ygPfFL7Txs814f20u3-BMbRxfUcDKI22RkqriMB0IJzqyZmke1AaBsKOIq5Q2BBcjES9oM6qoAgcbtGGreVaPD4feXqxo5DgNMDnC-cZQC4:1w9SRr:JqMhcJwCsrSe72K8xoviA59JQGBVm7fOpvfQrWzOpIc','2026-04-19 18:43:51.095644');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_herocounter`
--

DROP TABLE IF EXISTS `home_herocounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_herocounter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `counter_number` int DEFAULT NULL,
  `counter_text` varchar(100) NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_herocounter_page_id_db7d4393` (`page_id`),
  CONSTRAINT `home_herocounter_page_id_db7d4393_fk_home_homepage_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_homepage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_herocounter`
--

LOCK TABLES `home_herocounter` WRITE;
/*!40000 ALTER TABLE `home_herocounter` DISABLE KEYS */;
INSERT INTO `home_herocounter` VALUES (1,0,100,'Projects completed',3),(2,1,10,'Technologies mastered',3),(3,2,444,'Code Commits',3),(4,3,15,'Years of experience',3);
/*!40000 ALTER TABLE `home_herocounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_homepage`
--

DROP TABLE IF EXISTS `home_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_homepage` (
  `page_ptr_id` int NOT NULL,
  `hero_description` longtext NOT NULL DEFAULT (_utf8mb4'Hero Description'),
  `hero_image_id` int DEFAULT NULL,
  `hero_sub_subtitle` varchar(100) NOT NULL,
  `hero_subtitle` varchar(100) NOT NULL,
  `hero_title` varchar(100) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `home_homepage_hero_image_id_5fdd8871_fk_wagtailimages_image_id` (`hero_image_id`),
  CONSTRAINT `home_homepage_hero_image_id_5fdd8871_fk_wagtailimages_image_id` FOREIGN KEY (`hero_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_homepage`
--

LOCK TABLES `home_homepage` WRITE;
/*!40000 ALTER TABLE `home_homepage` DISABLE KEYS */;
INSERT INTO `home_homepage` VALUES (3,'As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.',1,'Engr Robin','Hello I\'m','Software Engineer');
/*!40000 ALTER TABLE `home_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_languagetag`
--

DROP TABLE IF EXISTS `resume_languagetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_languagetag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_languagetag`
--

LOCK TABLES `resume_languagetag` WRITE;
/*!40000 ALTER TABLE `resume_languagetag` DISABLE KEYS */;
INSERT INTO `resume_languagetag` VALUES (1,'English (Native)'),(3,'German (Basic)'),(2,'Spanish (Intermediate)');
/*!40000 ALTER TABLE `resume_languagetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumecategory`
--

DROP TABLE IF EXISTS `resume_resumecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumecategory`
--

LOCK TABLES `resume_resumecategory` WRITE;
/*!40000 ALTER TABLE `resume_resumecategory` DISABLE KEYS */;
INSERT INTO `resume_resumecategory` VALUES (4,'About Me'),(2,'Education'),(1,'Experience'),(3,'Skills');
/*!40000 ALTER TABLE `resume_resumecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumeindexpage`
--

DROP TABLE IF EXISTS `resume_resumeindexpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumeindexpage` (
  `page_ptr_id` int NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `resume_resumeindexpa_page_ptr_id_28b36884_fk_wagtailco` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumeindexpage`
--

LOCK TABLES `resume_resumeindexpage` WRITE;
/*!40000 ALTER TABLE `resume_resumeindexpage` DISABLE KEYS */;
INSERT INTO `resume_resumeindexpage` VALUES (5);
/*!40000 ALTER TABLE `resume_resumeindexpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumeitemcategory`
--

DROP TABLE IF EXISTS `resume_resumeitemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumeitemcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `resume_item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resume_resumeitemcat_category_id_e8de5a4e_fk_resume_re` (`category_id`),
  KEY `resume_resumeitemcategory_resume_item_id_a31499eb` (`resume_item_id`),
  CONSTRAINT `resume_resumeitemcat_category_id_e8de5a4e_fk_resume_re` FOREIGN KEY (`category_id`) REFERENCES `resume_resumecategory` (`id`),
  CONSTRAINT `resume_resumeitemcat_resume_item_id_a31499eb_fk_resume_re` FOREIGN KEY (`resume_item_id`) REFERENCES `resume_resumeorderable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumeitemcategory`
--

LOCK TABLES `resume_resumeitemcategory` WRITE;
/*!40000 ALTER TABLE `resume_resumeitemcategory` DISABLE KEYS */;
INSERT INTO `resume_resumeitemcategory` VALUES (1,0,1,1),(2,0,2,2),(3,0,3,3),(4,0,3,4),(5,0,3,5),(6,0,4,6);
/*!40000 ALTER TABLE `resume_resumeitemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumeitemlanguage`
--

DROP TABLE IF EXISTS `resume_resumeitemlanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumeitemlanguage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `language_id` bigint NOT NULL,
  `resume_item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resume_resumeitemlan_language_id_558d7444_fk_resume_la` (`language_id`),
  KEY `resume_resumeitemlanguage_resume_item_id_ec429260` (`resume_item_id`),
  CONSTRAINT `resume_resumeitemlan_language_id_558d7444_fk_resume_la` FOREIGN KEY (`language_id`) REFERENCES `resume_languagetag` (`id`),
  CONSTRAINT `resume_resumeitemlan_resume_item_id_ec429260_fk_resume_re` FOREIGN KEY (`resume_item_id`) REFERENCES `resume_resumeorderable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumeitemlanguage`
--

LOCK TABLES `resume_resumeitemlanguage` WRITE;
/*!40000 ALTER TABLE `resume_resumeitemlanguage` DISABLE KEYS */;
INSERT INTO `resume_resumeitemlanguage` VALUES (1,0,1,1),(2,0,1,6),(3,1,2,6),(4,2,3,6);
/*!40000 ALTER TABLE `resume_resumeitemlanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumeitemtag`
--

DROP TABLE IF EXISTS `resume_resumeitemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumeitemtag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `resume_item_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resume_resumeitemtag_tag_id_bc9b7092_fk_resume_resumetag_id` (`tag_id`),
  KEY `resume_resumeitemtag_resume_item_id_38154114` (`resume_item_id`),
  CONSTRAINT `resume_resumeitemtag_resume_item_id_38154114_fk_resume_re` FOREIGN KEY (`resume_item_id`) REFERENCES `resume_resumeorderable` (`id`),
  CONSTRAINT `resume_resumeitemtag_tag_id_bc9b7092_fk_resume_resumetag_id` FOREIGN KEY (`tag_id`) REFERENCES `resume_resumetag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumeitemtag`
--

LOCK TABLES `resume_resumeitemtag` WRITE;
/*!40000 ALTER TABLE `resume_resumeitemtag` DISABLE KEYS */;
INSERT INTO `resume_resumeitemtag` VALUES (1,0,1,3),(2,1,1,1),(3,2,1,2),(4,0,2,8),(5,1,2,9),(6,2,2,10),(7,0,3,1),(8,1,3,3),(9,2,3,2),(10,0,4,5),(11,1,4,6),(12,0,5,7),(13,0,6,11),(14,1,6,12),(15,2,6,13),(16,3,6,14),(17,2,4,15);
/*!40000 ALTER TABLE `resume_resumeitemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumeorderable`
--

DROP TABLE IF EXISTS `resume_resumeorderable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumeorderable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(100) NOT NULL,
  `description` json NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resume_resumeorderable_page_id_c8cbe9e0` (`page_id`),
  CONSTRAINT `resume_resumeorderab_page_id_c8cbe9e0_fk_resume_re` FOREIGN KEY (`page_id`) REFERENCES `resume_resumeindexpage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumeorderable`
--

LOCK TABLES `resume_resumeorderable` WRITE;
/*!40000 ALTER TABLE `resume_resumeorderable` DISABLE KEYS */;
INSERT INTO `resume_resumeorderable` VALUES (1,0,'Senior Frontend Developer','Tech Solutions Inc.','[{\"id\": \"adb9838b-fce1-480d-b26f-1e4ad45236c0\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"hu98a\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\"}]',5),(2,1,'Master of Computer Science','Tech University','[{\"id\": \"8717096e-7ee9-444a-b18c-d8b9d0f8d659\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"o4otj\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\"}]',5),(3,2,'Skills','Frontend Development','[{\"id\": \"7892c98c-411b-4343-9e42-357c0f34d60c\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"4bozm\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\"}]',5),(4,3,'Backend Development','','[{\"id\": \"223b76b7-17e2-4648-acc7-ccae5dfbf63a\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"4bozm\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\"}]',5),(5,4,'Tools & Others','','[{\"id\": \"8ad62e07-add5-464b-96de-505996439a7f\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"4bozm\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\"}]',5),(6,5,'','','[{\"id\": \"92d0b279-19e1-42c1-b2de-a9fa18421d14\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"7orhn\\\">Passionate software developer with over 5 years of experience in building modern web applications. Committed to writing clean, maintainable code and staying current with emerging technologies. Strong advocate for user-centric design and accessibility.</p>\"}]',5);
/*!40000 ALTER TABLE `resume_resumeorderable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_resumetag`
--

DROP TABLE IF EXISTS `resume_resumetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_resumetag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_resumetag`
--

LOCK TABLES `resume_resumetag` WRITE;
/*!40000 ALTER TABLE `resume_resumetag` DISABLE KEYS */;
INSERT INTO `resume_resumetag` VALUES (8,'4.0 GPA'),(21,'Agile Methodologies'),(7,'AWS'),(20,'CI/CD'),(10,'Dean\'s List'),(19,'Docker'),(15,'Express'),(18,'Git'),(14,'Machine Learning'),(6,'MongoDB'),(2,'Next.js'),(5,'Node.js'),(11,'Open Source Contributing'),(17,'PostgreSQL'),(16,'Python'),(1,'React'),(9,'Research Publication'),(4,'Team Leadership'),(12,'Tech Blogging'),(3,'TypeScript'),(13,'UI/UX Design');
/*!40000 ALTER TABLE `resume_resumetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_servicelistorderable`
--

DROP TABLE IF EXISTS `service_servicelistorderable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_servicelistorderable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `card_serial` int DEFAULT NULL,
  `card_title` varchar(100) NOT NULL,
  `card_summary` json NOT NULL,
  `cta_text` varchar(100) NOT NULL,
  `cta_url` varchar(200) NOT NULL,
  `cta_page_id` int DEFAULT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_servicelisto_cta_page_id_94e8d769_fk_wagtailco` (`cta_page_id`),
  KEY `service_servicelistorderable_page_id_e16d8f75` (`page_id`),
  CONSTRAINT `service_servicelisto_cta_page_id_94e8d769_fk_wagtailco` FOREIGN KEY (`cta_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `service_servicelisto_page_id_e16d8f75_fk_service_s` FOREIGN KEY (`page_id`) REFERENCES `service_servicepage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicelistorderable`
--

LOCK TABLES `service_servicelistorderable` WRITE;
/*!40000 ALTER TABLE `service_servicelistorderable` DISABLE KEYS */;
INSERT INTO `service_servicelistorderable` VALUES (1,0,1,'Web Development','[{\"id\": \"715504f0-7d7f-40b7-bd12-49039161421b\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"sep4p\\\"><b>Lorem</b> ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\"}]','Read More..','https://www.youtube.com/@reactjsBD',NULL,4),(2,1,2,'App Development','[{\"id\": \"64466523-91fe-4bce-8706-f671995aeae0\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"yk2w8\\\"><i>Lorem i</i>psum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseq</p>\"}]','Read More...','https://www.youtube.com/@reactjsBD',NULL,4),(3,2,3,'UI/UX Design','[{\"id\": \"d4f3bab0-f2d6-4e25-8f18-219290b37281\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"yk2w8\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\"}]','Read More...','https://www.youtube.com/@reactjsBD',NULL,4),(4,3,4,'Logo Design','[{\"id\": \"169ee9b7-3209-421b-88e6-22827297fe88\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"yk2w8\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\"}]','Read More...','https://www.youtube.com/@reactjsBD',NULL,4);
/*!40000 ALTER TABLE `service_servicelistorderable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_servicepage`
--

DROP TABLE IF EXISTS `service_servicepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_servicepage` (
  `page_ptr_id` int NOT NULL,
  `service_list_title` varchar(100) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `service_servicepage_page_ptr_id_37fd5d1f_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicepage`
--

LOCK TABLES `service_servicepage` WRITE;
/*!40000 ALTER TABLE `service_servicepage` DISABLE KEYS */;
INSERT INTO `service_servicepage` VALUES (4,'Services I Provide');
/*!40000 ALTER TABLE `service_servicepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_setting_sitesetting`
--

DROP TABLE IF EXISTS `site_setting_sitesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_setting_sitesetting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `facebook_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `cv_id` int DEFAULT NULL,
  `site_id` int NOT NULL,
  `site_favicon_id` int DEFAULT NULL,
  `site_logo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  KEY `site_setting_siteset_cv_id_721e1473_fk_wagtaildo` (`cv_id`),
  KEY `site_setting_siteset_site_favicon_id_aaf1b0a9_fk_wagtailim` (`site_favicon_id`),
  KEY `site_setting_siteset_site_logo_id_8143c8b4_fk_wagtailim` (`site_logo_id`),
  CONSTRAINT `site_setting_siteset_cv_id_721e1473_fk_wagtaildo` FOREIGN KEY (`cv_id`) REFERENCES `wagtaildocs_document` (`id`),
  CONSTRAINT `site_setting_siteset_site_favicon_id_aaf1b0a9_fk_wagtailim` FOREIGN KEY (`site_favicon_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `site_setting_siteset_site_logo_id_8143c8b4_fk_wagtailim` FOREIGN KEY (`site_logo_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `site_setting_sitesetting_site_id_04e74440_fk_wagtailcore_site_id` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_setting_sitesetting`
--

LOCK TABLES `site_setting_sitesetting` WRITE;
/*!40000 ALTER TABLE `site_setting_sitesetting` DISABLE KEYS */;
INSERT INTO `site_setting_sitesetting` VALUES (1,'My Site','ishefat@gmail.com','01816940095','Rajshahi, Bangladesh','https://facebook.com','https://twitter.com','https://linkedin.com','https://youtube.com','https://instagram.com',1,2,5,6);
/*!40000 ALTER TABLE `site_setting_sitesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'John Doe Image','john-doe-image');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_tagg_content_8fc721_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,28,1);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailadmin_admin`
--

DROP TABLE IF EXISTS `wagtailadmin_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailadmin_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailadmin_admin`
--

LOCK TABLES `wagtailadmin_admin` WRITE;
/*!40000 ALTER TABLE `wagtailadmin_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailadmin_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailadmin_editingsession`
--

DROP TABLE IF EXISTS `wagtailadmin_editingsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailadmin_editingsession` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `last_seen_at` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_editing` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailadmin_editingsession_user_id_6e1a9b70_fk_auth_user_id` (`user_id`),
  KEY `wagtailadmi_content_717955_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `wagtailadmin_editing_content_type_id_4df7730e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailadmin_editingsession_user_id_6e1a9b70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailadmin_editingsession`
--

LOCK TABLES `wagtailadmin_editingsession` WRITE;
/*!40000 ALTER TABLE `wagtailadmin_editingsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailadmin_editingsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collection`
--

DROP TABLE IF EXISTS `wagtailcore_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int unsigned NOT NULL,
  `numchild` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  CONSTRAINT `wagtailcore_collection_chk_1` CHECK ((`depth` >= 0)),
  CONSTRAINT `wagtailcore_collection_chk_2` CHECK ((`numchild` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,0,'Root');
/*!40000 ALTER TABLE `wagtailcore_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction`
--

LOCK TABLES `wagtailcore_collectionviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collectionviewrestriction_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction_groups`
--

LOCK TABLES `wagtailcore_collectionviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_comment`
--

DROP TABLE IF EXISTS `wagtailcore_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `contentpath` longtext NOT NULL,
  `position` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `page_id` int NOT NULL,
  `resolved_by_id` int DEFAULT NULL,
  `revision_created_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` (`resolved_by_id`),
  KEY `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_comment_page_id_108444b5` (`page_id`),
  KEY `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` (`revision_created_id`),
  CONSTRAINT `wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` FOREIGN KEY (`revision_created_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_comment`
--

LOCK TABLES `wagtailcore_comment` WRITE;
/*!40000 ALTER TABLE `wagtailcore_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_commentreply`
--

DROP TABLE IF EXISTS `wagtailcore_commentreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_commentreply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_commentreply_comment_id_afc7e027` (`comment_id`),
  CONSTRAINT `wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco` FOREIGN KEY (`comment_id`) REFERENCES `wagtailcore_comment` (`id`),
  CONSTRAINT `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_commentreply`
--

LOCK TABLES `wagtailcore_commentreply` WRITE;
/*!40000 ALTER TABLE `wagtailcore_commentreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_commentreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupapprovaltask` (
  `task_ptr_id` int NOT NULL,
  PRIMARY KEY (`task_ptr_id`),
  CONSTRAINT `wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco` FOREIGN KEY (`task_ptr_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask`
--

LOCK TABLES `wagtailcore_groupapprovaltask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask` VALUES (1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask_groups`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupapprovaltask_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupapprovaltask_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5ee7eb_uniq` (`groupapprovaltask_id`,`group_id`),
  KEY `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco` FOREIGN KEY (`groupapprovaltask_id`) REFERENCES `wagtailcore_groupapprovaltask` (`task_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask_groups`
--

LOCK TABLES `wagtailcore_groupapprovaltask_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupcollectionpermission`
--

DROP TABLE IF EXISTS `wagtailcore_groupcollectionpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,102),(4,1,1,103),(6,1,1,105),(8,1,1,106),(10,1,1,107),(12,1,1,109),(1,1,2,102),(3,1,2,103),(5,1,2,105),(7,1,2,106),(9,1,2,107),(11,1,2,109);
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_grouppagepermission`
--

DROP TABLE IF EXISTS `wagtailcore_grouppagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `page_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_permission` (`group_id`,`page_id`,`permission_id`),
  KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  KEY `wagtailcore_grouppagepermission_group_id_fc07e671` (`group_id`),
  KEY `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,1,1,34),(2,1,1,35),(6,1,1,39),(3,1,1,40),(7,1,1,41),(4,2,1,34),(5,2,1,35);
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_locale`
--

DROP TABLE IF EXISTS `wagtailcore_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_locale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_locale`
--

LOCK TABLES `wagtailcore_locale` WRITE;
/*!40000 ALTER TABLE `wagtailcore_locale` DISABLE KEYS */;
INSERT INTO `wagtailcore_locale` VALUES (1,'en');
/*!40000 ALTER TABLE `wagtailcore_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_modellogentry`
--

DROP TABLE IF EXISTS `wagtailcore_modellogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_modellogentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  `revision_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_modellogentry_action_d2d856ee` (`action`),
  KEY `wagtailcore_modellogentry_content_changed_8bc39742` (`content_changed`),
  KEY `wagtailcore_modellogentry_object_id_e0e7d4ef` (`object_id`),
  KEY `wagtailcore_modellogentry_user_id_0278d1bf` (`user_id`),
  KEY `wagtailcore_modellogentry_timestamp_9694521b` (`timestamp`),
  KEY `wagtailcore_modellogentry_revision_id_df6ca33a` (`revision_id`),
  CONSTRAINT `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_modellogentry`
--

LOCK TABLES `wagtailcore_modellogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_modellogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_modellogentry` VALUES (1,'Portfolio [default]','wagtail.edit','{}','2026-03-25 18:40:54.541984',1,0,'2',6,1,'c96f42d26a0f41f6aff5cb811b567305',NULL),(2,'English (Native)','wagtail.create','{}','2026-03-29 15:41:27.584057',1,0,'1',48,1,'2c8cd91fd41c48dd90410571d25ab60d',NULL),(3,'Spanish (Intermediate)','wagtail.create','{}','2026-03-29 15:41:38.330161',1,0,'2',48,1,'b29fceadb3784a9784dd3cdd9b483af4',NULL),(4,'German (Basic)','wagtail.create','{}','2026-03-29 15:41:50.676060',1,0,'3',48,1,'a893cda3f3044166b1fd9f5f689d038d',NULL),(5,'Experience','wagtail.create','{}','2026-03-29 15:46:22.746228',1,0,'1',50,1,'360d0813428d4a2991c6fc60ed2bf91a',NULL),(6,'Education','wagtail.create','{}','2026-03-29 15:46:32.596959',1,0,'2',50,1,'b3ea5467166a4b79b44faab365f8dc6d',NULL),(7,'Skills','wagtail.create','{}','2026-03-29 15:46:42.759353',1,0,'3',50,1,'d79583bdcbfc4142b164d5e623c7fe27',NULL),(8,'About Me','wagtail.create','{}','2026-03-29 15:46:54.363582',1,0,'4',50,1,'7c2f8e2f14e54230aa3cc0585c90b2da',NULL),(9,'React','wagtail.create','{}','2026-03-29 15:47:18.303331',1,0,'1',47,1,'6b54a187e9974705a08a7bf07bbf1aeb',NULL),(10,'Next.js','wagtail.create','{}','2026-03-29 15:47:24.891933',1,0,'2',47,1,'362560208cdd48e5b1a0bf42ea09a583',NULL),(11,'TypeScript','wagtail.create','{}','2026-03-29 15:47:32.189215',1,0,'3',47,1,'244bb2c3e7a342f5b33fe985b942e083',NULL),(12,'Team Leadership','wagtail.create','{}','2026-03-29 15:47:38.224666',1,0,'4',47,1,'6e2beb422b444b618091fc32c668c33b',NULL),(13,'Node.js','wagtail.create','{}','2026-03-29 15:47:44.991141',1,0,'5',47,1,'751385524c524b079431b14353a708b2',NULL),(14,'MongoDB','wagtail.create','{}','2026-03-29 15:47:54.272681',1,0,'6',47,1,'8c5b5af8a69d4f89a0c72532d197f775',NULL),(15,'AWS','wagtail.create','{}','2026-03-29 15:48:02.069153',1,0,'7',47,1,'ae1c90a27d5641baaf580057f6b0f4b2',NULL),(16,'4.0 GPA','wagtail.create','{}','2026-03-29 19:09:31.344725',1,0,'8',47,1,'1d7e877bad584b12b1f7c3a2e4cc016c',NULL),(17,'Research Publication','wagtail.create','{}','2026-03-29 19:09:38.106060',1,0,'9',47,1,'f9ca0ecc2fea44c4a87a79048fcace40',NULL),(18,'Dean\'s List','wagtail.create','{}','2026-03-29 19:09:44.246612',1,0,'10',47,1,'ad8a0aa08da44632ac54d1d35dd07969',NULL),(19,'Open Source Contributing','wagtail.create','{}','2026-03-29 19:21:16.635601',1,0,'11',47,1,'72eeed4383cb4a49823dccf629d15d59',NULL),(20,'Tech Blogging','wagtail.create','{}','2026-03-29 19:21:23.457296',1,0,'12',47,1,'a4cc3fe43acd4d26a6e6372404bb72fd',NULL),(21,'UI/UX Design','wagtail.create','{}','2026-03-29 19:21:30.106249',1,0,'13',47,1,'6e499129d0e44c41957e886f956a65e5',NULL),(22,'Machine Learning','wagtail.create','{}','2026-03-29 19:21:37.508087',1,0,'14',47,1,'6182985e0c7045a1b2314c7d08f16a9b',NULL),(23,'Express','wagtail.create','{}','2026-03-29 19:26:07.900086',1,0,'15',47,1,'905c31e7f79146bba56e434ecb60b7a2',NULL),(24,'Python','wagtail.create','{}','2026-03-29 19:26:14.331431',1,0,'16',47,1,'eb46c8db9f764fc288e4527bed79b9f4',NULL),(25,'PostgreSQL','wagtail.create','{}','2026-03-29 19:26:24.773752',1,0,'17',47,1,'c7fb20476ea945108c1b2a4d81f5229c',NULL),(26,'Git','wagtail.create','{}','2026-03-29 19:26:34.582459',1,0,'18',47,1,'537e387137b342dfb5cf406bd4b23af9',NULL),(27,'Docker','wagtail.create','{}','2026-03-29 19:26:40.691306',1,0,'19',47,1,'fd18e64f421446a5be11e8bc12583ba6',NULL),(28,'CI/CD','wagtail.create','{}','2026-03-29 19:26:48.280629',1,0,'20',47,1,'fe3f86e5594842649a5f38811cc5ec56',NULL),(29,'Agile Methodologies','wagtail.create','{}','2026-03-29 19:26:55.066528',1,0,'21',47,1,'1cfa3c8f51134cfdabf847a621f27f3f',NULL),(30,'Next.js','wagtail.create','{}','2026-03-30 19:19:29.629194',1,0,'1',56,1,'735f92e604ce4a6db0c9d111641f401c',NULL),(31,'React.js','wagtail.create','{}','2026-03-30 19:19:40.450363',1,0,'2',56,1,'9de9705528c34d5ab50fa35ffaba698e',NULL),(32,'Express.js','wagtail.create','{}','2026-03-30 19:19:46.889967',1,0,'3',56,1,'4f27985c87ad4589bc29fd58cc84e001',NULL),(33,'Tailwindcss','wagtail.create','{}','2026-03-30 19:19:53.762517',1,0,'4',56,1,'96eaf21a99174db2a38bbff9b18bfa94',NULL),(34,'MySql','wagtail.create','{}','2026-03-30 19:20:04.947298',1,0,'5',56,1,'df264e7c29084e69b568a554bd8e490f',NULL),(35,'My Site','wagtail.edit','{}','2026-04-01 19:06:56.430577',1,0,'1',59,1,'9f147d056edb4ee4818b57c2ff70668a',NULL),(36,'Kawsarul Islam - kawsar@example.com','wagtail.edit','{}','2026-04-05 19:05:28.137348',1,0,'2',60,1,'08b2012bda724249923e01d5bc4e8bea',NULL),(37,'Shefat - ishefat@gmail.com','wagtail.edit','{}','2026-04-14 19:20:40.938983',1,0,'3',60,1,'eb37be3fe9524ce4afc2af4d2e5f3461',NULL);
/*!40000 ALTER TABLE `wagtailcore_modellogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_page`
--

DROP TABLE IF EXISTS `wagtailcore_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int unsigned NOT NULL,
  `numchild` int unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `locked_by_id` int DEFAULT NULL,
  `translation_key` char(32) NOT NULL,
  `locale_id` int NOT NULL,
  `alias_of_id` int DEFAULT NULL,
  `latest_revision_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `wagtailcore_page_translation_key_locale_id_9b041bad_uniq` (`translation_key`,`locale_id`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` (`locked_by_id`),
  KEY `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` (`locale_id`),
  KEY `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` (`alias_of_id`),
  KEY `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` (`latest_revision_id`),
  CONSTRAINT `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` FOREIGN KEY (`alias_of_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` FOREIGN KEY (`latest_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` FOREIGN KEY (`locale_id`) REFERENCES `wagtailcore_locale` (`id`),
  CONSTRAINT `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_chk_1` CHECK ((`depth` >= 0)),
  CONSTRAINT `wagtailcore_page_chk_2` CHECK ((`numchild` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root',NULL,NULL,'0037188ef7564779ba3a5edeb4c3ba84',1,NULL,NULL),(3,'00010001',2,3,'Home','home',1,0,'/home/','',0,'',NULL,NULL,0,2,NULL,0,'2026-04-16 19:25:25.926781','2026-03-26 11:38:52.271933',40,'2026-04-16 19:25:25.964979','Home',NULL,NULL,'f2d2a0ba1bb64425b0bb115d58303fd4',1,NULL,40),(4,'000100010001',3,0,'Services','services',1,0,'/home/services/','',0,'',NULL,NULL,0,45,1,0,'2026-03-27 18:34:12.198925','2026-03-27 18:29:21.895392',5,'2026-03-27 18:34:12.250029','Services',NULL,NULL,'f73ee47bce264cbb8daa5eae7c948366',1,NULL,5),(5,'000100010002',3,0,'Resume','resume',1,0,'/home/resume/','',0,'',NULL,NULL,0,51,1,0,'2026-03-29 19:27:47.778888','2026-03-29 15:50:10.575083',18,'2026-03-29 19:27:47.855208','Resume',NULL,NULL,'f1ec8a7c81ae4da69edace8480d4d238',1,NULL,18),(6,'000100010003',3,0,'Work','work',1,0,'/home/work/','',0,'',NULL,NULL,0,58,1,0,'2026-03-30 19:21:37.998689','2026-03-30 19:11:12.193999',23,'2026-03-30 19:21:38.057949','Work',NULL,NULL,'170964ef969a4f748b1564b09e0c7812',1,NULL,23);
/*!40000 ALTER TABLE `wagtailcore_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagelogentry`
--

DROP TABLE IF EXISTS `wagtailcore_pagelogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pagelogentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `page_id` int NOT NULL,
  `revision_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_pagelogentry_action_c2408198` (`action`),
  KEY `wagtailcore_pagelogentry_content_changed_99f27ade` (`content_changed`),
  KEY `wagtailcore_pagelogentry_page_id_8464e327` (`page_id`),
  KEY `wagtailcore_pagelogentry_revision_id_8043d103` (`revision_id`),
  KEY `wagtailcore_pagelogentry_user_id_604ccfd8` (`user_id`),
  KEY `wagtailcore_pagelogentry_timestamp_deb774c4` (`timestamp`),
  CONSTRAINT `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagelogentry`
--

LOCK TABLES `wagtailcore_pagelogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagelogentry` VALUES (1,'Home','wagtail.edit','{}','2026-03-26 11:38:52.251056',1,0,2,3,1,1,'417d19719f694a28a1442c5977a1127f'),(2,'Home','wagtail.publish','{}','2026-03-26 11:38:52.305591',1,0,2,3,1,1,'417d19719f694a28a1442c5977a1127f'),(3,'Services','wagtail.create','{}','2026-03-27 18:29:21.835845',1,0,45,4,NULL,1,'a81f941a5cbf4e898828de151105a23f'),(4,'Services','wagtail.edit','{}','2026-03-27 18:29:21.873890',1,0,45,4,2,1,'a81f941a5cbf4e898828de151105a23f'),(5,'Services','wagtail.publish','{}','2026-03-27 18:29:21.923449',1,0,45,4,2,1,'a81f941a5cbf4e898828de151105a23f'),(6,'Services','wagtail.edit','{}','2026-03-27 18:31:06.006848',1,0,45,4,3,1,'e528c4485556444ba1c86358ea028e70'),(7,'Services','wagtail.publish','{}','2026-03-27 18:31:06.050439',1,0,45,4,3,1,'e528c4485556444ba1c86358ea028e70'),(8,'Services','wagtail.edit','{}','2026-03-27 18:33:40.702714',1,0,45,4,4,1,'7a9f85aeb18c4986b954afd7db5127ba'),(9,'Services','wagtail.publish','{}','2026-03-27 18:33:40.766917',1,0,45,4,4,1,'7a9f85aeb18c4986b954afd7db5127ba'),(10,'Services','wagtail.edit','{}','2026-03-27 18:34:12.230317',1,0,45,4,5,1,'a6df57129ac04f738970f44ca661a1b8'),(11,'Services','wagtail.publish','{}','2026-03-27 18:34:12.291815',1,0,45,4,5,1,'a6df57129ac04f738970f44ca661a1b8'),(12,'Resume','wagtail.create','{}','2026-03-29 15:50:10.505688',1,0,51,5,NULL,1,'7dfd782f84f2472d86f67b992fb91ef7'),(13,'Resume','wagtail.edit','{}','2026-03-29 15:50:10.548088',1,0,51,5,6,1,'7dfd782f84f2472d86f67b992fb91ef7'),(14,'Resume','wagtail.publish','{}','2026-03-29 15:50:10.619939',1,0,51,5,6,1,'7dfd782f84f2472d86f67b992fb91ef7'),(15,'Resume','wagtail.edit','{}','2026-03-29 15:53:38.314344',1,0,51,5,7,1,'28b4f5bd016f42a69e5f319ab5f9c36b'),(16,'Resume','wagtail.publish','{}','2026-03-29 15:53:38.388265',1,0,51,5,7,1,'28b4f5bd016f42a69e5f319ab5f9c36b'),(17,'Resume','wagtail.edit','{}','2026-03-29 15:57:02.097809',1,0,51,5,8,1,'c6995b1ae71c4547a3d678b482bde551'),(18,'Resume','wagtail.publish','{}','2026-03-29 15:57:02.175450',1,0,51,5,8,1,'c6995b1ae71c4547a3d678b482bde551'),(19,'Resume','wagtail.edit','{}','2026-03-29 16:02:34.195466',1,0,51,5,9,1,'087f3e3cc6e345cb97f5b0815905165e'),(20,'Resume','wagtail.publish','{}','2026-03-29 16:02:34.241054',1,0,51,5,9,1,'087f3e3cc6e345cb97f5b0815905165e'),(21,'Resume','wagtail.edit','{}','2026-03-29 16:38:43.801436',1,0,51,5,10,1,'a6a4b9467808456b9779280599c7c97f'),(22,'Resume','wagtail.publish','{}','2026-03-29 16:38:43.849927',1,0,51,5,10,1,'a6a4b9467808456b9779280599c7c97f'),(23,'Resume','wagtail.edit','{}','2026-03-29 16:38:59.937370',1,0,51,5,11,1,'0a26e6cb1f4d402282b412185f14b442'),(24,'Resume','wagtail.publish','{}','2026-03-29 16:38:59.992300',0,0,51,5,11,1,'0a26e6cb1f4d402282b412185f14b442'),(25,'Resume','wagtail.edit','{}','2026-03-29 16:54:15.364395',1,0,51,5,12,1,'5ef64c6e798740689d6a6142acc036fe'),(26,'Resume','wagtail.publish','{}','2026-03-29 16:54:15.420574',1,0,51,5,12,1,'5ef64c6e798740689d6a6142acc036fe'),(27,'Resume','wagtail.edit','{}','2026-03-29 17:12:49.619656',1,0,51,5,13,1,'019d31e1abff493695938a3c72733a7a'),(28,'Resume','wagtail.publish','{}','2026-03-29 17:12:49.694711',1,0,51,5,13,1,'019d31e1abff493695938a3c72733a7a'),(29,'Resume','wagtail.edit','{}','2026-03-29 19:10:14.814622',1,0,51,5,14,1,'cd3e228c1f7b4156a5707d52e4de5359'),(30,'Resume','wagtail.publish','{}','2026-03-29 19:10:14.931742',1,0,51,5,14,1,'cd3e228c1f7b4156a5707d52e4de5359'),(31,'Resume','wagtail.edit','{}','2026-03-29 19:18:01.874189',1,0,51,5,15,1,'cbe9dbcce4524cc690f23be3873fcacc'),(32,'Resume','wagtail.publish','{}','2026-03-29 19:18:02.150545',1,0,51,5,15,1,'cbe9dbcce4524cc690f23be3873fcacc'),(33,'Resume','wagtail.edit','{}','2026-03-29 19:24:06.095323',1,0,51,5,16,1,'e4e4f4c58bf040deb9b6f546e0772794'),(34,'Resume','wagtail.publish','{}','2026-03-29 19:24:06.371396',1,0,51,5,16,1,'e4e4f4c58bf040deb9b6f546e0772794'),(35,'Resume','wagtail.edit','{}','2026-03-29 19:25:19.912187',1,0,51,5,17,1,'46c1e8d69ce04f25895716c4c8d0c6f0'),(36,'Resume','wagtail.publish','{}','2026-03-29 19:25:20.239557',1,0,51,5,17,1,'46c1e8d69ce04f25895716c4c8d0c6f0'),(37,'Resume','wagtail.edit','{}','2026-03-29 19:27:47.812380',1,0,51,5,18,1,'7594f65f38e2450782a60c05dd7224ef'),(38,'Resume','wagtail.publish','{}','2026-03-29 19:27:48.183460',1,0,51,5,18,1,'7594f65f38e2450782a60c05dd7224ef'),(39,'Work','wagtail.create','{}','2026-03-30 19:11:12.136015',1,0,58,6,NULL,1,'a327e8a291d24f7ebadf6416f92e0f72'),(40,'Work','wagtail.edit','{}','2026-03-30 19:11:12.174095',1,0,58,6,19,1,'a327e8a291d24f7ebadf6416f92e0f72'),(41,'Work','wagtail.publish','{}','2026-03-30 19:11:12.221386',1,0,58,6,19,1,'a327e8a291d24f7ebadf6416f92e0f72'),(42,'Work','wagtail.edit','{}','2026-03-30 19:16:54.880333',1,0,58,6,20,1,'d51c16e828b546be8da375b6de1bdc54'),(43,'Work','wagtail.publish','{}','2026-03-30 19:16:54.932734',1,0,58,6,20,1,'d51c16e828b546be8da375b6de1bdc54'),(44,'Work','wagtail.edit','{}','2026-03-30 19:18:07.350323',1,0,58,6,21,1,'fec6c04528ad4a55ac0dc647d95ec511'),(45,'Work','wagtail.publish','{}','2026-03-30 19:18:07.410282',1,0,58,6,21,1,'fec6c04528ad4a55ac0dc647d95ec511'),(46,'Work','wagtail.edit','{}','2026-03-30 19:19:09.976374',1,0,58,6,22,1,'e38868c7fcd64dda9fbd9ff8666c1648'),(47,'Work','wagtail.publish','{}','2026-03-30 19:19:10.039563',1,0,58,6,22,1,'e38868c7fcd64dda9fbd9ff8666c1648'),(48,'Work','wagtail.edit','{}','2026-03-30 19:21:38.026063',1,0,58,6,23,1,'ad2c47f85fd04d78bb54256f953067dc'),(49,'Work','wagtail.publish','{}','2026-03-30 19:21:38.143802',1,0,58,6,23,1,'ad2c47f85fd04d78bb54256f953067dc'),(50,'Home','wagtail.edit','{}','2026-04-06 18:40:53.748806',1,0,2,3,24,1,'3244a0851017412e84440f67de133fe9'),(51,'Home','wagtail.edit','{}','2026-04-06 18:41:06.387967',1,0,2,3,25,1,'d4de7ad21dd142f48b6f4f242ef52eac'),(52,'Home','wagtail.edit','{}','2026-04-06 18:41:21.013032',1,0,2,3,26,1,'0d8b0f4f132f41c9b4d52336b5bc4d0c'),(53,'Home','wagtail.edit','{}','2026-04-06 18:41:38.985271',1,0,2,3,27,1,'996febdf2da04d9da1548c612497735c'),(54,'Home','wagtail.edit','{}','2026-04-06 18:42:43.665781',1,0,2,3,28,1,'5f5d7a0d29a641f19bf8bd95c5fa33c3'),(55,'Home','wagtail.edit','{}','2026-04-06 18:43:09.834451',1,0,2,3,29,1,'5440905c51cd4cefa88cd78fb2e356d8'),(56,'Home','wagtail.publish','{}','2026-04-06 18:43:09.937934',1,0,2,3,29,1,'5440905c51cd4cefa88cd78fb2e356d8'),(57,'Home','wagtail.edit','{}','2026-04-06 18:43:48.449470',1,0,2,3,30,1,'c58482a50ca143d4bf2f875c8cdbac44'),(58,'Home','wagtail.publish','{}','2026-04-06 18:43:48.546813',1,0,2,3,30,1,'c58482a50ca143d4bf2f875c8cdbac44'),(59,'Home','wagtail.edit','{}','2026-04-06 18:43:54.072694',1,0,2,3,31,1,'ad6a434bd5d54b34b6bea5ab632272d4'),(60,'Home','wagtail.edit','{}','2026-04-06 18:43:58.523660',1,0,2,3,32,1,'2c050941035b4c8b93cade9acff0c353'),(61,'Home','wagtail.publish','{}','2026-04-06 18:43:58.815169',0,0,2,3,32,1,'2c050941035b4c8b93cade9acff0c353'),(62,'Home','wagtail.edit','{}','2026-04-06 18:51:30.136764',1,0,2,3,33,1,'6d88556a4ebb4241bb5c039a40e8e602'),(63,'Home','wagtail.edit','{}','2026-04-06 18:51:33.097648',1,0,2,3,34,1,'76480c2ca6474ea2943322bac43ce1d2'),(64,'Home','wagtail.publish','{}','2026-04-06 18:51:33.186643',0,0,2,3,34,1,'76480c2ca6474ea2943322bac43ce1d2'),(65,'Home','wagtail.edit','{}','2026-04-14 19:50:54.818535',1,0,2,3,35,1,'61196b8fa7d24202ac19ef9418bb3b53'),(66,'Home','wagtail.edit','{}','2026-04-14 19:51:17.647814',1,0,2,3,36,1,'0161e37b8a77444c9227c2e8240a41f6'),(67,'Home','wagtail.publish','{}','2026-04-14 19:51:17.763155',0,0,2,3,36,1,'0161e37b8a77444c9227c2e8240a41f6'),(68,'Home','wagtail.edit','{}','2026-04-16 19:24:37.829201',1,0,2,3,37,1,'56b9407fbebb4ba3adf13c9663393e27'),(69,'Home','wagtail.edit','{}','2026-04-16 19:24:52.669791',1,0,2,3,38,1,'7f44206941cd46e29c48db92b014b929'),(70,'Home','wagtail.publish','{}','2026-04-16 19:24:52.762705',0,0,2,3,38,1,'7f44206941cd46e29c48db92b014b929'),(71,'Home','wagtail.edit','{}','2026-04-16 19:25:15.107022',1,0,2,3,39,1,'2af5f4610646450fb6abc5a3ecc29052'),(72,'Home','wagtail.publish','{}','2026-04-16 19:25:15.153612',0,0,2,3,39,1,'2af5f4610646450fb6abc5a3ecc29052'),(73,'Home','wagtail.edit','{}','2026-04-16 19:25:25.946402',1,0,2,3,40,1,'1b14ddfd6034447a84a71d25312b3e77'),(74,'Home','wagtail.publish','{}','2026-04-16 19:25:25.996580',0,0,2,3,40,1,'1b14ddfd6034447a84a71d25312b3e77');
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagesubscription`
--

DROP TABLE IF EXISTS `wagtailcore_pagesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pagesubscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_notifications` tinyint(1) NOT NULL,
  `page_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq` (`page_id`,`user_id`),
  KEY `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagesubscription`
--

LOCK TABLES `wagtailcore_pagesubscription` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagesubscription` VALUES (1,0,3,1),(2,1,4,1),(3,1,5,1),(4,1,6,1);
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `page_id` int NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction`
--

LOCK TABLES `wagtailcore_pageviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageviewrestriction_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction_groups`
--

LOCK TABLES `wagtailcore_pageviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_referenceindex`
--

DROP TABLE IF EXISTS `wagtailcore_referenceindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_referenceindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `to_object_id` varchar(255) NOT NULL,
  `model_path` longtext NOT NULL,
  `content_path` longtext NOT NULL,
  `content_path_hash` char(32) NOT NULL,
  `base_content_type_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `to_content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_referenceind_base_content_type_id_obj_9e6ccd6a_uniq` (`base_content_type_id`,`object_id`,`to_content_type_id`,`to_object_id`,`content_path_hash`),
  KEY `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` (`to_content_type_id`),
  CONSTRAINT `wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` FOREIGN KEY (`to_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_referenceindex`
--

LOCK TABLES `wagtailcore_referenceindex` WRITE;
/*!40000 ALTER TABLE `wagtailcore_referenceindex` DISABLE KEYS */;
INSERT INTO `wagtailcore_referenceindex` VALUES (1,'1','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(2,'3','1','hero_image','hero_image','2960929c7feb5d2b8541ed36105c53fd',1,2,28),(6,'5','1','resume_items.item.category_items.item.category','resume_items.1.category_items.1.category','fc270357727f55cda1e8351578a7034d',1,51,50),(7,'5','3','resume_items.item.tag_items.item.tag','resume_items.1.tag_items.1.tag','068b082c2611598f8c6954d07bd75f11',1,51,47),(8,'5','1','resume_items.item.language_items.item.language','resume_items.1.language_items.1.language','12362f08f5fa56c8b198727a8e4b9006',1,51,48),(11,'5','1','resume_items.item.tag_items.item.tag','resume_items.1.tag_items.2.tag','bbfd393f463e5298958b2ae9fab0f203',1,51,47),(12,'5','2','resume_items.item.tag_items.item.tag','resume_items.1.tag_items.3.tag','8dbd217b0dd050b2aa9757e0aba7b062',1,51,47),(21,'5','2','resume_items.item.category_items.item.category','resume_items.2.category_items.2.category','e2cd6fa786495faaa54fdc8d465759be',1,51,50),(22,'5','8','resume_items.item.tag_items.item.tag','resume_items.2.tag_items.4.tag','98847b2bbf8f5d6ab31de645035994d7',1,51,47),(23,'5','9','resume_items.item.tag_items.item.tag','resume_items.2.tag_items.5.tag','b91473436f5d582fafc8212a019e6547',1,51,47),(24,'5','10','resume_items.item.tag_items.item.tag','resume_items.2.tag_items.6.tag','e038ad2e505a53b7bea9cb5c1f6bfd1f',1,51,47),(36,'5','3','resume_items.item.category_items.item.category','resume_items.3.category_items.3.category','693309a5f08f590380db0233e54459b1',1,51,50),(37,'5','1','resume_items.item.tag_items.item.tag','resume_items.3.tag_items.7.tag','561abf615b7158d5b376dce07c1cc2c5',1,51,47),(38,'5','3','resume_items.item.tag_items.item.tag','resume_items.3.tag_items.8.tag','4232353c15165d059d7a5d075a92417d',1,51,47),(39,'5','2','resume_items.item.tag_items.item.tag','resume_items.3.tag_items.9.tag','e36dae3e67e953f8bb7516d823bb988a',1,51,47),(43,'5','3','resume_items.item.category_items.item.category','resume_items.4.category_items.4.category','2d2303d2c73d549b978b5c7caee8198d',1,51,50),(44,'5','5','resume_items.item.tag_items.item.tag','resume_items.4.tag_items.10.tag','e4d5366281635d9bbb2e3bf1ef3bb8ac',1,51,47),(45,'5','6','resume_items.item.tag_items.item.tag','resume_items.4.tag_items.11.tag','769d12081520578eb8dfd47561592c8c',1,51,47),(48,'5','3','resume_items.item.category_items.item.category','resume_items.5.category_items.5.category','524602818dbc5236a1870402ed3c80f9',1,51,50),(49,'5','7','resume_items.item.tag_items.item.tag','resume_items.5.tag_items.12.tag','5414ac5d0af75c3d87423abe42ed4528',1,51,47),(60,'5','4','resume_items.item.category_items.item.category','resume_items.6.category_items.6.category','a91bd47181de516fabd94078bf61e598',1,51,50),(62,'5','1','resume_items.item.language_items.item.language','resume_items.6.language_items.2.language','58e27130d7fa552db8ae0430b440dbdd',1,51,48),(63,'5','2','resume_items.item.language_items.item.language','resume_items.6.language_items.3.language','83f6aa3c86f45aa29cfc59303c9dc9f3',1,51,48),(64,'5','3','resume_items.item.language_items.item.language','resume_items.6.language_items.4.language','563305c3633457b7a8a209b3eef69c51',1,51,48),(65,'5','11','resume_items.item.tag_items.item.tag','resume_items.6.tag_items.13.tag','3163cbc0971c5c4aa4154399db4174d3',1,51,47),(69,'5','12','resume_items.item.tag_items.item.tag','resume_items.6.tag_items.14.tag','05a3cd69fb9d5056b7e40bcacbd07d15',1,51,47),(70,'5','13','resume_items.item.tag_items.item.tag','resume_items.6.tag_items.15.tag','38c26121fe775601b8d70d861f9ada67',1,51,47),(71,'5','14','resume_items.item.tag_items.item.tag','resume_items.6.tag_items.16.tag','1d4b1f2bf2c25c1eaa87ae2cd8bd8e86',1,51,47),(73,'5','15','resume_items.item.tag_items.item.tag','resume_items.4.tag_items.17.tag','f912b28298d25675a486b025cde174e1',1,51,47),(74,'2','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(76,'6','2','work_items.item.work_image','work_items.1.work_image','862044e20dcf5c78a8665655bec754ea',1,58,28),(77,'3','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(79,'6','3','work_items.item.work_image','work_items.2.work_image','7065ee0488845d89904b782e06d7759e',1,58,28),(80,'4','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(82,'6','4','work_items.item.work_image','work_items.3.work_image','a00c50a45e695183baef3c79bb8ab91c',1,58,28),(91,'6','1','work_items.item.work_tag_items.item.tag','work_items.1.work_tag_items.1.tag','612baaa5359457bd8d84d8a29e386a73',1,58,56),(92,'6','3','work_items.item.work_tag_items.item.tag','work_items.1.work_tag_items.2.tag','ae8a6a27cdec5928b8f23265603c472d',1,58,56),(93,'6','4','work_items.item.work_tag_items.item.tag','work_items.1.work_tag_items.3.tag','da6ceb0a33945016adb21dd795355143',1,58,56),(94,'6','2','work_items.item.work_tag_items.item.tag','work_items.2.work_tag_items.4.tag','3d6aa848cd9e5272aa3f0b21a1bfde23',1,58,56),(95,'6','4','work_items.item.work_tag_items.item.tag','work_items.2.work_tag_items.5.tag','0ef7999a3eb45b109a393740bf837615',1,58,56),(96,'6','3','work_items.item.work_tag_items.item.tag','work_items.3.work_tag_items.6.tag','782fc20fdf225c6187039f80a02bdec1',1,58,56),(97,'6','5','work_items.item.work_tag_items.item.tag','work_items.3.work_tag_items.7.tag','08c2afc72ba55231b10957346787c117',1,58,56),(98,'6','1','work_items.item.work_tag_items.item.tag','work_items.3.work_tag_items.8.tag','9465fedb69695f7c8fe3b4634b23c852',1,58,56),(99,'1','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',27,27,9),(100,'5','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9),(101,'6','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',28,28,9);
/*!40000 ALTER TABLE `wagtailcore_referenceindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_revision`
--

DROP TABLE IF EXISTS `wagtailcore_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_revision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `content` json NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `content_type_id` int NOT NULL,
  `base_content_type_id` int NOT NULL,
  `object_str` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  KEY `wagtailcore_pagerevision_approved_go_live_at_e56afc67` (`approved_go_live_at`),
  KEY `content_object_idx` (`content_type_id`,`object_id`),
  KEY `base_content_object_idx` (`base_content_type_id`,`object_id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_revision`
--

LOCK TABLES `wagtailcore_revision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_revision` DISABLE KEYS */;
INSERT INTO `wagtailcore_revision` VALUES (1,'2026-03-26 11:38:52.224674','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": null, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": null, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": null, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": null, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'3',1,2,1,'Home'),(2,'2026-03-27 18:29:21.852112','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"services\", \"depth\": 3, \"owner\": 1, \"title\": \"Services\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/services/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Services\", \"content_type\": 45, \"live_revision\": null, \"service_items\": [], \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"f73ee47b-ce26-4cbb-8daa-5eae7c948366\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"service_list_title\": \"Service List Title\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'4',1,45,1,'Services'),(3,'2026-03-27 18:31:05.985370','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"services\", \"depth\": 3, \"owner\": 1, \"title\": \"Services\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/services/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Services\", \"content_type\": 45, \"live_revision\": 2, \"service_items\": [{\"pk\": null, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More..\", \"card_title\": \"Web Development\", \"sort_order\": 0, \"card_serial\": 1, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"sep4p\\\\\\\"><b>Lorem</b> ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut. </p>\\\", \\\"id\\\": \\\"715504f0-7d7f-40b7-bd12-49039161421b\\\"}]\"}], \"show_in_menus\": false, \"latest_revision\": 2, \"translation_key\": \"f73ee47b-ce26-4cbb-8daa-5eae7c948366\", \"last_published_at\": \"2026-03-27T18:29:21.895Z\", \"first_published_at\": \"2026-03-27T18:29:21.895Z\", \"search_description\": \"\", \"service_list_title\": \"Services I Provide\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-27T18:29:21.852Z\"}',NULL,'4',1,45,1,'Services'),(4,'2026-03-27 18:33:40.680379','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"services\", \"depth\": 3, \"owner\": 1, \"title\": \"Services\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/services/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Services\", \"content_type\": 45, \"live_revision\": 3, \"service_items\": [{\"pk\": 1, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More..\", \"card_title\": \"Web Development\", \"sort_order\": 0, \"card_serial\": 1, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"sep4p\\\\\\\"><b>Lorem</b> ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\\\", \\\"id\\\": \\\"715504f0-7d7f-40b7-bd12-49039161421b\\\"}]\"}, {\"pk\": null, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"App Development\", \"sort_order\": 1, \"card_serial\": 2, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\"><i>Lorem i</i>psum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseq</p>\\\", \\\"id\\\": \\\"64466523-91fe-4bce-8706-f671995aeae0\\\"}]\"}, {\"pk\": null, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"UI/UX Design\", \"sort_order\": 2, \"card_serial\": 3, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut. </p>\\\", \\\"id\\\": \\\"d4f3bab0-f2d6-4e25-8f18-219290b37281\\\"}]\"}, {\"pk\": null, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"Logo Design\", \"sort_order\": 3, \"card_serial\": 4, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi  distinctio minus esse consequatur fugit accusamus velit iste quisquam  aut. </p>\\\", \\\"id\\\": \\\"169ee9b7-3209-421b-88e6-22827297fe88\\\"}]\"}], \"show_in_menus\": false, \"latest_revision\": 3, \"translation_key\": \"f73ee47b-ce26-4cbb-8daa-5eae7c948366\", \"last_published_at\": \"2026-03-27T18:31:06.022Z\", \"first_published_at\": \"2026-03-27T18:29:21.895Z\", \"search_description\": \"\", \"service_list_title\": \"Services I Provide\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-27T18:31:05.985Z\"}',NULL,'4',1,45,1,'Services'),(5,'2026-03-27 18:34:12.198925','{\"pk\": 4, \"live\": true, \"path\": \"000100010001\", \"slug\": \"services\", \"depth\": 3, \"owner\": 1, \"title\": \"Services\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/services/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Services\", \"content_type\": 45, \"live_revision\": 4, \"service_items\": [{\"pk\": 1, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More..\", \"card_title\": \"Web Development\", \"sort_order\": 0, \"card_serial\": 1, \"card_summary\": \"[{\\\"id\\\": \\\"715504f0-7d7f-40b7-bd12-49039161421b\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"sep4p\\\\\\\"><b>Lorem</b> ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\\\"}]\"}, {\"pk\": 2, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"App Development\", \"sort_order\": 1, \"card_serial\": 2, \"card_summary\": \"[{\\\"id\\\": \\\"64466523-91fe-4bce-8706-f671995aeae0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\"><i>Lorem i</i>psum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseqLorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse conseq</p>\\\"}]\"}, {\"pk\": 3, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"UI/UX Design\", \"sort_order\": 2, \"card_serial\": 3, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\\\", \\\"id\\\": \\\"d4f3bab0-f2d6-4e25-8f18-219290b37281\\\"}]\"}, {\"pk\": 4, \"page\": 4, \"cta_url\": \"https://www.youtube.com/@reactjsBD\", \"cta_page\": null, \"cta_text\": \"Read More...\", \"card_title\": \"Logo Design\", \"sort_order\": 3, \"card_serial\": 4, \"card_summary\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"yk2w8\\\\\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, sequi distinctio minus esse consequatur fugit accusamus velit iste quisquam aut.</p>\\\", \\\"id\\\": \\\"169ee9b7-3209-421b-88e6-22827297fe88\\\"}]\"}], \"show_in_menus\": false, \"latest_revision\": 4, \"translation_key\": \"f73ee47b-ce26-4cbb-8daa-5eae7c948366\", \"last_published_at\": \"2026-03-27T18:33:40.723Z\", \"first_published_at\": \"2026-03-27T18:29:21.895Z\", \"search_description\": \"\", \"service_list_title\": \"Services I Provide\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-27T18:33:40.680Z\"}',NULL,'4',1,45,1,'Services'),(6,'2026-03-29 15:50:10.531578','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [], \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'5',1,51,1,'Resume'),(7,'2026-03-29 15:53:38.293256','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": null, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality. </p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\"}], \"live_revision\": 6, \"show_in_menus\": false, \"latest_revision\": 6, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T15:50:10.575Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T15:50:10.531Z\"}',NULL,'5',1,51,1,'Resume'),(8,'2026-03-29 15:57:02.079128','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\"}], \"live_revision\": 7, \"show_in_menus\": false, \"latest_revision\": 7, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T15:53:38.343Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T15:53:38.293Z\"}',NULL,'5',1,51,1,'Resume'),(9,'2026-03-29 16:02:34.180756','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\"}], \"live_revision\": 8, \"show_in_menus\": false, \"latest_revision\": 8, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T15:57:02.129Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T15:57:02.079Z\"}',NULL,'5',1,51,1,'Resume'),(10,'2026-03-29 16:38:43.764034','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\"}], \"live_revision\": 9, \"show_in_menus\": false, \"latest_revision\": 9, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T16:02:34.213Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T16:02:34.180Z\"}',NULL,'5',1,51,1,'Resume'),(11,'2026-03-29 16:38:59.910351','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\"}], \"live_revision\": 10, \"show_in_menus\": false, \"latest_revision\": 10, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T16:38:43.818Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T16:38:43.764Z\"}',NULL,'5',1,51,1,'Resume'),(12,'2026-03-29 16:54:15.336217','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": null, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": null, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}], \"live_revision\": 11, \"show_in_menus\": false, \"latest_revision\": 11, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T16:38:59.955Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T16:38:59.910Z\"}',NULL,'5',1,51,1,'Resume'),(13,'2026-03-29 17:12:49.592846','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": null, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": null, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\", \\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}], \"live_revision\": 12, \"show_in_menus\": false, \"latest_revision\": 12, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T16:54:15.383Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T16:54:15.336Z\"}',NULL,'5',1,51,1,'Resume'),(14,'2026-03-29 19:10:14.784802','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": 2, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": 3, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}, {\"pk\": null, \"page\": 5, \"title\": \"Master of Computer Science\", \"sub_title\": \"Tech University\", \"tag_items\": [{\"pk\": null, \"tag\": 8, \"sort_order\": 0, \"resume_item\": null}, {\"pk\": null, \"tag\": 9, \"sort_order\": 1, \"resume_item\": null}, {\"pk\": null, \"tag\": 10, \"sort_order\": 2, \"resume_item\": null}], \"sort_order\": 1, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"o4otj\\\\\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\\\", \\\"id\\\": \\\"8717096e-7ee9-444a-b18c-d8b9d0f8d659\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 2, \"sort_order\": 0, \"resume_item\": null}], \"language_items\": []}], \"live_revision\": 13, \"show_in_menus\": false, \"latest_revision\": 13, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T17:12:49.645Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T17:12:49.592Z\"}',NULL,'5',1,51,1,'Resume'),(15,'2026-03-29 19:18:01.843796','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": 2, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": 3, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}, {\"pk\": 2, \"page\": 5, \"title\": \"Master of Computer Science\", \"sub_title\": \"Tech University\", \"tag_items\": [{\"pk\": 4, \"tag\": 8, \"sort_order\": 0, \"resume_item\": 2}, {\"pk\": 5, \"tag\": 9, \"sort_order\": 1, \"resume_item\": 2}, {\"pk\": 6, \"tag\": 10, \"sort_order\": 2, \"resume_item\": 2}], \"sort_order\": 1, \"description\": \"[{\\\"id\\\": \\\"8717096e-7ee9-444a-b18c-d8b9d0f8d659\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"o4otj\\\\\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\\\"}]\", \"category_items\": [{\"pk\": 2, \"category\": 2, \"sort_order\": 0, \"resume_item\": 2}], \"language_items\": []}, {\"pk\": null, \"page\": 5, \"title\": \"Skills\", \"sub_title\": \"Frontend Development\", \"tag_items\": [{\"pk\": null, \"tag\": 1, \"sort_order\": 0, \"resume_item\": null}, {\"pk\": null, \"tag\": 3, \"sort_order\": 1, \"resume_item\": null}, {\"pk\": null, \"tag\": 2, \"sort_order\": 2, \"resume_item\": null}], \"sort_order\": 2, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et,  distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste  labore, similique quod laudantium rerum dolor, impedit voluptas  distinctio praesentium quibusdam veniam tempore. Laudantium repellendus  possimus adipisci maxime. </p>\\\", \\\"id\\\": \\\"7892c98c-411b-4343-9e42-357c0f34d60c\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 3, \"sort_order\": 0, \"resume_item\": null}], \"language_items\": []}, {\"pk\": null, \"page\": 5, \"title\": \"Backend Development\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": null, \"tag\": 5, \"sort_order\": 0, \"resume_item\": null}, {\"pk\": null, \"tag\": 6, \"sort_order\": 1, \"resume_item\": null}], \"sort_order\": 3, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et,  distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste  labore, similique quod laudantium rerum dolor, impedit voluptas  distinctio praesentium quibusdam veniam tempore. Laudantium repellendus  possimus adipisci maxime. </p>\\\", \\\"id\\\": \\\"223b76b7-17e2-4648-acc7-ccae5dfbf63a\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 3, \"sort_order\": 0, \"resume_item\": null}], \"language_items\": []}, {\"pk\": null, \"page\": 5, \"title\": \"Tools & Others\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": null, \"tag\": 7, \"sort_order\": 0, \"resume_item\": null}], \"sort_order\": 4, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et,  distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste  labore, similique quod laudantium rerum dolor, impedit voluptas  distinctio praesentium quibusdam veniam tempore. Laudantium repellendus  possimus adipisci maxime. </p>\\\", \\\"id\\\": \\\"8ad62e07-add5-464b-96de-505996439a7f\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 3, \"sort_order\": 0, \"resume_item\": null}], \"language_items\": []}], \"live_revision\": 14, \"show_in_menus\": false, \"latest_revision\": 14, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T19:10:14.838Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T19:10:14.784Z\"}',NULL,'5',1,51,1,'Resume'),(16,'2026-03-29 19:24:06.061874','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": 2, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": 3, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}, {\"pk\": 2, \"page\": 5, \"title\": \"Master of Computer Science\", \"sub_title\": \"Tech University\", \"tag_items\": [{\"pk\": 4, \"tag\": 8, \"sort_order\": 0, \"resume_item\": 2}, {\"pk\": 5, \"tag\": 9, \"sort_order\": 1, \"resume_item\": 2}, {\"pk\": 6, \"tag\": 10, \"sort_order\": 2, \"resume_item\": 2}], \"sort_order\": 1, \"description\": \"[{\\\"id\\\": \\\"8717096e-7ee9-444a-b18c-d8b9d0f8d659\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"o4otj\\\\\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\\\"}]\", \"category_items\": [{\"pk\": 2, \"category\": 2, \"sort_order\": 0, \"resume_item\": 2}], \"language_items\": []}, {\"pk\": 3, \"page\": 5, \"title\": \"Skills\", \"sub_title\": \"Frontend Development\", \"tag_items\": [{\"pk\": 7, \"tag\": 1, \"sort_order\": 0, \"resume_item\": 3}, {\"pk\": 8, \"tag\": 3, \"sort_order\": 1, \"resume_item\": 3}, {\"pk\": 9, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 3}], \"sort_order\": 2, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\", \\\"id\\\": \\\"7892c98c-411b-4343-9e42-357c0f34d60c\\\"}]\", \"category_items\": [{\"pk\": 3, \"category\": 3, \"sort_order\": 0, \"resume_item\": 3}], \"language_items\": []}, {\"pk\": 4, \"page\": 5, \"title\": \"Backend Development\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 10, \"tag\": 5, \"sort_order\": 0, \"resume_item\": 4}, {\"pk\": 11, \"tag\": 6, \"sort_order\": 1, \"resume_item\": 4}], \"sort_order\": 3, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\", \\\"id\\\": \\\"223b76b7-17e2-4648-acc7-ccae5dfbf63a\\\"}]\", \"category_items\": [{\"pk\": 4, \"category\": 3, \"sort_order\": 0, \"resume_item\": 4}], \"language_items\": []}, {\"pk\": 5, \"page\": 5, \"title\": \"Tools & Others\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 12, \"tag\": 7, \"sort_order\": 0, \"resume_item\": 5}], \"sort_order\": 4, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\", \\\"id\\\": \\\"8ad62e07-add5-464b-96de-505996439a7f\\\"}]\", \"category_items\": [{\"pk\": 5, \"category\": 3, \"sort_order\": 0, \"resume_item\": 5}], \"language_items\": []}, {\"pk\": null, \"page\": 5, \"title\": \"\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": null, \"tag\": 9, \"sort_order\": 0, \"resume_item\": null}], \"sort_order\": 5, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"7orhn\\\\\\\">Passionate software developer with over 5 years of experience in  building modern web applications. Committed to writing clean,  maintainable code and staying current with emerging technologies. Strong  advocate for user-centric design and accessibility. </p>\\\", \\\"id\\\": \\\"92d0b279-19e1-42c1-b2de-a9fa18421d14\\\"}]\", \"category_items\": [{\"pk\": null, \"category\": 4, \"sort_order\": 0, \"resume_item\": null}], \"language_items\": [{\"pk\": null, \"language\": 1, \"sort_order\": 0, \"resume_item\": null}, {\"pk\": null, \"language\": 2, \"sort_order\": 1, \"resume_item\": null}, {\"pk\": null, \"language\": 3, \"sort_order\": 2, \"resume_item\": null}]}], \"live_revision\": 15, \"show_in_menus\": false, \"latest_revision\": 15, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T19:18:01.919Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T19:18:01.843Z\"}',NULL,'5',1,51,1,'Resume'),(17,'2026-03-29 19:25:19.880555','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": 2, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": 3, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}, {\"pk\": 2, \"page\": 5, \"title\": \"Master of Computer Science\", \"sub_title\": \"Tech University\", \"tag_items\": [{\"pk\": 4, \"tag\": 8, \"sort_order\": 0, \"resume_item\": 2}, {\"pk\": 5, \"tag\": 9, \"sort_order\": 1, \"resume_item\": 2}, {\"pk\": 6, \"tag\": 10, \"sort_order\": 2, \"resume_item\": 2}], \"sort_order\": 1, \"description\": \"[{\\\"id\\\": \\\"8717096e-7ee9-444a-b18c-d8b9d0f8d659\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"o4otj\\\\\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\\\"}]\", \"category_items\": [{\"pk\": 2, \"category\": 2, \"sort_order\": 0, \"resume_item\": 2}], \"language_items\": []}, {\"pk\": 3, \"page\": 5, \"title\": \"Skills\", \"sub_title\": \"Frontend Development\", \"tag_items\": [{\"pk\": 7, \"tag\": 1, \"sort_order\": 0, \"resume_item\": 3}, {\"pk\": 8, \"tag\": 3, \"sort_order\": 1, \"resume_item\": 3}, {\"pk\": 9, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 3}], \"sort_order\": 2, \"description\": \"[{\\\"id\\\": \\\"7892c98c-411b-4343-9e42-357c0f34d60c\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\"}]\", \"category_items\": [{\"pk\": 3, \"category\": 3, \"sort_order\": 0, \"resume_item\": 3}], \"language_items\": []}, {\"pk\": 4, \"page\": 5, \"title\": \"Backend Development\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 10, \"tag\": 5, \"sort_order\": 0, \"resume_item\": 4}, {\"pk\": 11, \"tag\": 6, \"sort_order\": 1, \"resume_item\": 4}], \"sort_order\": 3, \"description\": \"[{\\\"id\\\": \\\"223b76b7-17e2-4648-acc7-ccae5dfbf63a\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\"}]\", \"category_items\": [{\"pk\": 4, \"category\": 3, \"sort_order\": 0, \"resume_item\": 4}], \"language_items\": []}, {\"pk\": 5, \"page\": 5, \"title\": \"Tools & Others\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 12, \"tag\": 7, \"sort_order\": 0, \"resume_item\": 5}], \"sort_order\": 4, \"description\": \"[{\\\"id\\\": \\\"8ad62e07-add5-464b-96de-505996439a7f\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\"}]\", \"category_items\": [{\"pk\": 5, \"category\": 3, \"sort_order\": 0, \"resume_item\": 5}], \"language_items\": []}, {\"pk\": 6, \"page\": 5, \"title\": \"\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 13, \"tag\": 11, \"sort_order\": 0, \"resume_item\": 6}, {\"pk\": null, \"tag\": 12, \"sort_order\": 1, \"resume_item\": 6}, {\"pk\": null, \"tag\": 13, \"sort_order\": 2, \"resume_item\": 6}, {\"pk\": null, \"tag\": 14, \"sort_order\": 3, \"resume_item\": 6}], \"sort_order\": 5, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"7orhn\\\\\\\">Passionate software developer with over 5 years of experience in building modern web applications. Committed to writing clean, maintainable code and staying current with emerging technologies. Strong advocate for user-centric design and accessibility.</p>\\\", \\\"id\\\": \\\"92d0b279-19e1-42c1-b2de-a9fa18421d14\\\"}]\", \"category_items\": [{\"pk\": 6, \"category\": 4, \"sort_order\": 0, \"resume_item\": 6}], \"language_items\": [{\"pk\": 2, \"language\": 1, \"sort_order\": 0, \"resume_item\": 6}, {\"pk\": 3, \"language\": 2, \"sort_order\": 1, \"resume_item\": 6}, {\"pk\": 4, \"language\": 3, \"sort_order\": 2, \"resume_item\": 6}]}], \"live_revision\": 16, \"show_in_menus\": false, \"latest_revision\": 16, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T19:24:06.132Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T19:24:06.061Z\"}',NULL,'5',1,51,1,'Resume'),(18,'2026-03-29 19:27:47.778888','{\"pk\": 5, \"live\": true, \"path\": \"000100010002\", \"slug\": \"resume\", \"depth\": 3, \"owner\": 1, \"title\": \"Resume\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/resume/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"Resume\", \"content_type\": 51, \"resume_items\": [{\"pk\": 1, \"page\": 5, \"title\": \"Senior Frontend Developer\", \"sub_title\": \"Tech Solutions Inc.\", \"tag_items\": [{\"pk\": 1, \"tag\": 3, \"sort_order\": 0, \"resume_item\": 1}, {\"pk\": 2, \"tag\": 1, \"sort_order\": 1, \"resume_item\": 1}, {\"pk\": 3, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 1}], \"sort_order\": 0, \"description\": \"[{\\\"id\\\": \\\"adb9838b-fce1-480d-b26f-1e4ad45236c0\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"hu98a\\\\\\\">Led the development of multiple React-based web applications, improving performance by 40%. Mentored junior developers and implemented best practices for code quality.</p>\\\"}]\", \"category_items\": [{\"pk\": 1, \"category\": 1, \"sort_order\": 0, \"resume_item\": 1}], \"language_items\": [{\"pk\": 1, \"language\": 1, \"sort_order\": 0, \"resume_item\": 1}]}, {\"pk\": 2, \"page\": 5, \"title\": \"Master of Computer Science\", \"sub_title\": \"Tech University\", \"tag_items\": [{\"pk\": 4, \"tag\": 8, \"sort_order\": 0, \"resume_item\": 2}, {\"pk\": 5, \"tag\": 9, \"sort_order\": 1, \"resume_item\": 2}, {\"pk\": 6, \"tag\": 10, \"sort_order\": 2, \"resume_item\": 2}], \"sort_order\": 1, \"description\": \"[{\\\"id\\\": \\\"8717096e-7ee9-444a-b18c-d8b9d0f8d659\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"o4otj\\\\\\\">Specialized in Software Engineering and Artificial Intelligence. Graduated with honors.</p>\\\"}]\", \"category_items\": [{\"pk\": 2, \"category\": 2, \"sort_order\": 0, \"resume_item\": 2}], \"language_items\": []}, {\"pk\": 3, \"page\": 5, \"title\": \"Skills\", \"sub_title\": \"Frontend Development\", \"tag_items\": [{\"pk\": 7, \"tag\": 1, \"sort_order\": 0, \"resume_item\": 3}, {\"pk\": 8, \"tag\": 3, \"sort_order\": 1, \"resume_item\": 3}, {\"pk\": 9, \"tag\": 2, \"sort_order\": 2, \"resume_item\": 3}], \"sort_order\": 2, \"description\": \"[{\\\"id\\\": \\\"7892c98c-411b-4343-9e42-357c0f34d60c\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\"}]\", \"category_items\": [{\"pk\": 3, \"category\": 3, \"sort_order\": 0, \"resume_item\": 3}], \"language_items\": []}, {\"pk\": 4, \"page\": 5, \"title\": \"Backend Development\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 10, \"tag\": 5, \"sort_order\": 0, \"resume_item\": 4}, {\"pk\": 11, \"tag\": 6, \"sort_order\": 1, \"resume_item\": 4}, {\"pk\": null, \"tag\": 15, \"sort_order\": 2, \"resume_item\": 4}], \"sort_order\": 3, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\", \\\"id\\\": \\\"223b76b7-17e2-4648-acc7-ccae5dfbf63a\\\"}]\", \"category_items\": [{\"pk\": 4, \"category\": 3, \"sort_order\": 0, \"resume_item\": 4}], \"language_items\": []}, {\"pk\": 5, \"page\": 5, \"title\": \"Tools & Others\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 12, \"tag\": 7, \"sort_order\": 0, \"resume_item\": 5}], \"sort_order\": 4, \"description\": \"[{\\\"id\\\": \\\"8ad62e07-add5-464b-96de-505996439a7f\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"4bozm\\\\\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, distinctio. Quas fugiat nesciunt ipsum. Voluptatem inventore iste labore, similique quod laudantium rerum dolor, impedit voluptas distinctio praesentium quibusdam veniam tempore. Laudantium repellendus possimus adipisci maxime.</p>\\\"}]\", \"category_items\": [{\"pk\": 5, \"category\": 3, \"sort_order\": 0, \"resume_item\": 5}], \"language_items\": []}, {\"pk\": 6, \"page\": 5, \"title\": \"\", \"sub_title\": \"\", \"tag_items\": [{\"pk\": 13, \"tag\": 11, \"sort_order\": 0, \"resume_item\": 6}, {\"pk\": 14, \"tag\": 12, \"sort_order\": 1, \"resume_item\": 6}, {\"pk\": 15, \"tag\": 13, \"sort_order\": 2, \"resume_item\": 6}, {\"pk\": 16, \"tag\": 14, \"sort_order\": 3, \"resume_item\": 6}], \"sort_order\": 5, \"description\": \"[{\\\"id\\\": \\\"92d0b279-19e1-42c1-b2de-a9fa18421d14\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"7orhn\\\\\\\">Passionate software developer with over 5 years of experience in building modern web applications. Committed to writing clean, maintainable code and staying current with emerging technologies. Strong advocate for user-centric design and accessibility.</p>\\\"}]\", \"category_items\": [{\"pk\": 6, \"category\": 4, \"sort_order\": 0, \"resume_item\": 6}], \"language_items\": [{\"pk\": 2, \"language\": 1, \"sort_order\": 0, \"resume_item\": 6}, {\"pk\": 3, \"language\": 2, \"sort_order\": 1, \"resume_item\": 6}, {\"pk\": 4, \"language\": 3, \"sort_order\": 2, \"resume_item\": 6}]}], \"live_revision\": 17, \"show_in_menus\": false, \"latest_revision\": 17, \"translation_key\": \"f1ec8a7c-81ae-4da6-9eda-ce8480d4d238\", \"last_published_at\": \"2026-03-29T19:25:19.953Z\", \"first_published_at\": \"2026-03-29T15:50:10.575Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-29T19:25:19.880Z\"}',NULL,'5',1,51,1,'Resume'),(19,'2026-03-30 19:11:12.154081','{\"pk\": 6, \"live\": true, \"path\": \"000100010003\", \"slug\": \"work\", \"depth\": 3, \"owner\": 1, \"title\": \"Work\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/work/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"work_items\": [], \"draft_title\": \"Work\", \"content_type\": 58, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"170964ef-969a-4f74-8b15-64b09e0c7812\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'6',1,58,1,'Work'),(20,'2026-03-30 19:16:54.856976','{\"pk\": 6, \"live\": true, \"path\": \"000100010003\", \"slug\": \"work\", \"depth\": 3, \"owner\": 1, \"title\": \"Work\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/work/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"work_items\": [{\"pk\": null, \"page\": 6, \"title\": \"Full Stack Project\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 0, \"work_image\": 2, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"iu46y\\\\\\\">A modern e-commerce platform built with Next.js, featuring a responsive design, user authentication, and integration with a headless CMS for easy content management.</p>\\\", \\\"id\\\": \\\"dd6fc11a-b51b-451c-b3b5-e87a1917cc5a\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 1, \"work_tag_items\": []}], \"draft_title\": \"Work\", \"content_type\": 58, \"live_revision\": 19, \"show_in_menus\": false, \"latest_revision\": 19, \"translation_key\": \"170964ef-969a-4f74-8b15-64b09e0c7812\", \"last_published_at\": \"2026-03-30T19:11:12.193Z\", \"first_published_at\": \"2026-03-30T19:11:12.193Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-30T19:11:12.154Z\"}',NULL,'6',1,58,1,'Work'),(21,'2026-03-30 19:18:07.327652','{\"pk\": 6, \"live\": true, \"path\": \"000100010003\", \"slug\": \"work\", \"depth\": 3, \"owner\": 1, \"title\": \"Work\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/work/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"work_items\": [{\"pk\": 1, \"page\": 6, \"title\": \"Full Stack Project\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 0, \"work_image\": 2, \"description\": \"[{\\\"id\\\": \\\"dd6fc11a-b51b-451c-b3b5-e87a1917cc5a\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"iu46y\\\\\\\">A modern e-commerce platform built with Next.js, featuring a responsive design, user authentication, and integration with a headless CMS for easy content management.</p>\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 1, \"work_tag_items\": []}, {\"pk\": null, \"page\": 6, \"title\": \"Frontend\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 1, \"work_image\": 3, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"kfgyn\\\\\\\">A sleek task management application that helps users organize their daily activities, set priorities, and track progress. Built with React and Redux for state management.</p>\\\", \\\"id\\\": \\\"eeef08d5-50e9-46fe-bc2c-9a4189f5101d\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 2, \"work_tag_items\": []}], \"draft_title\": \"Work\", \"content_type\": 58, \"live_revision\": 20, \"show_in_menus\": false, \"latest_revision\": 20, \"translation_key\": \"170964ef-969a-4f74-8b15-64b09e0c7812\", \"last_published_at\": \"2026-03-30T19:16:54.899Z\", \"first_published_at\": \"2026-03-30T19:11:12.193Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-30T19:16:54.856Z\"}',NULL,'6',1,58,1,'Work'),(22,'2026-03-30 19:19:09.949693','{\"pk\": 6, \"live\": true, \"path\": \"000100010003\", \"slug\": \"work\", \"depth\": 3, \"owner\": 1, \"title\": \"Work\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/work/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"work_items\": [{\"pk\": 1, \"page\": 6, \"title\": \"Full Stack Project\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 0, \"work_image\": 2, \"description\": \"[{\\\"id\\\": \\\"dd6fc11a-b51b-451c-b3b5-e87a1917cc5a\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"iu46y\\\\\\\">A modern e-commerce platform built with Next.js, featuring a responsive design, user authentication, and integration with a headless CMS for easy content management.</p>\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 1, \"work_tag_items\": []}, {\"pk\": 2, \"page\": 6, \"title\": \"Frontend\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 1, \"work_image\": 3, \"description\": \"[{\\\"id\\\": \\\"eeef08d5-50e9-46fe-bc2c-9a4189f5101d\\\", \\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"kfgyn\\\\\\\">A sleek task management application that helps users organize their daily activities, set priorities, and track progress. Built with React and Redux for state management.</p>\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 2, \"work_tag_items\": []}, {\"pk\": null, \"page\": 6, \"title\": \"Backend\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 2, \"work_image\": 4, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"0e0uj\\\\\\\">An interactive weather forecast dashboard that provides real-time weather information and 5-day forecasts for multiple locations. Utilizes a third-party weather API.</p>\\\", \\\"id\\\": \\\"ad178ce2-4499-4c0b-ac75-3a81cf4c0cbb\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 3, \"work_tag_items\": []}], \"draft_title\": \"Work\", \"content_type\": 58, \"live_revision\": 21, \"show_in_menus\": false, \"latest_revision\": 21, \"translation_key\": \"170964ef-969a-4f74-8b15-64b09e0c7812\", \"last_published_at\": \"2026-03-30T19:18:07.368Z\", \"first_published_at\": \"2026-03-30T19:11:12.193Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-30T19:18:07.327Z\"}',NULL,'6',1,58,1,'Work'),(23,'2026-03-30 19:21:37.998689','{\"pk\": 6, \"live\": true, \"path\": \"000100010003\", \"slug\": \"work\", \"depth\": 3, \"owner\": 1, \"title\": \"Work\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/home/work/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"work_items\": [{\"pk\": 1, \"page\": 6, \"title\": \"Full Stack Project\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 0, \"work_image\": 2, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"iu46y\\\\\\\">A modern e-commerce platform built with Next.js, featuring a responsive design, user authentication, and integration with a headless CMS for easy content management.</p>\\\", \\\"id\\\": \\\"dd6fc11a-b51b-451c-b3b5-e87a1917cc5a\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 1, \"work_tag_items\": [{\"pk\": null, \"tag\": 1, \"work_item\": 1, \"sort_order\": 0}, {\"pk\": null, \"tag\": 3, \"work_item\": 1, \"sort_order\": 1}, {\"pk\": null, \"tag\": 4, \"work_item\": 1, \"sort_order\": 2}]}, {\"pk\": 2, \"page\": 6, \"title\": \"Frontend\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 1, \"work_image\": 3, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"kfgyn\\\\\\\">A sleek task management application that helps users organize their daily activities, set priorities, and track progress. Built with React and Redux for state management.</p>\\\", \\\"id\\\": \\\"eeef08d5-50e9-46fe-bc2c-9a4189f5101d\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 2, \"work_tag_items\": [{\"pk\": null, \"tag\": 2, \"work_item\": 2, \"sort_order\": 0}, {\"pk\": null, \"tag\": 4, \"work_item\": 2, \"sort_order\": 1}]}, {\"pk\": 3, \"page\": 6, \"title\": \"Backend\", \"repo_url\": \"https://github.com/Shiftrobin/business-directory-app\", \"sort_order\": 2, \"work_image\": 4, \"description\": \"[{\\\"type\\\": \\\"content\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"0e0uj\\\\\\\">An interactive weather forecast dashboard that provides real-time weather information and 5-day forecasts for multiple locations. Utilizes a third-party weather API.</p>\\\", \\\"id\\\": \\\"ad178ce2-4499-4c0b-ac75-3a81cf4c0cbb\\\"}]\", \"project_url\": \"https://sinediesystem.com/\", \"serial_number\": 3, \"work_tag_items\": [{\"pk\": null, \"tag\": 3, \"work_item\": 3, \"sort_order\": 0}, {\"pk\": null, \"tag\": 5, \"work_item\": 3, \"sort_order\": 1}, {\"pk\": null, \"tag\": 1, \"work_item\": 3, \"sort_order\": 2}]}], \"draft_title\": \"Work\", \"content_type\": 58, \"live_revision\": 22, \"show_in_menus\": false, \"latest_revision\": 22, \"translation_key\": \"170964ef-969a-4f74-8b15-64b09e0c7812\", \"last_published_at\": \"2026-03-30T19:19:09.996Z\", \"first_published_at\": \"2026-03-30T19:11:12.193Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-30T19:19:09.949Z\"}',NULL,'6',1,58,1,'Work'),(24,'2026-04-06 18:40:53.685383','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 1, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-03-26T11:38:52.224Z\"}',NULL,'3',1,2,1,'Home'),(25,'2026-04-06 18:41:06.318848','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer x\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 24, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:40:53.685Z\"}',NULL,'3',1,2,1,'Home'),(26,'2026-04-06 18:41:20.750957','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer x\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 25, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:41:06.318Z\"}',NULL,'3',1,2,1,'Home'),(27,'2026-04-06 18:41:38.902192','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 26, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:41:20.750Z\"}',NULL,'3',1,2,1,'Home'),(28,'2026-04-06 18:42:43.582121','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 27, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe ss\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:41:38.902Z\"}',NULL,'3',1,2,1,'Home'),(29,'2026-04-06 18:43:09.797692','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer - x\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I&apos;m\", \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 28, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-03-26T11:38:52.271Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:42:43.582Z\"}',NULL,'3',1,2,1,'Home'),(30,'2026-04-06 18:43:48.413740','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer - x\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 29, \"show_in_menus\": false, \"latest_revision\": 29, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-04-06T18:43:09.872Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-06T18:43:09.797Z\"}',NULL,'3',1,2,1,'Home'),(31,'2026-04-06 18:43:54.018436','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 30, \"show_in_menus\": false, \"latest_revision\": 30, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-04-06T18:43:48.486Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-06T18:43:48.413Z\"}',NULL,'3',1,2,1,'Home'),(32,'2026-04-06 18:43:58.434668','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 25}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 8}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 500}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 12}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 30, \"show_in_menus\": false, \"latest_revision\": 31, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-04-06T18:43:48.486Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:43:54.018Z\"}',NULL,'3',1,2,1,'Home'),(33,'2026-04-06 18:51:30.102070','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 32, \"show_in_menus\": false, \"latest_revision\": 32, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-04-06T18:43:58.629Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-06T18:43:58.434Z\"}',NULL,'3',1,2,1,'Home'),(34,'2026-04-06 18:51:33.056121','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 32, \"show_in_menus\": false, \"latest_revision\": 33, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"John Doe\", \"last_published_at\": \"2026-04-06T18:43:58.629Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-06T18:51:30.102Z\"}',NULL,'3',1,2,1,'Home'),(35,'2026-04-14 19:50:54.759755','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 34, \"show_in_menus\": false, \"latest_revision\": 34, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-06T18:51:33.130Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-06T18:51:33.056Z\"}',NULL,'3',1,2,1,'Home'),(36,'2026-04-14 19:51:17.612566','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 34, \"show_in_menus\": false, \"latest_revision\": 35, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-06T18:51:33.130Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-14T19:50:54.759Z\"}',NULL,'3',1,2,1,'Home'),(37,'2026-04-16 19:24:37.793526','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 36, \"show_in_menus\": false, \"latest_revision\": 36, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-14T19:51:17.688Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-14T19:51:17.612Z\"}',NULL,'3',1,2,1,'Home'),(38,'2026-04-16 19:24:52.647700','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 36, \"show_in_menus\": false, \"latest_revision\": 37, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-14T19:51:17.688Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2026-04-16T19:24:37.793Z\"}',NULL,'3',1,2,1,'Home'),(39,'2026-04-16 19:25:15.083163','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 38, \"show_in_menus\": false, \"latest_revision\": 38, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-16T19:24:52.687Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-16T19:24:52.647Z\"}',NULL,'3',1,2,1,'Home'),(40,'2026-04-16 19:25:25.926781','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"home\", \"depth\": 2, \"owner\": null, \"title\": \"Home\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 3, \"url_path\": \"/home/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"hero_image\": 1, \"hero_title\": \"Software Engineer\", \"draft_title\": \"Home\", \"content_type\": 2, \"counter_items\": [{\"pk\": 1, \"page\": 3, \"sort_order\": 0, \"counter_text\": \"Projects completed\", \"counter_number\": 100}, {\"pk\": 2, \"page\": 3, \"sort_order\": 1, \"counter_text\": \"Technologies mastered\", \"counter_number\": 10}, {\"pk\": 3, \"page\": 3, \"sort_order\": 2, \"counter_text\": \"Code Commits\", \"counter_number\": 444}, {\"pk\": 4, \"page\": 3, \"sort_order\": 3, \"counter_text\": \"Years of experience\", \"counter_number\": 15}], \"hero_subtitle\": \"Hello I\'m\", \"live_revision\": 39, \"show_in_menus\": false, \"latest_revision\": 39, \"translation_key\": \"f2d2a0ba-1bb6-4425-b0bb-115d58303fd4\", \"hero_description\": \"As a Software Engineer, I design and build innovative software solutions, solve complex problems, and ensure systems are scalable and user-friendly. From creating web apps to optimizing backend systems, I bridge the gap between technology and user needs.\", \"hero_sub_subtitle\": \"Engr Robin\", \"last_published_at\": \"2026-04-16T19:25:15.124Z\", \"first_published_at\": \"2026-03-26T11:38:52.271Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2026-04-16T19:25:15.083Z\"}',NULL,'3',1,2,1,'Home');
/*!40000 ALTER TABLE `wagtailcore_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_site`
--

DROP TABLE IF EXISTS `wagtailcore_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `port` int NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int NOT NULL,
  `site_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  KEY `wagtailcore_site_hostname_96b20b46` (`hostname`),
  CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (2,'localhost',80,1,3,'Portfolio');
/*!40000 ALTER TABLE `wagtailcore_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_task`
--

DROP TABLE IF EXISTS `wagtailcore_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` (`content_type_id`),
  CONSTRAINT `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_task`
--

LOCK TABLES `wagtailcore_task` WRITE;
/*!40000 ALTER TABLE `wagtailcore_task` DISABLE KEYS */;
INSERT INTO `wagtailcore_task` VALUES (1,'Moderators approval',1,4);
/*!40000 ALTER TABLE `wagtailcore_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_taskstate`
--

DROP TABLE IF EXISTS `wagtailcore_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_taskstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `content_type_id` int NOT NULL,
  `revision_id` int NOT NULL,
  `task_id` int NOT NULL,
  `workflow_state_id` int NOT NULL,
  `finished_by_id` int DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` (`workflow_state_id`),
  KEY `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` (`finished_by_id`),
  KEY `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` (`revision_id`),
  CONSTRAINT `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` FOREIGN KEY (`revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` FOREIGN KEY (`workflow_state_id`) REFERENCES `wagtailcore_workflowstate` (`id`),
  CONSTRAINT `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` FOREIGN KEY (`finished_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_taskstate`
--

LOCK TABLES `wagtailcore_taskstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_uploadedfile`
--

DROP TABLE IF EXISTS `wagtailcore_uploadedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_uploadedfile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `for_content_type_id` int DEFAULT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` (`for_content_type_id`),
  KEY `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` FOREIGN KEY (`for_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_uploadedfile`
--

LOCK TABLES `wagtailcore_uploadedfile` WRITE;
/*!40000 ALTER TABLE `wagtailcore_uploadedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_uploadedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflow`
--

DROP TABLE IF EXISTS `wagtailcore_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflow`
--

LOCK TABLES `wagtailcore_workflow` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflow` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflow` VALUES (1,'Moderators approval',1);
/*!40000 ALTER TABLE `wagtailcore_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowcontenttype`
--

DROP TABLE IF EXISTS `wagtailcore_workflowcontenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowcontenttype` (
  `content_type_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`content_type_id`),
  KEY `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_content_type_id_b261bb37_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowcontenttype`
--

LOCK TABLES `wagtailcore_workflowcontenttype` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowcontenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_workflowcontenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowpage`
--

DROP TABLE IF EXISTS `wagtailcore_workflowpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowpage` (
  `page_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowpage`
--

LOCK TABLES `wagtailcore_workflowpage` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowpage` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowpage` VALUES (1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowstate`
--

DROP TABLE IF EXISTS `wagtailcore_workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `current_task_state_id` int DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `requested_by_id` int DEFAULT NULL,
  `workflow_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `base_content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_task_state_id` (`current_task_state_id`),
  KEY `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` (`requested_by_id`),
  KEY `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` (`workflow_id`),
  KEY `workflowstate_ct_id_idx` (`content_type_id`,`object_id`),
  KEY `workflowstate_base_ct_id_idx` (`base_content_type_id`,`object_id`),
  CONSTRAINT `wagtailcore_workflow_base_content_type_id_a30dc576_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_content_type_id_2bb78ce1_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco` FOREIGN KEY (`current_task_state_id`) REFERENCES `wagtailcore_taskstate` (`id`),
  CONSTRAINT `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` FOREIGN KEY (`requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowstate`
--

LOCK TABLES `wagtailcore_workflowstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowtask`
--

DROP TABLE IF EXISTS `wagtailcore_workflowtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailcore_workflowtask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `task_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq` (`workflow_id`,`task_id`),
  KEY `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_workflowtask_workflow_id_b9717175` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowtask`
--

LOCK TABLES `wagtailcore_workflowtask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowtask` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowtask` VALUES (1,0,1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_document`
--

DROP TABLE IF EXISTS `wagtaildocs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtaildocs_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  `collection_id` int NOT NULL,
  `file_size` bigint unsigned DEFAULT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtaildocs_document_chk_1` CHECK ((`file_size` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_document`
--

LOCK TABLES `wagtaildocs_document` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_document` DISABLE KEYS */;
INSERT INTO `wagtaildocs_document` VALUES (1,'resume','documents/resume.pdf','2026-04-01 19:03:08.728500',1,1,116012,'99711a8f8d92c138d9ff51020ed1407282480635');
/*!40000 ALTER TABLE `wagtaildocs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailembeds_embed`
--

DROP TABLE IF EXISTS `wagtailembeds_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailembeds_embed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  `max_width` smallint DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` longtext NOT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `cache_until` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailembeds_embed_hash_c9bd8c9a_uniq` (`hash`),
  KEY `wagtailembeds_embed_cache_until_26c94bb0` (`cache_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailembeds_embed`
--

LOCK TABLES `wagtailembeds_embed` WRITE;
/*!40000 ALTER TABLE `wagtailembeds_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailembeds_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailforms_formsubmission`
--

DROP TABLE IF EXISTS `wagtailforms_formsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailforms_formsubmission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_data` json NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `page_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_image`
--

DROP TABLE IF EXISTS `wagtailimages_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailimages_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int unsigned DEFAULT NULL,
  `focal_point_y` int unsigned DEFAULT NULL,
  `focal_point_width` int unsigned DEFAULT NULL,
  `focal_point_height` int unsigned DEFAULT NULL,
  `uploaded_by_user_id` int DEFAULT NULL,
  `file_size` int unsigned DEFAULT NULL,
  `collection_id` int NOT NULL,
  `file_hash` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  KEY `wagtailimages_image_file_hash_fb5bbb23` (`file_hash`),
  CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailimages_image_chk_1` CHECK ((`focal_point_x` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_2` CHECK ((`focal_point_y` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_3` CHECK ((`focal_point_width` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_4` CHECK ((`focal_point_height` >= 0)),
  CONSTRAINT `wagtailimages_image_chk_5` CHECK ((`file_size` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'John Doe Image','original_images/john-doe-image.png',600,780,'2026-03-26 11:37:25.426344',NULL,NULL,NULL,NULL,1,148383,1,'2ff9783c444a9990099b56bd2e9ebfcb745a6252','John Doe Image'),(2,'full stack','original_images/projectOne.60504072.png',1048,766,'2026-03-30 19:16:48.659386',NULL,NULL,NULL,NULL,1,189706,1,'b529c4d236d1ef92cc947837cb2e2448f9ba51fe',''),(3,'frontend','original_images/projectTwo.dbbfe4ff.png',849,831,'2026-03-30 19:18:03.536593',NULL,NULL,NULL,NULL,1,160504,1,'1cd2dc2ffd31d4cbc7a42049762bc164770a0737',''),(4,'backend','original_images/projectThree.c287ea3f.png',866,875,'2026-03-30 19:19:05.581042',NULL,NULL,NULL,NULL,1,189642,1,'3556faf810ee757c9a62da35a930b5d18bc6c261',''),(5,'user','original_images/user.png',90,90,'2026-04-01 19:04:22.079394',NULL,NULL,NULL,NULL,1,5323,1,'cde1ee5b71c5df56016d3479c92e34bf6666d8da',''),(6,'LOGO_Png_Big','original_images/LOGO_Png_Big.jpeg',2778,748,'2026-04-01 19:05:39.398857',NULL,NULL,NULL,NULL,1,310040,1,'10fce84dcc6bcd2e32c9a89e5a25ee142d2e700e','');
/*!40000 ALTER TABLE `wagtailimages_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_rendition`
--

DROP TABLE IF EXISTS `wagtailimages_rendition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailimages_rendition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`),
  CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/john-doe-image.max-165x165.png',126,165,'','max-165x165',1),(2,'images/john-doe-image.2e16d0ba.fill-600x780.png',600,780,'2e16d0ba','fill-600x780',1),(3,'images/projectOne.60504072.max-165x165.png',165,120,'','max-165x165',2),(4,'images/projectTwo.dbbfe4ff.max-165x165.png',165,161,'','max-165x165',3),(5,'images/projectThree.c287ea3f.max-165x165.png',163,165,'','max-165x165',4),(6,'images/projectOne.60504072.2e16d0ba.fill-600x780.png',590,766,'2e16d0ba','fill-600x780',2),(7,'images/projectTwo.dbbfe4ff.2e16d0ba.fill-600x780.png',600,780,'2e16d0ba','fill-600x780',3),(8,'images/projectThree.c287ea3f.2e16d0ba.fill-600x780.png',600,780,'2e16d0ba','fill-600x780',4),(9,'images/user.max-165x165.png',90,90,'','max-165x165',5),(10,'images/LOGO_Png_Big.max-165x165.jpg',165,44,'','max-165x165',6),(11,'images/LOGO_Png_Big.2e16d0ba.fill-200x80.jpg',200,80,'2e16d0ba','fill-200x80',6),(12,'images/user.2e16d0ba.fill-64x64.png',64,64,'2e16d0ba','fill-64x64',5);
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailredirects_redirect`
--

DROP TABLE IF EXISTS `wagtailredirects_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailredirects_redirect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `automatically_created` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `redirect_page_route_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`),
  CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailredirects_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_indexentry`
--

DROP TABLE IF EXISTS `wagtailsearch_indexentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailsearch_indexentry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` varchar(50) NOT NULL,
  `title_norm` double NOT NULL,
  `content_type_id` int NOT NULL,
  `autocomplete` longtext,
  `body` longtext,
  `title` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq` (`content_type_id`,`object_id`),
  FULLTEXT KEY `fulltext_body` (`body`),
  FULLTEXT KEY `fulltext_title` (`title`),
  FULLTEXT KEY `fulltext_title_body` (`title`,`body`),
  FULLTEXT KEY `fulltext_autocomplete` (`autocomplete`) /*!50100 WITH PARSER `ngram` */ ,
  CONSTRAINT `wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_indexentry`
--

LOCK TABLES `wagtailsearch_indexentry` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_indexentry` DISABLE KEYS */;
INSERT INTO `wagtailsearch_indexentry` VALUES (1,'1',0.6428571428571429,28,'John Doe Image John Doe Image','John Doe Image','John Doe Image'),(2,'3',2.25,2,'Home','','Home'),(3,'4',1.0833375,45,'Services','','Services'),(4,'5',1.3333333333333333,51,'Resume','','Resume'),(5,'6',1.8,58,'Work','','Work'),(6,'2',0.76667,28,'full stack','','full stack'),(7,'3',0.9642875,28,'frontend','','frontend'),(8,'4',1.0892857142857142,28,'backend','','backend'),(9,'1',1.2407333333333332,27,'resume','','resume'),(10,'5',1.775,28,'user','','user'),(11,'6',0.6287916666666666,28,'LOGO_Png_Big','','LOGO_Png_Big');
/*!40000 ALTER TABLE `wagtailsearch_indexentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailusers_userprofile`
--

DROP TABLE IF EXISTS `wagtailusers_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagtailusers_userprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `updated_comments_notifications` tinyint(1) NOT NULL,
  `dismissibles` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `theme` varchar(40) NOT NULL,
  `density` varchar(40) NOT NULL,
  `contrast` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
INSERT INTO `wagtailusers_userprofile` VALUES (1,1,1,1,1,'','','',1,'{}','system','default','system');
/*!40000 ALTER TABLE `wagtailusers_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_workindexpage`
--

DROP TABLE IF EXISTS `work_workindexpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_workindexpage` (
  `page_ptr_id` int NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `work_workindexpage_page_ptr_id_c4e526fd_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_workindexpage`
--

LOCK TABLES `work_workindexpage` WRITE;
/*!40000 ALTER TABLE `work_workindexpage` DISABLE KEYS */;
INSERT INTO `work_workindexpage` VALUES (6);
/*!40000 ALTER TABLE `work_workindexpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_workitemtag`
--

DROP TABLE IF EXISTS `work_workitemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_workitemtag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `work_item_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_workitemtag_tag_id_acb91b85_fk_work_worktag_id` (`tag_id`),
  KEY `work_workitemtag_work_item_id_2a2734d9` (`work_item_id`),
  CONSTRAINT `work_workitemtag_tag_id_acb91b85_fk_work_worktag_id` FOREIGN KEY (`tag_id`) REFERENCES `work_worktag` (`id`),
  CONSTRAINT `work_workitemtag_work_item_id_2a2734d9_fk_work_workorderable_id` FOREIGN KEY (`work_item_id`) REFERENCES `work_workorderable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_workitemtag`
--

LOCK TABLES `work_workitemtag` WRITE;
/*!40000 ALTER TABLE `work_workitemtag` DISABLE KEYS */;
INSERT INTO `work_workitemtag` VALUES (1,0,1,1),(2,1,1,3),(3,2,1,4),(4,0,2,2),(5,1,2,4),(6,0,3,3),(7,1,3,5),(8,2,3,1);
/*!40000 ALTER TABLE `work_workitemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_workorderable`
--

DROP TABLE IF EXISTS `work_workorderable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_workorderable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int DEFAULT NULL,
  `serial_number` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` json NOT NULL,
  `project_url` varchar(200) NOT NULL,
  `repo_url` varchar(200) NOT NULL,
  `page_id` int NOT NULL,
  `work_image_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `work_workorderable_work_image_id_77e6c4c8_fk_wagtailim` (`work_image_id`),
  KEY `work_workorderable_page_id_fe41e329` (`page_id`),
  CONSTRAINT `work_workorderable_page_id_fe41e329_fk_work_work` FOREIGN KEY (`page_id`) REFERENCES `work_workindexpage` (`page_ptr_id`),
  CONSTRAINT `work_workorderable_work_image_id_77e6c4c8_fk_wagtailim` FOREIGN KEY (`work_image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_workorderable`
--

LOCK TABLES `work_workorderable` WRITE;
/*!40000 ALTER TABLE `work_workorderable` DISABLE KEYS */;
INSERT INTO `work_workorderable` VALUES (1,0,1,'Full Stack Project','[{\"id\": \"dd6fc11a-b51b-451c-b3b5-e87a1917cc5a\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"iu46y\\\">A modern e-commerce platform built with Next.js, featuring a responsive design, user authentication, and integration with a headless CMS for easy content management.</p>\"}]','https://sinediesystem.com/','https://github.com/Shiftrobin/business-directory-app',6,2),(2,1,2,'Frontend','[{\"id\": \"eeef08d5-50e9-46fe-bc2c-9a4189f5101d\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"kfgyn\\\">A sleek task management application that helps users organize their daily activities, set priorities, and track progress. Built with React and Redux for state management.</p>\"}]','https://sinediesystem.com/','https://github.com/Shiftrobin/business-directory-app',6,3),(3,2,3,'Backend','[{\"id\": \"ad178ce2-4499-4c0b-ac75-3a81cf4c0cbb\", \"type\": \"content\", \"value\": \"<p data-block-key=\\\"0e0uj\\\">An interactive weather forecast dashboard that provides real-time weather information and 5-day forecasts for multiple locations. Utilizes a third-party weather API.</p>\"}]','https://sinediesystem.com/','https://github.com/Shiftrobin/business-directory-app',6,4);
/*!40000 ALTER TABLE `work_workorderable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_worktag`
--

DROP TABLE IF EXISTS `work_worktag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_worktag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_worktag`
--

LOCK TABLES `work_worktag` WRITE;
/*!40000 ALTER TABLE `work_worktag` DISABLE KEYS */;
INSERT INTO `work_worktag` VALUES (3,'Express.js'),(5,'MySql'),(1,'Next.js'),(2,'React.js'),(4,'Tailwindcss');
/*!40000 ALTER TABLE `work_worktag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05  0:04:35
