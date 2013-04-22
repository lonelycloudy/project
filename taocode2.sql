/*
SQLyog Enterprise Trial - MySQL GUI v8.14 
MySQL - 5.5.9-log : Database - taocode2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taocode2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `taocode2`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_message` */

DROP TABLE IF EXISTS `auth_message`;

CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_message` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add content type',1,'add_contenttype'),(2,'Can change content type',1,'change_contenttype'),(3,'Can delete content type',1,'delete_contenttype'),(4,'Can add session',2,'add_session'),(5,'Can change session',2,'change_session'),(6,'Can delete session',2,'delete_session'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add message',6,'add_message'),(17,'Can change message',6,'change_message'),(18,'Can delete message',6,'delete_message'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add message',9,'add_message'),(26,'Can change message',9,'change_message'),(27,'Can delete message',9,'delete_message'),(28,'Can add project',10,'add_project'),(29,'Can change project',10,'change_project'),(30,'Can delete project',10,'delete_project'),(31,'Can add project profile',11,'add_projectprofile'),(32,'Can change project profile',11,'change_projectprofile'),(33,'Can delete project profile',11,'delete_projectprofile'),(34,'Can add project member',12,'add_projectmember'),(35,'Can change project member',12,'change_projectmember'),(36,'Can delete project member',12,'delete_projectmember'),(37,'Can add project watcher',13,'add_projectwatcher'),(38,'Can change project watcher',13,'change_projectwatcher'),(39,'Can delete project watcher',13,'delete_projectwatcher'),(40,'Can add repository',14,'add_repository'),(41,'Can change repository',14,'change_repository'),(42,'Can delete repository',14,'delete_repository'),(43,'Can add issue',15,'add_issue'),(44,'Can change issue',15,'change_issue'),(45,'Can delete issue',15,'delete_issue'),(46,'Can add tag',16,'add_tag'),(47,'Can change tag',16,'change_tag'),(48,'Can delete tag',16,'delete_tag'),(49,'Can add issue comment',17,'add_issuecomment'),(50,'Can change issue comment',17,'change_issuecomment'),(51,'Can delete issue comment',17,'delete_issuecomment'),(52,'Can add issue vote',18,'add_issuevote'),(53,'Can change issue vote',18,'change_issuevote'),(54,'Can delete issue vote',18,'delete_issuevote'),(55,'Can add wiki content',19,'add_wikicontent'),(56,'Can change wiki content',19,'change_wikicontent'),(57,'Can delete wiki content',19,'delete_wikicontent'),(58,'Can add wiki content log',20,'add_wikicontentlog'),(59,'Can change wiki content log',20,'change_wikicontentlog'),(60,'Can delete wiki content log',20,'delete_wikicontentlog'),(61,'Can add project attachment',21,'add_projectattachment'),(62,'Can change project attachment',21,'change_projectattachment'),(63,'Can delete project attachment',21,'delete_projectattachment'),(64,'Can add verify task',22,'add_verifytask'),(65,'Can change verify task',22,'change_verifytask'),(66,'Can delete verify task',22,'delete_verifytask'),(67,'Can add user watcher',23,'add_userwatcher'),(68,'Can change user watcher',23,'change_userwatcher'),(69,'Can delete user watcher',23,'delete_userwatcher'),(70,'Can add activity',24,'add_activity'),(71,'Can change activity',24,'change_activity'),(72,'Can delete activity',24,'delete_activity'),(73,'Can add repos checker',25,'add_reposchecker'),(74,'Can change repos checker',25,'change_reposchecker'),(75,'Can delete repos checker',25,'delete_reposchecker'),(76,'Can add feature project',26,'add_featureproject'),(77,'Can change feature project',26,'change_featureproject'),(78,'Can delete feature project',26,'delete_featureproject'),(79,'Can add old project',27,'add_oldproject'),(80,'Can change old project',27,'change_oldproject'),(81,'Can delete old project',27,'delete_oldproject');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`) values (1,'webmaster','','','webmaster@etentec.com','sha1$b73b8$ca31a078a75f0db2b04c439ae9ac861f032d8940',1,1,1,'2012-04-13 17:15:59','2012-04-13 17:15:59');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`name`,`app_label`,`model`) values (1,'content type','contenttypes','contenttype'),(2,'session','sessions','session'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'message','auth','message'),(7,'log entry','admin','logentry'),(8,'user','taocode2','user'),(9,'message','taocode2','message'),(10,'project','taocode2','project'),(11,'project profile','taocode2','projectprofile'),(12,'project member','taocode2','projectmember'),(13,'project watcher','taocode2','projectwatcher'),(14,'repository','taocode2','repository'),(15,'issue','taocode2','issue'),(16,'tag','taocode2','tag'),(17,'issue comment','taocode2','issuecomment'),(18,'issue vote','taocode2','issuevote'),(19,'wiki content','taocode2','wikicontent'),(20,'wiki content log','taocode2','wikicontentlog'),(21,'project attachment','taocode2','projectattachment'),(22,'verify task','taocode2','verifytask'),(23,'user watcher','taocode2','userwatcher'),(24,'activity','taocode2','activity'),(25,'repos checker','taocode2','reposchecker'),(26,'feature project','taocode2','featureproject'),(27,'old project','taocode2','oldproject');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('3cca802682f7fc346152a81e16333ca7','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-04-30 15:41:24'),('44c1eb2df75817626318dc3c25ec4a8f','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-05-03 04:12:46'),('453186c24dc80449a2d5dbbdeaa0239d','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-05-02 05:56:01'),('4a73442eb6b4a2291d33ceb86d34ec2c','NjlmOGQ3Y2ViZjYyY2NhNzdjYTE1MjE5MTI3ZGNmYmMwODM2Yjk0ZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-01 12:53:38'),('574ef9c388aaf51a4302e3ee4676c562','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-08-08 08:10:14'),('71590c8c9004fd343c78eb4a7990c597','MWZmYWQ4ZTZhMzBlZmJiYWM0YjEwYWVmNWIzODc1NzJjNzZmMzExOTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSoA6CQBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSd0YW9jb2RlMi5hcHBzLnVzZXIu\nYXV0aC5Vc2VyQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigECdS4=\n','2012-04-25 11:18:57'),('71ab28ee3b063148adb866681fa8d270','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-04-29 18:56:10'),('8031b8aa77ce0e669f80980f0c06a92c','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2013-04-26 16:46:57'),('9109c0819527370dd6c3af9b3371a3be','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-05-09 15:48:05'),('9354f5bad7c7cd1c35eeffd0c9ec5bfc','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-05-02 07:22:09'),('cd4388602d9ac3a19c01dc2a17245e28','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-04-27 18:30:20'),('f918cd77a3901bf38f49878e8e31d10d','YjE2ZDIyMWY2NGY0OTgzZTEzOTRmMDNkNjAyZDQ0OTdjMDUwNjVlYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSd0YW9jb2RlMi5hcHBzLnVzZXIuYXV0aC5Vc2VyQXV0aEJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigECdS4=\n','2012-05-01 12:53:40');

