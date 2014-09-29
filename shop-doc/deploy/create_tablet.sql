/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/9/23 21:09:38                           */
/*==============================================================*/


drop table if exists area;

drop table if exists attr_group;

drop table if exists attribute;

drop table if exists brand;

drop table if exists cart;

drop table if exists category;

drop table if exists express;

drop index index_product_id on goods;

drop table if exists goods;

drop index idx_invoice_order_id on invoice;

drop table if exists invoice;

drop index idx_order_address_ordre_id on order_address;

drop table if exists order_address;

drop index idx_order_goods_order_id on order_goods;

drop table if exists order_goods;

drop index idx_order_history_status_order_id on order_history_status;

drop table if exists order_history_status;

drop table if exists packing_list;

drop table if exists payment;

drop table if exists product;

drop table if exists product_attr;

drop table if exists product_cat;

drop table if exists product_comment;

drop table if exists product_detail;

drop table if exists product_kind;

drop table if exists product_pic;

drop table if exists shop;

drop table if exists spec_attr;

drop table if exists trade_order;

drop table if exists user;

drop table if exists user_address;

drop table if exists user_integral;

drop table if exists user_rank;

/*==============================================================*/
/* Table: area                                                  */
/*==============================================================*/
create table area
(
   area_id              bigint not null auto_increment,
   area_code            int,
   area_name            varchar(50) comment '商品类型ID',
   parent_id            bigint comment '规格名',
   level                smallint comment '0 国家
            1 省
            2 市
            3 区/县',
   primary key (area_id)
);

alter table area comment '地区表';

/*==============================================================*/
/* Table: attr_group                                            */
/*==============================================================*/
create table attr_group
(
   attr_group_id        bigint not null auto_increment,
   kind_id              bigint,
   group_name           varchar(30),
   status               smallint comment '1 正常
            2 已删除',
   primary key (attr_group_id)
);

/*==============================================================*/
/* Table: attribute                                             */
/*==============================================================*/
create table attribute
(
   attr_id              bigint not null auto_increment,
   attr_group_id        bigint,
   kind_id              bigint comment '类型ID',
   attr_name            varchar(50) comment '属性名',
   attr_values          varchar(200) comment '多选属性值',
   attr_type            smallint comment '1输入
            2下拉单选
            3多选',
   create_time          datetime,
   update_time          datetime,
   primary key (attr_id)
);

/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   brand_id             bigint not null auto_increment,
   brand_name           varchar(10),
   url                  varchar(200),
   brand_desc           varchar(200),
   create_time          datetime,
   update_time          datetime,
   status               smallint comment '1 正常
            2 已删除',
   primary key (brand_id)
);

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   id                   bigint not null auto_increment,
   user_id              bigint not null,
   goods_id             bigint not null,
   buy_num              smallint not null default 1,
   create_time          datetime not null default CURRENT_TIMESTAMP,
   primary key (id)
);

alter table cart comment '购物车';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   cat_id               bigint not null auto_increment,
   parent_id            bigint comment '父分类ID',
   name                 varchar(50) comment '分类名',
   status               smallint comment '1 正常
            2 已删除',
   sort_order           smallint comment '排序',
   create_time          datetime,
   update_time          datetime,
   level                smallint comment '顶层为0',
   is_leaf              char(1) default 'n' comment 'y 是
            n 否',
   primary key (cat_id)
);

/*==============================================================*/
/* Table: express                                               */
/*==============================================================*/
create table express
(
   express_id           bigint not null auto_increment,
   express_name         varchar(50) comment '快递公司名',
   status               smallint comment '1 正常
            2 已删除',
   telephone            varchar(50) comment '联系电话',
   contact              varchar(30) comment '联系人',
   contact_phone_num    varchar(30) comment '联系人手机',
   create_time          datetime,
   update_time          datetime,
   primary key (express_id)
);

