CREATE TABLE `tb_area` (
  `area_id`  int(2) NOT NULL AUTO_INCREMENT COMMENT '区域ID' ,
  `area_name`  varchar(200) NOT NULL COMMENT '区域名称' ,
  `priority`  int(2) NOT NULL DEFAULT 0 COMMENT '区域优先级' ,
  `create_time`  datetime DEFAULT NULL COMMENT '区域创建时间' ,
  `last_edit_time`  datetime DEFAULT NULL COMMENT '最后修改时间' ,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE = InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET = utf8;

CREATE TABLE `tb_person_info` (
  `user_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) DEFAULT NULL ,
  `profile_img` VARCHAR(1024) DEFAULT NULL ,
  `email` VARCHAR(1024) DEFAULT NULL ,
  `gender` VARCHAR(2) DEFAULT NULL ,
  `enable_status` INT(2) NOT NULL DEFAULT 0 COMMENT '0:禁止使用本商城，1：允许使用本商城',
  `user_type` INT(2) NOT NULL DEFAULT 1 COMMENT '1: 顾客， 2：店家， 3：超级管理员',
  `create_time`  datetime DEFAULT NULL COMMENT '创建时间' ,
  `last_edit_time`  datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`user_id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET = utf8;

CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NOT NULL ,
  -- ERROR 1071 (42000): Specified key was too long; max key length is 767 bytes
  -- 原来是1024 但是mysql会报这么一个错误，只好修改
  -- 还是没有修改，这里真的不知道应该怎么设计这个唯一键的长度，要不牺牲open_id的长度，要不牺牲唯一键
  `open_id` VARCHAR(1024) NOT NULL ,
  `create_time` DATETIME DEFAULT NULL ,
  -- 主键索引
  PRIMARY KEY (`wechat_auth_id`),
  -- 唯一索引
  #   UNIQUE KEY (`open_id`),
  -- 外键索引
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE `tb_local_auth` (
  `local_auth_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NOT NULL ,
  `username` VARCHAR(128) NOT NULL ,
  `password` VARCHAR(128) NOT NULL ,
  `create_time` DATETIME DEFAULT NULL ,
  `last_edit_time` DATETIME DEFAULT NULL ,
  -- 主键约束
  PRIMARY KEY (`local_auth_id`) ,
  -- 唯一键约束
  UNIQUE KEY `uk_local_profile`(`username`),
  -- 外键约束
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE `tb_head_line` (
  `line_id` INT(100) NOT NULL AUTO_INCREMENT,
  `line_name` VARCHAR(1000) DEFAULT NULL ,
  `line_link` VARCHAR(2000) NOT NULL ,
  `line_img` VARCHAR(2000) NOT NULL ,
  `priority` INT(2) DEFAULT NULL ,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL ,
  `last_edit_time` DATETIME DEFAULT NULL ,
  PRIMARY KEY (`line_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE  `tb_shop_category` (
  `shop_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` VARCHAR(100) NOT NULL DEFAULT '',
  `shop_category_desc` VARCHAR(1000) DEFAULT '',
  `shop_category_img` VARCHAR(2000) DEFAULT NULL,
  `priority` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL ,
  `parent_id` INT(11) DEFAULT NULL ,
  PRIMARY KEY (`shop_category_id`),
  CONSTRAINT `kf_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category`(`shop_category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE tb_shop (
  `shop_id` INT(10) NOT NULL AUTO_INCREMENT,
  `owner_id` INT(10) NOT NULL COMMENT '店铺创建人',
  `area_id` INT(5) DEFAULT NULL ,
  `shop_category_id` INT(11) DEFAULT NULL ,
  `shop_name` VARCHAR(256) NOT NULL ,
  `shop_desc` VARCHAR(1024) DEFAULT NULL ,
  `shop_addr` VARCHAR(200) DEFAULT NULL ,
  `phone` VARCHAR(128) DEFAULT NULL ,
  `shop_img` VARCHAR(1024) DEFAULT NULL ,
  `priority` INT(3) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL ,
  `last_edit_time` DATETIME DEFAULT NULL ,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `advice` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area`(`area_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info`(`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category`(`shop_category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE tb_product_category (
  `product_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` VARCHAR(100) NOT NULL ,
  `priority` INT(2) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL ,
  `shop_id` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop`(`shop_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


CREATE TABLE tb_product_img (
  `product_img_id` INT(20) NOT NULL AUTO_INCREMENT,
  `img_addr` VARCHAR(2000) NOT NULL ,
  `img_desc` VARCHAR(2000) DEFAULT NULL ,
  `priority` INT(2) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL ,
  `product_id` INT(20) DEFAULT NULL ,
  PRIMARY KEY (`product_img_id`),
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product`(`product_id`)
) ENGINE InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE `tb_product`(
  `product_id` INT(100) not NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL ,
  `product_desc` VARCHAR(2000) DEFAULT NULL ,
  `img_addr` VARCHAR(2000) DEFAULT '',
  `normal_price` VARCHAR(100) DEFAULT NULL ,
  `promotion_price` VARCHAR(100) DEFAULT NULL,
  `priority` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `product_category_id` INT(11) DEFAULT NULL,
  `shop_id` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category`(`product_category_id`),
  CONSTRAINT `fk_product_shop0` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop`(`shop_id`)
)ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;