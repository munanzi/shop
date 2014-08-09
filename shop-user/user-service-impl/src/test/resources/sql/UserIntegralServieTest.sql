drop table if exists user;

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

insert into `user` (`user_id`, `rank_id`, `user_name`, `user_real_name`, `phone_num`, `mail`, `sex`, `status`, `integral`, `create_time`, `update_time`, `version`) values('1','1','hexizheng','贺夕政','13851402609','hexizheng@163.com','m','1','100','2014-08-01 21:43:43','2014-08-01 21:43:46','0');


DROP TABLE IF EXISTS user_integeral;

/*==============================================================*/
/* Table: user_integeral                                        */
/*==============================================================*/
CREATE TABLE user_integeral
(
   id                   BIGINT NOT NULL AUTO_INCREMENT,
   user_id              BIGINT NOT NULL,
   order_id             BIGINT,
   user_name            VARCHAR(50) COMMENT '用户名',
   create_time          DATETIME NOT NULL,
   integral             INT NOT NULL COMMENT '积分增减
            增加积分为正数
            扣减积分为负数',
   TYPE                 SMALLINT NOT NULL COMMENT '1 消费赠送
            2 推荐
            3 积分消费',
   remark               VARCHAR(200),
   PRIMARY KEY (id)
);

ALTER TABLE user_integeral COMMENT '记录会员每笔积分增减记录';
