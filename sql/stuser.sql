/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : node

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-03-25 22:13:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `stuser`
-- ----------------------------
DROP TABLE IF EXISTS `stuser`;
CREATE TABLE `stuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `upass` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuser
-- ----------------------------
INSERT INTO `stuser` VALUES ('6', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `stuser` VALUES ('7', 'lisi', '202cb962ac59075b964b07152d234b70');
INSERT INTO `stuser` VALUES ('8', 'wanwu', '202cb962ac59075b964b07152d234b70');
INSERT INTO `stuser` VALUES ('9', 'lll', '202cb962ac59075b964b07152d234b70');
