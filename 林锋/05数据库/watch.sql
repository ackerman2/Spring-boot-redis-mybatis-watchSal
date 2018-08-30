/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : watch

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-08-07 18:02:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) NOT NULL,
  `adminpwd` varchar(20) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wzn', '111');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandid` int(11) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(30) NOT NULL,
  `brandcount` int(11) NOT NULL,
  `branddscr` varchar(200) NOT NULL,
  `brandpics` varchar(20) NOT NULL,
  PRIMARY KEY (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '伯爵', '2', '伯爵（Piaget），1874年由年仅19岁的乔治·爱德华·伯爵（Georges Edouard Piaget）创立。诞生以来，伯爵一直秉承“永远做得比要求的更好”的品牌精神，将精湛工艺与无限创意融入每一件作品中，同时优先发展创意和对细节的追求，将腕表与珠宝的工艺完全融合在一起。伯爵能够捕捉时间的神韵，每一件腕表和珠宝作品都是对精湛工艺的不懈探求。目前隶属瑞士历峰集团。', 'bj.jpg');
INSERT INTO `brand` VALUES ('2', '天梭', '2', '天梭（Tissot）1853年诞生于手表制造业的摇篮——瑞士，属于瑞士中档手表之一。\r\n\r\n凭借在传统中不断创新的精神，如今，天梭表的已遍布全球五大洲超过150多个国家，并屡次获得国际殊荣及奖项，成为表坛中不朽的名表品牌之一。对于天梭而言，“时间，随你掌控”不仅仅是一句广告词。它传递了天梭品牌的DNA ，天梭一直致力将前沿科技与时尚设计在钟表制作中完美融合。', 'ts.jpg');
INSERT INTO `brand` VALUES ('3', '浪琴', '2', '浪琴(Longines)由欧内斯特·富兰西林（Ernest Francillon）于瑞士圣米尔(Saint-Imier)创立，它的起源可以追述到19世纪30年代，拥有逾175年的悠久历史与精湛工艺。以飞翼沙漏为标志的浪琴表以优雅著称于世，在运动计时领域亦拥有显赫传统与卓越经验。作为全球领先钟表制造商斯沃琪集团旗下的著名品牌，浪琴表现已遍布世界130多个国家。', 'lq.jpg');
INSERT INTO `brand` VALUES ('4', '卡地亚', '2', '卡地亚（Cartier SA）是一间法国钟表及珠宝制造商，1847年由Louis-Fran?ois Cartier在巴黎Rue Montorgueil 31号创办。1874年，其子亚法·卡地亚继承其管理权，由其孙子路易·卡地亚、皮尔·卡地亚与积斯·卡地亚将其发展成世界著名品牌。现为瑞士历峰集团（Compagnie Financière Richemont SA）下属公司。', 'kdy.jpg');
INSERT INTO `brand` VALUES ('5', '欧米茄', '2', '欧米茄（Omega）是国际著名制表企业和品牌，英文名omega，代表符号“Ω”。由路易士·勃兰特始创于1848 年，拥有超过150年的悠久历史。欧米茄(W)是希腊文的第二十四个，也是最后一个字母。它象征着事物的伊始与终极，第一与最后。代表了\"完美、极致、卓越、成就\"的非凡品质，诠释出欧米茄追寻\"卓越品质\"的经营理念和\"崇尚传统，并勇于创新\"的精神风范。', 'omg.jpg');
INSERT INTO `brand` VALUES ('6', '劳力士', '2', '劳力士（Rolex）是瑞士著名的手表制造商，前身为Wilsdorf and Davis（W&D）公司，由德国人汉斯·威斯多夫（Hans Wilsdof）与英国人戴维斯（Alfred Davis）于1905年在伦敦合伙经营。1908年由汉斯·威斯多夫在瑞士的拉夏德芬（La Chaux-de-Fonds）注册更名为ROLEX。', 'lls.png');
INSERT INTO `brand` VALUES ('7', '百达翡丽', '2', '百达翡丽（Patek Philippe），是一家始于1839年的瑞士著名钟表品牌，逾百年来，百达翡丽一直信奉精品哲学，遵守重质不重量、细工慢活的生产原则。主旨只有一个，即追求完美。它奉行限量生产，每年的产量只有5万只。在长达一个半多世纪中，百达翡丽出品的表数极为有限，且只在世界顶级名店发售。', 'bdfl.jpg');
INSERT INTO `brand` VALUES ('8', '江诗丹顿', '2', '江诗丹顿（Vacheron Constantin），世界最著名钟表品牌之一，1755年创立于瑞士日内瓦，为世界最古老最早的钟表制造厂，也是世界最著名的表厂之一。江诗丹顿传承了瑞士的传统制表精华，未曾间断，同时也创新了许多制表技术，对制表业有莫大的贡献。\r\n\r\n江诗丹顿在整个二十世纪推出了多款令人永世难忘的设计。', 'jsdd.jpg');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `watch_id` int(11) NOT NULL,
  `cartcount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`cartid`),
  KEY `fk_watchid_id` (`watch_id`),
  CONSTRAINT `fk_watchid_id` FOREIGN KEY (`watch_id`) REFERENCES `watch` (`watchid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '1', '1', '2');
