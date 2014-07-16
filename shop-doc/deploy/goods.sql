/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `goods` (
	`goods_id` bigint (20),
	`product_id` bigint (20),
	`spec` varchar (1500),
	`stock` int (11),
	`sales` int (11),
	`price` int (11),
	`display_price` int (11),
	`create_time` datetime ,
	`update_time` datetime ,
	`version` int (11),
	`pic_id` bigint (20)
); 
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('1','1',NULL,'100','1','1399','1599',NULL,NULL,'0','1');
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('2','2',NULL,'100','1','1599','1999',NULL,NULL,'0','2');
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('3','3',NULL,'500','0','5000','6000',NULL,NULL,'0','3');
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('4','3',NULL,'600','0','5500','6500',NULL,NULL,'0','4');
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('5','3',NULL,'300','0','5100','6100',NULL,NULL,'0','5');
insert into `goods` (`goods_id`, `product_id`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `pic_id`) values('6','3',NULL,'200','0','5200','6200',NULL,NULL,'0','6');