/*Table structure for table `taocode2_activity` */

DROP TABLE IF EXISTS `taocode2_activity`;

CREATE TABLE `taocode2_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `act_type` varchar(32) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_activity_499df97c` (`project_id`),
  KEY `taocode2_activity_403f60f` (`user_id`),
  KEY `taocode2_activity_2943a58c` (`act_type`),
  KEY `taocode2_activity_34eb116e` (`ctime`),
  CONSTRAINT `project_id_refs_id_51b19834` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`),
  CONSTRAINT `user_id_refs_id_7dc3abb1` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_activity` */

insert  into `taocode2_activity`(`id`,`project_id`,`user_id`,`act_type`,`content`,`ctime`) values (1,1,2,'new_prj','1','2012-04-13 18:36:49'),(2,2,2,'new_prj','2','2012-04-13 19:54:24'),(3,3,2,'new_prj','3','2012-04-16 15:41:45'),(4,4,2,'new_prj','4','2012-04-16 15:48:11'),(5,5,2,'new_prj','5','2012-04-16 15:49:28'),(6,6,2,'new_prj','6','2012-04-16 15:51:24'),(7,7,2,'new_prj','7','2012-04-16 15:51:49'),(8,8,2,'new_prj','8','2012-04-16 15:52:31'),(9,9,2,'new_prj','9','2012-04-16 15:55:18'),(10,10,2,'new_prj','10','2012-04-16 16:30:06'),(11,11,2,'new_prj','11','2012-04-16 16:31:06'),(12,12,2,'new_prj','12','2012-04-16 16:42:33'),(13,13,2,'new_prj','13','2012-04-16 17:05:21'),(14,14,2,'new_prj','14','2012-04-17 12:55:55'),(15,15,2,'new_prj','15','2012-04-17 13:00:30'),(16,16,2,'new_prj','16','2012-04-17 13:07:00'),(17,17,2,'new_prj','17','2012-04-17 14:17:54'),(18,18,2,'new_prj','18','2012-04-17 14:58:01'),(19,19,2,'new_prj','19','2012-04-17 15:01:48'),(20,20,2,'new_prj','20','2012-04-17 15:04:17'),(21,21,2,'new_prj','21','2012-04-17 15:05:13'),(22,22,2,'new_prj','22','2012-04-17 15:06:59'),(23,23,2,'new_prj','23','2012-04-17 15:14:23'),(24,24,2,'new_prj','24','2012-04-17 15:22:01'),(25,25,2,'new_prj','25','2012-04-17 16:37:15'),(26,26,2,'new_prj','26','2012-04-17 16:41:56'),(27,27,2,'new_prj','27','2012-04-17 16:53:46'),(28,28,2,'new_prj','28','2012-04-18 06:12:51'),(29,29,2,'new_prj','29','2012-04-18 06:47:48'),(30,30,2,'new_prj','30','2012-04-18 06:53:02'),(31,31,2,'new_prj','31','2012-04-18 06:53:35'),(32,32,2,'new_prj','32','2012-04-18 06:56:00'),(33,33,2,'new_prj','33','2012-04-18 07:00:21'),(34,34,2,'new_prj','34','2012-04-18 07:22:49'),(35,35,2,'new_prj','35','2012-04-18 10:01:04'),(36,36,2,'new_prj','36','2012-04-18 10:34:59'),(37,37,2,'new_prj','37','2012-04-18 11:11:49'),(38,38,2,'new_prj','38','2012-04-18 11:19:10'),(39,39,2,'new_prj','39','2012-04-19 04:13:12');