INSERT INTO `cart` VALUES ('2', '2', '2', '2');
INSERT INTO `cart` VALUES ('20', '5', '1', '6');
INSERT INTO `cart` VALUES ('22', '2', '1', '6');
INSERT INTO `cart` VALUES ('23', '4', '1', '6');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', 'ackerman', '111111', '2122', '13124412121');
INSERT INTO `user` VALUES ('7', 'aaaa', '111111', '212', '13124412121');

-- ----------------------------
-- Table structure for `watch`
-- ----------------------------
DROP TABLE IF EXISTS `watch`;
CREATE TABLE `watch` (
  `watchid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `watchname` varchar(200) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `pics` varchar(200) NOT NULL,
  `xl` int(11) NOT NULL,
  PRIMARY KEY (`watchid`),
  KEY `fk_brand_id_id` (`brand_id`),
  CONSTRAINT `fk_brand_id_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of watch
-- ----------------------------
INSERT INTO `watch` VALUES ('1', '男表', '劳力士潜航者型系列116610LV-97200 绿盘腕表', '6', '70000', '21', '品牌：劳力士 系列：潜航者型 机芯类型：自动机械 机芯型号：Cal.3135 表径：40毫米 表壳材质：904L不锈钢(蚝式钢) ', 'a1.jpg,a2.jpg,a3.jpg,a4.jpg,a5.jpg', '14');
INSERT INTO `watch` VALUES ('2', '女表', '劳力士日志型系列m279160-0014腕表', '6', '47500', '7', '品牌：劳力士 系列：日志型 机芯类型：自动机械 机芯型号：2236 表径：28毫米 表壳材质：904L不锈钢(蚝式钢) ', 'b1.jpg,b2.jpg,b3.jpg,b4.jpg,b5.jpg', '13');
INSERT INTO `watch` VALUES ('3', '男表', '欧米茄特别系列522.32.44.21.03.001腕表', '5', '51700', '7', '品牌：欧米茄 系列：特别 机芯类型：自动机械 机芯型号：欧米茄8900 表径：43.5毫米 表壳材质：精钢，单向旋转表圈 \r\n品牌：欧米茄 系列：特别 机芯类型：自动机械 机芯型号：欧米茄8900 表径：43.5毫米 表壳材质：精钢，单向旋转表圈 \r\n品牌：欧米茄 系列：特别 机芯类型：自动机械 机芯型号：欧米茄8900 表径：43.5毫米 表壳材质：精钢，单向旋转表圈 ', 'c1.jpg,c2.jpg,c3.jpg,c4.jpg,c5.jpg', '14');
INSERT INTO `watch` VALUES ('4', '女表', '欧米茄星座系列123.25.24.60.05.001腕表\r\n', '5', '52300', '10', '欧米茄星座系列123.25.24.60.05.001腕表\r\n品牌：欧米茄 系列：星座 机芯类型：石英 机芯型号：Cal.1376 表径：24毫米 表壳材质：精钢，黄金镶钻 ', 'd1.jpg,d2.jpg,d3.jpg,d4.jpg,d5.jpg', '12');
INSERT INTO `watch` VALUES ('5', '男表', '卡地亚桑托斯系列W20073X8腕表', '4', '53000', '9', '品牌：卡地亚 系列：桑托斯 机芯类型：自动机械 机芯型号：Cal.049 表径：51.1 x 41.3毫米 表壳材质：精钢 ', 'e1.jpg,e2.jpg,e3.jpg,e4.jpg,g5.jpg', '14');
INSERT INTO `watch` VALUES ('6', '女表', '卡地亚蓝气球系列W69010Z4腕表', '4', '34600', '10', '品牌：卡地亚 系列：蓝气球 机芯类型：石英 机芯型号：Cal.057 表径：28.6毫米 表壳材质：精钢 ', 'f1.jpg,f2.jpg,f3.jpg,f4.jpg,f5.jpg', '14');
INSERT INTO `watch` VALUES ('7', '男表', '伯爵ALTIPLANO系列G0A29112腕表', '1', '127000', '10', '品牌：伯爵 系列：ALTIPLANO 机芯类型：手动机械 机芯型号：Cal.430P 表径：38毫米 表壳材质：18k白金 ', 'g1.jpg,g2.jpg,g3.jpg,g4.jpg,g5.jpg', '15');
INSERT INTO `watch` VALUES ('8', '女表', '伯爵珠宝腕表系列G0A40111腕表', '1', '237000', '10', '品牌：伯爵 系列：珠宝腕表 机芯类型：自动机械 机芯型号：584P 表径：36毫米 表壳材质：18k白金，镶饰126颗圆形美钻（约0.65克拉）', 'h1.jpg,h2.jpg,h3.jpg,h4.jpg,h5.jpg', '16');
INSERT INTO `watch` VALUES ('9', '男表', '百达翡丽超级复杂功能计时系列6104G-001腕表', '7', '2938700', '10', '品牌：百达翡丽 系列：超级复杂功能计时 机芯类型：自动机械 机芯型号：Cal.240 LU CL C 表径：44毫米 表壳材质：18k白金镶钻 ', 'i1.jpg,i2.jpg,i3.jpg,i4.jpg,i5.jpg', '17');
INSERT INTO `watch` VALUES ('10', '女表', '百达翡丽复杂功能计时系列4947R-001腕表', '7', '375800', '10', '品牌：百达翡丽 系列：复杂功能计时 机芯类型：自动机械 机芯型号：324 S QA LU 表径：38毫米 表壳材质：18k玫瑰金镶钻，表壳镶嵌141颗钻石（~1.28克拉）', 'j1.jpg,j2.jpg,j3.jpg,j4.jpg,j5.jpg', '18');
INSERT INTO `watch` VALUES ('11', '男表', '江诗丹顿传承系列30030/000P-8200腕表', '8', '6815000', '10', '品牌：江诗丹顿 系列：传承系列 机芯类型：手动机械 机芯型号：Cal.1755 表径：37毫米 表壳材质：950铂金 \r\n品牌：江诗丹顿 系列：传承系列 机芯类型：手动机械 机芯型号：Cal.1755 表径：37毫米 表壳材质：950铂金 ', 'k1.jpg,k2.jpg,k3.jpg,k4.jpg,k5.jpg', '19');
INSERT INTO `watch` VALUES ('12', '女表', '江诗丹顿传承系列25162/000R-9182腕表', '8', '104000', '10', '品牌：江诗丹顿 系列：传承系列 机芯类型：石英 表径：29毫米 表壳材质：18k玫瑰金 ', 'l1.jpg,l2.jpg,l3.jpg,l4.jpg,l5.jpg', '20');
INSERT INTO `watch` VALUES ('13', '男表', '浪琴制表传统系列L2.708.4.78.3腕表', '3', '17500', '10', '品牌：浪琴 系列：制表传统 机芯类型：自动机械 机芯型号：Cal.L602 表径：38.5毫米 表壳材质：精钢 ', 'm1.jpg,m2.jpg,m3.jpg,m4.jpg,m5.jpg', '21');
INSERT INTO `watch` VALUES ('14', '女表', '浪琴优雅系列L4.708.4.11.6腕表', '3', '11700', '10', '品牌：浪琴 系列：优雅 机芯类型：自动机械 机芯型号：Cal.L593 表径：34毫米 表壳材质：精钢 ', 'n1.jpg,n2.jpg,n3.jpg,n4.jpg,n5.jpg', '22');
INSERT INTO `watch` VALUES ('15', '男表', '天梭经典系列T41.1.483.33腕表', '2', '4450', '10', '品牌：天梭 系列：经典 机芯类型：自动机械 机芯型号：ETA 2824-2 表径：39.3毫米 表壳材质：精钢 ', 'o1.jpg,o2.jpg,o3.jpg,o4.jpg,o5.jpg', '23');
INSERT INTO `watch` VALUES ('16', '女表', '天梭经典系列T035.210.16.371.00腕表', '2', '8000', '10', '品牌：天梭 系列：经典 机芯类型：石英 机芯型号：ETA F05.111 表径：32毫米 表壳材质：精钢 ', 'p1.jpg,p2.jpg,p3.jpg,p4.jpg,p5.jpg', '24');

-- ----------------------------
-- Table structure for `w_order`
-- ----------------------------
DROP TABLE IF EXISTS `w_order`;
CREATE TABLE `w_order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `watch_id` int(11) NOT NULL,
  `w_count` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `w_ordertime` varchar(50) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `fk_or_watch_id` (`watch_id`),
  CONSTRAINT `fk_or_watch_id` FOREIGN KEY (`watch_id`) REFERENCES `watch` (`watchid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_order
-- ----------------------------
INSERT INTO `w_order` VALUES ('1', '1', '1', '6', 'Tue Aug 07 08:49:01 CST 2018', '已送达');
INSERT INTO `w_order` VALUES ('2', '3', '2', '6', 'Tue Aug 07 08:49:01 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('3', '5', '1', '6', 'Tue Aug 07 08:49:01 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('4', '9', '1', '6', 'Tue Aug 07 08:49:01 CST 2018', '已送达');
INSERT INTO `w_order` VALUES ('5', '11', '1', '6', 'Tue Aug 07 08:49:01 CST 2018', '已送达');
INSERT INTO `w_order` VALUES ('6', '2', '2', '6', 'Tue Aug 07 09:58:03 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('7', '3', '1', '6', 'Tue Aug 07 09:58:03 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('8', '1', '1', '6', 'Tue Aug 07 09:58:03 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('9', '2', '1', '6', 'Tue Aug 07 15:46:17 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('10', '1', '1', '6', 'Tue Aug 07 15:46:17 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('11', '3', '2', '7', 'Tue Aug 07 17:28:35 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('12', '5', '1', '7', 'Tue Aug 07 17:28:36 CST 2018', '未送达');
INSERT INTO `w_order` VALUES ('13', '1', '2', '7', 'Tue Aug 07 17:28:36 CST 2018', '未送达');
DROP TRIGGER IF EXISTS `t1`;
DELIMITER ;;
CREATE TRIGGER `t1` AFTER INSERT ON `watch` FOR EACH ROW UPDATE brand SET brandcount=brandcount+1  WHERE brandid=new.brand_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t2`;
DELIMITER ;;
CREATE TRIGGER `t2` AFTER DELETE ON `watch` FOR EACH ROW UPDATE brand SET brandcount=brandcount-1  WHERE brandid=old.brand_id
;;
DELIMITER ;
