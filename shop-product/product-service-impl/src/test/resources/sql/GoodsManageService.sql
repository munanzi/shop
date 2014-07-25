drop table if exists goods;

create table `goods` (
	`goods_id` bigint (20),
	`product_id` bigint (20),
	`goods_sn` int (11),
	`spec` varchar (1500),
	`stock` int (11),
	`sales` int (11),
	`price` int (11),
	`display_price` int (11),
	`create_time` datetime ,
	`update_time` datetime ,
	`version` int (11),
	`product_pic_id` bigint (20),
	`status` smallint (6)
); 
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('1','1','1001','{\"网络\":\"电信3G\",\"颜色\":\"白\"}','100','1','1399','1599',NULL,NULL,'0','1',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('2','2','1002',NULL,'100','1','1599','1999',NULL,NULL,'0','2',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('3','3','1003',NULL,'500','0','5000','6000',NULL,NULL,'0','3',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('4','3','1004',NULL,'600','0','5500','6500',NULL,NULL,'0','4',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('5','3','1005',NULL,'300','0','5100','6100',NULL,NULL,'0','5',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('6','3','1006',NULL,'200','0','5200','6200',NULL,NULL,'0','6',NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('7','1','1007','{\"网络\":\"电信3G\",\"颜色\":\"黑\"}','99','90','1299','1399',NULL,NULL,'0',NULL,NULL);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('8','1','1008','{\"网络\":\"移动3G\",\"颜色\":\"白\"}','98','80','1199','1299',NULL,NULL,'0',NULL,NULL);
