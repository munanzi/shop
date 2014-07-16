/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `product` (
	`product_id` bigint (20),
	`kind_id` bigint (20),
	`shop_id` bigint (20),
	`shop_name` varchar (150),
	`product_name` varchar (300),
	`product_title` varchar (900),
	`brand_id` bigint (20),
	`brand_name` varchar (150),
	`view_num` bigint (20),
	`status` int (11),
	`pay_type` int (11),
	`delevery_amount` int (11),
	`min_price` int (11),
	`max_price` int (11),
	`pic_url` varchar (300),
	`create_time` datetime ,
	`update_time` datetime ,
	`comment_times` int (11),
	`score` int (11)
); 
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `delevery_amount`, `min_price`, `max_price`, `pic_url`, `create_time`, `update_time`, `comment_times`, `score`) values('1','1','1','自营','小米2S','小米2S 正品行货 特价销售','1','小米','1','1000','1','5','1999','2099','common/images/product/1.jpg',NULL,NULL,'3258','48');
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `delevery_amount`, `min_price`, `max_price`, `pic_url`, `create_time`, `update_time`, `comment_times`, `score`) values('2','1','1','自营','小米3',NULL,'1','小米','1','1000','1','5','2499','2599','common/images/product/2.jpg',NULL,NULL,'12','47');
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `delevery_amount`, `min_price`, `max_price`, `pic_url`, `create_time`, `update_time`, `comment_times`, `score`) values('3','1','1','自营','iPhone5S',NULL,'2','APPLE','1','1000','1','5','4999','5499','common/images/product/4.jpg',NULL,NULL,NULL,'50');
