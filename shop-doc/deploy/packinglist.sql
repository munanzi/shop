/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `packing_list` (
	`id` bigint (20),
	`product_id` bigint (20),
	`goods_name` varchar (50),
	`num` smallint (6),
	`status` smallint (6),
	`create_time` datetime ,
	`update_time` datetime 
); 
insert into `packing_list` (`id`, `product_id`, `goods_name`, `num`, `status`, `create_time`, `update_time`) values('1','1','手机','1','1',NULL,NULL);
insert into `packing_list` (`id`, `product_id`, `goods_name`, `num`, `status`, `create_time`, `update_time`) values('2','1','充电器','1','1',NULL,NULL);
insert into `packing_list` (`id`, `product_id`, `goods_name`, `num`, `status`, `create_time`, `update_time`) values('3','1','耳机','1','1',NULL,NULL);
insert into `packing_list` (`id`, `product_id`, `goods_name`, `num`, `status`, `create_time`, `update_time`) values('4','1','说明书','1','1',NULL,NULL);
