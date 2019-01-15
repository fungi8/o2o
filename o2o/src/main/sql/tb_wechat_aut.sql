use o2o;
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

# alter table tb_wechat_auth add unique index(open_id);
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