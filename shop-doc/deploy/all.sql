/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.1.50-community-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `area_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) DEFAULT NULL COMMENT '商品类型ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '规格名',
  `level` int(11) DEFAULT NULL COMMENT '0 全国\n            1 省\n            2 市\n            3 区/县',
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地区表';

/*Data for the table `area` */

/*Table structure for table `attr_group` */

DROP TABLE IF EXISTS `attr_group`;

CREATE TABLE `attr_group` (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `attr_group` */

insert  into `attr_group`(`attr_group_id`,`kind_id`,`group_name`,`status`) values (1,1,'显示',1),(2,1,'存储',1),(3,1,'网络',1),(4,1,'基本参数',1),(5,1,'机身详情',1),(6,1,'拍照功能',1);

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attr_group_id` bigint(20) DEFAULT NULL,
  `kind_id` bigint(20) DEFAULT NULL COMMENT '类型ID',
  `attr_name` varchar(50) DEFAULT NULL COMMENT '属性名',
  `attr_values` varchar(200) DEFAULT NULL COMMENT '多选属性值',
  `attr_type` int(11) DEFAULT NULL COMMENT '输入，下拉单选，多选',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `attribute` */

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(10) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `brand_desc` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1000 正常\n            1001 已删除',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `status` int(11) DEFAULT NULL COMMENT '1000 正常\n            1001 已删除',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `level` int(11) DEFAULT NULL COMMENT '顶层为0',
  `is_leaf` char(1) DEFAULT NULL COMMENT 'y 是',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cat_id`,`parent_id`,`name`,`status`,`sort_order`,`create_time`,`update_time`,`level`,`is_leaf`) values (1,NULL,'全部',1000,1,NULL,NULL,0,'n'),(2,1,'电脑',1000,1,NULL,NULL,1,'n'),(3,1,'手机',1000,2,NULL,NULL,1,'n'),(4,1,'服装',1001,3,NULL,NULL,1,'n');

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `id` varchar(32) NOT NULL,
  `merchant_id` varchar(32) DEFAULT NULL,
  `merchant_name` varchar(50) DEFAULT NULL,
  `is_recommend` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `use_address` varchar(100) NOT NULL,
  `introduce` varchar(200) DEFAULT NULL,
  `show_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `coupon` */

/*Table structure for table `express` */

DROP TABLE IF EXISTS `express`;

