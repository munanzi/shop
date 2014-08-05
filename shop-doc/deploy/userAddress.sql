/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `user_address` (
	`address_id` bigint (20),
	`user_id` bigint (20),
	`post_code` varchar (150),
	`address` varchar (600),
	`consignee` varchar (90),
	`phone_num` varchar (90),
	`province_id` bigint (20),
	`city_id` bigint (20),
	`county_id` bigint (20),
	`status` smallint (6),
	`create_time` datetime ,
	`update_time` datetime 
); 
insert into `user_address` (`address_id`, `user_id`, `post_code`, `address`, `consignee`, `phone_num`, `province_id`, `city_id`, `county_id`, `status`, `create_time`, `update_time`) values('1','1','10000','火星路8号','hexizheng','13888888888','1','3','3','1',NULL,NULL);