alter table express comment '快递公司';

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   goods_id             bigint not null auto_increment,
   product_id           bigint,
   goods_sn             int comment '商品序列号',
   spec                 varchar(500) comment '以json格式存储规格，比如{颜色：白色，尺寸：xl}',
   stock                int default 0 comment '库存',
   sales                int default 0 comment '销量',
   price                int comment '价格',
   display_price        int comment '原价',
   create_time          datetime,
   update_time          datetime,
   version              int,
   product_pic_id       bigint,
   status               smallint default 1 comment '1 正常
            2 已删除',
   primary key (goods_id)
);

alter table goods comment 'sku 属性，价格，库存等';

/*==============================================================*/
/* Index: index_product_id                                      */
/*==============================================================*/
create index index_product_id on goods
(
   product_id
);

/*==============================================================*/
/* Table: invoice                                               */
/*==============================================================*/
create table invoice
(
   invoice_id           bigint not null auto_increment,
   order_id             bigint,
   type                 smallint comment '1：普通发票   2：增值发票',
   title                varchar(100) comment '发票抬头',
   product_type         smallint comment '1：办公用品  2：日用品   3：食品',
   create_time          datetime,
   primary key (invoice_id)
);

alter table invoice comment '发票';

/*==============================================================*/
/* Index: idx_invoice_order_id                                  */
/*==============================================================*/
create unique index idx_invoice_order_id on invoice
(
   order_id
);

/*==============================================================*/
/* Table: order_address                                         */
/*==============================================================*/
create table order_address
(
   id                   bigint not null auto_increment,
   order_id             bigint not null,
   consigee             varchar(50) not null comment '收货人',
   phone_num            varchar(30) not null comment '收货人电话',
   post_code            varchar(10) comment '邮编',
   address              varchar(200) comment '详细地址',
   province             varchar(50) comment '省',
   city                 varchar(50) comment '市',
   county               varchar(50) comment '县',
   express_id           bigint comment '快递公司id',
   express_name         varchar(50) comment '快递公司名',
   express_no           varchar(50) comment '快递单号',
   create_time          datetime not null,
   primary key (id)
);

alter table order_address comment '订单地址表';

/*==============================================================*/
/* Index: idx_order_address_ordre_id                            */
/*==============================================================*/
create unique index idx_order_address_ordre_id on order_address
(
   order_id
);

/*==============================================================*/
/* Table: order_goods                                           */
/*==============================================================*/
create table order_goods
(
   id                   bigint not null auto_increment,
   order_id             bigint,
   goods_id             bigint,
   goods_name           varchar(100) comment '商品名称',
   price                int comment '成交价格',
   quanity              int comment '成交数量',
   create_time          datetime,
   primary key (id)
);

alter table order_goods comment '订单商品表';

/*==============================================================*/
/* Index: idx_order_goods_order_id                              */
/*==============================================================*/
create index idx_order_goods_order_id on order_goods
(
   order_id
);

/*==============================================================*/
/* Table: order_history_status                                  */
/*==============================================================*/
create table order_history_status
(
   id                   bigint not null auto_increment,
   order_id             bigint,
   status               smallint comment '状态',
   remark               varchar(500) comment '说明',
   create_time          datetime,
   primary key (id)
);

alter table order_history_status comment '订单状态表';

/*==============================================================*/
/* Index: idx_order_history_status_order_id                     */
/*==============================================================*/
create index idx_order_history_status_order_id on order_history_status
(
   order_id
);