CREATE TABLE `express` (
  `express_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(50) DEFAULT NULL COMMENT '快递公司名',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contact_phone_num` varchar(30) DEFAULT NULL COMMENT '联系人手机',
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递公司';

/*Data for the table `express` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `goods_sn` int(11) DEFAULT NULL COMMENT '商品序列号',
  `spec` varchar(500) DEFAULT NULL COMMENT '以json格式存储规格，比如{颜色：白色，尺寸：xl}',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `sales` int(11) DEFAULT NULL COMMENT '销量',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `display_price` int(11) DEFAULT NULL COMMENT '原价',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `pic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sku 属性，价格，库存等';

/*Data for the table `goods` */

insert  into `goods`(`goods_id`,`product_id`,`goods_sn`,`spec`,`stock`,`sales`,`price`,`display_price`,`create_time`,`update_time`,`version`,`pic_id`) values (1,1,1001,'{\"网络\":\"电信3G\",\"颜色\":\"白\"}',100,1,1399,1599,NULL,NULL,0,1),(2,2,1002,NULL,100,1,1599,1999,NULL,NULL,0,2),(3,3,1003,NULL,500,0,5000,6000,NULL,NULL,0,3),(4,3,1004,NULL,600,0,5500,6500,NULL,NULL,0,4),(5,3,1005,NULL,300,0,5100,6100,NULL,NULL,0,5),(6,3,1006,NULL,200,0,5200,6200,NULL,NULL,0,6),(7,1,1007,'{\"网络\":\"电信3G\",\"颜色\":\"黑\"}',99,90,1299,1399,NULL,NULL,NULL,NULL),(8,1,1008,'{\"网络\":\"移动3G\",\"颜色\":\"白\"}',98,80,1199,1299,NULL,NULL,NULL,NULL);

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '1：普通发票   2：增值发票',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `product_type` int(11) DEFAULT NULL COMMENT '1：办公用品  2：日用品   3：食品',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发票';

/*Data for the table `invoice` */

/*Table structure for table `merchant` */

DROP TABLE IF EXISTS `merchant`;

CREATE TABLE `merchant` (
  `id` varchar(32) NOT NULL,
  `merchant_type_id` varchar(32) DEFAULT NULL,
  `merchant_type_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `is_lock` int(11) DEFAULT '0',
  `feature` varchar(100) DEFAULT NULL,
  `per_fee` varchar(6) DEFAULT NULL,
  `open_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `is_join` int(11) DEFAULT '1',
  `service` varchar(50) DEFAULT NULL,
  `order_phone` varchar(20) DEFAULT NULL,
  `introduce` varchar(200) DEFAULT NULL,
  `pop_pic1` varchar(50) DEFAULT NULL,
  `pop_pic2` varchar(50) DEFAULT NULL,
  `pop_pic3` varchar(50) DEFAULT NULL,
  `pop_pic4` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_type_id` (`merchant_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `merchant` */

/*Table structure for table `merchant_type` */

DROP TABLE IF EXISTS `merchant_type`;

CREATE TABLE `merchant_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  `show_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `merchant_type` */

/*Table structure for table `order_address` */

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

/*Data for the table `order_address` */

/*Table structure for table `order_goods` */

DROP TABLE IF EXISTS `order_goods`;

CREATE TABLE `order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL COMMENT '成交价格',
  `quanity` int(11) DEFAULT NULL COMMENT '成交数量',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';

/*Data for the table `order_goods` */

/*Table structure for table `order_status` */

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `remark` varchar(500) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL,
  `pdate_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单状态表';

/*Data for the table `order_status` */

/*Table structure for table `packing_list` */

DROP TABLE IF EXISTS `packing_list`;

CREATE TABLE `packing_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `goods_name` varbinary(50) NOT NULL,
  `num` int(11) NOT NULL,
  `units` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1000 正常\n            1001 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `packing_list` */

insert  into `packing_list`(`id`,`product_id`,`goods_name`,`num`,`units`,`status`,`create_time`,`update_time`) values (1,1,'手机主机',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(2,1,'专用电池',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(3,1,'电源适配器',2,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(4,1,'USB2.0数据线',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(5,1,'三包凭证',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(6,1,'入门指南',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL COMMENT '支付金额',
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `pay_account` varchar(50) DEFAULT NULL COMMENT '买家账号',
  `payer_name` varchar(50) DEFAULT NULL COMMENT '买家姓名',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付表';

/*Data for the table `payment` */

/*Table structure for table `pic_url` */

DROP TABLE IF EXISTS `pic_url`;

CREATE TABLE `pic_url` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(200) DEFAULT NULL,
  `pic_desc` varchar(500) DEFAULT NULL,
  `pic_name` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '1000 正常\n            1001 已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `pic_url` */

insert  into `pic_url`(`id`,`pic_url`,`pic_desc`,`pic_name`,`create_time`,`update_time`,`status`) values (1,'1.jpg',NULL,NULL,NULL,NULL,'1000'),(2,'2.jpg',NULL,NULL,NULL,NULL,'1000'),(3,'3.jpg',NULL,NULL,NULL,NULL,'1000'),(4,'4.jpg',NULL,NULL,NULL,NULL,'1000'),(5,'5.webp',NULL,NULL,NULL,NULL,'1000'),(6,'4.jpg',NULL,NULL,NULL,NULL,'1000');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind_id` bigint(20) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shop_name` varchar(50) DEFAULT NULL COMMENT '商店名称',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名,用于首页列表展示',
  `product_title` varchar(500) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌ID',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名',
  `view_num` bigint(20) DEFAULT NULL COMMENT '浏览量',
  `status` int(11) DEFAULT NULL COMMENT '1000 上架\n            1001 已删除\n            1002 下架\n            1003 待审核',
  `pay_type` int(11) DEFAULT NULL COMMENT '0 货到付款\n            1 在线支付\n            2 都支持',
  `delevery_amount` int(11) DEFAULT NULL,
  `min_price` int(11) DEFAULT NULL COMMENT '不同规格中的最低价',
  `max_price` int(11) DEFAULT NULL COMMENT '不同规格中的最高价',
  `pic_url` varchar(100) DEFAULT NULL,
  `comment_times` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`product_id`,`kind_id`,`shop_id`,`shop_name`,`product_name`,`product_title`,`brand_id`,`brand_name`,`view_num`,`status`,`pay_type`,`delevery_amount`,`min_price`,`max_price`,`pic_url`,`comment_times`,`score`,`create_time`,`update_time`,`sales`) values (1,1,1,'自营','小米2S','小米2S 正品行货 特价销售',1,'小米',1,1000,1,5,1999,2099,'common/images/product/1.jpg',3258,48,NULL,NULL,8000),(2,1,1,'自营','小米3',NULL,1,'小米',1,1000,1,5,2499,2599,'common/images/product/2.jpg',12,47,NULL,NULL,889),(3,1,1,'自营','iPhone5S',NULL,2,'APPLE',1,1000,1,5,4999,5499,'common/images/product/4.jpg',NULL,50,NULL,NULL,200);

/*Table structure for table `product_attr` */

DROP TABLE IF EXISTS `product_attr`;

CREATE TABLE `product_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `attr_group_id` bigint(20) DEFAULT NULL,
  `attr_name` varchar(30) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值,如果是规格属性，属性值以逗号分隔',
  `sort_order` int(11) DEFAULT NULL COMMENT '数字越小越靠前',
  `attr_type` int(11) DEFAULT '3' COMMENT '1 规格属性\n            2 常用属性\n            3 一般属性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `product_attr` */

insert  into `product_attr`(`id`,`product_id`,`attr_group_id`,`attr_name`,`attr_value`,`sort_order`,`attr_type`) values (1,1,NULL,'颜色','黑,白',10,1),(2,1,NULL,'网络','电信3G,移动3G,联通3G',20,1),(3,1,1,'屏幕尺寸','4.3',30,2),(4,1,1,'触摸屏类型','电容式',40,2),(5,1,1,'分辨率','1280x720',50,3),(6,1,2,'运行内存RAM','2GB',60,3),(7,1,2,'机身内存','16GB 32GB',70,3),(8,1,3,'网络类型','联通3G GSM/WCDMA(3G)',80,3),(9,1,3,'网络模式','单卡双模',90,3),(10,1,4,'品牌','MIUI/小米',100,3),(11,1,4,'型号','2S(MI2S',110,3),(12,1,4,'机身颜色','前黑后白',120,3),(13,1,4,'操作系统','Android/安卓',130,3),(14,1,4,'手机类型','3G手机',140,3),(15,1,4,'电池类型','可拆卸式电池',150,3),(16,1,4,'CPU核数','四核',160,3),(17,1,4,'cpu频率','1.7GHz',170,3),(18,1,4,'电池容量','2000mAh',180,3),(19,1,5,'款式','直板',190,3),(20,1,5,'键盘类型','虚拟触屏键盘',200,3),(21,1,5,'厚度',' 1CM以上',210,3),(22,1,6,'后置摄像头','800-1300万',220,3),(23,1,6,'摄像头类型','双摄像头（前后）',230,3),(24,1,6,'视频显示格式','1080P(全高清D5)',240,3);

/*Table structure for table `product_cat` */

DROP TABLE IF EXISTS `product_cat`;

CREATE TABLE `product_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product_cat` */

insert  into `product_cat`(`id`,`product_id`,`cat_id`,`create_time`,`update_time`,`sort_order`) values (1,1,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',1),(2,2,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',2),(3,3,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',3);

/*Table structure for table `product_comment` */

DROP TABLE IF EXISTS `product_comment`;

CREATE TABLE `product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `similar` int(11) DEFAULT NULL COMMENT '描述相符',
  `attitude` int(11) DEFAULT NULL COMMENT '服务态度',
  `speed` int(11) DEFAULT NULL COMMENT '发货速度',
  `comment` varchar(1000) DEFAULT NULL COMMENT '评价',
  `status` int(11) DEFAULT NULL COMMENT '1000 正常\n            1001 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_comment` */

/*Table structure for table `product_detail` */

DROP TABLE IF EXISTS `product_detail`;

CREATE TABLE `product_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `description` varchar(20000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放商品详细描述，大数据字段，分开存储';

/*Data for the table `product_detail` */

/*Table structure for table `product_kind` */

DROP TABLE IF EXISTS `product_kind`;

CREATE TABLE `product_kind` (
  `kind_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '类型名',
  `status` int(11) DEFAULT NULL COMMENT '1000 正常\n            1001 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`kind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='手机、电脑等，用来管理属性列表';

/*Data for the table `product_kind` */

insert  into `product_kind`(`kind_id`,`type_name`,`status`,`create_time`,`update_time`) values (1,'手机',1,'2014-07-11 21:54:39','2014-07-11 21:54:36');

/*Table structure for table `product_pic` */

DROP TABLE IF EXISTS `product_pic`;

CREATE TABLE `product_pic` (
  `product_pic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `post_fix` varchar(50) DEFAULT NULL,
  `brief_name` varchar(50) DEFAULT NULL,
  `use_type` smallint(6) DEFAULT NULL COMMENT '1：搜索首页图片\n            2：详情页左侧展示图片',
  `status` smallint(6) DEFAULT NULL COMMENT '1正常\n            2已删除',
  PRIMARY KEY (`product_pic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品图片表,用于详细页左边展示的几个典型图片';

/*Data for the table `product_pic` */

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_name` bigint(20) DEFAULT NULL COMMENT '店铺名',
  `link_men` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '店铺状态',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商店';

/*Data for the table `shop` */

/*Table structure for table `spec_attr` */

DROP TABLE IF EXISTS `spec_attr`;

CREATE TABLE `spec_attr` (
  `spec_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind_id` bigint(20) DEFAULT NULL COMMENT '商品类型ID',
  `spec_name` varchar(50) DEFAULT NULL COMMENT '规格名',
  `spec_values` varchar(500) DEFAULT NULL COMMENT '多个值以竖线分隔',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='如：颜色属性的红黄蓝等';

/*Data for the table `spec_attr` */

/*Table structure for table `sys_action` */

DROP TABLE IF EXISTS `sys_action`;

CREATE TABLE `sys_action` (
  `UUID` varchar(32) NOT NULL COMMENT '主键UUID',
  `NAME` varchar(200) NOT NULL COMMENT '动作名称',
  `URL` varchar(400) DEFAULT NULL COMMENT '动作URL,多个用逗号分隔',
  `IS_MENU` int(11) NOT NULL DEFAULT '0' COMMENT '是否为菜单 0:菜单,1:按钮或链接',
  `MENU_ID` varchar(32) NOT NULL COMMENT '所属菜单ID',
  `SORT_NUM` int(11) DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '0' COMMENT '菜单状态 0:有效,1:无效',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LAST_UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  `OPERATOR` varchar(100) DEFAULT NULL COMMENT '操作人',
  `PARENT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_action` */

insert  into `sys_action`(`UUID`,`NAME`,`URL`,`IS_MENU`,`MENU_ID`,`SORT_NUM`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`,`PARENT_ID`) values ('805','添加公告','/notice/public/toadd',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('807','编辑公告页面数据','/notice/public/toedit',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('808','删除公告页面数据','/notice/public/del',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('FVEYcp7pRIOW_wrAvC4VRw','公告管理','/notice/public/list',0,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','超级管理员',NULL),('mf_4cr-qTXySGQrXbxuvmQ','私信管理','/notice/private/list',0,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','超级管理员',NULL),('801','添加私信','/notice/private/toadd',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('803','编辑私信页面数据','/notice/private/toedit',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('804','删除私信页面数据','/notice/private/del',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('809','批量删除私信','/notice/private/batchdel',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('810','批量删除公告','/notice/public/batchdel',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL);

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `AREA_CODE` varchar(32) NOT NULL COMMENT '主键UUID',
  `AREA_NAME` varchar(50) NOT NULL COMMENT '区域名称',
  `AREA_LEVEL` int(11) NOT NULL COMMENT '区域级别（1:地市,2:区）',
  `ISLEAF` int(11) NOT NULL DEFAULT '0' COMMENT '是否是叶子节点',
  `PARENT_CODE` varchar(32) DEFAULT NULL COMMENT '父区域ID',
  `SORT_NUM` int(11) DEFAULT NULL COMMENT '显示顺序',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '区域描述信息',
  `STATE` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:激活,1:停用',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LAST_UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  `OPERATOR` varchar(100) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`AREA_CODE`,`STATE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_area` */

insert  into `sys_area`(`AREA_CODE`,`AREA_NAME`,`AREA_LEVEL`,`ISLEAF`,`PARENT_CODE`,`SORT_NUM`,`DESCRIPTION`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`) values ('025','南京市',1,0,'0',0,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0251','鼓楼区',2,0,'025',1,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0252','秦淮区',2,0,'025',2,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0253','玄武区',2,0,'025',3,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0254','建邺区',2,0,'025',4,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0255','雨花区',2,0,'025',5,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0256','栖霞区',2,0,'025',6,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0257','浦口区',2,0,'025',7,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0258','江宁区',2,0,'025',8,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0259','六合区',2,0,'025',9,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL);

/*Table structure for table `sys_friendlink` */

DROP TABLE IF EXISTS `sys_friendlink`;

CREATE TABLE `sys_friendlink` (
  `linkid` varchar(32) NOT NULL,
  `link_name` varchar(50) NOT NULL,
  `link_url` varchar(400) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_friendlink` */

insert  into `sys_friendlink`(`linkid`,`link_name`,`link_url`,`create_time`,`sort_num`) values ('1','电视商城','http://172.20.225.46/tvroot/','2014-06-10 09:40:25',1),('2','开放平台','http://172.20.225.87/jos/','2014-06-10 09:40:25',2),('3','边看边送后台','http://172.20.225.97/dianping-bg/index','2014-06-10 09:40:25',3),('4','商城IPP后台','http://172.20.222.191/IPPOversea/Portal/ControlPanel/Login.aspx','2014-06-10 09:40:25',4),('5','报表系统','http://172.20.225.240:8080/bi','2014-06-10 09:40:25',5),('6','房产展销后台','https://172.20.225.97/housesell','2014-06-10 09:40:25',6);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(32) NOT NULL,
  `operator_id` varchar(20) NOT NULL,
  `operator_name` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `code` varchar(15) NOT NULL,
  `title` varchar(30) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_code` varchar(15) NOT NULL,
  `menu_level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `display_num` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`code`,`title`,`url`,`parent_code`,`menu_level`,`children_count`,`display_num`) values ('ZFJL','交易记录','/record/search.htm','ZFPTGL',2,0,2),('ZFYHGL','支付银行管理','/bank/search.htm','XTGL',2,0,6),('ZFPTGL','支付平台管理',NULL,'0',1,4,1),('THGL','退货管理','/refund/search.htm','ZFPTGL',2,0,4),('XTGL','系统管理',NULL,'0',1,7,5),('SZMX','收支明细','/item/search.htm','ZFPTGL',2,0,3),('SHGL','商户管理','/merchant/search.htm','XTGL',2,0,7),('XTRZ','系统操作日志','/log/querylogs.htm','XTGL',2,0,9),('GNCDGL','功能菜单管理','/menu/querymenus.htm','XTGL',2,0,3),('QXZGL','权限组管理','/rolegl/queryroles.htm','XTGL',2,0,5),('CZYGL','操作员管理','/operator/searchoperators.htm','XTGL',2,0,1),('YHJGL','优惠劵管理','/coupon/search.htm','XTGL',2,0,9),('SHLXGL','商户类型管理','/type/search.htm','XTGL',2,0,8),('WZGL','网站管理','','WZPCGL',2,0,1),('WZPCGL','网站爬虫管理','','0',1,2,1),('CSPZGL','参数配置管理','','WZPCGL',2,0,2);

/*Table structure for table `sys_menu_role` */

DROP TABLE IF EXISTS `sys_menu_role`;

CREATE TABLE `sys_menu_role` (
  `id` varchar(32) NOT NULL,
  `menu_code` varchar(15) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_role` */

insert  into `sys_menu_role`(`id`,`menu_code`,`role_code`) values ('5cc1e7dfb16847ebacaf5e1fdb9d97d2','XTGL','ROLE_ADMIN'),('25acbb56a06445dfa8be8e402806a39d','SHGL','ROLE_ADMIN'),('b0045ffa58cc4c45b8144f08b3e230ac','ZFYHGL','ROLE_ADMIN'),('123385b0d6c441ccbad260db6d5fd33c','CZYGL','ROLE_ADMIN'),('aa7b518f995e47a5a774a3cb63d543a4','XTRZ','ROLE_ADMIN'),('0a074274109543f9968bfd5ceb1384ea','GNCDGL','ROLE_ADMIN'),('0b14caabd19b409fb7da61d90740f2ca','QXZGL','ROLE_ADMIN'),('db8d73234c904925908be21f263df8a1','ZFPTGL','ROLE_ADMIN'),('d0b680d37118462e8eef9f2b27b46354','THGL','ROLE_ADMIN'),('beb0c823c8184b9abf12b193cf27a4ee','SZMX','ROLE_ADMIN'),('053fa39d74bc405aa9bd083d99ea17d9','ZFJL','ROLE_ADMIN');

/*Table structure for table `sys_operate_log` */

DROP TABLE IF EXISTS `sys_operate_log`;

CREATE TABLE `sys_operate_log` (
  `UUID` varchar(32) NOT NULL COMMENT '主键UUID',
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `OPERATOR` varchar(100) DEFAULT NULL COMMENT '操作人',
  `IP` varchar(32) DEFAULT NULL COMMENT '操作IP',
  `ACTION` varchar(100) NOT NULL COMMENT '执行动作',
  `CONTENT` varchar(400) NOT NULL COMMENT '操作内容',
  `CLASSZ` varchar(200) DEFAULT NULL COMMENT '操作类名',
  `METHOD` varchar(200) DEFAULT NULL COMMENT '操作方法名',
  `PARAMS` varchar(400) DEFAULT NULL COMMENT '操作方法参数',
  PRIMARY KEY (`UUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_operate_log` */

insert  into `sys_operate_log`(`UUID`,`TIME`,`OPERATOR`,`IP`,`ACTION`,`CONTENT`,`CLASSZ`,`METHOD`,`PARAMS`) values ('vF0uoFiuTn-fo100mulwcA','2014-06-10 10:04:09',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('TJmvBfFeSYineIOkvZKHMA','2014-06-10 10:08:35',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('naep88Y0TKOzhmE7E1ACqA','2014-06-10 10:15:35',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('JN1mdkZoRi-U1r1XBwdCmA','2014-06-10 10:34:20',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('imwBSgx3Q1yNIwW9kRhdWA','2014-06-10 10:53:17',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('xPD8qymSTDOiVAddQVmW3w','2014-06-10 10:53:18','superadmin','0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('MDDtKFeoSueOb55gVGCCFA','2014-06-10 10:55:02','superadmin','0:0:0:0:0:0:0:1','查询','菜单','com.jscn.tvmall.system.controller.SysMenuController','menulist',''),('NzO5-3oQSgWtp4U6juFV1A','2014-06-10 13:26:49',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmdi;1;'),('9d7qfNyKSwapN-tLL6X1sQ','2014-06-10 13:27:21',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('60P_p2q8TIWMIkie0mGjKQ','2014-06-10 13:49:29',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;');

/*Table structure for table `sys_operator` */

DROP TABLE IF EXISTS `sys_operator`;

CREATE TABLE `sys_operator` (
  `operator_id` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile_num` varchar(15) DEFAULT NULL,
  `tele_num` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `job_name` varchar(40) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `last_time` varchar(20) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`operator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_operator` */

insert  into `sys_operator`(`operator_id`,`password`,`name`,`mobile_num`,`tele_num`,`email`,`status`,`job_name`,`remark`,`last_time`,`last_ip`) values ('admin','21232f297a57a5a743894a0e4a801fc3','管理员','133258711111','025-582144212',NULL,'1',NULL,NULL,'2012-06-03 14:38:18','127.0.0.1');

/*Table structure for table `sys_operator_role` */

DROP TABLE IF EXISTS `sys_operator_role`;

CREATE TABLE `sys_operator_role` (
  `id` varchar(32) NOT NULL,
  `operator_id` varchar(20) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_OPERATOR_ROLE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_operator_role` */

insert  into `sys_operator_role`(`id`,`operator_id`,`role_code`) values ('f9edd715d7b54020bd53fe3a7a30694a','admin','ROLE_ADMIN');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `code` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`code`,`title`,`remark`) values ('ROLE_ADMIN','系统管理员组','系统管理员组');

/*Table structure for table `sys_role_action` */

DROP TABLE IF EXISTS `sys_role_action`;

CREATE TABLE `sys_role_action` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `ACTION_ID` varchar(32) NOT NULL COMMENT '动作ID',
  PRIMARY KEY (`ROLE_ID`,`ACTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_action` */

insert  into `sys_role_action`(`ROLE_ID`,`ACTION_ID`) values ('1','1'),('1','10'),('1','100244'),('1','100245'),('1','11'),('1','12'),('1','120'),('1','121'),('1','122'),('1','123'),('1','13'),('1','130'),('1','131'),('1','132'),('1','133'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','3'),('1','30'),('1','31'),('1','32'),('1','35'),('1','36'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','5'),('1','6'),('1','60'),('1','6666YMzQTWuTG9e80eQRxg'),('1','6700YMzQTWuTG9e80eQGrx'),('1','6701YMzQTWuTG9e80eQGrx'),('1','6766YMzQTWuTG9e80eQGrx'),('1','6766YMzQTWuTG9e80eQRxg'),('1','6798YMzQTWuTG9e80eQGrx'),('1','7'),('1','8'),('1','80'),('1','801'),('1','803'),('1','804'),('1','805'),('1','807'),('1','808'),('1','809'),('1','810'),('1','9'),('1','FVEYcp7pRIOW_wrAvC4VRw'),('1','IHZ8JiLyTZ2C1RcHuN1lCQ'),('1','mf_4cr-qTXySGQrXbxuvmQ'),('1','njgp_wDZTQGYDKGOPmoEEg');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `UUID` varchar(32) NOT NULL COMMENT '主键UUID',
  `ACCOUNT` varchar(50) NOT NULL COMMENT '账号',
  `PASSWORD` varchar(32) NOT NULL COMMENT '密码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '姓名',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机号',
  `TEL` varchar(20) DEFAULT NULL COMMENT '办公电话',
  `DEPARTMENT` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `STATE` int(11) NOT NULL DEFAULT '0' COMMENT '账号状态 0:激活,1:停用',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LAST_UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  `OPERATOR` varchar(100) DEFAULT NULL COMMENT '操作人',
  `LAST_LOGIN_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`UUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`UUID`,`ACCOUNT`,`PASSWORD`,`NAME`,`MOBILE`,`TEL`,`DEPARTMENT`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`,`LAST_LOGIN_TIME`) values ('0','superadmin','c4ca4238a0b923820dcc509a6f75849b','超级管理员',NULL,NULL,'运营',0,'2014-06-10 13:49:29','2014-06-10 10:14:59','zS1n9i1ESoy759yaW8ATEw','2014-06-10 13:49:29');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `USER_ID` varchar(32) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`ROLE_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`ROLE_ID`,`USER_ID`) values ('1','0');

/*Table structure for table `trade_order` */

DROP TABLE IF EXISTS `trade_order`;

CREATE TABLE `trade_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind_id` bigint(20) DEFAULT NULL COMMENT '商品类型ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `status` int(11) DEFAULT NULL COMMENT '1000  初始\n            1001 支付中\n            1002 支付成功\n            1003 已发货\n            1004 交易成功\n            1005 退货申请中\n            1006 已同意退货\n            1007 退货成功\n            1008 拒绝退货',
  `pay_type` char(1) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '订单金额 = 商品金额 + 快递费用',
  `delevery_amount` int(11) DEFAULT NULL COMMENT '快递费',
  `integral` int(11) DEFAULT NULL COMMENT '应付金额= 订单金额-使用积分',
  `version` int(11) DEFAULT NULL,
  `invoice_id` bigint(20) DEFAULT NULL COMMENT '发票id',
  `remark` varchar(100) DEFAULT NULL COMMENT '下单备注',
  `presenter_user_id` bigint(20) DEFAULT NULL COMMENT '推荐人用户id',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='交易订单表';

/*Data for the table `trade_order` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_real_name` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `phone_num` varchar(30) DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` char(1) DEFAULT NULL COMMENT 'm 男\n            f  女',
  `status` int(11) DEFAULT NULL,
  `rank_id` bigint(20) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站会员';

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_real_name`,`create_time`,`update_time`,`phone_num`,`mail`,`sex`,`status`,`rank_id`,`integral`) values (1,'hexizheng','贺夕政',NULL,NULL,'13851402609','hexizheng@163.com','m',1000,1,1000);

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `county` varchar(50) DEFAULT NULL COMMENT ' 县',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `consignee` varchar(30) DEFAULT NULL COMMENT '收件人姓名',
  `phone_num` varchar(30) DEFAULT NULL COMMENT '收件人电话',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省地区id',
  `city_id` bigint(20) DEFAULT NULL COMMENT '市地区id',
  `conty_id` bigint(20) DEFAULT NULL COMMENT '县地区id',
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='常用收货地址';

/*Data for the table `user_address` */

/*Table structure for table `user_integral` */

DROP TABLE IF EXISTS `user_integral`;

CREATE TABLE `user_integral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `integral` int(11) DEFAULT NULL COMMENT '积分增减',
  `type` int(11) DEFAULT NULL COMMENT '1000 消费赠送\n            2000 推荐',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录会员每笔积分增减记录';

/*Data for the table `user_integral` */

/*Table structure for table `user_rank` */

DROP TABLE IF EXISTS `user_rank`;

CREATE TABLE `user_rank` (
  `rank_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '等级数值',
  `rank_name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员等级表';

/*Data for the table `user_rank` */

/*Table structure for table `user_web` */

DROP TABLE IF EXISTS `user_web`;

CREATE TABLE `user_web` (
  `id` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `show_name` varchar(15) DEFAULT NULL,
  `sex` int(11) DEFAULT '2',
  `head_photo` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `mobile` varchar(20) DEFAULT NULL,
  `regest_time` varchar(20) DEFAULT NULL,
  `prelogin_time` varchar(20) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `birthday` varchar(15) DEFAULT NULL,
  `age` int(11) DEFAULT '0',
  `zodiac` varchar(15) DEFAULT NULL,
  `constellation` varchar(15) DEFAULT NULL,
  `signature` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `answer_id` varchar(2) DEFAULT NULL,
  `answer_result` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `user_web` */

/*Table structure for table `website_list` */

DROP TABLE IF EXISTS `website_list`;

CREATE TABLE `website_list` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(100) NOT NULL,
  `logo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `website_list` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
