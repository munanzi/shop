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

/*Data for the table `area` */

/*Data for the table `attr_group` */

insert  into `attr_group`(`attr_group_id`,`kind_id`,`group_name`,`status`) values (1,1,'显示',1),(2,1,'存储',1),(3,1,'网络',1),(4,1,'基本参数',1),(5,1,'机身详情',1),(6,1,'拍照功能',1);

/*Data for the table `attribute` */

/*Data for the table `brand` */

/*Data for the table `category` */

insert  into `category`(`cat_id`,`parent_id`,`name`,`status`,`sort_order`,`create_time`,`update_time`,`level`,`is_leaf`) values (1,NULL,'全部',1000,1,NULL,NULL,0,'n'),(2,1,'电脑',1000,1,NULL,NULL,1,'n'),(3,1,'手机',1000,2,NULL,NULL,1,'n'),(4,1,'服装',1001,3,NULL,NULL,1,'n');

/*Data for the table `coupon` */

/*Data for the table `express` */

/*Data for the table `goods` */

insert  into `goods`(`goods_id`,`product_id`,`goods_sn`,`spec`,`stock`,`sales`,`price`,`display_price`,`create_time`,`update_time`,`version`,`pic_id`) values (1,1,1001,'{\"网络\":\"电信3G\",\"颜色\":\"白\"}',100,1,1399,1599,NULL,NULL,0,1),(2,2,1002,NULL,100,1,1599,1999,NULL,NULL,0,2),(3,3,1003,NULL,500,0,5000,6000,NULL,NULL,0,3),(4,3,1004,NULL,600,0,5500,6500,NULL,NULL,0,4),(5,3,1005,NULL,300,0,5100,6100,NULL,NULL,0,5),(6,3,1006,NULL,200,0,5200,6200,NULL,NULL,0,6),(7,1,1007,'{\"网络\":\"电信3G\",\"颜色\":\"黑\"}',99,90,1299,1399,NULL,NULL,NULL,NULL),(8,1,1008,'{\"网络\":\"移动3G\",\"颜色\":\"白\"}',98,80,1199,1299,NULL,NULL,NULL,NULL);

/*Data for the table `invoice` */

/*Data for the table `merchant` */

/*Data for the table `merchant_type` */

/*Data for the table `order_address` */

/*Data for the table `order_goods` */

/*Data for the table `order_status` */

/*Data for the table `packing_list` */