/*Table structure for table `taocode2_featureproject` */

DROP TABLE IF EXISTS `taocode2_featureproject`;

CREATE TABLE `taocode2_featureproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `desc` longtext NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`),
  CONSTRAINT `project_id_refs_id_17c7e3c` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_featureproject` */

/*Table structure for table `taocode2_issue` */

DROP TABLE IF EXISTS `taocode2_issue`;

CREATE TABLE `taocode2_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext,
  `status` smallint(6) NOT NULL,
  `vote_count` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_issue_499df97c` (`project_id`),
  KEY `taocode2_issue_685aee7` (`creator_id`),
  KEY `taocode2_issue_36528e23` (`status`),
  CONSTRAINT `creator_id_refs_id_42ecca94` FOREIGN KEY (`creator_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `project_id_refs_id_7db9c4a9` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_issue` */

/*Table structure for table `taocode2_issuecomment` */

DROP TABLE IF EXISTS `taocode2_issuecomment`;

CREATE TABLE `taocode2_issuecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_issuecomment_18752524` (`issue_id`),
  KEY `taocode2_issuecomment_5d52dd10` (`owner_id`),
  CONSTRAINT `issue_id_refs_id_513d3dc7` FOREIGN KEY (`issue_id`) REFERENCES `taocode2_issue` (`id`),
  CONSTRAINT `owner_id_refs_id_56ece982` FOREIGN KEY (`owner_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_issuecomment` */

/*Table structure for table `taocode2_issuevote` */

DROP TABLE IF EXISTS `taocode2_issuevote`;

CREATE TABLE `taocode2_issuevote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_id` (`issue_id`,`owner_id`),
  KEY `taocode2_issuevote_18752524` (`issue_id`),
  KEY `taocode2_issuevote_5d52dd10` (`owner_id`),
  CONSTRAINT `issue_id_refs_id_61026e31` FOREIGN KEY (`issue_id`) REFERENCES `taocode2_issue` (`id`),
  CONSTRAINT `owner_id_refs_id_70b9a088` FOREIGN KEY (`owner_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_issuevote` */

/*Table structure for table `taocode2_message` */

DROP TABLE IF EXISTS `taocode2_message`;

CREATE TABLE `taocode2_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `sender_status` smallint(6) NOT NULL,
  `reader_status` smallint(6) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `send_time` datetime NOT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_message_5d52dd10` (`owner_id`),
  KEY `taocode2_message_6fe0a617` (`sender_id`),
  CONSTRAINT `owner_id_refs_id_42d93f1e` FOREIGN KEY (`owner_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `sender_id_refs_id_42d93f1e` FOREIGN KEY (`sender_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_message` */

/*Table structure for table `taocode2_oldproject` */

DROP TABLE IF EXISTS `taocode2_oldproject`;

CREATE TABLE `taocode2_oldproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oldid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `taocode2_oldproject_4faf29be` (`oldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_oldproject` */

/*Table structure for table `taocode2_project` */

DROP TABLE IF EXISTS `taocode2_project`;

CREATE TABLE `taocode2_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `tags` longtext,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `license` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `taocode2_project_5d52dd10` (`owner_id`),
  KEY `taocode2_project_36528e23` (`status`),
  CONSTRAINT `owner_id_refs_id_5844a2c8` FOREIGN KEY (`owner_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_project` */

insert  into `taocode2_project`(`id`,`owner_id`,`name`,`title`,`tags`,`status`,`ctime`,`license`,`is_public`) values (1,2,'myapp','app',NULL,1,'2012-04-13 18:36:49','Apache License 2.0',1),(2,2,'second','second-liuxin',NULL,1,'2012-04-13 19:54:24','Apache License 2.0',1),(3,2,'liuxin_1','liuxin_1',NULL,1,'2012-04-16 15:41:45','Apache License 2.0',1),(4,2,'test11','test11',NULL,1,'2012-04-16 15:48:11','Apache License 2.0',0),(5,2,'test12','test12',NULL,1,'2012-04-16 15:49:28','Apache License 2.0',0),(6,2,'test13','test13',NULL,1,'2012-04-16 15:51:24','Apache License 2.0',0),(7,2,'test14','test14',NULL,1,'2012-04-16 15:51:49','Apache License 2.0',0),(8,2,'test15','test15',NULL,1,'2012-04-16 15:52:31','Apache License 2.0',0),(9,2,'test16','test16',NULL,1,'2012-04-16 15:55:18','Apache License 2.0',0),(10,2,'test17','test17',NULL,1,'2012-04-16 16:30:06','Apache License 2.0',0),(11,2,'test18','test18',NULL,1,'2012-04-16 16:31:06','Apache License 2.0',1),(12,2,'test19','test19',NULL,1,'2012-04-16 16:42:33','Apache License 2.0',1),(13,2,'test2','test2',NULL,1,'2012-04-16 17:05:21','Apache License 2.0',0),(14,2,'12417','12417',NULL,1,'2012-04-17 12:55:55','Apache License 2.0',1),(15,2,'124171','124171',NULL,1,'2012-04-17 13:00:29','Apache License 2.0',1),(16,2,'124172','124172',NULL,1,'2012-04-17 13:07:00','Apache License 2.0',1),(17,2,'124173','124173',NULL,1,'2012-04-17 14:17:54','Apache License 2.0',1),(18,2,'124174','124174',NULL,1,'2012-04-17 14:58:01','Apache License 2.0',1),(19,2,'124175','124175',NULL,1,'2012-04-17 15:01:48','Apache License 2.0',1),(20,2,'124176','124176',NULL,1,'2012-04-17 15:04:17','Apache License 2.0',1),(21,2,'124177','124177',NULL,1,'2012-04-17 15:05:13','Apache License 2.0',1),(22,2,'124178','124178',NULL,1,'2012-04-17 15:06:59','Apache License 2.0',1),(23,2,'124179','124179',NULL,1,'2012-04-17 15:14:23','Apache License 2.0',0),(24,2,'124180','124180',NULL,1,'2012-04-17 15:22:01','Apache License 2.0',0),(25,2,'test20','test20',NULL,1,'2012-04-17 16:37:15','Apache License 2.0',1),(26,2,'test21','test21',NULL,1,'2012-04-17 16:41:56','Apache License 2.0',0),(27,2,'test23','test23',NULL,1,'2012-04-17 16:53:46','Apache License 2.0',1),(28,2,'2012418','2012418',NULL,1,'2012-04-18 06:12:51','Apache License 2.0',1),(29,2,'20124181','20124181',NULL,1,'2012-04-18 06:47:48','Apache License 2.0',1),(30,2,'20124182','20124182',NULL,1,'2012-04-18 06:53:02','Apache License 2.0',1),(31,2,'20124183','20124183',NULL,1,'2012-04-18 06:53:35','Apache License 2.0',1),(32,2,'20124184','20124184',NULL,1,'2012-04-18 06:56:00','Apache License 2.0',1),(33,2,'20124185','20124185',NULL,1,'2012-04-18 07:00:21','Apache License 2.0',1),(34,2,'zhangyuan1','zhangyuan1',NULL,1,'2012-04-18 07:22:49','Apache License 2.0',1),(35,2,'boy1','boy1',NULL,1,'2012-04-18 10:01:04','Apache License 2.0',1),(36,2,'boy12','boy12',NULL,1,'2012-04-18 10:34:59','Apache License 2.0',1),(37,2,'boy2','boy2',NULL,1,'2012-04-18 11:11:49','Apache License 2.0',1),(38,2,'zy123','zy123',NULL,1,'2012-04-18 11:19:10','Apache License 2.0',0),(39,2,'12419','12419',NULL,1,'2012-04-19 04:13:12','Apache License 2.0',0);

/*Table structure for table `taocode2_projectattachment` */

DROP TABLE IF EXISTS `taocode2_projectattachment`;

CREATE TABLE `taocode2_projectattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `ftype` varchar(12) NOT NULL,
  `ftid` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `fname` varchar(1024) NOT NULL,
  `orig_name` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_projectattachment_499df97c` (`project_id`),
  KEY `taocode2_projectattachment_5d52dd10` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_6bf91805` FOREIGN KEY (`owner_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `project_id_refs_id_651b4f38` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_projectattachment` */

/*Table structure for table `taocode2_projectmember` */

DROP TABLE IF EXISTS `taocode2_projectmember`;

CREATE TABLE `taocode2_projectmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `member_type` smallint(6) NOT NULL,
  `join_time` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`project_id`),
  KEY `taocode2_projectmember_403f60f` (`user_id`),
  KEY `taocode2_projectmember_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_1087db89` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`),
  CONSTRAINT `user_id_refs_id_478e8174` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_projectmember` */

/*Table structure for table `taocode2_projectprofile` */

DROP TABLE IF EXISTS `taocode2_projectprofile`;

CREATE TABLE `taocode2_projectprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `taocode2_projectprofile_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_38e05f3d` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_projectprofile` */

/*Table structure for table `taocode2_projectwatcher` */

DROP TABLE IF EXISTS `taocode2_projectwatcher`;

CREATE TABLE `taocode2_projectwatcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `watch_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`project_id`),
  KEY `taocode2_projectwatcher_403f60f` (`user_id`),
  KEY `taocode2_projectwatcher_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_5705e330` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`),
  CONSTRAINT `user_id_refs_id_5513cf6d` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_projectwatcher` */

