SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for app_key
-- ----------------------------
DROP TABLE IF EXISTS `app_key`;
CREATE TABLE `app_key` (
  `key` varchar(255) NOT NULL,
  `secrect` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '校区id',
  `campus_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '校区名称',
  `city_id` int(11) NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `location_x` double DEFAULT NULL,
  `location_y` double DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `close_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `custom_service` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`campus_id`,`city_id`),
  KEY `campus_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- ----------------------------
-- Table structure for campus_admin
-- ----------------------------
DROP TABLE IF EXISTS `campus_admin`;
CREATE TABLE `campus_admin` (
  `campus_admin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `campus_id` int(11) NOT NULL,
  `last_login_date` date DEFAULT NULL,
  PRIMARY KEY (`campus_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for campus_admin_type
-- ----------------------------
DROP TABLE IF EXISTS `campus_admin_type`;
CREATE TABLE `campus_admin_type` (
  `campus_admin_type` smallint(3) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for campus_status
-- ----------------------------
DROP TABLE IF EXISTS `campus_status`;
CREATE TABLE `campus_status` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `city_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `campus_id` int(11) NOT NULL,
  `phone_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `suggestion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campus_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float(6,2) NOT NULL,
  `discount_price` float(6,2) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '食品状态，1上架，0下架',
  `grade` float(2,0) DEFAULT NULL,
  `food_flag` varchar(255) DEFAULT NULL COMMENT '食品标签',
  `is_discount` smallint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `prime_cost` float(6,2) DEFAULT NULL,
  `sale_number` bigint(11) DEFAULT NULL,
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `food_count` int(11) NOT NULL DEFAULT '500',
  `to_home` smallint(6) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `home_image` varchar(255) DEFAULT NULL,
  `is_full_discount` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`food_id`,`campus_id`),
  KEY `campus_foodid` (`campus_id`,`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100102 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for food_category
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `campus_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `serial` smallint(2) DEFAULT NULL,
  `is_open` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`,`campus_id`),
  KEY `campus_cateogry` (`campus_id`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4710 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for food_comment
-- ----------------------------
DROP TABLE IF EXISTS `food_comment`;
CREATE TABLE `food_comment` (
  `food_id` bigint(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `grade` smallint(6) NOT NULL,
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `is_hidden` smallint(6) NOT NULL DEFAULT '0',
  `order_id` bigint(40) NOT NULL,
  PRIMARY KEY (`food_id`,`phone`,`date`,`campus_id`),
  KEY `campus_food_comment` (`campus_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for hot_search
-- ----------------------------
DROP TABLE IF EXISTS `hot_search`;
CREATE TABLE `hot_search` (
  `hot_id` int(10) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `search_tag` varchar(255) NOT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `is_display` tinyint(4) NOT NULL DEFAULT '1',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`hot_id`),
  KEY `index_search` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` bigint(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `title` varchar(100) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`news_id`,`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `together_id` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `price` float(6,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `is_remarked` smallint(6) NOT NULL DEFAULT '0',
  `food_id` bigint(20) NOT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `together_date` datetime DEFAULT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `reserve_time` varchar(30) DEFAULT NULL COMMENT '预定送达时间',
  `message` varchar(255) DEFAULT NULL COMMENT '留言',
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `pay_way` smallint(6) DEFAULT '0',
  `prefere_id` int(11) DEFAULT NULL,
  `total_price` float(6,2) DEFAULT NULL,
  `charge_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`phone`),
  KEY `together_id_index` (`together_id`),
  KEY `admin_phone_index` (`admin_phone`),
  KEY `rank_index` (`rank`),
  KEY `create_time_index` (`create_time`),
  KEY `together_date_index` (`together_date`),
  KEY `food_id_index` (`food_id`),
  KEY `campus_order` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for order_pay
-- ----------------------------
DROP TABLE IF EXISTS `order_pay`;
CREATE TABLE `order_pay` (
  `pay_id` smallint(6) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for preferential
-- ----------------------------
DROP TABLE IF EXISTS `preferential`;
CREATE TABLE `preferential` (
  `preferential_id` int(11) NOT NULL AUTO_INCREMENT,
  `need_number` int(11) NOT NULL,
  `discount_num` int(11) NOT NULL DEFAULT '0',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`preferential_id`),
  KEY `prefer_campus` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for receiver
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver` (
  `phone_id` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tag` smallint(6) DEFAULT '1',
  `rank` varchar(20) NOT NULL,
  `is_out` smallint(6) NOT NULL DEFAULT '0' COMMENT '地址是否失效',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`rank`,`phone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `phone` varchar(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '类型：0,分派元;1,配送员;2,普通用户',
  `create_time` date NOT NULL COMMENT '注册时间',
  `nickname` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `last_login_date` date DEFAULT NULL,
  `token` varchar(256) DEFAULT NULL,
  `sex` smallint(1) DEFAULT NULL,
  `academy` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `last_campus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`phone`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `mail_2` (`mail`),
  KEY `campus_index` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for users_type
-- ----------------------------
DROP TABLE IF EXISTS `users_type`;
CREATE TABLE `users_type` (
  `user_type` smallint(6) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- View structure for detail_order
-- ----------------------------
DROP VIEW IF EXISTS `detail_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `detail_order` AS SELECT
	`orders`.`together_id` AS `together_id`,
	`orders`.`campus_id` AS `campus_id`,
	`food`.`name` AS `food_name`,
	`food`.`price` AS `price`,
	`food`.`discount_price` AS `discount_price`,
	`food`.`is_discount` AS `is_discount`,
	`orders`.`order_count` AS `order_count`,
	`orders`.`status` AS `status`
FROM
	(`orders` JOIN `food`)
WHERE
	(
		(
			`orders`.`food_id` = `food`.`food_id`
		)
		AND (`orders`.`status` <> 0)
		AND (
			`food`.`campus_id` = `orders`.`campus_id`
		)
		AND (`orders`.`tag` = 1)
	) ;

-- ----------------------------
-- View structure for order_food_receiver
-- ----------------------------
DROP VIEW IF EXISTS `order_food_receiver`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `order_food_receiver` AS SELECT
	`orders`.`phone` AS `phone`,
	`orders`.`campus_id` AS `campus_id`,
	`orders`.`together_id` AS `together_id`,
	`orders`.`order_count` AS `order_count`,
	`orders`.`food_id` AS `food_id`,
	`orders`.`rank` AS `rank`,
	`orders`.`together_date` AS `together_date`,
	`orders`.`admin_phone` AS `admin_phone`,
	`orders`.`reserve_time` AS `reserve_time`,
	`orders`.`tag` AS `tag`,
	`food`.`name` AS `foodName`,
	`food`.`price` AS `price`,
	`food`.`discount_price` AS `discount_price`,
	`food`.`img_url` AS `img_url`,
	`food`.`status` AS `status`,
	`food`.`is_discount` AS `is_discount`,
	`food`.`message` AS `message`,
	`receiver`.`phone_id` AS `customer_phone`,
	`receiver`.`name` AS `receiverName`,
	`receiver`.`address` AS `address`,
	`receiver`.`is_out` AS `is_out`
FROM
	(
		(`orders` JOIN `food`)
		JOIN `receiver`
	)
WHERE
	(
		(
			`orders`.`food_id` = `food`.`food_id`
		)
		AND (
			`orders`.`phone` = `receiver`.`phone`
		)
	) ;

-- ----------------------------
-- View structure for together_order
-- ----------------------------
DROP VIEW IF EXISTS `together_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `together_order` AS SELECT
	`orders`.`phone` AS `phone`,
	`orders`.`together_id` AS `together_id`,
	`orders`.`campus_id` AS `campus_id`,
	`receiver`.`name` AS `nickname`,
	`receiver`.`phone` AS `custome_phone`,
	`orders`.`together_date` AS `together_date`,
	`users`.`nickname` AS `admin_name`,
	`orders`.`reserve_time` AS `reserve_time`,
	`orders`.`message` AS `message`,
	`orders`.`status` AS `STATUS`,
	`orders`.`tag` AS `tag`,
	`orders`.`admin_phone` AS `admin_phone`,
	`orders`.`total_price` AS `total_price`,
	`receiver`.`address` AS `address`,
	`orders`.`charge_id` AS `charge_id`,
	`orders`.`pay_way` AS `pay_way`
FROM
	(
		(
			`orders`
			LEFT JOIN `receiver` ON (
				(
					(
						`orders`.`phone` = `receiver`.`phone_id`
					)
					AND (
						`orders`.`rank` = `receiver`.`rank`
					)
				)
			)
		)
		LEFT JOIN `users` ON (
			(
				`users`.`phone` = `orders`.`admin_phone`
			)
		)
	)
GROUP BY
	`orders`.`together_id`
HAVING
	(`orders`.`status` <> 0) ;
