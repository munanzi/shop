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
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('1','1','1001','{\"网络\":\"电信3G\",\"颜色\":\"白\"}','100','1','1399','1599',NULL,NULL,'0','1',1);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('2','2','1002',NULL,'100','1','1599','1999',NULL,NULL,'0','2',1);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('3','3','1003',NULL,'500','0','5000','6000',NULL,NULL,'0','3',1);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('4','3','1004',NULL,'600','0','5500','6500',NULL,NULL,'0','4',1);
insert into `goods` (`goods_id`, `product_id`, `goods_sn`, `spec`, `stock`, `sales`, `price`, `display_price`, `create_time`, `update_time`, `version`, `product_pic_id`, `status`) values('5','3','1005',NULL,'300','0','5100','6100',NULL,NULL,'0','5',1);


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
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `express_fee`, `min_price`, `max_price`, `pic_url`, `comment_times`, `score`, `create_time`, `update_time`, `sales`) values('2','1','1','自营','小米3',NULL,'1','小米','1','1','1',NULL,'2499','2599','common/images/product/2.jpg','12','47',NULL,NULL,'889');
insert into `product` (`product_id`, `kind_id`, `shop_id`, `shop_name`, `product_name`, `product_title`, `brand_id`, `brand_name`, `view_num`, `status`, `pay_type`, `express_fee`, `min_price`, `max_price`, `pic_url`, `comment_times`, `score`, `create_time`, `update_time`, `sales`) values('3','1','2','自营','iPhone5S',NULL,'2','APPLE','1','1','1',NULL,'4999','5499','common/images/product/4.jpg',NULL,'50',NULL,NULL,'200');


drop table if exists area;
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


drop table if exists user_address;
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

drop table if exists invoice;
CREATE TABLE `invoice` (
  `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL COMMENT '1：普通发票   2：增值发票',
  `title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `product_type` smallint(6) DEFAULT NULL COMMENT '1：办公用品  2：日用品   3：食品',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发票';



DROP TABLE IF EXISTS `order_address`;
CREATE TABLE `order_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consigee` varchar(50) DEFAULT NULL COMMENT '收货人',
  `phone_num` varchar(30) DEFAULT NULL COMMENT '收货人电话',
  `post_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `county` varchar(50) DEFAULT NULL COMMENT '县',
  `express_id` bigint(20) DEFAULT NULL COMMENT '快递公司id',
  `express_name` varchar(50) DEFAULT NULL COMMENT '快递公司名',
  `express_no` varchar(50) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单地址表';


DROP TABLE IF EXISTS `order_goods`;

CREATE TABLE `order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `price` int(11) DEFAULT NULL COMMENT '成交价格',
  `quanity` int(11) DEFAULT NULL COMMENT '成交数量',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';

DROP TABLE IF EXISTS `order_history_status`;

CREATE TABLE `order_history_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '状态',
  `remark` varchar(500) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单状态表';


DROP TABLE IF EXISTS `trade_order`;

CREATE TABLE `trade_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '商品类型ID',
  `invoice_id` bigint(20) DEFAULT NULL COMMENT '发票id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `address_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1  初始\n            2 支付中\n            3 支付成功\n            4 已发货\n            5 交易成功\n            6 退货申请中\n            7 已同意退货\n            8 退货成功\n            9 拒绝退货',
  `pay_type` smallint(6) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '订单金额 = 商品金额 + 快递费用',
  `express_fee` int(11) DEFAULT NULL COMMENT '快递费',
  `use_integral` int(11) DEFAULT NULL COMMENT '应付金额= 订单金额-使用积分',
  `sent_integral` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL COMMENT '下单备注',
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='交易订单表';


DROP TABLE IF EXISTS `user_integral`;

CREATE TABLE `user_integral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `integral` int(11) DEFAULT NULL COMMENT '积分增减',
  `type` smallint(6) DEFAULT NULL COMMENT '1 消费赠送\n            2 推荐',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录会员每笔积分增减记录';




DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rank_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_real_name` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `phone_num` varchar(30) DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` char(1) DEFAULT NULL COMMENT 'm 男\n            f  女',
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 黑名单用户',
  `integral` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站会员';