/*==============================================================*/
/* Table: packing_list                                          */
/*==============================================================*/
create table packing_list
(
   id                   bigint not null auto_increment,
   product_id           bigint not null,
   goods_name           varchar(50) not null,
   num                  smallint not null,
   status               smallint not null comment '1 正常
            2 已删除',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: payment                                               */
/*==============================================================*/
create table payment
(
   payment_id           bigint not null auto_increment,
   order_id             bigint,
   amount               varchar(50) comment '支付金额',
   status               smallint,
   create_time          datetime,
   update_time          datetime,
   pay_account          varchar(50) comment '买家账号',
   payer_name           varchar(50) comment '买家姓名',
   primary key (payment_id)
);

alter table payment comment '支付表';

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           bigint not null auto_increment,
   kind_id              bigint,
   shop_id              bigint,
   shop_name            varchar(50) comment '商店名称',
   product_name         varchar(100) comment '产品名,用于首页列表展示',
   product_title        varchar(500),
   brand_id             bigint comment '品牌ID',
   brand_name           varchar(50) comment '品牌名',
   view_num             bigint comment '浏览量',
   status               smallint comment '1上架
            2 下架
            3初始
            4 待审核
            5 拒绝
            6已删除',
   pay_type             smallint comment '1 货到付款
            2 在线支付
            3 都支持',
   express_fee          int default 0,
   min_price            int comment '不同规格中的最低价',
   max_price            int comment '不同规格中的最高价',
   pic_url              varchar(100),
   comment_times        int,
   score                int,
   create_time          datetime,
   update_time          datetime,
   sales                int,
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_attr                                          */
/*==============================================================*/
create table product_attr
(
   id                   bigint not null auto_increment,
   product_id           bigint not null,
   attr_group_id        bigint,
   attr_name            varchar(30) not null comment '属性名',
   attr_value           varchar(200) not null comment '属性值,如果是规格属性，属性值以逗号分隔',
   sort_order           smallint default 1000 comment '数字越小越靠前',
   attr_type            smallint default 3 comment '1 规格属性
            2 常用属性
            3 一般属性',
   primary key (id)
);

alter table product_attr comment '产品属性表';

/*==============================================================*/
/* Table: product_cat                                           */
/*==============================================================*/
create table product_cat
(
   id                   bigint not null auto_increment,
   product_id           bigint,
   cat_id               bigint,
   create_time          datetime,
   update_time          datetime,
   sort_order           smallint,
   status               smallint comment '1 正常
            2 已删除',
   primary key (id)
);

alter table product_cat comment '产品分类';

/*==============================================================*/
/* Table: product_comment                                       */
/*==============================================================*/
create table product_comment
(
   id                   bigint not null auto_increment,
   product_id           bigint,
   order_id             bigint,
   user_id              bigint,
   user_name            varchar(100) comment '用户名',
   similar              smallint comment '描述相符',
   attitude             smallint comment '服务态度',
   speed                smallint comment '发货速度',
   comment              varchar(500) comment '评价',
   shop_reply           varbinary(500),
   status               smallint comment '1 正常
            2 已删除',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: product_detail                                        */
/*==============================================================*/
create table product_detail
(
   detail_id            bigint not null auto_increment,
   product_id           bigint,
   description          varchar(20000),
   create_time          datetime,
   update_time          datetime,
   primary key (detail_id)
);

alter table product_detail comment '存放商品详细描述，大数据字段，分开存储';

/*==============================================================*/
/* Table: product_kind                                          */
/*==============================================================*/
create table product_kind
(
   kind_id              bigint not null auto_increment,
   type_name            varchar(50) comment '类型名',
   status               smallint comment '1 正常
            2 已删除',
   create_time          datetime,
   update_time          datetime,
   primary key (kind_id)
);

alter table product_kind comment '手机、电脑等，用来管理属性列表';

/*==============================================================*/
/* Table: product_pic                                           */
/*==============================================================*/
create table product_pic
(
   product_pic_id       bigint not null auto_increment,
   product_id           bigint not null,
   url                  varchar(100),
   image_name           varchar(50),
   post_fix             varchar(50),
   brief_name           varchar(50),
   use_type             smallint comment '1：搜索首页图片
            2：详情页左侧展示图片
            3：对应规格goods的图片',
   status               SMALLINT comment '1正常
            2已删除',
   primary key (product_pic_id)
);

alter table product_pic comment '商品图片表,用于详细页左边展示的几个典型图片';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              bigint not null auto_increment,
   shop_name            varchar(100) not null comment '店铺名',
   link_men             varchar(50) comment '联系人',
   phone_num            varchar(200) comment '联系电话',
   create_time          datetime not null,
   update_time          datetime,
   status               smallint not null comment '店铺状态',
   primary key (shop_id)
);

alter table shop comment '商店';

/*==============================================================*/
/* Table: spec_attr                                             */
/*==============================================================*/
create table spec_attr
(
   spec_id              bigint not null auto_increment,
   kind_id              bigint comment '商品类型ID',
   spec_name            varchar(50) comment '规格名',
   spec_values          varchar(500) comment '多个值以竖线分隔',
   create_time          datetime,
   update_time          datetime,
   primary key (spec_id)
);

alter table spec_attr comment '如：颜色属性的红黄蓝等';

/*==============================================================*/
/* Table: trade_order                                           */
/*==============================================================*/
create table trade_order
(
   order_id             bigint not null auto_increment,
   shop_id              bigint,
   user_id              bigint comment '商品类型ID',
   user_name            varchar(50) comment '用户名',
   status               smallint comment '1  初始
            2 支付中
            3 支付成功
            4 已发货
            5 交易成功
            6 退货申请中
            7 已同意退货
            8 退货成功
            9 拒绝退货',
   pay_type             smallint,
   amount               int comment '订单金额 = 商品金额 + 快递费用',
   express_fee          int comment '快递费',
   use_integral         int comment '应付金额= 订单金额-使用积分',
   sent_integral        int,
   remark               varchar(100) comment '下单备注',
   version              int default 0,
   create_time          datetime,
   update_time          datetime,
   primary key (order_id)
);

alter table trade_order comment '交易订单表';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              bigint not null auto_increment,
   rank_id              bigint,
   user_name            varchar(50) not null comment '用户名',
   user_real_name       varchar(50) comment '用户真实姓名',
   phone_num            varchar(30) comment '手机号',
   mail                 varchar(50) comment '邮箱',
   sex                  char(1) comment 'm 男
            f  女',
   status               smallint not null comment '1 正常
            2 已删除
            3 黑名单',
   integral             int not null default 0,
   create_time          datetime not null,
   update_time          datetime,
   version              int not null default 0,
   primary key (user_id)
);

