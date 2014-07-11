/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `product_attr` (
	`id` bigint (20),
	`product_id` bigint (20),
	`attr_group_id` bigint (20),
	`attr_name` varchar (150),
	`attr_value` varchar (600),
	`sort_order` int (11),
	`attr_type` int (11)
); 
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('1','1',NULL,'颜色','黑,白','1','1');
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('2','1',NULL,'网络','电信3G,移动3G,联通3G','2','1');
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('3','1',NULL,'商品重量','100克','3','2');
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('4','1',NULL,'系统','MIUI','4','2');
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('5','1',NULL,'屏幕尺寸','4.3','5','3');
insert into `product_attr` (`id`, `product_id`, `attr_group_id`, `attr_name`, `attr_value`, `sort_order`, `attr_type`) values('6','1',NULL,NULL,NULL,NULL,'3');
