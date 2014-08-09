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

insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('1','1','1001','{\"网络\":\"电信3G\",\"颜色\":\"白\"}','100','1','1399','1599',NULL,NULL,'0','1',2);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('2','2','1002',NULL,'100','1','1599','1999',NULL,NULL,'0','2',1);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('3','3','1003',NULL,'10','0','5000','6000',NULL,NULL,'0','3',1);


drop table if exists product;
create table `product` (
	`product_id` bigint (20),
	`kind_id` bigint (20),
	`shop_id` bigint (20),
	`shop_name` varchar (150),
	`product_name` varchar (300),
	`product_title` varchar (1500),
	`brand_id` bigint (20),
	`brand_name` varchar (150),
	`view_num` bigint (20),
	`status` smallint (6),
	`pay_type` smallint (6),
	`express_fee` int (11),
	`min_price` int (11),
	`max_price` int (11),
	`pic_url` varchar (300),
	`comment_times` int (11),
	`score` int (11),
	`create_time` datetime ,
	`update_time` datetime ,
	`sales` int (11)
);


insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `express_fee`, `min_price`, `max_price`, `pic_url`, `comment_times`, `score`, `create_time`, `update_time`, `sales`) values('1','1','1','自营','小米2S','小米2S 正品行货 特价销售','1','小米','1','1','1',NULL,'1999','2099','common/images/product/1.jpg','3258','48',NULL,NULL,'8000');
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `express_fee`, `min_price`, `max_price`, `pic_url`, `comment_times`, `score`, `create_time`, `update_time`, `sales`) values('2','1','1','自营','小米3',NULL,'1','小米','1','3','1',NULL,'2499','2599','common/images/product/2.jpg','12','47',NULL,NULL,'889');
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `express_fee`, `min_price`, `max_price`, `pic_url`, `comment_times`, `score`, `create_time`, `update_time`, `sales`) values('3','1','2','自营','iPhone5S',NULL,'2','APPLE','1','1','1',NULL,'4999','5499','common/images/product/4.jpg',NULL,'50',NULL,NULL,'200');
