/*
MySQL Data Transfer
Source Host: localhost
Source Database: profession_health
Target Host: localhost
Target Database: profession_health
Date: 2019/8/4 20:07:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
CREATE TABLE `tb_config` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `next_check_date` datetime default NULL COMMENT '下次检查时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
CREATE TABLE `tb_department` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL COMMENT '部门名称',
  `sort_num` int(11) default NULL COMMENT '部门排序号',
  `gmt_create` datetime default NULL,
  `gmt_modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_health
-- ----------------------------
CREATE TABLE `tb_health` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(11) default NULL COMMENT '用户ID',
  `blood_fat` int(11) default NULL COMMENT '血脂1正常 0异常',
  `blood_pressure` int(11) default NULL COMMENT '血压1正常 0异常',
  `liver` int(11) default NULL COMMENT '肝功能1正常 0异常',
  `blood` int(11) default NULL COMMENT '血常规1正常 0异常',
  `heart_rate` int(11) default NULL COMMENT '心率1正常 0异常',
  `tumor_marker` int(11) default NULL COMMENT '肿瘤标志物1正常 0异常',
  `x_ray` int(11) default NULL COMMENT 'x光透视1正常 0异常',
  `eent` int(11) default NULL COMMENT '眼耳鼻咽喉 1正常 0异常',
  `check_date` date default NULL COMMENT '检查时间',
  `gmt_create` datetime default NULL,
  `gmt_modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL COMMENT '用户登录名',
  `real_name` varchar(30) default NULL COMMENT '真实名字',
  `sex` tinyint(4) default NULL COMMENT '性别 1男 0女',
  `age` tinyint(4) default NULL COMMENT '年龄',
  `department_id` int(11) default NULL COMMENT '部门ID',
  `work_age` int(11) default NULL COMMENT '工龄',
  `password` varchar(30) default NULL COMMENT '密码',
  `health_status` tinyint(4) default NULL COMMENT '健康状态  1健康 0 异常',
  `role` tinyint(4) default NULL COMMENT '角色  1管理员 2待审核的企业用户3企业用户 -1不通过',
  `gmt_create` datetime default NULL,
  `gmt_modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tb_config` VALUES ('1', '2019-05-17 14:27:24');
INSERT INTO `tb_department` VALUES ('1', '企管科', '1', '2019-07-31 13:15:31', '2019-07-31 13:15:31');
INSERT INTO `tb_department` VALUES ('2', '财务部', '2', '2019-07-31 13:15:31', '2019-07-31 13:15:31');
INSERT INTO `tb_department` VALUES ('3', '人事部', '3', '2019-07-31 13:15:31', '2019-07-31 13:15:31');
INSERT INTO `tb_user` VALUES ('4', 'admin', '系统管理员', '1', '35', '1', '1', '123', '1', '1', '2018-04-01 15:10:10', '2018-04-01 15:28:28');
