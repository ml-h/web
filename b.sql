/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : blogdemo2

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2021-07-01 09:50:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('6', 'badfive', '夷陵老祖', '87654', '1005309071@qq.com', 'fzu', 'CC-gshBoHrvMDEDF6crZ5yUtD1RFdmcl', '$2y$13$RZ20K81ZdERPDyFq2EM31e6KjmmdNRtGmCC6Fq9NST3hWhcgoPqUy', null);
INSERT INTO `adminuser` VALUES ('7', 'hlm', '吹杨', '123456', '1005309071@qq.com', '福州大学', 'hQpoR_MRuTxiTW10rgqcGbOTlPPVCiz4', '$2y$13$RZ20K81ZdERPDyFq2EM31e6KjmmdNRtGmCC6Fq9NST3hWhcgoPqUy', null);
INSERT INTO `adminuser` VALUES ('8', 'joker', 'dangerous', '031804114', '1060925061@qq.com', '老薛', 'u61_InOiocSjXZhjqTEUy-IEdjkSCPzw', '$2y$13$nMctVdKsEtK1YjlIBBZGr.Bt8oYkfRbFr3Dz.imETvtc7HjYG602O', null);

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', '1478063489');
INSERT INTO `auth_assignment` VALUES ('admin', '6', '1578323830');
INSERT INTO `auth_assignment` VALUES ('admin', '7', '1624982243');
INSERT INTO `auth_assignment` VALUES ('admin', '8', '1624982249');
INSERT INTO `auth_assignment` VALUES ('commentAuditor', '1', '1478063489');
INSERT INTO `auth_assignment` VALUES ('commentAuditor', '4', '1465177361');
INSERT INTO `auth_assignment` VALUES ('commentAuditor', '6', '1578323830');
INSERT INTO `auth_assignment` VALUES ('commentAuditor', '7', '1624982243');
INSERT INTO `auth_assignment` VALUES ('commentAuditor', '8', '1624982249');
INSERT INTO `auth_assignment` VALUES ('postAdmin', '1', '1478063489');
INSERT INTO `auth_assignment` VALUES ('postAdmin', '2', '1477816632');
INSERT INTO `auth_assignment` VALUES ('postAdmin', '6', '1578323830');
INSERT INTO `auth_assignment` VALUES ('postAdmin', '7', '1624982243');
INSERT INTO `auth_assignment` VALUES ('postAdmin', '8', '1624982249');
INSERT INTO `auth_assignment` VALUES ('postOperator', '1', '1478063489');
INSERT INTO `auth_assignment` VALUES ('postOperator', '3', '1577369389');
INSERT INTO `auth_assignment` VALUES ('postOperator', '6', '1578323830');
INSERT INTO `auth_assignment` VALUES ('postOperator', '7', '1624982243');
INSERT INTO `auth_assignment` VALUES ('postOperator', '8', '1624982249');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('admin', '1', '系统管理员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('approveComment', '2', '审核评论', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('commentAuditor', '1', '评论审核员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('createPost', '2', '新增文章', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('deletePost', '2', '删除文章', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('postAdmin', '1', '文章管理员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('postOperator', '1', '文章操作员', null, null, '1465177361', '1465177361');
INSERT INTO `auth_item` VALUES ('updatePost', '2', '修改文章', null, null, '1465177361', '1465177361');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('commentAuditor', 'approveComment');
INSERT INTO `auth_item_child` VALUES ('admin', 'commentAuditor');
INSERT INTO `auth_item_child` VALUES ('postAdmin', 'createPost');
INSERT INTO `auth_item_child` VALUES ('postAdmin', 'deletePost');
INSERT INTO `auth_item_child` VALUES ('postOperator', 'deletePost');
INSERT INTO `auth_item_child` VALUES ('admin', 'postAdmin');
INSERT INTO `auth_item_child` VALUES ('postAdmin', 'updatePost');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Lakers', '1');
INSERT INTO `category` VALUES ('2', '快船', '2');
INSERT INTO `category` VALUES ('3', '篮网', '3');
INSERT INTO `category` VALUES ('4', '桃花坞', '4');
INSERT INTO `category` VALUES ('5', '五哈', '5');
INSERT INTO `category` VALUES ('6', '少年', '6');
INSERT INTO `category` VALUES ('7', '心动的信号', '7');
INSERT INTO `category` VALUES ('8', '奔跑吧', '8');
INSERT INTO `category` VALUES ('9', '五十公里', '9');
INSERT INTO `category` VALUES ('10', '送你', '10');
INSERT INTO `category` VALUES ('11', '一朵', '11');
INSERT INTO `category` VALUES ('12', '小红花', '12');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `remind` int(4) DEFAULT '0' COMMENT '0:未提醒1：已提醒',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  KEY `FK_comment_user` (`userid`),
  KEY `FK_comment_status` (`status`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_comment_status` FOREIGN KEY (`status`) REFERENCES `commentstatus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'maybe', '2', '1624976350', '6', '1715985997@qq.com', '', '52', '0');
INSERT INTO `comment` VALUES ('2', 'maybe', '2', '1624976402', '6', '1715985997@qq.com', '', '52', '0');
INSERT INTO `comment` VALUES ('3', '有点奇怪', '2', '1624977261', '6', '1715985997@qq.com', '', '52', '0');
INSERT INTO `comment` VALUES ('4', '有点奇怪', '2', '1624977501', '6', '1715985997@qq.com', '', '52', '0');
INSERT INTO `comment` VALUES ('5', '海上日记', '2', '1624979573', '6', '1715985997@qq.com', '', '55', '0');
INSERT INTO `comment` VALUES ('6', '海上日记', '2', '1624979634', '6', '1715985997@qq.com', '', '55', '0');
INSERT INTO `comment` VALUES ('112', 'maobuyi', '2', '1625016582', '6', '1715985997@qq.com', null, '56', '0');
INSERT INTO `comment` VALUES ('113', '同名专辑', '2', '1625016947', '6', '1715985997@qq.com', null, '55', '0');
INSERT INTO `comment` VALUES ('114', '开始了 冲', '2', '1625016980', '6', '1715985997@qq.com', null, '52', '0');
INSERT INTO `comment` VALUES ('115', '城市傍晚可以', '2', '1625017028', '6', '1715985997@qq.com', null, '56', '0');
INSERT INTO `comment` VALUES ('116', '可以啊 nb', '2', '1625019228', '6', '1715985997@qq.com', null, '57', '0');
INSERT INTO `comment` VALUES ('117', 'test', '1', '1625023143', '6', '1715985997@qq.com', null, '55', '0');
INSERT INTO `comment` VALUES ('118', 'hjashdj', '1', '1625023482', '6', '1715985997@qq.com', null, '56', '0');
INSERT INTO `comment` VALUES ('119', 'hjashdj', '2', '1625023495', '6', '1715985997@qq.com', '', '56', '0');

-- ----------------------------
-- Table structure for commentstatus
-- ----------------------------
DROP TABLE IF EXISTS `commentstatus`;
CREATE TABLE `commentstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of commentstatus
-- ----------------------------
INSERT INTO `commentstatus` VALUES ('1', '待审核', '1');
INSERT INTO `commentstatus` VALUES ('2', '已审核', '2');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1462597684');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1462597693');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1465176156');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_status` (`status`),
  KEY `category` (`category`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_post_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_post_status` FOREIGN KEY (`status`) REFERENCES `poststatus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('51', '快船翻盘', '<p>预测一波，卢指导带领快船逆转太阳</p>', 'NBA', '2', '1624972169', '1624972169', '6', '10');
INSERT INTO `post` VALUES ('52', '老鹰vs雄鹿', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/advanced/advanced/backend/web/assets/d422dd15/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://admin.blogdemo2.com/ueditor/php/upload/file/20210629/1624976189450887.jpg\" title=\"IMG_2288(20200927-094354).JPG\">IMG_2288(20200927-094354).JPG</a></p><p>预估雄鹿应该总决赛了，大概率<br/></p>', 'NBA', '2', '1624976246', '1624979019', '7', '5');
INSERT INTO `post` VALUES ('54', 'somewhere', '<p><span style=\"color: rgba(0, 0, 0, 0.7); font-family: arial, 微软雅黑, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif, simsun; font-size: 14.4px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 18px; background-color: rgb(250, 250, 250);\">Where he’d like to find some company to share</span></p>', 'song', '1', '1624979310', '1624979310', '6', '7');
INSERT INTO `post` VALUES ('55', '幼鸟指南', '<p>毛不易新专</p>', 'song', '2', '1624979397', '1624980182', '6', '7');
INSERT INTO `post` VALUES ('56', 'video', '<p>video播放</p>', 'song', '2', '1625015489', '1625015489', '8', '12');
INSERT INTO `post` VALUES ('57', '老鹰', '<p>老鹰竟然还领先了</p>', 'NBA', '2', '1625019196', '1625019196', '7', '3');

-- ----------------------------
-- Table structure for poststatus
-- ----------------------------
DROP TABLE IF EXISTS `poststatus`;
CREATE TABLE `poststatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of poststatus
-- ----------------------------
INSERT INTO `poststatus` VALUES ('1', '草稿', '1');
INSERT INTO `poststatus` VALUES ('2', '已发布', '2');
INSERT INTO `poststatus` VALUES ('3', '已归档', '3');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('63', 'Gii', '8');
INSERT INTO `tag` VALUES ('64', '查询构建器', '1');
INSERT INTO `tag` VALUES ('65', 'DAO', '7');
INSERT INTO `tag` VALUES ('66', 'GridView', '10');
INSERT INTO `tag` VALUES ('67', 'ListView', '4');
INSERT INTO `tag` VALUES ('68', 'DetailView', '4');
INSERT INTO `tag` VALUES ('69', 'ActiveRecord', '15');
INSERT INTO `tag` VALUES ('70', '安装', '3');
INSERT INTO `tag` VALUES ('71', 'Composer', '3');
INSERT INTO `tag` VALUES ('80', 'NBA', '3');
INSERT INTO `tag` VALUES ('82', 'song', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', '魏无羡', 'ejnetNOuyoaDGfooQbDxmovikLLlcAlJ', '$2y$13$P/piVc5HSJxq5si59wm5IuJ5WWTvieOTJbfiu52b8d92ZXcogr9MW', null, '1715985997@qq.com', '10', '1624964127', '1625039990');
INSERT INTO `user` VALUES ('7', 'hlm', 'Dyx3-hgSm51Bbmdr61lYllsC0kTgEMhM', '$2y$13$wGkk1WUn1sU1mMRA5mMehekObUOitYVPMj9PWORB4Q5tuTQffnHzS', null, '2054949851@qq.com', '10', '1624979998', '1624979998');