/*Table structure for table `taocode2_reposchecker` */

DROP TABLE IF EXISTS `taocode2_reposchecker`;

CREATE TABLE `taocode2_reposchecker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `last_rev` int(11) NOT NULL,
  `last_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`),
  KEY `taocode2_reposchecker_6fdb1a96` (`last_time`),
  CONSTRAINT `project_id_refs_id_691e860d` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_reposchecker` */

insert  into `taocode2_reposchecker`(`id`,`project_id`,`last_rev`,`last_time`) values (1,37,3,'2013-04-12 16:51:31'),(2,38,1,'2012-04-18 11:19:11'),(3,39,1,'2012-04-19 04:13:13');

/*Table structure for table `taocode2_repository` */

DROP TABLE IF EXISTS `taocode2_repository`;

CREATE TABLE `taocode2_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `repos_type` smallint(6) NOT NULL,
  `vc_type` smallint(6) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `auth_user` varchar(128) NOT NULL,
  `auth_password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_repository_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_14c86799` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_repository` */

/*Table structure for table `taocode2_tag` */

DROP TABLE IF EXISTS `taocode2_tag`;

CREATE TABLE `taocode2_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `color` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_tag_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_162af8b2` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_tag` */

/*Table structure for table `taocode2_user` */

DROP TABLE IF EXISTS `taocode2_user`;

CREATE TABLE `taocode2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `supper` tinyint(1) NOT NULL,
  `sex` smallint(6) NOT NULL,
  `last_login_ip` varchar(32) NOT NULL,
  `last_login` datetime NOT NULL,
  `openId` varchar(40) DEFAULT NULL,
  `openPlatform` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `taocode2_user_36528e23` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_user` */

insert  into `taocode2_user`(`id`,`name`,`email`,`password`,`status`,`ctime`,`supper`,`sex`,`last_login_ip`,`last_login`,`openId`,`openPlatform`) values (1,'test','test@etentec.com','e10adc3949ba59abbe56e057f20f883e',1,'2012-04-13 18:27:32',0,-1,'192.168.0.192','2012-04-15 18:55:51',NULL,NULL),(2,'liuxin','liuxin@etentec.om','e10adc3949ba59abbe56e057f20f883e',1,'2012-04-13 18:30:19',1,-1,'192.168.0.192','2013-04-12 16:46:57',NULL,NULL);

/*Table structure for table `taocode2_userwatcher` */

DROP TABLE IF EXISTS `taocode2_userwatcher`;

CREATE TABLE `taocode2_userwatcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `watch_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`target_id`),
  KEY `taocode2_userwatcher_403f60f` (`user_id`),
  KEY `taocode2_userwatcher_6ca73769` (`target_id`),
  CONSTRAINT `target_id_refs_id_2be88bd0` FOREIGN KEY (`target_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `user_id_refs_id_2be88bd0` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_userwatcher` */

/*Table structure for table `taocode2_verifytask` */

DROP TABLE IF EXISTS `taocode2_verifytask`;

CREATE TABLE `taocode2_verifytask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `ctime` datetime NOT NULL,
  `expire_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `taocode2_verifytask_403f60f` (`user_id`),
  KEY `taocode2_verifytask_52094d6e` (`name`),
  KEY `taocode2_verifytask_34eb116e` (`ctime`),
  CONSTRAINT `user_id_refs_id_11ab36cc` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_verifytask` */

