/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `attr_group` (
	`attr_group_id` bigint (20),
	`kind_id` bigint (20),
	`group_name` varchar (90),
	`status` int (11)
); 
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('1','1','显示','1000');
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('2','1','存储','1000');
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('3','1','网络','1000');
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('4','1','基本参数','1000');
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('5','1','机身详情','1000');
insert into `attr_group` (`attr_group_id`, `kind_id`, `group_name`, `status`) values('6','1','拍照功能','1000');
