/*
 Navicat Premium Data Transfer

 Source Server         : Zentertain
 Source Server Type    : MySQL
 Source Server Version : 50525
 Source Host           : localhost
 Source Database       : zentertain

 Target Server Type    : MySQL
 Target Server Version : 50525
 File Encoding         : utf-8

 Date: 12/06/2012 12:04:05 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `r_ad_group_ad`
-- ----------------------------
DROP TABLE IF EXISTS `r_ad_group_ad`;
CREATE TABLE `r_ad_group_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t_ad_id` bigint(20) NOT NULL,
  `t_ad_group_id` bigint(20) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD_GROUP_ID` (`t_ad_group_id`) USING BTREE,
  KEY `IDX_AD_ID` (`t_ad_id`),
  CONSTRAINT `FK_T_AD_GROUP_ID` FOREIGN KEY (`t_ad_group_id`) REFERENCES `t_ad_group` (`id`),
  CONSTRAINT `FK_T_AD_ID` FOREIGN KEY (`t_ad_id`) REFERENCES `t_ad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_ad`
-- ----------------------------
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE `t_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `bundle_identifier` varchar(100) NOT NULL,
  `alert_id` varchar(50) NOT NULL,
  `apple_id` varchar(50) NOT NULL,
  `app_name` varchar(50) NOT NULL,
  `app_alert_title` varchar(255) NOT NULL,
  `app_alert_description` varchar(255) NOT NULL,
  `app_alert_button_text` varchar(255) NOT NULL DEFAULT '',
  `device_type` varchar(1) NOT NULL,
  `show_type` varchar(50) NOT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `action_info_1` varchar(255) DEFAULT NULL,
  `message_title` varchar(255) DEFAULT NULL,
  `message_body` varchar(255) DEFAULT NULL,
  `button_yes_text` varchar(255) DEFAULT NULL,
  `button_no_text` varchar(255) DEFAULT NULL,
  `show_again` varchar(1) DEFAULT NULL,
  `force_push` varchar(1) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BUNDLE_ID` (`bundle_identifier`),
  KEY `IDX_APPLE_ID` (`apple_id`),
  KEY `IDX_CREATE_DATE` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_ad_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_group`;
CREATE TABLE `t_ad_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATE_DATE` (`create_date`),
  KEY `IDX_NAME` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_app`
-- ----------------------------
DROP TABLE IF EXISTS `t_app`;
CREATE TABLE `t_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_group_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `bundle_identifier` varchar(100) NOT NULL,
  `apple_id` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_USER_NAME` (`user_name`),
  KEY `IDX_PASSWORD` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