/*Table structure for table `taocode2_wikicontent` */

DROP TABLE IF EXISTS `taocode2_wikicontent`;

CREATE TABLE `taocode2_wikicontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`path`),
  KEY `taocode2_wikicontent_499df97c` (`project_id`),
  KEY `taocode2_wikicontent_403f60f` (`user_id`),
  KEY `taocode2_wikicontent_7cdc735f` (`last_user_id`),
  KEY `taocode2_wikicontent_6a8a34e2` (`path`),
  CONSTRAINT `last_user_id_refs_id_33a97758` FOREIGN KEY (`last_user_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `project_id_refs_id_3521b425` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`),
  CONSTRAINT `user_id_refs_id_33a97758` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_wikicontent` */

/*Table structure for table `taocode2_wikicontentlog` */

DROP TABLE IF EXISTS `taocode2_wikicontentlog`;

CREATE TABLE `taocode2_wikicontentlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `content` longtext,
  `old_content` longtext,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taocode2_wikicontentlog_499df97c` (`project_id`),
  KEY `taocode2_wikicontentlog_403f60f` (`user_id`),
  KEY `taocode2_wikicontentlog_5c4ded7c` (`wiki_id`),
  CONSTRAINT `project_id_refs_id_5ff828de` FOREIGN KEY (`project_id`) REFERENCES `taocode2_project` (`id`),
  CONSTRAINT `user_id_refs_id_54337d59` FOREIGN KEY (`user_id`) REFERENCES `taocode2_user` (`id`),
  CONSTRAINT `wiki_id_refs_id_717a963e` FOREIGN KEY (`wiki_id`) REFERENCES `taocode2_wikicontent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taocode2_wikicontentlog` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
