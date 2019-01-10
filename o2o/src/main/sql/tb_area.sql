CREATE TABLE `tb_area` (
  `area_id`  int(2) NOT NULL AUTO_INCREMENT COMMENT '区域ID' ,
  `area_name`  varchar(200) NOT NULL COMMENT '区域名称' ,
  `priority`  int(2) NOT NULL DEFAULT 0 COMMENT '区域优先级' ,
  `create_time`  datetime DEFAULT NULL COMMENT '区域创建时间' ,
  `last_edit_time`  datetime DEFAULT NULL COMMENT '最后修改时间' ,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE = InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET = utf8;
;

