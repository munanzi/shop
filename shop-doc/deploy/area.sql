/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `area` (
	`area_id` bigint (20),
	`area_code` int (11),
	`area_name` varchar (150),
	`parent_id` bigint (20),
	`level` smallint (6)
); 
insert into `area` (`area_id`, `area_code`, `area_name`, `parent_id`, `level`) values('1','110000','北京市',NULL,'1');
insert into `area` (`area_id`, `area_code`, `area_name`, `parent_id`, `level`) values('2','110100','市辖区','0','2');
insert into `area` (`area_id`, `area_code`, `area_name`, `parent_id`, `level`) values('3','110101','东城区','110000','2');
insert into `area` (`area_id`, `area_code`, `area_name`, `parent_id`, `level`) values('4','110102','西城区','110000','2');
