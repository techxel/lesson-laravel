# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.22)
# Database: book
# Generation Time: 2016-03-03 14:27:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `username`, `password`)
VALUES
	(1,'admin','ca95a7cb6dfc2a840255b7703d5a3f21');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cart_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart_item`;

CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `category_no` int(11) DEFAULT NULL,
  `preview` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `category_no`, `preview`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(1,'php',1,NULL,NULL,NULL,NULL),
	(2,'java',2,NULL,NULL,NULL,NULL),
	(3,'javascript',3,NULL,NULL,NULL,NULL),
	(4,'laravel',1,NULL,1,NULL,NULL),
	(5,'thinkphp',2,NULL,1,NULL,'2016-02-28 20:11:15'),
	(6,'yii',3,NULL,1,NULL,NULL),
	(7,'nodejs',1,NULL,3,NULL,NULL),
	(8,'reactjs',2,NULL,3,NULL,NULL),
	(9,'angularjs',3,NULL,3,NULL,NULL),
	(10,'java base',1,NULL,2,NULL,NULL),
	(11,'java web',2,NULL,2,NULL,NULL);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(16) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `active` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;

INSERT INTO `member` (`id`, `nickname`, `phone`, `password`, `created_at`, `updated_at`, `email`, `active`)
VALUES
	(12,NULL,'17000204093','ca95a7cb6dfc2a840255b7703d5a3f21','2016-01-03 16:26:24','2016-01-03 16:26:24','',0),
	(17,'magina','18576437523','ca95a7cb6dfc2a840255b7703d5a3f21','2016-01-03 20:06:26','2016-03-02 00:40:51','magina@speakez.cn',0);

/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `order_no` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payway` int(11) DEFAULT '1',
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `member_id`, `order_no`, `name`, `total_price`, `payway`, `status`, `created_at`, `updated_at`)
VALUES
	(9,12,'E14562303689','《深入浅出Node.js》《Node.js权威指南》《React》',90.00,1,2,'2016-02-23 20:26:08','2016-03-02 22:41:35'),
	(10,12,'E145623055610','《深入浅出Node.js》《Node.js权威指南》《React》',90.00,1,1,'2016-02-23 20:29:16','2016-03-02 22:44:29'),
	(18,12,'E145623133518','《React》',10.00,1,2,'2016-02-23 20:42:14','2016-02-23 20:42:15'),
	(19,12,'E145623147819','《React》',10.00,1,1,'2016-02-23 20:44:38','2016-02-23 20:44:38'),
	(20,12,'E145700200720','《React》《深入浅出Node.js》',20.00,1,1,'2016-03-03 18:46:47','2016-03-03 18:46:47');

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `pdt_snapshot` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `count`, `pdt_snapshot`)
VALUES
	(12,9,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(13,9,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(14,9,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(15,10,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(16,10,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(17,10,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(18,11,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(19,11,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(20,11,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(21,12,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(22,12,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(23,12,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(24,13,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(25,13,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(26,13,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(27,14,1,4,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(28,14,2,3,'{\"id\":2,\"name\":\"Node.js\\u6743\\u5a01\\u6307\\u5357\",\"summary\":\"\\u4ee5\\u5b9e\\u8df5\\u4e3a\\u5bfc\\u5411\\uff0c\\u4e0d\\u4ec5\\u4e3a\\u6bcf\\u4e2a\\u77e5\\u8bc6\\u70b9\\u914d\\u5907\\u4e86\\u7cbe\\u5de7\\u7684\\u5c0f\\u6848\\u4f8b\\uff0c\\u800c\\u4e14\\u8fd8\\u8bbe\\u8ba1\\u4e862\\u4e2a\\u53ef\\u64cd\\u4f5c\\u6027\\u6781\\u5f3a\\u7684\\u7efc\\u5408\\u6027\\u6848\\u4f8b\",\"price\":\"10.00\",\"preview\":\"\\/images\\/2.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}'),
	(29,14,3,2,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(30,15,3,1,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(31,17,3,1,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(32,18,3,1,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(33,19,3,1,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(34,20,3,1,'{\"id\":3,\"name\":\"React\",\"summary\":\"\\u8eab\\u51fa\\u540d\\u95e8\\uff0cFackbook\\u5f00\\u6e90\\u5de8\\u732e\\uff0c\\u4e00\\u7ecf\\u63a8\\u51fa\\uff0c\\u77ac\\u95f4\\u4eae\\u778e\\u5168\\u7403\\u653b\\u57ce\\u72ee,\\u4ee5BAT\\u4e3a\\u9996\\u7684\\u4e00\\u7ebf\\u56fd\\u5185\\u4e92\\u8054\\u7f51\\u4f01\\u4e1a\\u5747\\u4ee5\\u5feb\\u901f\\u8ddf\\u8fdb\\u7814\\u53d1\\u3001\\u5b9e\\u8df5React\\uff0c\\u4e0b\\u4e00\\u6b21\\u6c42\\u804c\\u4f60\\u5c31\\u4e00\\u5b9a\\u4f1a\\u88ab\\u9762\\u5230\",\"price\":\"10.00\",\"preview\":\"\\/images\\/3.jpg\",\"category_id\":8,\"created_at\":null,\"updated_at\":null}'),
	(35,20,1,1,'{\"id\":1,\"name\":\"\\u6df1\\u5165\\u6d45\\u51faNode.js\",\"summary\":\"\\u7b2c\\u4e00\\u672c\\u6df1\\u5ea6\\u8bb2\\u89e3Node\\u7684\\u56fe\\u4e66,\\u6e90\\u7801\\u7ea7\\u522b\\u63a2\\u5bfb\\u8fc7Node\\u7684\\u5b9e\\u73b0\\u539f\\u7406,\\u963f\\u91cc\\u5df4\\u5df4\\u4e00\\u7ebfNode\\u5f00\\u53d1\\u8005\\u6700\\u771f\\u5b9e\\u7684\\u7ecf\\u9a8c\",\"price\":\"10.00\",\"preview\":\"\\/images\\/1.jpg\",\"category_id\":7,\"created_at\":null,\"updated_at\":null}');

/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pdt_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pdt_content`;

CREATE TABLE `pdt_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(20000) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pdt_content` WRITE;
/*!40000 ALTER TABLE `pdt_content` DISABLE KEYS */;

INSERT INTO `pdt_content` (`id`, `content`, `product_id`, `created_at`, `updated_at`)
VALUES
	(1,'Node.js实战（第2季） \n¥50.20 (8.51折)\nNode.js实战（第2季）\n吴中骅 雷宗民 赵坤 刘亚中 著\nAngularJS权威教程 “百科全书”式著作，公认的AngularJS经典。MVC教程精粹，JavaScript框架教程实例。\n¥84.00 (8.49折)\nAngularJS权威教程\n（美）勒纳　著 等\nJavaScript实战—JavaScript、jQuery、HTML5、Node.js实例大全 \n¥58.60 (8.5折)\nJavaScript实战—JavaScript、jQuery、HTML5、Node.js实例大\n张泽娜 编著\n跨终端 Web 移动优先|响应式|HTML5|Hybrid|桌面+移动应用|一线前端负责人联袂推荐\n¥46.70 (8.5折)\n跨终端 Web\n徐凯　著\nAngularJS高级程序设计 深入学习AngularJS，驾驭强大的现代Web浏览器\n¥84.20 (8.51折)\nAngularJS高级程序设计\n[美] Adam Freeman 弗里曼　著 等\nJavaScript框架设计 进入JavaScript框架设计的魔法指南。html+css+javascript教程详解，JavaScript高级程序设计精粹！\n¥75.00 (8.43折)\nJavaScript框架设计\n司徒正美　编著\n[当当自营]金龙鱼 原香稻大米5000g（限北京市购买）新老包装随机发放 自营食品 粮油 新老包装随机发货  物流原因限北京市购买\n¥61.00\n[当当自营]金龙鱼 原香稻大米5000g（限北京市购买）新老包装\n远山 白莲子 福建建宁磨皮莲子250g*2袋 口感粉面水磨通心去芯 满138-10 满228-20 满328-30\n¥36.80\n远山 白莲子 福建建宁磨皮莲子250g*2袋 口感粉面水磨通心去\n更多>>',1,NULL,NULL),
	(2,'xxxxxxxxx',2,NULL,NULL),
	(3,'<p>111</p>',5,'2016-02-29 02:15:37','2016-02-29 02:15:37'),
	(4,'<p>休息休息</p>',6,'2016-02-29 02:50:42','2016-02-29 02:50:42');

/*!40000 ALTER TABLE `pdt_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pdt_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pdt_images`;

CREATE TABLE `pdt_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(200) DEFAULT NULL,
  `image_no` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pdt_images` WRITE;
/*!40000 ALTER TABLE `pdt_images` DISABLE KEYS */;

INSERT INTO `pdt_images` (`id`, `image_path`, `image_no`, `product_id`, `created_at`, `updated_at`)
VALUES
	(1,'/images/1.jpg',NULL,1,NULL,NULL),
	(2,'/images/2.jpg',NULL,1,NULL,NULL),
	(3,'/images/3.jpg',NULL,1,NULL,NULL),
	(4,'/upload/images/20160229/27edde94c996defb3e594c54d9328459.png',1,5,'2016-02-29 02:15:37','2016-02-29 02:15:37'),
	(5,'/upload/images/20160229/4de6d095b3a014af4b1b2df29bde0ab5.png',2,5,'2016-02-29 02:15:37','2016-02-29 02:15:37'),
	(6,'/upload/images/20160229/f46db7a5c23bc65ca2df8d6c77a38c2e.png',1,6,'2016-02-29 02:50:42','2016-02-29 02:50:42'),
	(7,'/upload/images/20160229/f69a1305399e7ed2cb9cc6db79312887.png',2,6,'2016-02-29 02:50:42','2016-02-29 02:50:42');

/*!40000 ALTER TABLE `pdt_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `preview` varchar(200) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `name`, `summary`, `price`, `preview`, `category_id`, `created_at`, `updated_at`)
VALUES
	(1,'深入浅出Node.js','第一本深度讲解Node的图书,源码级别探寻过Node的实现原理,阿里巴巴一线Node开发者最真实的经验',10.00,'/images/1.jpg',7,NULL,NULL),
	(2,'Node.js权威指南','以实践为导向，不仅为每个知识点配备了精巧的小案例，而且还设计了2个可操作性极强的综合性案例',10.00,'/images/2.jpg',7,NULL,NULL),
	(3,'React','身出名门，Fackbook开源巨献，一经推出，瞬间亮瞎全球攻城狮,以BAT为首的一线国内互联网企业均以快速跟进研发、实践React，下一次求职你就一定会被面到',10.00,'/images/3.jpg',8,NULL,NULL),
	(4,'React Native','如果你对开发Web端的原生移动应用感兴趣，《React Native：用JavaScript开发移动应用》就是一本不容错过的以实例代码为引导的入门书籍',10.00,'/images/4.jpg',8,NULL,NULL),
	(5,'test','sss',999.00,'/upload/images/20160229/ca8fd990a0cd3c4937afd7107cf01389.png',7,'2016-02-29 02:15:37','2016-02-29 02:15:37'),
	(6,'test2','x\'x\'x\'x',999.00,'/upload/images/20160229/305ab8feeff80360d817e70580c6b6e6.png',7,'2016-02-29 02:50:42','2016-02-29 02:50:42');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table temp_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `temp_email`;

CREATE TABLE `temp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `temp_email` WRITE;
/*!40000 ALTER TABLE `temp_email` DISABLE KEYS */;

INSERT INTO `temp_email` (`id`, `member_id`, `code`, `deadline`)
VALUES
	(2,17,'1ece9d4717eb2a31a97967e629dbc1da','2016-01-04 20:06:26');

/*!40000 ALTER TABLE `temp_email` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table temp_phone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `temp_phone`;

CREATE TABLE `temp_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `temp_phone` WRITE;
/*!40000 ALTER TABLE `temp_phone` DISABLE KEYS */;

INSERT INTO `temp_phone` (`id`, `phone`, `code`, `deadline`)
VALUES
	(10,'17000204093',209649,'2016-01-10 19:45:22');

/*!40000 ALTER TABLE `temp_phone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