insert  into `packing_list`(`id`,`product_id`,`goods_name`,`num`,`units`,`status`,`create_time`,`update_time`) values (1,1,'手机主机',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(2,1,'专用电池',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(3,1,'电源适配器',2,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(4,1,'USB2.0数据线',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(5,1,'三包凭证',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43'),(6,1,'入门指南',1,'件',1000,'2014-07-11 22:06:43','2014-07-11 22:06:43');

/*Data for the table `payment` */

/*Data for the table `pic_url` */

insert  into `pic_url`(`id`,`pic_url`,`pic_desc`,`pic_name`,`create_time`,`update_time`,`status`) values (1,'1.jpg',NULL,NULL,NULL,NULL,'1000'),(2,'2.jpg',NULL,NULL,NULL,NULL,'1000'),(3,'3.jpg',NULL,NULL,NULL,NULL,'1000'),(4,'4.jpg',NULL,NULL,NULL,NULL,'1000'),(5,'5.webp',NULL,NULL,NULL,NULL,'1000'),(6,'4.jpg',NULL,NULL,NULL,NULL,'1000');

/*Data for the table `product` */

insert  into `product`(`product_id`,`kind_id`,`shop_id`,`shop_name`,`product_name`,`product_title`,`brand_id`,`brand_name`,`view_num`,`status`,`pay_type`,`delevery_amount`,`min_price`,`max_price`,`pic_url`,`comment_times`,`score`,`create_time`,`update_time`,`sales`) values (1,1,1,'自营','小米2S','小米2S 正品行货 特价销售',1,'小米',1,1000,1,5,1999,2099,'common/images/product/1.jpg',3258,48,NULL,NULL,8000),(2,1,1,'自营','小米3',NULL,1,'小米',1,1000,1,5,2499,2599,'common/images/product/2.jpg',12,47,NULL,NULL,889),(3,1,1,'自营','iPhone5S',NULL,2,'APPLE',1,1000,1,5,4999,5499,'common/images/product/4.jpg',NULL,50,NULL,NULL,200);

/*Data for the table `product_attr` */

insert  into `product_attr`(`id`,`product_id`,`attr_group_id`,`attr_name`,`attr_value`,`sort_order`,`attr_type`) values (1,1,NULL,'颜色','黑,白',10,1),(2,1,NULL,'网络','电信3G,移动3G,联通3G',20,1),(3,1,1,'屏幕尺寸','4.3',30,2),(4,1,1,'触摸屏类型','电容式',40,2),(5,1,1,'分辨率','1280x720',50,3),(6,1,2,'运行内存RAM','2GB',60,3),(7,1,2,'机身内存','16GB 32GB',70,3),(8,1,3,'网络类型','联通3G GSM/WCDMA(3G)',80,3),(9,1,3,'网络模式','单卡双模',90,3),(10,1,4,'品牌','MIUI/小米',100,3),(11,1,4,'型号','2S(MI2S',110,3),(12,1,4,'机身颜色','前黑后白',120,3),(13,1,4,'操作系统','Android/安卓',130,3),(14,1,4,'手机类型','3G手机',140,3),(15,1,4,'电池类型','可拆卸式电池',150,3),(16,1,4,'CPU核数','四核',160,3),(17,1,4,'cpu频率','1.7GHz',170,3),(18,1,4,'电池容量','2000mAh',180,3),(19,1,5,'款式','直板',190,3),(20,1,5,'键盘类型','虚拟触屏键盘',200,3),(21,1,5,'厚度',' 1CM以上',210,3),(22,1,6,'后置摄像头','800-1300万',220,3),(23,1,6,'摄像头类型','双摄像头（前后）',230,3),(24,1,6,'视频显示格式','1080P(全高清D5)',240,3);

/*Data for the table `product_cat` */

insert  into `product_cat`(`id`,`product_id`,`cat_id`,`create_time`,`update_time`,`sort_order`) values (1,1,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',1),(2,2,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',2),(3,3,3,'2014-06-17 21:15:52','2014-06-17 21:15:52',3);

/*Data for the table `product_comment` */

/*Data for the table `product_detail` */

/*Data for the table `product_kind` */

insert  into `product_kind`(`kind_id`,`type_name`,`status`,`create_time`,`update_time`) values (1,'手机',1,'2014-07-11 21:54:39','2014-07-11 21:54:36');

/*Data for the table `product_pic` */

/*Data for the table `shop` */

/*Data for the table `spec_attr` */

/*Data for the table `sys_action` */

insert  into `sys_action`(`UUID`,`NAME`,`URL`,`IS_MENU`,`MENU_ID`,`SORT_NUM`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`,`PARENT_ID`) values ('805','添加公告','/notice/public/toadd',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('807','编辑公告页面数据','/notice/public/toedit',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('808','删除公告页面数据','/notice/public/del',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('FVEYcp7pRIOW_wrAvC4VRw','公告管理','/notice/public/list',0,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','超级管理员',NULL),('mf_4cr-qTXySGQrXbxuvmQ','私信管理','/notice/private/list',0,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','超级管理员',NULL),('801','添加私信','/notice/private/toadd',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('803','编辑私信页面数据','/notice/private/toedit',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('804','删除私信页面数据','/notice/private/del',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('809','批量删除私信','/notice/private/batchdel',1,'10025',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL),('810','批量删除公告','/notice/public/batchdel',1,'10026',1,0,'2014-06-10 10:25:56','2014-06-10 10:25:56','',NULL);

/*Data for the table `sys_area` */

insert  into `sys_area`(`AREA_CODE`,`AREA_NAME`,`AREA_LEVEL`,`ISLEAF`,`PARENT_CODE`,`SORT_NUM`,`DESCRIPTION`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`) values ('025','南京市',1,0,'0',0,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0251','鼓楼区',2,0,'025',1,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0252','秦淮区',2,0,'025',2,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0253','玄武区',2,0,'025',3,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0254','建邺区',2,0,'025',4,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0255','雨花区',2,0,'025',5,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0256','栖霞区',2,0,'025',6,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0257','浦口区',2,0,'025',7,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0258','江宁区',2,0,'025',8,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL),('0259','六合区',2,0,'025',9,NULL,0,'2014-06-10 09:37:19','2014-06-10 09:37:19',NULL);

/*Data for the table `sys_friendlink` */

insert  into `sys_friendlink`(`linkid`,`link_name`,`link_url`,`create_time`,`sort_num`) values ('1','电视商城','http://172.20.225.46/tvroot/','2014-06-10 09:40:25',1),('2','开放平台','http://172.20.225.87/jos/','2014-06-10 09:40:25',2),('3','边看边送后台','http://172.20.225.97/dianping-bg/index','2014-06-10 09:40:25',3),('4','商城IPP后台','http://172.20.222.191/IPPOversea/Portal/ControlPanel/Login.aspx','2014-06-10 09:40:25',4),('5','报表系统','http://172.20.225.240:8080/bi','2014-06-10 09:40:25',5),('6','房产展销后台','https://172.20.225.97/housesell','2014-06-10 09:40:25',6);

/*Data for the table `sys_log` */

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`code`,`title`,`url`,`parent_code`,`menu_level`,`children_count`,`display_num`) values ('ZFJL','交易记录','/record/search.htm','ZFPTGL',2,0,2),('ZFYHGL','支付银行管理','/bank/search.htm','XTGL',2,0,6),('ZFPTGL','支付平台管理',NULL,'0',1,4,1),('THGL','退货管理','/refund/search.htm','ZFPTGL',2,0,4),('XTGL','系统管理',NULL,'0',1,7,5),('SZMX','收支明细','/item/search.htm','ZFPTGL',2,0,3),('SHGL','商户管理','/merchant/search.htm','XTGL',2,0,7),('XTRZ','系统操作日志','/log/querylogs.htm','XTGL',2,0,9),('GNCDGL','功能菜单管理','/menu/querymenus.htm','XTGL',2,0,3),('QXZGL','权限组管理','/rolegl/queryroles.htm','XTGL',2,0,5),('CZYGL','操作员管理','/operator/searchoperators.htm','XTGL',2,0,1),('YHJGL','优惠劵管理','/coupon/search.htm','XTGL',2,0,9),('SHLXGL','商户类型管理','/type/search.htm','XTGL',2,0,8),('WZGL','网站管理','','WZPCGL',2,0,1),('WZPCGL','网站爬虫管理','','0',1,2,1),('CSPZGL','参数配置管理','','WZPCGL',2,0,2);

/*Data for the table `sys_menu_role` */

insert  into `sys_menu_role`(`id`,`menu_code`,`role_code`) values ('5cc1e7dfb16847ebacaf5e1fdb9d97d2','XTGL','ROLE_ADMIN'),('25acbb56a06445dfa8be8e402806a39d','SHGL','ROLE_ADMIN'),('b0045ffa58cc4c45b8144f08b3e230ac','ZFYHGL','ROLE_ADMIN'),('123385b0d6c441ccbad260db6d5fd33c','CZYGL','ROLE_ADMIN'),('aa7b518f995e47a5a774a3cb63d543a4','XTRZ','ROLE_ADMIN'),('0a074274109543f9968bfd5ceb1384ea','GNCDGL','ROLE_ADMIN'),('0b14caabd19b409fb7da61d90740f2ca','QXZGL','ROLE_ADMIN'),('db8d73234c904925908be21f263df8a1','ZFPTGL','ROLE_ADMIN'),('d0b680d37118462e8eef9f2b27b46354','THGL','ROLE_ADMIN'),('beb0c823c8184b9abf12b193cf27a4ee','SZMX','ROLE_ADMIN'),('053fa39d74bc405aa9bd083d99ea17d9','ZFJL','ROLE_ADMIN');

/*Data for the table `sys_operate_log` */

insert  into `sys_operate_log`(`UUID`,`TIME`,`OPERATOR`,`IP`,`ACTION`,`CONTENT`,`CLASSZ`,`METHOD`,`PARAMS`) values ('vF0uoFiuTn-fo100mulwcA','2014-06-10 10:04:09',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('TJmvBfFeSYineIOkvZKHMA','2014-06-10 10:08:35',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('naep88Y0TKOzhmE7E1ACqA','2014-06-10 10:15:35',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;superadmin;'),('JN1mdkZoRi-U1r1XBwdCmA','2014-06-10 10:34:20',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('imwBSgx3Q1yNIwW9kRhdWA','2014-06-10 10:53:17',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('xPD8qymSTDOiVAddQVmW3w','2014-06-10 10:53:18','superadmin','0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('MDDtKFeoSueOb55gVGCCFA','2014-06-10 10:55:02','superadmin','0:0:0:0:0:0:0:1','查询','菜单','com.jscn.tvmall.system.controller.SysMenuController','menulist',''),('NzO5-3oQSgWtp4U6juFV1A','2014-06-10 13:26:49',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmdi;1;'),('9d7qfNyKSwapN-tLL6X1sQ','2014-06-10 13:27:21',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;'),('60P_p2q8TIWMIkie0mGjKQ','2014-06-10 13:49:29',NULL,'0:0:0:0:0:0:0:1','登录','用户登录','com.jscn.tvmall.system.controller.LoginController','login','superadmin;1;');

/*Data for the table `sys_operator` */

insert  into `sys_operator`(`operator_id`,`password`,`name`,`mobile_num`,`tele_num`,`email`,`status`,`job_name`,`remark`,`last_time`,`last_ip`) values ('admin','21232f297a57a5a743894a0e4a801fc3','管理员','133258711111','025-582144212',NULL,'1',NULL,NULL,'2012-06-03 14:38:18','127.0.0.1');

/*Data for the table `sys_operator_role` */

insert  into `sys_operator_role`(`id`,`operator_id`,`role_code`) values ('f9edd715d7b54020bd53fe3a7a30694a','admin','ROLE_ADMIN');

/*Data for the table `sys_role` */

insert  into `sys_role`(`code`,`title`,`remark`) values ('ROLE_ADMIN','系统管理员组','系统管理员组');

/*Data for the table `sys_role_action` */

insert  into `sys_role_action`(`ROLE_ID`,`ACTION_ID`) values ('1','1'),('1','10'),('1','100244'),('1','100245'),('1','11'),('1','12'),('1','120'),('1','121'),('1','122'),('1','123'),('1','13'),('1','130'),('1','131'),('1','132'),('1','133'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','3'),('1','30'),('1','31'),('1','32'),('1','35'),('1','36'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','5'),('1','6'),('1','60'),('1','6666YMzQTWuTG9e80eQRxg'),('1','6700YMzQTWuTG9e80eQGrx'),('1','6701YMzQTWuTG9e80eQGrx'),('1','6766YMzQTWuTG9e80eQGrx'),('1','6766YMzQTWuTG9e80eQRxg'),('1','6798YMzQTWuTG9e80eQGrx'),('1','7'),('1','8'),('1','80'),('1','801'),('1','803'),('1','804'),('1','805'),('1','807'),('1','808'),('1','809'),('1','810'),('1','9'),('1','FVEYcp7pRIOW_wrAvC4VRw'),('1','IHZ8JiLyTZ2C1RcHuN1lCQ'),('1','mf_4cr-qTXySGQrXbxuvmQ'),('1','njgp_wDZTQGYDKGOPmoEEg');

/*Data for the table `sys_user` */

insert  into `sys_user`(`UUID`,`ACCOUNT`,`PASSWORD`,`NAME`,`MOBILE`,`TEL`,`DEPARTMENT`,`STATE`,`CREATE_TIME`,`LAST_UPDATE_TIME`,`OPERATOR`,`LAST_LOGIN_TIME`) values ('0','superadmin','c4ca4238a0b923820dcc509a6f75849b','超级管理员',NULL,NULL,'运营',0,'2014-06-10 13:49:29','2014-06-10 10:14:59','zS1n9i1ESoy759yaW8ATEw','2014-06-10 13:49:29');

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`ROLE_ID`,`USER_ID`) values ('1','0');

/*Data for the table `trade_order` */

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_real_name`,`create_time`,`update_time`,`phone_num`,`mail`,`sex`,`status`,`rank_id`,`integral`) values (1,'hexizheng','贺夕政',NULL,NULL,'13851402609','hexizheng@163.com','m',1000,1,1000);

/*Data for the table `user_address` */

/*Data for the table `user_integral` */

/*Data for the table `user_rank` */

/*Data for the table `user_web` */

/*Data for the table `website_list` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
