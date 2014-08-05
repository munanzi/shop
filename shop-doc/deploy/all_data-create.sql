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
  `area_code` int(11) DEFAULT NULL,
  `area_name` varchar(50) DEFAULT NULL COMMENT '商品类型ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '规格名',
  `level` smallint(6) DEFAULT NULL COMMENT '0 国家\n            1 省\n            2 市\n            3 区/县',
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='地区表';

/*Table structure for table `attr_group` */

DROP TABLE IF EXISTS `attr_group`;

CREATE TABLE `attr_group` (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attr_group_id` bigint(20) DEFAULT NULL,
  `kind_id` bigint(20) DEFAULT NULL COMMENT '类型ID',
  `attr_name` varchar(50) DEFAULT NULL COMMENT '属性名',
  `attr_values` varchar(200) DEFAULT NULL COMMENT '多选属性值',
  `attr_type` smallint(6) DEFAULT NULL COMMENT '1输入\n            2下拉单选\n            3多选',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(10) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `brand_desc` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `buy_num` smallint(6) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  `sort_order` smallint(6) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL COMMENT '顶层为0',
  `is_leaf` char(1) DEFAULT 'n' COMMENT 'y 是\n            n 否',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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

/*Table structure for table `express` */

DROP TABLE IF EXISTS `express`;

CREATE TABLE `express` (
  `express_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(50) DEFAULT NULL COMMENT '快递公司名',
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contact_phone_num` varchar(30) DEFAULT NULL COMMENT '联系人手机',
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递公司';

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
  `product_pic_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  PRIMARY KEY (`goods_id`),
  KEY `index_product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='sku 属性，价格，库存等';

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL COMMENT '1：普通发票   2：增值发票',
  `title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `product_type` smallint(6) DEFAULT NULL COMMENT '1：办公用品  2：日用品   3：食品',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发票';

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

/*Table structure for table `merchant_type` */

DROP TABLE IF EXISTS `merchant_type`;

CREATE TABLE `merchant_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  `show_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

/*Table structure for table `order_goods` */

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

/*Table structure for table `order_history_status` */

DROP TABLE IF EXISTS `order_history_status`;

CREATE TABLE `order_history_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '状态',
  `remark` varchar(500) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单状态表';

/*Table structure for table `packing_list` */

DROP TABLE IF EXISTS `packing_list`;

CREATE TABLE `packing_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `num` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL COMMENT '1 正常\n            2 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL COMMENT '支付金额',
  `status` smallint(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `pay_account` varchar(50) DEFAULT NULL COMMENT '买家账号',
  `payer_name` varchar(50) DEFAULT NULL COMMENT '买家姓名',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付表';

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
  `status` smallint(6) DEFAULT NULL COMMENT '1上架\n            2 下架\n            3初始\n            4 待审核\n            5 拒绝\n            6已删除',
  `pay_type` smallint(6) DEFAULT NULL COMMENT '0 货到付款\n            1 在线支付\n            2 都支持',
  `express_fee` int(11) DEFAULT NULL,
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

/*Table structure for table `product_attr` */

DROP TABLE IF EXISTS `product_attr`;

CREATE TABLE `product_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `attr_group_id` bigint(20) DEFAULT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '属性名',
  `attr_value` varchar(200) NOT NULL COMMENT '属性值,如果是规格属性，属性值以逗号分隔',
  `sort_order` smallint(6) DEFAULT '1000' COMMENT '数字越小越靠前',
  `attr_type` smallint(6) DEFAULT '3' COMMENT '1 规格属性\n            2 常用属性\n            3 一般属性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='产品属性表';

/*Table structure for table `product_cat` */

DROP TABLE IF EXISTS `product_cat`;

CREATE TABLE `product_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sort_order` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品分类';

/*Table structure for table `product_comment` */

DROP TABLE IF EXISTS `product_comment`;

CREATE TABLE `product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `similar` smallint(6) DEFAULT NULL COMMENT '描述相符',
  `attitude` smallint(6) DEFAULT NULL COMMENT '服务态度',
  `speed` smallint(6) DEFAULT NULL COMMENT '发货速度',
  `comment` varchar(500) DEFAULT NULL COMMENT '评价',
  `shop_reply` varbinary(500) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

/*Table structure for table `product_kind` */

DROP TABLE IF EXISTS `product_kind`;

CREATE TABLE `product_kind` (
  `kind_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '类型名',
  `status` smallint(6) DEFAULT NULL COMMENT '1 正常\n            2 已删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`kind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='手机、电脑等，用来管理属性列表';

/*Table structure for table `product_pic` */

DROP TABLE IF EXISTS `product_pic`;

CREATE TABLE `product_pic` (
  `product_pic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `post_fix` varchar(50) DEFAULT NULL,
  `brief_name` varchar(50) DEFAULT NULL,
  `use_type` smallint(6) DEFAULT NULL COMMENT '1：搜索首页图片\n            2：详情页左侧展示图片\n            3：对应规格goods的图片',
  `status` smallint(6) DEFAULT NULL COMMENT '1正常\n            2已删除',
  PRIMARY KEY (`product_pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品图片表,用于详细页左边展示的几个典型图片';

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_name` bigint(20) DEFAULT NULL COMMENT '店铺名',
  `link_men` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '店铺状态',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商店';

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

/*Table structure for table `sys_menu_role` */

DROP TABLE IF EXISTS `sys_menu_role`;

CREATE TABLE `sys_menu_role` (
  `id` varchar(32) NOT NULL,
  `menu_code` varchar(15) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

/*Table structure for table `sys_operator_role` */

DROP TABLE IF EXISTS `sys_operator_role`;

CREATE TABLE `sys_operator_role` (
  `id` varchar(32) NOT NULL,
  `operator_id` varchar(20) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_OPERATOR_ROLE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `code` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role_action` */

DROP TABLE IF EXISTS `sys_role_action`;

CREATE TABLE `sys_role_action` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `ACTION_ID` varchar(32) NOT NULL COMMENT '动作ID',
  PRIMARY KEY (`ROLE_ID`,`ACTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色ID',
  `USER_ID` varchar(32) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`ROLE_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `trade_order` */

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

/*Table structure for table `user` */

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

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `consignee` varchar(30) DEFAULT NULL COMMENT '收件人姓名',
  `phone_num` varchar(30) DEFAULT NULL COMMENT '收件人电话',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省地区id',
  `city_id` bigint(20) DEFAULT NULL COMMENT '市地区id',
  `county_id` bigint(20) DEFAULT NULL COMMENT '县地区id',
  `status` smallint(6) DEFAULT NULL COMMENT '1 默认地址\n            2 常用地址\n            3 已删除地址',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='常用收货地址';

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
  `type` smallint(6) DEFAULT NULL COMMENT '1 消费赠送\n            2 推荐',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录会员每笔积分增减记录';

/*Table structure for table `user_rank` */

DROP TABLE IF EXISTS `user_rank`;

CREATE TABLE `user_rank` (
  `rank_id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '等级数值',
  `rank_name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员等级表';

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

/*Table structure for table `website_list` */

DROP TABLE IF EXISTS `website_list`;

CREATE TABLE `website_list` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(100) NOT NULL,
  `logo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
