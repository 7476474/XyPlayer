
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for danmaku_ip
-- ----------------------------
DROP TABLE IF EXISTS `danmaku_ip`;
CREATE TABLE `danmaku_ip`  (
  `ip` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发送人ip',
  `c` int NOT NULL COMMENT '弹幕次数',
  `time` int NOT NULL DEFAULT 1 COMMENT '发送时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for danmaku_list
-- ----------------------------
DROP TABLE IF EXISTS `danmaku_list`;
CREATE TABLE `danmaku_list` (
  `cid` int NOT NULL AUTO_INCREMENT COMMENT '现在是弹幕id，以后可能是发送者id了',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '弹幕ID',
  `type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '弹幕样式  ',
  `text` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '弹幕内容',
  `color` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '弹幕颜色',
  `videotime` float(24,3) NOT NULL COMMENT '出现时间',
  `time` int NOT NULL COMMENT '发送时间',
  `size` varchar(10) DEFAULT NULL COMMENT '内容大小',
  `ip` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '弹幕IP',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for danmaku_report
-- ----------------------------
DROP TABLE IF EXISTS `danmaku_report`;
CREATE TABLE `danmaku_report`  (
  `cid` int NOT NULL COMMENT '弹幕ID',
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕池id',
  `text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报内容',
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报类型',
  `time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报时间',
  `ip` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送弹幕的IP地址',
  PRIMARY KEY (`text`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