alter table user comment '网站会员';

/*==============================================================*/
/* Table: user_address                                          */
/*==============================================================*/
create table user_address
(
   address_id           bigint not null auto_increment,
   user_id              bigint not null,
   post_code            varchar(50) comment '邮编',
   address              varchar(200) not null comment '详细地址',
   consignee            varchar(30) not null comment '收件人姓名',
   phone_num            varchar(30) not null comment '收件人电话',
   province_id          bigint not null comment '省地区id',
   city_id              bigint not null comment '市地区id',
   county_id            bigint not null comment '县地区id',
   status               smallint not null comment '1 默认地址
            2 常用地址',
   create_time          datetime not null,
   update_time          datetime not null,
   province             varchar(50),
   city                 varchar(50),
   county               varchar(50),
   primary key (address_id)
);

alter table user_address comment '常用收货地址';

/*==============================================================*/
/* Table: user_integral                                         */
/*==============================================================*/
create table user_integral
(
   id                   bigint not null auto_increment,
   user_id              bigint not null,
   order_id             bigint,
   user_name            varchar(50) comment '用户名',
   create_time          datetime not null,
   integral             int not null comment '积分增减
            增加积分为正数
            扣减积分为负数',
   type                 smallint not null comment '1 消费赠送
            2 积分消费
            3 退货退积分',
   remark               varchar(200),
   primary key (id)
);

alter table user_integral comment '记录会员每笔积分增减记录';

/*==============================================================*/
/* Table: user_rank                                             */
/*==============================================================*/
create table user_rank
(
   rank_id              int not null,
   rank                 int not null comment '等级数值',
   rank_name            varchar(50) not null comment '等级名称',
   create_time          datetime not null,
   update_time          datetime not null,
   status               smallint not null,
   primary key (rank_id)
);

alter table user_rank comment '会员等级表';

alter table attribute add constraint FK_Reference_3 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

alter table goods add constraint FK_Reference_6 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_4 foreign key (brand_id)
      references brand (brand_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_9 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

alter table product_cat add constraint FK_Reference_11 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product_cat add constraint FK_Reference_12 foreign key (cat_id)
      references category (cat_id) on delete restrict on update restrict;

alter table product_comment add constraint FK_Reference_14 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product_detail add constraint FK_Reference_13 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table spec_attr add constraint FK_Reference_10 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

