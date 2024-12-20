/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : pos_db

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 19/07/2021 15:07:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `session_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`session_id`) USING BTREE,
  INDEX `last_activity_idx`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pos_attendance_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_attendance_tbl`;
CREATE TABLE `pos_attendance_tbl`  (
  `attendance_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NOT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `attendance_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_attendance_tbl
-- ----------------------------
INSERT INTO `pos_attendance_tbl` VALUES (6, 2, 1, '2021-07-15 02:10:30', 0, '2021-07-15 02:10:30', '2021-07-15 02:10:30');
INSERT INTO `pos_attendance_tbl` VALUES (7, 2, 2, '2021-07-15 02:10:37', 0, '2021-07-15 02:10:37', '2021-07-15 02:10:37');
INSERT INTO `pos_attendance_tbl` VALUES (8, 2, 1, '2021-07-15 02:11:26', 0, '2021-07-15 02:11:26', '2021-07-15 02:11:26');
INSERT INTO `pos_attendance_tbl` VALUES (9, 2, 2, '2021-07-15 02:12:19', 0, '2021-07-15 02:12:19', '2021-07-15 02:12:19');
INSERT INTO `pos_attendance_tbl` VALUES (10, 2, 1, '2021-07-15 08:40:06', 0, '2021-07-15 08:40:06', '2021-07-15 08:40:06');
INSERT INTO `pos_attendance_tbl` VALUES (11, 2, 2, '2021-07-15 08:40:15', 0, '2021-07-15 08:40:15', '2021-07-15 08:40:15');
INSERT INTO `pos_attendance_tbl` VALUES (12, 2, 1, '2021-07-15 08:41:08', 0, '2021-07-15 08:41:08', '2021-07-15 08:41:08');
INSERT INTO `pos_attendance_tbl` VALUES (13, 2, 2, '2021-07-15 08:41:15', 0, '2021-07-15 08:41:15', '2021-07-15 08:41:15');
INSERT INTO `pos_attendance_tbl` VALUES (14, 2, 1, '2021-07-15 08:53:03', 0, '2021-07-15 08:53:03', '2021-07-15 08:53:03');
INSERT INTO `pos_attendance_tbl` VALUES (15, 2, 2, '2021-07-15 08:53:43', 0, '2021-07-15 08:53:43', '2021-07-15 08:53:43');
INSERT INTO `pos_attendance_tbl` VALUES (16, 2, 1, '2021-07-15 08:53:57', 0, '2021-07-15 08:53:57', '2021-07-15 08:53:57');
INSERT INTO `pos_attendance_tbl` VALUES (17, 2, 2, '2021-07-15 08:56:55', 0, '2021-07-15 08:56:55', '2021-07-15 08:56:55');
INSERT INTO `pos_attendance_tbl` VALUES (18, 2, 1, '2021-07-15 08:57:55', 0, '2021-07-15 08:57:55', '2021-07-15 08:57:55');
INSERT INTO `pos_attendance_tbl` VALUES (19, 2, 2, '2021-07-15 08:58:44', 0, '2021-07-15 08:58:44', '2021-07-15 08:58:44');
INSERT INTO `pos_attendance_tbl` VALUES (20, 2, 1, '2021-07-15 08:59:42', 0, '2021-07-15 08:59:42', '2021-07-15 08:59:42');
INSERT INTO `pos_attendance_tbl` VALUES (21, 2, 2, '2021-07-15 09:02:10', 0, '2021-07-15 09:02:10', '2021-07-15 09:02:10');
INSERT INTO `pos_attendance_tbl` VALUES (22, 2, 1, '2021-07-15 09:02:57', 0, '2021-07-15 09:02:57', '2021-07-15 09:02:57');
INSERT INTO `pos_attendance_tbl` VALUES (23, 2, 2, '2021-07-15 09:03:03', 0, '2021-07-15 09:03:03', '2021-07-15 09:03:03');
INSERT INTO `pos_attendance_tbl` VALUES (24, 2, 1, '2021-07-15 09:03:36', 0, '2021-07-15 09:03:36', '2021-07-15 09:03:36');
INSERT INTO `pos_attendance_tbl` VALUES (25, 2, 2, '2021-07-15 09:05:12', 0, '2021-07-15 09:05:12', '2021-07-15 09:05:12');
INSERT INTO `pos_attendance_tbl` VALUES (26, 2, 1, '2021-07-15 09:44:49', 0, '2021-07-15 09:44:49', '2021-07-15 09:44:49');
INSERT INTO `pos_attendance_tbl` VALUES (27, 2, 2, '2021-07-15 09:45:26', 0, '2021-07-15 09:45:26', '2021-07-15 09:45:26');
INSERT INTO `pos_attendance_tbl` VALUES (28, 2, 1, '2021-07-15 09:45:36', 0, '2021-07-15 09:45:36', '2021-07-15 09:45:36');
INSERT INTO `pos_attendance_tbl` VALUES (29, 2, 1, '2021-07-15 09:45:39', 0, '2021-07-15 09:45:39', '2021-07-15 09:45:39');
INSERT INTO `pos_attendance_tbl` VALUES (30, 2, 1, '2021-07-15 09:45:40', 0, '2021-07-15 09:45:40', '2021-07-15 09:45:40');
INSERT INTO `pos_attendance_tbl` VALUES (31, 2, 2, '2021-07-15 09:46:09', 0, '2021-07-15 09:46:09', '2021-07-15 09:46:09');
INSERT INTO `pos_attendance_tbl` VALUES (32, 2, 1, '2021-07-15 09:46:14', 0, '2021-07-15 09:46:14', '2021-07-15 09:46:14');
INSERT INTO `pos_attendance_tbl` VALUES (33, 2, 2, '2021-07-15 09:46:16', 0, '2021-07-15 09:46:16', '2021-07-15 09:46:16');
INSERT INTO `pos_attendance_tbl` VALUES (34, 2, 1, '2021-07-15 09:46:18', 0, '2021-07-15 09:46:18', '2021-07-15 09:46:18');
INSERT INTO `pos_attendance_tbl` VALUES (35, 2, 2, '2021-07-15 09:46:19', 0, '2021-07-15 09:46:19', '2021-07-15 09:46:19');
INSERT INTO `pos_attendance_tbl` VALUES (36, 2, 1, '2021-07-15 09:46:49', 0, '2021-07-15 09:46:49', '2021-07-15 09:46:49');
INSERT INTO `pos_attendance_tbl` VALUES (37, 2, 2, '2021-07-15 09:46:51', 0, '2021-07-15 09:46:51', '2021-07-15 09:46:51');
INSERT INTO `pos_attendance_tbl` VALUES (38, 2, 1, '2021-07-15 09:46:53', 0, '2021-07-15 09:46:53', '2021-07-15 09:46:53');
INSERT INTO `pos_attendance_tbl` VALUES (39, 2, 2, '2021-07-15 09:46:58', 0, '2021-07-15 09:46:58', '2021-07-15 09:46:58');
INSERT INTO `pos_attendance_tbl` VALUES (40, 2, 1, '2021-07-15 10:03:19', 0, '2021-07-15 10:03:19', '2021-07-15 10:03:19');
INSERT INTO `pos_attendance_tbl` VALUES (41, 2, 2, '2021-07-15 10:03:22', 0, '2021-07-15 10:03:22', '2021-07-15 10:03:22');
INSERT INTO `pos_attendance_tbl` VALUES (42, 2, 1, '2021-07-15 10:03:58', 0, '2021-07-15 10:03:58', '2021-07-15 10:03:58');
INSERT INTO `pos_attendance_tbl` VALUES (43, 2, 2, '2021-07-15 10:04:01', 0, '2021-07-15 10:04:01', '2021-07-15 10:04:01');
INSERT INTO `pos_attendance_tbl` VALUES (44, 2, 1, '2021-07-15 10:04:03', 0, '2021-07-15 10:04:03', '2021-07-15 10:04:03');
INSERT INTO `pos_attendance_tbl` VALUES (45, 2, 2, '2021-07-15 10:04:06', 0, '2021-07-15 10:04:06', '2021-07-15 10:04:06');
INSERT INTO `pos_attendance_tbl` VALUES (46, 2, 1, '2021-07-15 10:06:14', 0, '2021-07-15 10:06:14', '2021-07-15 10:06:14');
INSERT INTO `pos_attendance_tbl` VALUES (47, 2, 1, '2021-07-15 10:06:44', 0, '2021-07-15 10:06:44', '2021-07-15 10:06:44');
INSERT INTO `pos_attendance_tbl` VALUES (48, 2, 2, '2021-07-15 10:06:46', 0, '2021-07-15 10:06:46', '2021-07-15 10:06:46');
INSERT INTO `pos_attendance_tbl` VALUES (49, 2, 1, '2021-07-15 10:06:51', 0, '2021-07-15 10:06:51', '2021-07-15 10:06:51');
INSERT INTO `pos_attendance_tbl` VALUES (50, 2, 2, '2021-07-15 10:07:18', 0, '2021-07-15 10:07:18', '2021-07-15 10:07:18');
INSERT INTO `pos_attendance_tbl` VALUES (51, 2, 1, '2021-07-15 10:07:20', 0, '2021-07-15 10:07:20', '2021-07-15 10:07:20');
INSERT INTO `pos_attendance_tbl` VALUES (52, 2, 2, '2021-07-15 10:15:29', 0, '2021-07-15 10:15:29', '2021-07-15 10:15:29');
INSERT INTO `pos_attendance_tbl` VALUES (53, 2, 1, '2021-07-15 10:15:32', 0, '2021-07-15 10:15:32', '2021-07-15 10:15:32');
INSERT INTO `pos_attendance_tbl` VALUES (54, 2, 2, '2021-07-15 10:15:34', 0, '2021-07-15 10:15:34', '2021-07-15 10:15:34');
INSERT INTO `pos_attendance_tbl` VALUES (55, 2, 1, '2021-07-15 10:16:28', 0, '2021-07-15 10:16:28', '2021-07-15 10:16:28');
INSERT INTO `pos_attendance_tbl` VALUES (56, 2, 2, '2021-07-15 10:24:44', 0, '2021-07-15 10:24:44', '2021-07-15 10:24:44');
INSERT INTO `pos_attendance_tbl` VALUES (57, 2, 1, '2021-07-15 10:24:48', 0, '2021-07-15 10:24:48', '2021-07-15 10:24:48');
INSERT INTO `pos_attendance_tbl` VALUES (58, 2, 2, '2021-07-15 10:25:06', 0, '2021-07-15 10:25:06', '2021-07-15 10:25:06');
INSERT INTO `pos_attendance_tbl` VALUES (59, 2, 1, '2021-07-15 10:25:08', 0, '2021-07-15 10:25:08', '2021-07-15 10:25:08');
INSERT INTO `pos_attendance_tbl` VALUES (60, 2, 2, '2021-07-15 10:27:53', 0, '2021-07-15 10:27:53', '2021-07-15 10:27:53');
INSERT INTO `pos_attendance_tbl` VALUES (61, 2, 1, '2021-07-15 10:29:15', 0, '2021-07-15 10:29:15', '2021-07-15 10:29:15');
INSERT INTO `pos_attendance_tbl` VALUES (62, 2, 2, '2021-07-15 10:29:18', 0, '2021-07-15 10:29:18', '2021-07-15 10:29:18');
INSERT INTO `pos_attendance_tbl` VALUES (63, 2, 1, '2021-07-15 10:41:35', 0, '2021-07-15 10:41:35', '2021-07-15 10:41:35');
INSERT INTO `pos_attendance_tbl` VALUES (64, 2, 2, '2021-07-15 10:41:40', 0, '2021-07-15 10:41:40', '2021-07-15 10:41:40');
INSERT INTO `pos_attendance_tbl` VALUES (65, 2, 1, '2021-07-15 10:43:45', 0, '2021-07-15 10:43:45', '2021-07-15 10:43:45');
INSERT INTO `pos_attendance_tbl` VALUES (66, 2, 2, '2021-07-15 10:44:20', 0, '2021-07-15 10:44:20', '2021-07-15 10:44:20');
INSERT INTO `pos_attendance_tbl` VALUES (67, 2, 1, '2021-07-15 11:28:09', 0, '2021-07-15 11:28:09', '2021-07-15 11:28:09');
INSERT INTO `pos_attendance_tbl` VALUES (68, 2, 2, '2021-07-15 11:28:11', 0, '2021-07-15 11:28:11', '2021-07-15 11:28:11');
INSERT INTO `pos_attendance_tbl` VALUES (69, 2, 1, '2021-07-15 11:37:49', 0, '2021-07-15 11:37:49', '2021-07-15 11:37:49');
INSERT INTO `pos_attendance_tbl` VALUES (70, 2, 2, '2021-07-15 11:37:52', 0, '2021-07-15 11:37:52', '2021-07-15 11:37:52');
INSERT INTO `pos_attendance_tbl` VALUES (71, 2, 1, '2021-07-15 11:40:42', 0, '2021-07-15 11:40:42', '2021-07-15 11:40:42');
INSERT INTO `pos_attendance_tbl` VALUES (72, 2, 2, '2021-07-15 11:41:00', 0, '2021-07-15 11:41:00', '2021-07-15 11:41:00');
INSERT INTO `pos_attendance_tbl` VALUES (73, 2, 1, '2021-07-15 15:06:24', 0, '2021-07-15 15:06:24', '2021-07-15 15:06:24');
INSERT INTO `pos_attendance_tbl` VALUES (74, 2, 2, '2021-07-15 15:06:27', 0, '2021-07-15 15:06:27', '2021-07-15 15:06:27');
INSERT INTO `pos_attendance_tbl` VALUES (75, 2, 1, '2021-07-15 15:07:42', 0, '2021-07-15 15:07:42', '2021-07-15 15:07:42');
INSERT INTO `pos_attendance_tbl` VALUES (76, 2, 2, '2021-07-15 15:15:11', 0, '2021-07-15 15:15:11', '2021-07-15 15:15:11');
INSERT INTO `pos_attendance_tbl` VALUES (77, 2, 1, '2021-07-15 15:15:24', 0, '2021-07-15 15:15:24', '2021-07-15 15:15:24');
INSERT INTO `pos_attendance_tbl` VALUES (78, 2, 2, '2021-07-15 15:19:43', 0, '2021-07-15 15:19:43', '2021-07-15 15:19:43');
INSERT INTO `pos_attendance_tbl` VALUES (79, 2, 1, '2021-07-15 15:23:55', 0, '2021-07-15 15:23:55', '2021-07-15 15:23:55');
INSERT INTO `pos_attendance_tbl` VALUES (80, 2, 1, '2021-07-15 15:23:55', 0, '2021-07-15 15:23:55', '2021-07-15 15:23:55');
INSERT INTO `pos_attendance_tbl` VALUES (81, 2, 2, '2021-07-15 15:23:59', 0, '2021-07-15 15:23:59', '2021-07-15 15:23:59');
INSERT INTO `pos_attendance_tbl` VALUES (82, 2, 2, '2021-07-15 15:23:59', 0, '2021-07-15 15:23:59', '2021-07-15 15:23:59');
INSERT INTO `pos_attendance_tbl` VALUES (83, 2, 1, '2021-07-15 15:24:07', 0, '2021-07-15 15:24:07', '2021-07-15 15:24:07');
INSERT INTO `pos_attendance_tbl` VALUES (84, 2, 1, '2021-07-15 15:24:07', 0, '2021-07-15 15:24:07', '2021-07-15 15:24:07');
INSERT INTO `pos_attendance_tbl` VALUES (85, 2, 2, '2021-07-15 15:24:11', 0, '2021-07-15 15:24:11', '2021-07-15 15:24:11');
INSERT INTO `pos_attendance_tbl` VALUES (86, 2, 2, '2021-07-15 15:24:11', 0, '2021-07-15 15:24:11', '2021-07-15 15:24:11');
INSERT INTO `pos_attendance_tbl` VALUES (87, 2, 1, '2021-07-15 15:24:39', 0, '2021-07-15 15:24:39', '2021-07-15 15:24:39');
INSERT INTO `pos_attendance_tbl` VALUES (88, 2, 1, '2021-07-15 15:24:39', 0, '2021-07-15 15:24:39', '2021-07-15 15:24:39');
INSERT INTO `pos_attendance_tbl` VALUES (89, 2, 2, '2021-07-15 15:25:19', 0, '2021-07-15 15:25:19', '2021-07-15 15:25:19');
INSERT INTO `pos_attendance_tbl` VALUES (90, 2, 2, '2021-07-15 15:25:19', 0, '2021-07-15 15:25:19', '2021-07-15 15:25:19');
INSERT INTO `pos_attendance_tbl` VALUES (91, 2, 1, '2021-07-15 15:25:44', 0, '2021-07-15 15:25:44', '2021-07-15 15:25:44');
INSERT INTO `pos_attendance_tbl` VALUES (92, 2, 1, '2021-07-15 15:25:44', 0, '2021-07-15 15:25:44', '2021-07-15 15:25:44');
INSERT INTO `pos_attendance_tbl` VALUES (93, 2, 2, '2021-07-15 15:25:47', 0, '2021-07-15 15:25:47', '2021-07-15 15:25:47');
INSERT INTO `pos_attendance_tbl` VALUES (94, 2, 2, '2021-07-15 15:25:47', 0, '2021-07-15 15:25:47', '2021-07-15 15:25:47');
INSERT INTO `pos_attendance_tbl` VALUES (95, 2, 1, '2021-07-15 15:25:52', 0, '2021-07-15 15:25:52', '2021-07-15 15:25:52');
INSERT INTO `pos_attendance_tbl` VALUES (96, 2, 1, '2021-07-15 15:25:52', 0, '2021-07-15 15:25:52', '2021-07-15 15:25:52');
INSERT INTO `pos_attendance_tbl` VALUES (97, 2, 2, '2021-07-15 15:26:00', 0, '2021-07-15 15:26:00', '2021-07-15 15:26:00');
INSERT INTO `pos_attendance_tbl` VALUES (98, 2, 2, '2021-07-15 15:26:00', 0, '2021-07-15 15:26:00', '2021-07-15 15:26:00');
INSERT INTO `pos_attendance_tbl` VALUES (99, 2, 1, '2021-07-15 15:26:22', 0, '2021-07-15 15:26:22', '2021-07-15 15:26:22');
INSERT INTO `pos_attendance_tbl` VALUES (100, 2, 1, '2021-07-15 15:26:22', 0, '2021-07-15 15:26:22', '2021-07-15 15:26:22');
INSERT INTO `pos_attendance_tbl` VALUES (101, 2, 2, '2021-07-15 15:26:26', 0, '2021-07-15 15:26:26', '2021-07-15 15:26:26');
INSERT INTO `pos_attendance_tbl` VALUES (102, 2, 2, '2021-07-15 15:26:26', 0, '2021-07-15 15:26:26', '2021-07-15 15:26:26');
INSERT INTO `pos_attendance_tbl` VALUES (103, 2, 1, '2021-07-15 15:26:28', 0, '2021-07-15 15:26:28', '2021-07-15 15:26:28');
INSERT INTO `pos_attendance_tbl` VALUES (104, 2, 1, '2021-07-15 15:26:28', 0, '2021-07-15 15:26:28', '2021-07-15 15:26:28');
INSERT INTO `pos_attendance_tbl` VALUES (105, 2, 2, '2021-07-15 15:26:31', 0, '2021-07-15 15:26:31', '2021-07-15 15:26:31');
INSERT INTO `pos_attendance_tbl` VALUES (106, 2, 2, '2021-07-15 15:26:31', 0, '2021-07-15 15:26:31', '2021-07-15 15:26:31');
INSERT INTO `pos_attendance_tbl` VALUES (107, 2, 1, '2021-07-15 15:26:47', 0, '2021-07-15 15:26:47', '2021-07-15 15:26:47');
INSERT INTO `pos_attendance_tbl` VALUES (108, 2, 1, '2021-07-15 15:26:47', 0, '2021-07-15 15:26:47', '2021-07-15 15:26:47');
INSERT INTO `pos_attendance_tbl` VALUES (109, 2, 2, '2021-07-15 15:26:50', 0, '2021-07-15 15:26:50', '2021-07-15 15:26:50');
INSERT INTO `pos_attendance_tbl` VALUES (110, 2, 2, '2021-07-15 15:26:50', 0, '2021-07-15 15:26:50', '2021-07-15 15:26:50');
INSERT INTO `pos_attendance_tbl` VALUES (111, 2, 1, '2021-07-15 15:27:09', 0, '2021-07-15 15:27:09', '2021-07-15 15:27:09');
INSERT INTO `pos_attendance_tbl` VALUES (112, 2, 1, '2021-07-15 15:27:09', 0, '2021-07-15 15:27:09', '2021-07-15 15:27:09');
INSERT INTO `pos_attendance_tbl` VALUES (113, 2, 2, '2021-07-15 15:27:11', 0, '2021-07-15 15:27:11', '2021-07-15 15:27:11');
INSERT INTO `pos_attendance_tbl` VALUES (114, 2, 2, '2021-07-15 15:27:11', 0, '2021-07-15 15:27:11', '2021-07-15 15:27:11');
INSERT INTO `pos_attendance_tbl` VALUES (115, 2, 1, '2021-07-15 15:27:46', 0, '2021-07-15 15:27:46', '2021-07-15 15:27:46');
INSERT INTO `pos_attendance_tbl` VALUES (116, 2, 1, '2021-07-15 15:27:46', 0, '2021-07-15 15:27:46', '2021-07-15 15:27:46');
INSERT INTO `pos_attendance_tbl` VALUES (117, 2, 2, '2021-07-15 15:27:48', 0, '2021-07-15 15:27:48', '2021-07-15 15:27:48');
INSERT INTO `pos_attendance_tbl` VALUES (118, 2, 2, '2021-07-15 15:27:48', 0, '2021-07-15 15:27:48', '2021-07-15 15:27:48');
INSERT INTO `pos_attendance_tbl` VALUES (119, 2, 1, '2021-07-15 15:27:51', 0, '2021-07-15 15:27:51', '2021-07-15 15:27:51');
INSERT INTO `pos_attendance_tbl` VALUES (120, 2, 1, '2021-07-15 15:27:51', 0, '2021-07-15 15:27:51', '2021-07-15 15:27:51');
INSERT INTO `pos_attendance_tbl` VALUES (121, 2, 2, '2021-07-15 15:27:54', 0, '2021-07-15 15:27:54', '2021-07-15 15:27:54');
INSERT INTO `pos_attendance_tbl` VALUES (122, 2, 2, '2021-07-15 15:27:54', 0, '2021-07-15 15:27:54', '2021-07-15 15:27:54');
INSERT INTO `pos_attendance_tbl` VALUES (123, 2, 1, '2021-07-15 15:27:57', 0, '2021-07-15 15:27:57', '2021-07-15 15:27:57');
INSERT INTO `pos_attendance_tbl` VALUES (124, 2, 1, '2021-07-15 15:27:57', 0, '2021-07-15 15:27:57', '2021-07-15 15:27:57');
INSERT INTO `pos_attendance_tbl` VALUES (125, 2, 2, '2021-07-15 15:28:03', 0, '2021-07-15 15:28:03', '2021-07-15 15:28:03');
INSERT INTO `pos_attendance_tbl` VALUES (126, 2, 2, '2021-07-15 15:28:03', 0, '2021-07-15 15:28:03', '2021-07-15 15:28:03');
INSERT INTO `pos_attendance_tbl` VALUES (127, 2, 1, '2021-07-15 15:31:33', 0, '2021-07-15 15:31:33', '2021-07-15 15:31:33');
INSERT INTO `pos_attendance_tbl` VALUES (128, 2, 1, '2021-07-15 15:31:33', 0, '2021-07-15 15:31:33', '2021-07-15 15:31:33');
INSERT INTO `pos_attendance_tbl` VALUES (129, 2, 2, '2021-07-15 15:31:35', 0, '2021-07-15 15:31:35', '2021-07-15 15:31:35');
INSERT INTO `pos_attendance_tbl` VALUES (130, 2, 2, '2021-07-15 15:31:35', 0, '2021-07-15 15:31:35', '2021-07-15 15:31:35');
INSERT INTO `pos_attendance_tbl` VALUES (131, 2, 1, '2021-07-15 15:31:37', 0, '2021-07-15 15:31:37', '2021-07-15 15:31:37');
INSERT INTO `pos_attendance_tbl` VALUES (132, 2, 1, '2021-07-15 15:31:37', 0, '2021-07-15 15:31:37', '2021-07-15 15:31:37');
INSERT INTO `pos_attendance_tbl` VALUES (133, 2, 2, '2021-07-15 15:31:39', 0, '2021-07-15 15:31:39', '2021-07-15 15:31:39');
INSERT INTO `pos_attendance_tbl` VALUES (134, 2, 2, '2021-07-15 15:31:39', 0, '2021-07-15 15:31:39', '2021-07-15 15:31:39');
INSERT INTO `pos_attendance_tbl` VALUES (135, 2, 1, '2021-07-15 15:32:16', 0, '2021-07-15 15:32:16', '2021-07-15 15:32:16');
INSERT INTO `pos_attendance_tbl` VALUES (136, 2, 1, '2021-07-15 15:32:16', 0, '2021-07-15 15:32:16', '2021-07-15 15:32:16');
INSERT INTO `pos_attendance_tbl` VALUES (137, 2, 2, '2021-07-15 15:32:18', 0, '2021-07-15 15:32:18', '2021-07-15 15:32:18');
INSERT INTO `pos_attendance_tbl` VALUES (138, 2, 2, '2021-07-15 15:32:18', 0, '2021-07-15 15:32:18', '2021-07-15 15:32:18');
INSERT INTO `pos_attendance_tbl` VALUES (139, 2, 1, '2021-07-15 15:32:52', 0, '2021-07-15 15:32:52', '2021-07-15 15:32:52');
INSERT INTO `pos_attendance_tbl` VALUES (140, 2, 1, '2021-07-15 15:32:52', 0, '2021-07-15 15:32:52', '2021-07-15 15:32:52');
INSERT INTO `pos_attendance_tbl` VALUES (141, 2, 2, '2021-07-15 15:33:04', 0, '2021-07-15 15:33:04', '2021-07-15 15:33:04');
INSERT INTO `pos_attendance_tbl` VALUES (142, 2, 2, '2021-07-15 15:33:04', 0, '2021-07-15 15:33:04', '2021-07-15 15:33:04');
INSERT INTO `pos_attendance_tbl` VALUES (143, 2, 1, '2021-07-15 15:34:04', 0, '2021-07-15 15:34:04', '2021-07-15 15:34:04');
INSERT INTO `pos_attendance_tbl` VALUES (144, 2, 2, '2021-07-15 15:34:06', 0, '2021-07-15 15:34:06', '2021-07-15 15:34:06');
INSERT INTO `pos_attendance_tbl` VALUES (145, 2, 1, '2021-07-15 15:35:08', 0, '2021-07-15 15:35:08', '2021-07-15 15:35:08');
INSERT INTO `pos_attendance_tbl` VALUES (146, 2, 2, '2021-07-15 15:39:47', 0, '2021-07-15 15:39:47', '2021-07-15 15:39:47');
INSERT INTO `pos_attendance_tbl` VALUES (147, 2, 1, '2021-07-15 15:39:57', 0, '2021-07-15 15:39:57', '2021-07-15 15:39:57');
INSERT INTO `pos_attendance_tbl` VALUES (148, 2, 1, '2021-07-15 17:01:25', 0, '2021-07-15 17:01:25', '2021-07-15 17:01:25');
INSERT INTO `pos_attendance_tbl` VALUES (149, 2, 1, '2021-07-16 11:54:42', 0, '2021-07-16 11:54:42', '2021-07-16 11:54:42');
INSERT INTO `pos_attendance_tbl` VALUES (150, 2, 2, '2021-07-16 11:54:44', 0, '2021-07-16 11:54:44', '2021-07-16 11:54:44');
INSERT INTO `pos_attendance_tbl` VALUES (151, 2, 1, '2021-07-18 01:27:20', 0, '2021-07-18 01:27:20', '2021-07-18 01:27:20');
INSERT INTO `pos_attendance_tbl` VALUES (152, 2, 1, '2021-07-18 22:50:31', 0, '2021-07-18 22:50:31', '2021-07-18 22:50:31');

-- ----------------------------
-- Table structure for pos_order_accounting_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_order_accounting_tbl`;
CREATE TABLE `pos_order_accounting_tbl`  (
  `accounting_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NOT NULL,
  `position` int(6) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT NULL,
  `create_date` datetime(1) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`accounting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_order_accounting_tbl
-- ----------------------------
INSERT INTO `pos_order_accounting_tbl` VALUES (1, 2, 3, '23', 0, NULL, '2021-07-18 00:02:44');
INSERT INTO `pos_order_accounting_tbl` VALUES (2, 2, 1, '席12', 0, '2021-07-17 11:02:00.0', '2021-07-17 11:02:45');
INSERT INTO `pos_order_accounting_tbl` VALUES (3, 2, 2, 'SApmle', 0, '2021-07-17 11:02:25.0', '2021-07-17 11:02:25');
INSERT INTO `pos_order_accounting_tbl` VALUES (4, 2, 4, '111', 0, '2021-07-17 11:43:53.0', '2021-07-18 01:27:47');
INSERT INTO `pos_order_accounting_tbl` VALUES (5, 2, 5, '席5', 0, '2021-07-17 12:04:16.0', '2021-07-17 12:04:16');
INSERT INTO `pos_order_accounting_tbl` VALUES (6, 2, 6, '席6', 0, '2021-07-17 12:11:31.0', '2021-07-17 12:11:31');

-- ----------------------------
-- Table structure for pos_order_item_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_order_item_tbl`;
CREATE TABLE `pos_order_item_tbl`  (
  `item_id` int(6) NOT NULL AUTO_INCREMENT,
  `item_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT 0,
  `sort_no` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_order_item_tbl
-- ----------------------------
INSERT INTO `pos_order_item_tbl` VALUES (1, 'メニュー1', '5000', 0, 1, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (2, 'メニュー2', '7000', 0, 2, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (3, 'メニュー3', '6000', 0, 3, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (4, 'メニュー4', '3500', 0, 4, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (5, 'メニュー5', '6000', 0, 5, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (6, 'メニュー6', '5500', 0, 6, NULL, NULL);
INSERT INTO `pos_order_item_tbl` VALUES (7, 'メニュー7', '1122', 0, NULL, '2021-07-19 08:48:20', '2021-07-19 08:56:12');

-- ----------------------------
-- Table structure for pos_order_list_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_order_list_tbl`;
CREATE TABLE `pos_order_list_tbl`  (
  `list_id` int(6) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accounting_id` int(6) NULL DEFAULT NULL,
  `order_item_id` int(6) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_order_list_tbl
-- ----------------------------
INSERT INTO `pos_order_list_tbl` VALUES (18, 'メニュー4', '3500', '3', 1, 4, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (19, 'test', '96000', '4', 1, NULL, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (22, 'メニュー3', '6000', '2', 4, 3, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (23, 'メニュー4', '3500', '3', 4, 4, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (27, 'メニュー3', '6000', '23', 3, 3, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (28, 'rhj', '23', '2', 3, NULL, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');
INSERT INTO `pos_order_list_tbl` VALUES (29, 'tyty', '8745', '3', 3, NULL, 0, '2021-07-18 00:00:00', '2021-07-18 00:00:00');

-- ----------------------------
-- Table structure for pos_setting_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_setting_tbl`;
CREATE TABLE `pos_setting_tbl`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `order_accounting_count` int(6) NULL DEFAULT NULL,
  `order_item_count` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_setting_tbl
-- ----------------------------
INSERT INTO `pos_setting_tbl` VALUES (2, 10, 7);

-- ----------------------------
-- Table structure for pos_staff_tbl
-- ----------------------------
DROP TABLE IF EXISTS `pos_staff_tbl`;
CREATE TABLE `pos_staff_tbl`  (
  `staff_id` int(6) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `mail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attendance_status` int(1) NULL DEFAULT NULL,
  `visit_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT 0,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_staff_tbl
-- ----------------------------
INSERT INTO `pos_staff_tbl` VALUES (2, 'staff1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'スタッフ', 1, NULL, 0, NULL, '2021-07-14 17:21:43');
INSERT INTO `pos_staff_tbl` VALUES (5, 'staff2@gmail.com', '88ea39439e74fa27c09a4fc0bc8ebe6d00978392', '222', 2, NULL, 0, NULL, '2021-07-14 15:14:23');
INSERT INTO `pos_staff_tbl` VALUES (6, 'staff4@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', 'テスト５つ', NULL, NULL, 0, '2021-07-14 15:16:27', '2021-07-14 15:16:43');
INSERT INTO `pos_staff_tbl` VALUES (7, NULL, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, 2, NULL, 1, '2021-07-19 08:45:38', '2021-07-19 08:45:38');

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del_flag` int(1) NOT NULL DEFAULT 0,
  `create_date` datetime(0) NOT NULL,
  `update_date` datetime(0) NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES (1, '管理者', 'admin@example.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, '2021-06-20 00:00:00', '2021-06-20 00:00:00');

-- ----------------------------
-- Table structure for tbl_analytics
-- ----------------------------
DROP TABLE IF EXISTS `tbl_analytics`;
CREATE TABLE `tbl_analytics`  (
  `analytics_id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_date` datetime(0) NOT NULL,
  `view_cnt` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`analytics_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_analytics
-- ----------------------------
INSERT INTO `tbl_analytics` VALUES (1, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (2, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (3, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (4, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (5, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (6, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (7, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (8, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (9, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (10, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (11, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (12, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (13, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (14, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (15, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (16, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-15 00:00:00', 35, 1);
INSERT INTO `tbl_analytics` VALUES (17, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (18, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (19, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (20, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (21, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (22, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (23, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (24, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (25, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (26, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (27, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (28, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (29, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (30, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (31, '91efe6b4-4deb-41a7-abee-91c2400217f4', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (32, '926e6c07-708b-402b-8576-507d08785021', '2021-06-01 00:00:00', 4, 1);
INSERT INTO `tbl_analytics` VALUES (33, '926e6c07-708b-402b-8576-507d08785021', '2021-06-02 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (34, '926e6c07-708b-402b-8576-507d08785021', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (35, '926e6c07-708b-402b-8576-507d08785021', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (36, '926e6c07-708b-402b-8576-507d08785021', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (37, '926e6c07-708b-402b-8576-507d08785021', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (38, '926e6c07-708b-402b-8576-507d08785021', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (39, '926e6c07-708b-402b-8576-507d08785021', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (40, '926e6c07-708b-402b-8576-507d08785021', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (41, '926e6c07-708b-402b-8576-507d08785021', '2021-06-10 00:00:00', 4, 1);
INSERT INTO `tbl_analytics` VALUES (42, '926e6c07-708b-402b-8576-507d08785021', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (43, '926e6c07-708b-402b-8576-507d08785021', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (44, '926e6c07-708b-402b-8576-507d08785021', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (45, '926e6c07-708b-402b-8576-507d08785021', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (46, '926e6c07-708b-402b-8576-507d08785021', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (47, '926e6c07-708b-402b-8576-507d08785021', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (48, '926e6c07-708b-402b-8576-507d08785021', '2021-06-17 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (49, '926e6c07-708b-402b-8576-507d08785021', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (50, '926e6c07-708b-402b-8576-507d08785021', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (51, '926e6c07-708b-402b-8576-507d08785021', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (52, '926e6c07-708b-402b-8576-507d08785021', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (53, '926e6c07-708b-402b-8576-507d08785021', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (54, '926e6c07-708b-402b-8576-507d08785021', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (55, '926e6c07-708b-402b-8576-507d08785021', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (56, '926e6c07-708b-402b-8576-507d08785021', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (57, '926e6c07-708b-402b-8576-507d08785021', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (58, '926e6c07-708b-402b-8576-507d08785021', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (59, '926e6c07-708b-402b-8576-507d08785021', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (60, '926e6c07-708b-402b-8576-507d08785021', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (61, '926e6c07-708b-402b-8576-507d08785021', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (62, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (63, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-02 00:00:00', 11, 1);
INSERT INTO `tbl_analytics` VALUES (64, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (65, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (66, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (67, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (68, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (69, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (70, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (71, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (72, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (73, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (74, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (75, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (76, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (77, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (78, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (79, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (80, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (81, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (82, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (83, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (84, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (85, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (86, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (87, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (88, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (89, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (90, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (91, '01e27ab5-9137-436c-bc89-0192ebed5ddc', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (92, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (93, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (94, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-03 00:00:00', 11, 1);
INSERT INTO `tbl_analytics` VALUES (95, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (96, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (97, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (98, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (99, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (100, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (101, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (102, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (103, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (104, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (105, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (106, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (107, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (108, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (109, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (110, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (111, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (112, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (113, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (114, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (115, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (116, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (117, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (118, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (119, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (120, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (121, '76315ef0-2d2c-4951-a09c-ddaede441ac5', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (122, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (123, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (124, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (125, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (126, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (127, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (128, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-07 00:00:00', 11, 1);
INSERT INTO `tbl_analytics` VALUES (129, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (130, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (131, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (132, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (133, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (134, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (135, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (136, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (137, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (138, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (139, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (140, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (141, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (142, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (143, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (144, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (145, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (146, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (147, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (148, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (149, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (150, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (151, 'd1b3dc73-9277-479a-8e06-e86ad7bfd16b', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (152, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (153, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (154, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (155, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (156, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (157, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (158, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-07 00:00:00', 11, 1);
INSERT INTO `tbl_analytics` VALUES (159, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (160, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (161, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (162, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (163, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (164, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (165, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (166, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (167, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (168, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (169, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (170, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (171, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (172, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (173, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (174, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (175, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (176, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (177, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (178, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (179, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (180, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (181, 'f8198657-562c-4d81-8562-f3ebcc156f5f', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (182, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (183, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (184, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (185, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (186, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (187, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (188, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (189, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (190, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (191, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (192, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (193, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (194, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (195, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (196, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-15 00:00:00', 9, 1);
INSERT INTO `tbl_analytics` VALUES (197, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (198, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (199, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (200, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (201, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (202, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (203, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (204, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (205, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (206, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (207, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (208, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (209, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (210, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (211, 'd78fc5c7-9948-47dc-8327-670f38db0dee', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (212, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (213, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (214, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (215, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (216, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (217, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (218, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (219, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (220, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (221, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-10 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (222, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (223, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (224, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (225, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (226, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (227, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (228, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (229, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (230, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (231, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (232, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (233, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (234, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (235, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (236, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (237, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (238, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (239, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (240, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (241, '1450f3b0-c770-4d07-816a-38522f3a0074', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (242, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (243, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (244, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (245, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (246, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (247, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (248, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (249, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (250, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (251, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (252, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (253, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (254, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (255, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (256, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (257, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (258, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-17 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (259, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (260, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (261, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (262, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (263, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (264, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (265, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (266, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (267, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (268, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (269, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (270, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (271, '3497f425-c48b-4f37-9c4c-26d058c69d81', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (272, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (273, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (274, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (275, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (276, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (277, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (278, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (279, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (280, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (281, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-10 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (282, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (283, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (284, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (285, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-14 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (286, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (287, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (288, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (289, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (290, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (291, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (292, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (293, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (294, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (295, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (296, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (297, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (298, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (299, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (300, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (301, '37a75575-6480-4ba8-8fa1-d3b4ea529356', '2021-06-30 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (302, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-01 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (303, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-02 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (304, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-03 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (305, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-04 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (306, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-05 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (307, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-06 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (308, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-07 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (309, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-08 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (310, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-09 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (311, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-10 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (312, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-11 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (313, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-12 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (314, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-13 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (315, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-14 00:00:00', 2, 1);
INSERT INTO `tbl_analytics` VALUES (316, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-15 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (317, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-16 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (318, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-17 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (319, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-18 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (320, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-19 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (321, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-20 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (322, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-21 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (323, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-22 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (324, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-23 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (325, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-24 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (326, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-25 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (327, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-26 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (328, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-27 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (329, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-28 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (330, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-29 00:00:00', 0, 1);
INSERT INTO `tbl_analytics` VALUES (331, '58f7dd5a-ceb5-4339-ab53-4e23e568773a', '2021-06-30 00:00:00', 0, 1);

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company`  (
  `company_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会社ID',
  `company_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会社名',
  `company_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_start` int(11) NOT NULL DEFAULT 9,
  `work_end` int(11) NOT NULL DEFAULT 17,
  `company_wix_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_wix_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_wix_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_wix_widget` varchar(10240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `use_flag` int(11) NOT NULL,
  `del_flag` int(1) NOT NULL DEFAULT 0,
  `create_date` datetime(0) NOT NULL,
  `update_date` datetime(0) NOT NULL,
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_company
-- ----------------------------
INSERT INTO `tbl_company` VALUES (1, 'company@example.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '53811ad1-9788-45b6-b00b-c7ecb9b5eb30', 'XXX株式会社', '', '', '', 7, 14, 'sapporo', 'fea1272d-3c03-4055-9d2c-a390c246c329', 'GsAniOm010qMsEPCtzrn3dhu0TnkeXQTRzWljbFqS0w', '!function () {\r\n    function e() {\r\n        var e = document.createElement(\"script\");\r\n        e.type = \"text/javascript\", e.async = !0, e.src = \"https://sapporo.wixanswers.com/apps/widget/v1/sapporo/fbd000a0-1f82-49b9-930f-788edf09b680/ja/embed.js\";\r\n        var t = document.getElementsByTagName(\"script\")[0];\r\n        t.parentNode.insertBefore(e, t)\r\n    }\r\n\r\n    window.addEventListener ? window.addEventListener(\"load\", e) : window.attachEvent(\"onload\", e), window.AnswersWidget = {\r\n        onLoaded: function (e) {\r\n            window.AnswersWidget.queue.push(e)\r\n        }, queue: []\r\n    }\r\n}();', 1, 1, '2021-06-20 00:00:00', '2021-06-30 16:46:37');
INSERT INTO `tbl_company` VALUES (2, 'a@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '5d80a798-ab4d-47e2-a5c1-d9861e8eba35', 'a', '', '', '', 9, 17, '', '', '', '', 0, 0, '2021-06-30 18:14:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_company` VALUES (3, 'b@proz.jp', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'd211b2c8-1d28-4530-8f54-3f336451d31b', 'b', '', '', '', 9, 17, '', '', '', '', 0, 0, '2021-06-30 18:15:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_company` VALUES (4, 'c@proz.jp', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'e47d6f2a-c6ef-47dc-bd1c-3b773b523122', 'c株式会社', '', '', '', 9, 17, 'kastumoto', '5d91b039-f390-41b3-a6b1-df0670958f2b', '_jEL3QbWZH2Hckf436BxiFuq4Uk7zspenK4a6bKFNqI', '<script type=\"text/javascript\">!function(){function e(){var e=document.createElement(\"script\");e.type=\"text/javascript\",e.async=!0,e.src=\"https://kastumoto.wixanswers.com/apps/widget/v1/kastumoto/4c081bb5-580f-43d1-8000-04160615c404/en/embed.js\";var t=document.getElementsByTagName(\"script\")[0];t.parentNode.insertBefore(e,t)}window.addEventListener?window.addEventListener(\"load\",e):window.attachEvent(\"onload\",e),window.AnswersWidget={onLoaded:function(e){window.AnswersWidget.queue.push(e)},queue:[]}}();</script>', 1, 0, '2021-06-30 18:17:50', '2021-06-30 18:17:50');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `session` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `client_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `browser` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `scenario` int(11) NOT NULL DEFAULT 0,
  `faq` int(11) NOT NULL DEFAULT 0,
  `chat` int(11) NOT NULL DEFAULT 0,
  `visit_time` datetime(0) NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES (1, 4, 'qarg384tvm17uoiha5vmpi277fun37d1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'Chrome 91.0.4472.114', 1, 0, 0, '2021-06-30 19:14:46');

-- ----------------------------
-- Table structure for tbl_faq
-- ----------------------------
DROP TABLE IF EXISTS `tbl_faq`;
CREATE TABLE `tbl_faq`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_faq
-- ----------------------------
INSERT INTO `tbl_faq` VALUES ('06871615-5c15-406b-ba34-bd613ce7467c', 1, '', 'Anker PowerCore Essential 20000の対応機種は？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">以下の機種に対応しています。</h2></div><div data-component-type=\"text\"><div><strong>スマートフォン</strong><br />\n- iPhone 11 / 11 Pro / 11 Pro Max / XS / XS Max / XR / X / 8 / 8 Plus<br />\n- Galaxy S10 / S10+ / S9 / S9+<br />\n- Google Pixel 3 / 3 XL<br />\n- Nexus 6P / 7 他<br />\n<br />\n<strong>タブレット端末</strong><br />\n- iPad Pro (2018, 11インチ) / iPad mini 5 他</div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('0b26b1b8-c558-4be3-9d40-c724db202e21', 1, '', '配送日時の指定はできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">誠に申し訳ございませんが、指定することはできません｡</h2></div><div data-component-type=\"text\"><div><br /></div><div><br /></div></div>');
INSERT INTO `tbl_faq` VALUES ('0d48a670-2d29-4d3e-be92-90e0528d3d3a', 1, '', 'Anker PowerCore 13000は何色カラーバリエーションがありますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"2\">ブラック、ホワイト、レッド、ブルーの4色です</h2></div><div data-component-type=\"text\"><div><br />\n</div><div>ブラック</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1215/A1215-BLACK-001.jpg\" /></div><div>ホワイト</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1215/A1215-WHITE-008.jpg\" /></div><div>ブルー</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1215/A1215-BLUE-008.jpg\" /></div><div>レッド</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1215/A1215-RED-009.jpg\" /></div></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1215011 (ブラック) </li>  <li>A1215021 (ホワイト) </li>  <li>A1215091 (レッド) </li>  <li>A1215031 (ブルー)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('10a6ee15-2d79-47db-8d85-359aad3c905c', 1, '', 'Ankerグループの本社Anker Innovationsが深圳証券取引所の新興企業向け市場「創業板 (ChiNext) 」へ新規上場', '<div data-component-type=\"text\"><h1><img data-composite=\"true\" src=\"https://lp.ankerjapan.com/hubfs/Landing%20Page/20200822_Listing%20Day/02.jpg\" alt=\"02\" /></h1><h2> Ankerグループの本社Anker Innovationsが<br />\n深圳証券取引所の新興企業向け市場「創業板 (ChiNext) 」へ新規上場</h2><div> </div><div>Ankerグループの本社Anker Innovationsは2020年8月24日、深圳証券取引所の新興企業向け市場「創業板 (ChiNext) 」にて、新方式のIPO登録制導入後初の上場企業の一つとして新規上場を致しました。</div><div>今回の株式上場に際しAnker Innovationsは4,100万株を新たに発行し、約420億円の資金調達を行います。</div><div>調達した資金は、主にコア技術や製品、ソフトウェアの研究開発や、その中心となる施設の増強や運用に投じられ、世界中のお客様の生活をよりスマート＆快適にサポートする体制強化を行って参ります。</div><div> </div><div><a class=\"ce-image-link\" href=\"https://lp.ankerjapan.com/cs/c/?cta_guid=24753d64-f0be-4845-b329-86f5ce0865bc&amp;signature=AAH58kHiDt-eqkcc0HVLUfBLAWD-VgiOAg&amp;pageId=33970940809&amp;placement_guid=a63194c0-1a85-4159-bca2-75f94431dc8a&amp;click=693e66d5-347a-4035-8f9f-2c9ec7e1f6ec&amp;hsutk=ac13a8677c00df748b491da56ca9079b&amp;canon=https%3A%2F%2Flp.ankerjapan.com%2Fanker-ipo&amp;utm_referrer=https%3A%2F%2Flp.ankerjapan.com%2Fcorporate&amp;portal');
INSERT INTO `tbl_faq` VALUES ('11540578-a729-4ea7-ba83-82c931a94316', 1, '', '返品の手続きはどうすればいいでしょうか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">電子メールもしくはお電話でカスタマーサポートにお問い合わせください。</h2></div><div data-component-type=\"text\"><div>カスタマーサポートより、ご返品の方法についてご案内致します。</div></div>');
INSERT INTO `tbl_faq` VALUES ('1450f3b0-c770-4d07-816a-38522f3a0074', 1, '', '不良品を交換したいです。', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">Ankerの全製品には18ヶ月間の製品保証がついておりますので、その期間内にお買い上げの製品に不具合があった場合、カスタマーサポートにお問い合わせください。弊社が不具合であると確認した後、迅速に同一新品製品との交換対応をお承り致します。</h2></div>');
INSERT INTO `tbl_faq` VALUES ('15833436-1875-4f69-ad9e-860249b71689', 1, '', '返品時の送料はかかりますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">１．製品不具合の場合</h2></div><div data-component-type=\"text\"><div>当該事象を弊社が不具合であると確認した後、迅速に同一新品製品との交換対応をお承り致します。その際の送料は弊社が負担致します。</div></div><div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">2．上記以外の場合</h2></div><div data-component-type=\"text\"><div><ins>カスタマーサポート</ins>にお問い合わせください。</div></div>');
INSERT INTO `tbl_faq` VALUES ('187725ea-e536-48b8-ba17-36be19b18d27', 1, '', 'カスタマーサポートの営業時間', '<div data-component-type=\"text\"><div><strong>お電話（03-4455-7823）</strong></div><div><br /></div><div>月～金 9:00～17:00 祝日・お盆・年末年始を除く</div><div><br /></div><div><strong>メール（お問合せフォーム）</strong></div><div><br /></div><div>24時間</div><div><br /></div><div><strong>チャット</strong></div><div><br /></div><div>24時間（チャットボットによる対応）</div><div>月～金 9:00～17:00 祝日・お盆・年末年始を除く（オペレーターによる対応）</div></div>');
INSERT INTO `tbl_faq` VALUES ('27461b70-e5ba-4dd0-ae07-ea4013ad7379', 1, '', 'スマートフォン以外の機器を充電することは可能ですか。', '<div data-component-type=\"text\"><div>スマートフォン、ノートパソコン、タブレット用のモバイルバッテリーとなります。</div></div>');
INSERT INTO `tbl_faq` VALUES ('28ee1282-49a9-4144-8f1d-719eb6d28463', 1, '', 'Anker PowerCore Essential 20000はフルスピード充電に対応していますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">フルスピード充電に対応しています。</h2></div><div data-component-type=\"text\"><div>Anker独自技術PowerIQとVoltageBoostによりフルスピード充電が可能です (最大2A) </div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('3497f425-c48b-4f37-9c4c-26d058c69d81', 1, '', 'フルスピード充電とは？', '<div data-component-type=\"text\"><div>Anker独自技術PowerIQ (接続機器を検知し電流を最適化) とVoltageBoost (ケーブル抵抗を検知し出力電圧を自動調整) により、超高速充電を実現。最大3Aのフルスピード充電を可能にします (各ポート毎に最大2.4A) 。 2つのUSBポートを備え、2台同時充電も可能です。</div></div><div data-component-type=\"table\"><div class=\"table-wrapper\"><table><thead><tr><th><div>対象製品</div></th></tr></thead><tbody><tr><td><div>Anker PowerCore Essential 20000</div></td></tr><tr><td><div>Anker PowerCore 5000</div></td></tr><tr><td><div>Anker PowerCore 13000</div></td></tr></tbody></table></div></div>');
INSERT INTO `tbl_faq` VALUES ('37a75575-6480-4ba8-8fa1-d3b4ea529356', 1, '', 'Anker PowerCore 5000は何色カラーバリエーションがありますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"2\">ブラック、ホワイト、レッド、ブルーの4色です</h2></div><div data-component-type=\"text\"><div>ブラック</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1109/A1109-BLACK--001jpg.jpg\" /></div><div>ホワイト</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1109/A1109-WHITE-021%202.jpg\" /></div><div>ブルー</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1109/A1109-BLUE-008.jpg\" /></div><div>レッド</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1109/A1109-RED-009.jpg\" /></div></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1109011 (ブラック) </li>  <li>A1109021 (ホワイト) </li>  <li>A1109031 (ブルー) </li>  <li>A1109091 (レッド)<br />\n</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('40f75b14-40e5-4740-bd0b-8679487df599', 1, '', '本製品を充電しながらほかの機器に給電をすることはできますか。', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">本製品は同時に蓄電と給電を行うことはできません。</h2></div><div data-component-type=\"text\"><div><br />\n蓄電中は出力ポートを使用しないでください。</div></div><div data-component-type=\"table\"><div class=\"table-wrapper\"><table><thead><tr><th><div>対象製品</div></th></tr></thead><tbody><tr><td><div>Anker PowerCore Essential 20000</div></td></tr><tr><td><div>Anker PowerCore 5000</div></td></tr><tr><td><div>Anker PowerCore 13000</div></td></tr></tbody></table></div></div>');
INSERT INTO `tbl_faq` VALUES ('4769a0d4-939c-4661-8e71-da401d9bbafe', 1, '', 'Anker PowerCore Essential 20000は何台同時に充電できますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">2つのUSB出力ポート搭載で、2台同時に充電できます。（合計最大出力15W）</h2></div><div data-component-type=\"text\"><div>製品型番</div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('48378834-6ebc-425a-a7e4-87eaa8ef974e', 1, '', '製品の外箱が破損しています。交換はできますでしょうか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">カスタマーサポートにお問い合わせください。お客様に到着した際に箱がつぶれていた場合、迅速に同一新品製品との交換対応をお承り致します。</h2></div>');
INSERT INTO `tbl_faq` VALUES ('49f1aa69-8d98-4801-809e-892388a8f712', 1, '', 'どのような支払い方法がありますか?', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">お支払方法は､以下のいずれかよりお選びいただけます｡</h2></div><div data-component-type=\"text\"><ul>\n  <li>クレジットカード</li>  <li>Amazonペイメント</li>  <li>atone 翌月後払い (コンビニ)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('59e57c40-3dcf-46df-8dac-a00a1370357d', 1, '', 'Anker PowerCore 5000はフルスピード充電に対応していますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">フルスピード充電に対応しています。</h2></div><div data-component-type=\"text\"><div>Anker独自技術PowerIQとVoltageBoostによりフルスピード充電が可能です (最大2A) </div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1109011 (ブラック) </li>  <li>A1109021 (ホワイト) </li>  <li>A1109031 (ブルー) </li>  <li>A1109091 (レッド)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('63bcdd8b-f207-42d8-bb00-c1374f7de999', 1, '', 'お問合せ先が知りたい', '<div data-component-type=\"text\"><div>03-4455-7823</div><div><br /></div><div>【受付時間】</div><div>月～金 9:00～17:00 祝日・お盆・年末年始を除く</div><div><br /></div><div>メールでのお問合せは<a href=\"https://sapporo.wixanswers.com/contact\" target=\"\">こちら</a></div></div>');
INSERT INTO `tbl_faq` VALUES ('7028dd0d-769d-4809-bfb2-84bb512cad66', 1, '', 'Anker PowerCore Essential 20000の仕様について', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">Anker PowerCore Essential 20000のサイズ、重さ、出力などについては以下を参照ください</h2></div><div data-component-type=\"text\"><div><strong>製品サイズ</strong></div><div>約158 x 74 x 19 mm</div><div><br /></div><div><strong>製品重量</strong></div><div>約343g</div><div><br /></div><div><strong>バッテリー容量</strong></div><div>20,000ｍAh</div><div><br /></div><div><strong>入力</strong></div><div>5V = 2A</div><div><br /></div><div><strong>出力</strong></div><div>5V = 3A (各ポート最大2.4A)</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"green\"><div class=\"info-title\">パッケージ内容</div><div class=\"info-content\"><ul>\n  <li>Anker PowerCore Essential 20000</li>  <li>Micro USB ケーブル (※USB-CとライトニングUSBケーブルは別売り) </li>  <li>トラベルポーチ</li>  <li>取扱説明書</li>  <li>18ヶ月保証 + 6ヶ月 (Anker会員登録後) </li>  <li>カスタマーサポート</li></ul></div></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)</li></ul></div><div data-component-type=\"');
INSERT INTO `tbl_faq` VALUES ('70d300bc-7e4d-416b-aeb6-af1da80eb467', 1, '', '新しい有効期限のカードはいつ頃届くのですか？', '<div data-component-type=\"text\"><div>新しいカードは有効期限の5～10日頃に発送いたします。 万一カードが届かないという場合は<a href=\"http://www.orico.co.jp/support/cardcenter/\" target=\"\">オリコカードセンター</a>までお問い合わせください。 なお新しいカードが届きましたら、有効期限が切れるカードはハサミで半分に切ってご処分いただきますようお願いいたします。</div></div>');
INSERT INTO `tbl_faq` VALUES ('80c8bf69-4518-420c-9834-ee1627e16ccc', 1, '', 'プリペイドカードを紛失してしまいましたが、どうすればいいですか？', '<div data-component-type=\"text\"><div>第三者による利用防止のため、「Orico My プリカ」内の「カード利用停止・解除」ページにて利用停止を行ってください。 ※詳しくは<a href=\"http://www.orico.co.jp/prepaid/guide/member/stop.html\" target=\"\">「Orico My プリカの使い方」</a>をご覧ください。 ※再発券の場合は、プリペイドカード番号、有効期限、暗証番号が再発券前の内容から変更となります。 ※プリペイドカードの紛失・盗難・事故・不正使用は補償の対象外となります。</div></div>');
INSERT INTO `tbl_faq` VALUES ('848968a3-bd1a-44d1-a709-a03accaeb4e0', 1, '', '海外で購入した製品が壊れました。日本で交換・返品はできますか？', '<div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">海外で購入した製品を日本で交換/返品することはできません。ご購入元の店舗様宛にお問い合わせください。</h2></div><div data-component-type=\"text\"><div><br /></div><div><br /></div></div>');
INSERT INTO `tbl_faq` VALUES ('8582dcd1-3fae-4e68-871d-ca396f3e9df0', 1, '', 'Anker PowerCore Essential 20000は何回充電が可能ですか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">20000mAhの超大容量で、iPhone11 / 11 Proを4回以上、Galaxy S10を約4回、iPad mini 5を2回以上満充電することができます。緊急災害対策用としても最適です。</h2></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('8c9049e5-4d1d-458c-a16d-4d075e3272bd', 1, '', '開封した製品でも返品はできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">ご注文日から30日以内に、メールやお電話にてカスタマーサポートにお問い合わせください。</h2></div><div data-component-type=\"text\"><div>カスタマーサポートより、ご返品の方法についてご案内致します。<br />\n製品返品のための返送送料をお客様にてご負担いただくことを条件に､製品代金の全額を返金致します。</div><div><br />\nただし、お客様のご判断により着払い等でご返送いただいた場合、弊社では返品をお受けとり致しかねます。あらかじめご了承ください。</div></div>');
INSERT INTO `tbl_faq` VALUES ('8d6402a7-947c-42cb-92ed-9143320fb9a9', 1, '', 'オリコETCカードは申込みしてからどれくらいで届きますか？', '<div data-component-type=\"text\"><div>1週間～2週間前後でお届けいたします。 ※オリコカードと同時にETCカードをお申込みされた場合でも、別々にお客さまへ郵送されることがございます。 なお、その際郵送事情により、ETCカードがオリコカードよりも先に届くことがあります。 ※カードのお届けは諸事情により遅れる場合がございますので、あらかじめご了承ください。</div></div>');
INSERT INTO `tbl_faq` VALUES ('91efe6b4-4deb-41a7-abee-91c2400217f4', 1, '', 'ご利用代金明細書の費用を知りたい', '<div data-component-type=\"text\"><div>100円です</div></div>');
INSERT INTO `tbl_faq` VALUES ('926e6c07-708b-402b-8576-507d08785021', 1, '', 'Anker PowerCore 13000の仕様について', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">Anker PowerCore 13000のサイズ、重さ、出力などについては以下を参照ください</h2></div><div data-component-type=\"text\"><div><strong>製品サイズ</strong></div><div>約97.5x 80 x 22mm</div><div><br /></div><div><strong>製品重量</strong></div><div>約255g</div><div><br /></div><div><strong>入力</strong></div><div>5V/2A</div><div><br /></div><div><strong>出力</strong></div><div>5V/3A</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"green\"><div class=\"info-title\">パッケージ内容</div><div class=\"info-content\"><ul>\n  <li>Anker PowerCore 13000</li>  <li>Micro USBケーブル</li>  <li>トラベルポーチ</li>  <li>18ヶ月保証 + 6ヶ月 (Anker会員登録後) </li></ul></div></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1215011 (ブラック) </li>  <li>A1215021 (ホワイト) </li>  <li>A1215091 (レッド) </li>  <li>A1215031 (ブルー)</li></ul></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"red\"><div class=\"info-title\">ご注意</div><div class=\"info-content\"><ul>\n ');
INSERT INTO `tbl_faq` VALUES ('93b7cff1-4f39-4e95-bb16-692b0425ac59', 1, '', 'パスワードを忘れてしまった', '<div data-component-type=\"text\"><div>パスワードを忘れてしまった場合、<a href=\"http://www.google.com\" target=\"\">こちら</a>よりパスワードリセットを行ってください</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"red\"><div class=\"info-title\">ご注意</div><div class=\"info-content\"><div>パスワードを3回続けて間違えた場合、24時間パスワードがロックされパスワードリセットも出来なくなりますのでご注意ください</div></div></div></div>');
INSERT INTO `tbl_faq` VALUES ('9b6e7218-c2f9-400b-8685-4675b5f9f2da', 1, '', '製品のお届け先を変更できますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">誠に申し訳ございませんが、注文確定後のお客様のご都合による配送先のご変更はできません。ご了承ください。</h2></div><div data-component-type=\"text\"><div><br /></div></div>');
INSERT INTO `tbl_faq` VALUES ('9bc3d7c3-ce5c-4afd-bb9f-1bb1f56b1906', 1, '', '製品が発送されない。商品が届かない。', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">ご注文いただいた製品が出荷されますと、配送情報がメールにて送付されます｡ もしこちらのメールが届いていない場合は、カスタマーサポートへご連絡ください｡</h2></div><div data-component-type=\"text\"><div>上記メールを受信済みの場合は、お手数ですが配送業者へ直接ご連絡ください｡</div></div>');
INSERT INTO `tbl_faq` VALUES ('9cabe102-b236-4a91-8705-5c8788f6da49', 1, '', '届いた製品に傷がついています。どうすればいいでしょうか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">全製品には18ヶ月間の製品保証がついておりますので、その期間内にお買い上げの製品に不具合があった場合、カスタマーサポートにお問い合わせください。弊社が不具合であると確認した後、迅速に同一新品製品との交換対応をお承り致します。</h2></div>');
INSERT INTO `tbl_faq` VALUES ('9f0a924f-d3e6-4ae3-9419-7523a5110419', 1, '', 'カードやETCカードが紛失や盗難にあった時はどうしたら良いですか？', '<div data-component-type=\"text\"><div>至急弊社までご連絡ください。 紛失盗難受付窓口（24時間365日受付）は<a href=\"http://www.orico.co.jp/support/card_loss/\" target=\"\">こちら</a> 併せて警察へのお届けもお願いします。 また、「ハイカ・前払」残高管理サービスまたはETCマイレージサービスをご利用中のお客さまは、前払金残高や還元額を保全するため、利用一時停止の手続きが必要となります。</div><div>＜ETCマイレージサービス＞ <a href=\"http://www.smile-etc.jp/\" target=\"\">ETCマイレージサービス事務局</a>の会員トップページから「利用停止」手続きを行ってください。 または、ナビダイヤル 0570-010125、携帯電話・PHSなどからは045-477-3793へご連絡ください。（受付は平日9:00～21:00、土･日･祝9:00～18:00）</div><div>＜障害者割引（ETC利用登録）＞市町村福祉事務所窓口へお問合せの上、お手続きください。</div></div>');
INSERT INTO `tbl_faq` VALUES ('a0cef70f-9432-45ef-ac80-98ee3e3f9092', 1, '', '申込みしたカードはいつ頃届きますか？', '<div data-component-type=\"text\"><div>ネットでの「オンライン申込」によるお申込みは、「審査完了日」から最短8営業日でカードを発送いたします。 「郵送申込」によるお申込みは約3週間ほどでカードを発送いたします。 ※カードのお届けは郵便事情により遅れる場合がございますので、あらかじめご了承ください。</div></div>');
INSERT INTO `tbl_faq` VALUES ('a179690e-04ff-43a5-8d03-772b35c915bc', 1, '', 'ギフトラッピングや、複数の製品ご注文時に同梱の指定はできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">誠に申し訳ございませんが、ご指定は承っておりません｡</h2></div>');
INSERT INTO `tbl_faq` VALUES ('b2e31ac3-d0c3-4324-99f3-44470c668815', 1, '', '取扱説明書\nAnker PowerCore 13000', '<div data-component-type=\"text\"><div><a href=\"https://d2x3xhvgiqkx42.cloudfront.net/8b4de52f-f9b8-46bd-8e5b-5f1b35623ce7/70b48832-e802-4fdc-a006-6aafb8bb9337/2021/05/22/a7d97b8e-b797-4985-b98b-f7ece40b619e/a1109manual.pdf?response-content-disposition=attachment;filename*=UTF-8\'\'a1109manual.pdf\" target=\"\">取扱説明書（PDF）</a></div></div>');
INSERT INTO `tbl_faq` VALUES ('b9e79322-1a7e-4003-825a-cb6aec74296e', 1, '', '送料はかかりますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">ご購入金額が4000円未満の場合､送料540円(税込)が必要となります｡また､ご購入金額が4000円以上のお客様は､送料無料となります｡</h2></div><div data-component-type=\"text\"><div><br /></div></div>');
INSERT INTO `tbl_faq` VALUES ('bc95c773-5cf0-4f73-aba7-8dbbdf641a32', 1, '', '取扱説明書\nAnker PowerCore 5000', '<div data-component-type=\"text\"><div><a href=\"https://d2x3xhvgiqkx42.cloudfront.net/8b4de52f-f9b8-46bd-8e5b-5f1b35623ce7/70b48832-e802-4fdc-a006-6aafb8bb9337/2021/05/22/a7d97b8e-b797-4985-b98b-f7ece40b619e/a1109manual.pdf?response-content-disposition=attachment;filename*=UTF-8\'\'a1109manual.pdf\" target=\"\">取扱説明書（PDF）</a></div></div>');
INSERT INTO `tbl_faq` VALUES ('bd0e913f-7f86-4814-91c9-2d23d417bbdc', 1, '', 'Anker PowerCore 5000\nは何回充電が可能ですか？', '<div data-component-type=\"text\"><div>ほとんどのスマートフォンに約1回の充電が可能です。職場、旅行、家で少し使いたいときであっても非常に便利です</div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1109011 (ブラック) </li>  <li>A1109021 (ホワイト) </li>  <li>A1109031 (ブルー) </li>  <li>A1109091 (レッド)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('be1ff100-a7f5-4708-aa73-babc680e6332', 1, '', '注文後に、注文内容の変更・配送先の変更はできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">誠に申し訳ございませんが、注文確定後のお客様のご都合によるご注文内容の変更・配送先のご変更は承っておりません｡</h2></div>');
INSERT INTO `tbl_faq` VALUES ('c29a632c-a75f-45ab-b7b2-45cadb462f69', 1, '', '修理したい', '<div data-component-type=\"text\"><div>弊社では製品の修理を行っておりません。</div><div>保証期間内の場合は無償にて交換対応させていただいております。</div><div><br /></div><div>詳しくは<a href=\"https://sapporo.wixanswers.com/kb/ja/article/%E8%A3%BD%E5%93%81%E3%81%AE%E4%BF%9D%E8%A8%BC%E5%86%85%E5%AE%B9%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6\" target=\"\">製品の保証内容</a>についてをご覧ください</div></div>');
INSERT INTO `tbl_faq` VALUES ('d4ac65f3-97a9-4240-8f42-a1796df48443', 1, '', 'Anker PowerCore 5000の仕様について', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">Anker PowerCore 5000のサイズ、重さ、出力などについては以下を参照ください</h2></div><div data-component-type=\"text\"><div><strong>製品サイズ</strong></div><div>約108 x 33 x 33mm</div><div><br /></div><div><strong>製品重量</strong></div><div>約134g</div><div><br /></div><div><strong>入力</strong></div><div>5V/2A</div><div><br /></div><div><strong>出力</strong></div><div>5V/2A</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"green\"><div class=\"info-title\">パッケージ内容</div><div class=\"info-content\"><ul>\n  <li>Anker PowerCore 5000 モバイルバッテリー</li>  <li>Micro USBケーブル</li>  <li>トラベルポーチ</li>  <li>取扱説明書</li>  <li>18ヶ月保証 + 6ヶ月 (Anker会員登録後) </li>  <li>カスタマーサポート</li></ul></div></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1109011 (ブラック) </li>  <li>A1109021 (ホワイト) </li>  <li>A1109031 (ブルー) </li>  <li>A1109091 (レッド)</li></ul></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"red\"><div class=\"info-titl');
INSERT INTO `tbl_faq` VALUES ('d78fc5c7-9948-47dc-8327-670f38db0dee', 1, '', 'オリコカードの申込方法や申込み時に必要な書類を教えてください。', '<div data-component-type=\"text\"><div>インターネットや携帯電話から「オンライン申込」または「郵送申込」でお申込いただけます。<br />\n→各カードのご案内・お申込は<a href=\"http://www.orico.co.jp/creditcard\" target=\"_blank\">こちら</a><br />\n<br />\n●「オンライン申込」でお申込いただいた場合は、本人限定受取郵便（特定事項伝達型）または簡易書留郵便にてカードをお送りいたします。本人限定受取郵便（特定事項伝達型）は本人確認書類のご提示が必要となります。<br />\n→本人限定受取郵便（特定事項伝達型）については<a href=\"http://www.orico.co.jp/creditcard/entry/id.html\" target=\"_blank\">こちら</a><br />\n<br />\n●「郵送申込」でお申込いただいた場合は、お申込書をご返送いただく際に、合わせて本人確認書類コピーもご返送が必要となります。<br />\n→本人確認書類については<a href=\"http://www.orico.co.jp/creditcard/entry/doc_2.html\" target=\"_blank\">こちら</a></div><div> </div><div>※またキャッシングをご希望で以下のいずれかに該当する場合、所得証明書類が必要となります。<br />\n・今回のお申込を含めて、当社でのお借入額（カードの場合はご利用可能枠）の合計が50万円を超える場合</div><div>・上記の当社お借入合計額と他の貸金業者（信販会社、クレジット会社、消費者金融等）を含めた借入残高の合計額が100万円を超える場合</div></div>');
INSERT INTO `tbl_faq` VALUES ('d893b02e-0f09-4376-9e1b-c358c835b04b', 1, '', '間違った製品を購入してしまった場合、返品はできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">ご注文日から30日以内に、メールやお電話にてカスタマーサポートにお問い合わせください。</h2></div><div data-component-type=\"text\"><div><br /></div><div>カスタマーサポートより、ご返品の方法についてご案内致します。<br />\n製品返品のための返送送料をお客様にてご負担いただくことを条件に､製品代金の全額を返金致します。</div><div><br /></div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"orange\"><div class=\"info-title\">ご注意</div><div class=\"info-content\"><div>お客様のご判断により着払い等でご返送いただいた場合、弊社では返品をお受けとり致しかねます。あらかじめご了承ください。</div></div></div></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"collapsible\"><div><h4 class=\"collapsible-title\">返品手続きについて</h4><div class=\"collapsible-content\"><div>カスタマーサポートより、ご返品の方法についてご案内致します。 製品返品のための返送送料をお客様にてご負担いただくことを条件に､製品代金の全額を返金致します。</div></div></div></div>');
INSERT INTO `tbl_faq` VALUES ('dcea0532-7d9b-48c0-ac67-5efe15730f8b', 1, '', '利用時に手数料はかかりますか？', '<div data-component-type=\"text\"><div>ATM/CDによりキャッシングをご利用いただいた場合、次のATM手数料をご負担いただきます。 ・ご利用金額1万円以下の場合　110 円（税込） ・ご利用金額1万円超の場合　　220 円（税込）</div></div>');
INSERT INTO `tbl_faq` VALUES ('df67edfc-7ad7-413b-aa07-6f5fbdc5840c', 1, '', 'Anker PowerCore Essential 20000は何色カラーバリエーションがありますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"2\">ブラック、ホワイトの2色です</h2></div><div data-component-type=\"text\"><div>ブラック</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1268/A1268-BLACK-001.jpg\" /></div><div>ホワイト</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1268/A1268-WHITE-001-WHITE.jpg\" /></div></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1268011 (ブラック) </li>  <li>A1268021 (ホワイト)<br />\n</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('e10baf4c-2a52-4a65-8ea6-82cc64562a1b', 1, '', 'Anker PowerCore 13000は何回充電が可能ですか？', '<div data-component-type=\"text\"><div>数日のご使用にも十分な容量で、iPhone 11 Proに約3回以上、Galaxy S9に約3回、iPad Pro (2018, 11インチ) に約1回以上の充電が可能。Apple MacBook (12インチ, 2015)も約4~5時間で満充電可能です (PowerIQ非対応) 。</div></div><div data-component-type=\"text\"><div><strong>製品型番</strong></div><ul>\n  <li>A1215011 (ブラック) </li>  <li>A1215021 (ホワイト) </li>  <li>A1215091 (レッド) </li>  <li>A1215031 (ブルー)</li></ul></div>');
INSERT INTO `tbl_faq` VALUES ('e1bb0fe1-7650-4c54-9f1d-517014ec3de3', 1, '', '買い替えキャンペーンについて', '<div data-component-type=\"text\"><div><br />\n<br />\n</div><div><img data-composite=\"true\" src=\"https://f.hubspotusercontent20.net/hubfs/5012528/A%E5%85%AC%E5%BC%8F/Other/202011_Replacement%20Campaign/replacement_campaign_v2.png\" alt=\"replacement_campaign\" /></div><div>お申し込みにあたって、下記内容を必ずご一読くださいますようお願い申し上げます。<br />\n対象製品を現在お使いの方、もしくはお持ちの方は <a href=\"https://www.ankerjapan.com/apply.html?id=REPLACEMENT_2020#step\">【お申し込みの流れ】</a>をご一読の上、お申し込みください。</div><div>【受付期間】 2020年11月19日 (木) 18:00 ～ 2020年12月23日 (水) 23:59</div><div>【回収期間】 2020年11月19日 (木) 18:00 ～ 2021年1月14日 (木) 当日消印有効</div><h2>キャンペーン対象商品</h2><div>本キャンペーンは、2017年末日までに日本国内でご購入いただいたAnkerのモバイルバッテリーおよび充電器が対象となります。<br />\nなお、一部対象外の製品もございます。対象外の製品でお申し込みを頂いた場合、製品の返却及びポイント付与は致しかねますので、ご注意ください。</div><h2>対象外製品 ※下記製品は本キャンペーンの対象外です</h2><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.net/client_info/ANKERJAPAN/itemimage/A1263/A1263001.jpg\" alt=\"A1263\" /></div><div>PowerCore<br />\n10000</div><div><img data-composite=\"true\" src=\"https://dbcn1bdvswqbx.cloudfront.');
INSERT INTO `tbl_faq` VALUES ('e757fc85-f4a0-4a86-aa10-4dc9dbb5f19e', 1, '', '支払い方法を変更できますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">注文確定後のお支払いの変更はできません｡</h2></div>');
INSERT INTO `tbl_faq` VALUES ('e9e9d2cc-e891-48db-9eaa-c79f67a8230e', 1, '', '注文のキャンセルはできますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">誠に申し訳ございませんが、原則としてご注文後発送手配が完了している場合､お客様のご都合によるご注文のキャンセルはお受け致しかねます｡</h2></div>');
INSERT INTO `tbl_faq` VALUES ('ec62d503-9114-4ea1-8b97-718753d214d7', 1, '', '製品の保証内容について', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">30日間の返品返金保証ならび\n18ヶ月製品長期保証を提供しております</h2></div><div data-component-type=\"text\"><div><br /></div></div><div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">30日間の返品返金保証</h2></div><div data-component-type=\"text\"><div>ご注文日から30日間 (注) は、以下のいずれかの場合に限り、弊社指定の場所に製品をご返品後、返金対応を承ります。 (注：予約注文を除く。予約注文に限り、発送日から起算させて頂きます。)</div></div><div data-component-type=\"text\"><div><strong>① 製品不具合の場合</strong></div><div><br /></div><div>製品が説明書通りに動作しない、未使用の状態で製品にキズがあった、お客様に到着した際に箱がつぶれていた、等の場合 (これらの状況を「不具合」と呼びます) 、ご希望されるお客様には製品代金の全額を返金致します。この際、当該製品返品のための返送送料は弊社が負担致します。ただし、ご購入後の落下、衝撃、改造、浸水等、お客様が意図せずとも製品の故障につながるような行為を起因とした製品の不具合 (「お客様過失による不具合」と呼びます) につきましては、本保証の対象外とさせていただきます</div><div><br /></div><div><strong>② 上記以外で返品をご希望の場合</strong></div><div><br /></div><div>購入された製品自体に不具合はないものの、お客様が意図せずとも誤って注文された (色違い、長さ違いを含む) 等を理由に返品をご希望される場合、当該製品返品のための返送送料をお客様にご負担いただくことを条件に、製品代金の全額を返金致します。なお、お客様のご判断により着払い等でご返送いただいた場合、返品をお受け致しませんので、あらかじめご了承ください。</div></div><div data-component-type=\"informative\"><div c');
INSERT INTO `tbl_faq` VALUES ('ed1ae00e-a9ed-47ac-bfb6-044ebcee348e', 1, '', 'Anker会員はどのような特典がありますか?', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">Anker公式オンラインストアでは､会員登録をしていただいた方々へ､様々な特典サービスをご用意しております。詳細は会員特典についてのページをご確認ください｡</h2></div>');
INSERT INTO `tbl_faq` VALUES ('f04e0f7f-b301-4b0d-890d-a121e9b90b24', 1, '', '書籍「Anker 爆発的成長を続ける新時代のメーカー」の販売', '<div data-component-type=\"text\"><div><br /></div><div><img data-composite=\"true\" src=\"https://www.ankerjapan.com/client_info/ANKERJAPAN/itemimage/ANKERBOOK01/ANKERBOOK01_banner.jpg\" /></div><div>モバイルバッテリーや急速充電器、USBケーブルなどの、現代社会に必要不可欠なスマートフォン・タブレット関連製品の開発・販売を行うハードウェアメーカー、Ankerグループ。その中核をなすブランド「Anker」は米・Google出身の数名の若者達によって2011年に創設され、iPhoneをはじめとするスマートフォンやモバイルアプリ市場の拡大とともに爆発的な成長を遂げた。現在ではスマートフォン・タブレットアクセサリーの枠を超え、グループ全体で高品質なオーディオ機器やロボット掃除機といった生活を豊かにするスマートなデバイスを数々提供し、感度の高いビジネスパーソンやガジェット好きを筆頭に世界中で評価され続けている。<br />\n知名度ゼロであった外資系ハードウェアベンチャーが、何故わずか数年で業界のトップランナーになれたのか？　そこには、同グループの創設者であるスティーブン・ヤンを始めとする経営陣の明確なビジョンや、中央集権にならないための組織づくり、徹底されたカスタマーサポート、Amazonでトップを取り続けるための販売戦略など、世界で躍進を続けるための確固たる理由があった。<br />\n本書は、「Empowering Smarter Lives（スマートな生活を後押しする）」をミッションに掲げるAnkerグループがトップブランドとしての地位を確立するに至った歩みとともに、「新時代のメーカーの在り方」について紐解くものである。Ankerグループ製品を愛するファンのみならず、企業で働く多くのビジネスパーソンにとっても必読の内容になっている。<br />\n<br />\n</div><h4>■ 米国や日本、欧州各国など、世界のEC市場でベストセラーや売上1位を獲得！中国・深圳発のハードウェアベンチャーが、数年で業界のトップランナーになれた秘訣とは？</h4><div>松村太郎<br />\nジャーナリスト･著者。1980年生まれ。慶應義塾大学政策');
INSERT INTO `tbl_faq` VALUES ('f1c33cbd-1e74-4dbb-86e0-18699ec2741d', 1, '', '注文した製品は、何日後に届きますか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">入金確認後1〜7営業日でお届け致します｡</h2></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"green\"><div class=\"info-content\"><div>ただし､配送状況により上記日程を超えてのお届けになる場合もございます｡</div></div></div></div>');
INSERT INTO `tbl_faq` VALUES ('f1fc6cc0-6ccb-4bde-b143-808f6f0970f3', 1, '', '配送業者はどこですか？', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"4\">発送業務はアマゾン・ジャパン合同会社様へ外部委託を行っております。</h2></div><div data-component-type=\"text\"><div>配送業者はデリバリープロバイダ､ヤマト運輸、日本郵便等（配送業者様は適宜異なる場合がございます。）</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"blue\"><div class=\"info-content\"><ul>\n  <li>アマゾン・ジャパン合同会社様のシステム仕様により、沖縄県の一部の住所には配送できない場合がございます。その場合につきましては、キャンセル対応とさせていただきます。 </li>  <li>コンビニエンスストアまたは、配送業者局留めでのお受け取りはできません。お受け取りできるご自宅等のご住所にてご注文ください。</li></ul></div></div></div>');
INSERT INTO `tbl_faq` VALUES ('f8198657-562c-4d81-8562-f3ebcc156f5f', 1, '', '充電できない', '<div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">Anker製モバイルバッテリーが充電できない場合の確認事項と対処方法については以下をご確認ください</h2></div><div data-component-type=\"line\"><hr line-style=\"thin\" /></div><div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">確認①　充電ケーブル</h2></div><div data-component-type=\"text\"><div>充電ケーブルの不良が原因でモバイルバッテリーの充電ができないことが考えられます。新しい充電ケーブルで充電が可能かご確認ください</div></div><div data-component-type=\"heading\"><h2 id=\"\" level=\"3\">確認②　モバイルバッテリー</h2></div><div data-component-type=\"text\"><div>新しい充電ケーブルでも充電ができない場合、モバイルバッテリー側に原因があることが考えられます。</div><div><br /></div><div><strong>利用回数の限度</strong></div><div><br /></div><div>モバイルバッテリーを長期間使っていると劣化してきます。モバイルバッテリーの充電回数は、約300〜500回ぐらいです。1日に1回、モバイルバッテリーで充電したとすると約1年〜1年半ぐらいが寿命となります。</div></div><div data-component-type=\"informative\"><div class=\"info-container\" info-color=\"blue\"><div class=\"info-title\">修理のご相談</div><div class=\"info-content\"><div>充電回数も少なく、モバイルバッテリーの故障が考えられる場合は弊社サポートセンターまでご相談をお願い致します</div><div><br /></div><div>お問合せは<a href=\"https://sapporo.wixanswers.com/contact\" target=\"\">こちら</a');
INSERT INTO `tbl_faq` VALUES ('febb3eaf-2a0c-4030-9dc9-c55d832a8f0b', 1, '', '取扱説明書\nAnker PowerCore Essential 20000', '<div data-component-type=\"text\"><div><a href=\"https://d2x3xhvgiqkx42.cloudfront.net/8b4de52f-f9b8-46bd-8e5b-5f1b35623ce7/70b48832-e802-4fdc-a006-6aafb8bb9337/2021/05/22/fd1a1888-60fc-42b5-92c1-9e215c17ac7d/a1268manual.pdf?response-content-disposition=attachment;filename*=UTF-8\'\'a1268manual.pdf\" target=\"\">取扱説明書（PDF）</a></div></div>');

-- ----------------------------
-- Table structure for tbl_last_login
-- ----------------------------
DROP TABLE IF EXISTS `tbl_last_login`;
CREATE TABLE `tbl_last_login`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `sessionData` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `machineIp` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAgent` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agentString` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `platform` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDtm` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_last_login
-- ----------------------------
INSERT INTO `tbl_last_login` VALUES (1, 4, '{\"company_id\":\"4\",\"company_email\":\"c@proz.jp\",\"company_password\":\"d033e22ae348aeb5660fc2140aec35850c4da997\",\"uuid\":\"e47d6f2a-c6ef-47dc-bd1c-3b773b523122\",\"company_name\":\"c\\u682a\\u5f0f\\u4f1a\\u793e\",\"company_key\":\"\",\"company_secret\":\"\",\"company_url\":\"\",\"work_start\":\"9\",\"work_end\":\"17\",\"company_wix_domain\":\"\",\"company_wix_key\":\"\",\"company_wix_secret\":\"\",\"company_wix_widget\":\"\",\"use_flag\":\"1\",\"del_flag\":\"0\",\"create_date\":\"2021-06-30 18:17:50\",\"update_date\":\"2021-06-30 18:17:50\"}', '::1', 'Chrome 91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'Windows 10', '2021-06-30 02:18:43');
INSERT INTO `tbl_last_login` VALUES (2, 1, '{\"company_id\":\"1\",\"company_email\":\"company@example.com\",\"company_password\":\"d033e22ae348aeb5660fc2140aec35850c4da997\",\"uuid\":\"53811ad1-9788-45b6-b00b-c7ecb9b5eb30\",\"company_name\":\"XXX\\u682a\\u5f0f\\u4f1a\\u793e\",\"company_key\":\"\",\"company_secret\":\"\",\"company_url\":\"\",\"work_start\":\"7\",\"work_end\":\"14\",\"company_wix_domain\":\"sapporo\",\"company_wix_key\":\"fea1272d-3c03-4055-9d2c-a390c246c329\",\"company_wix_secret\":\"GsAniOm010qMsEPCtzrn3dhu0TnkeXQTRzWljbFqS0w\",\"company_wix_widget\":\"!function () {\\r\\n    function e() {\\r\\n        var e = document.createElement(\\\"script\\\");\\r\\n        e.type = \\\"text\\/javascript\\\", e.async = !0, e.src = \\\"https:\\/\\/sapporo.wixanswers.com\\/apps\\/widget\\/v1\\/sapporo\\/fbd000a0-1f82-49b9-930f-788edf09b680\\/ja\\/embed.js\\\";\\r\\n        var t = document.getElementsByTagName(\\\"script\\\")[0];\\r\\n        t.parentNode.insertBefore(e, t)\\r\\n    }\\r\\n\\r\\n    window.addEventListener ? window.addEventListener(\\\"load\\\", e) : window.attachEvent(\\\"onload\\\", e), window.AnswersWidget = {\\r\\n        onLoaded: function (e) {\\r\\n            window.AnswersWidget.queue.push(e)\\r\\n        }, queue: []\\r\\n    }\\r\\n}();\",\"use_flag\":\"1\",\"del_flag\":\"0\",\"create_date\":\"2021-06-20 00:00:00\",\"update_date\":\"2021-06-30 16:46:37\"}', '::1', 'Chrome 91.0.4472.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'Windows 10', '2021-07-14 11:23:02');

-- ----------------------------
-- Table structure for tbl_reset_password
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reset_password`;
CREATE TABLE `tbl_reset_password`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activation_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agent` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_ip` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdBy` bigint(20) NOT NULL DEFAULT 1,
  `createdDtm` datetime(0) NOT NULL,
  `updatedBy` bigint(20) NULL DEFAULT NULL,
  `updatedDtm` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_roles
-- ----------------------------
DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE `tbl_roles`  (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_roles
-- ----------------------------
INSERT INTO `tbl_roles` VALUES (1, '管理者');
INSERT INTO `tbl_roles` VALUES (2, 'スタッフ');

-- ----------------------------
-- Table structure for tbl_scenario
-- ----------------------------
DROP TABLE IF EXISTS `tbl_scenario`;
CREATE TABLE `tbl_scenario`  (
  `scenario_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT ' ユーザーID',
  `parent_id` int(11) NOT NULL,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tree_code` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_order` int(11) NOT NULL DEFAULT 1,
  `level` int(11) NOT NULL DEFAULT 0,
  `select_cnt` bigint(20) NOT NULL DEFAULT 0 COMMENT 'シナリオ選択数',
  `child_flag` tinyint(1) NOT NULL DEFAULT 0,
  `view_flag` tinyint(2) NOT NULL DEFAULT 1,
  `create_date` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`scenario_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_scenario
-- ----------------------------
INSERT INTO `tbl_scenario` VALUES (1, 1, 1, 0, '製品の仕様・詳細について', '次から選択ください', '0001', 1, 1, 7, 1, 1, '2021-05-19 18:02:10', NULL);
INSERT INTO `tbl_scenario` VALUES (2, 1, 1, 0, '不具合・修理のご相談', '以下よりお選びください', '0002', 2, 1, 21, 1, 1, '2021-05-19 18:02:14', NULL);
INSERT INTO `tbl_scenario` VALUES (3, 1, 1, 0, '返品・交換について', '次からお選びください', '0003', 3, 1, 14, 1, 1, '2021-05-19 18:02:17', NULL);
INSERT INTO `tbl_scenario` VALUES (4, 1, 1, 0, 'ご注文・配送について', '次からお選びください', '0004', 4, 1, 14, 1, 1, '2021-05-19 18:02:19', NULL);
INSERT INTO `tbl_scenario` VALUES (5, 1, 1, 1, '特定の製品について', '詳細を知りたい製品を次から選択してください', '00010001', 1, 2, 3, 1, 1, '2021-05-19 18:02:34', NULL);
INSERT INTO `tbl_scenario` VALUES (6, 1, 1, 2, '充電できない', 'モバイルバッテリーが充電できない場合充電ケーブルの不良が原因でモバイルバッテリーの充電ができないことが考えられます。新しい充電ケーブルで充電が可能かご確認ください\r\n', '00020001', 1, 2, 5, 1, 1, '2021-05-19 18:51:31', NULL);
INSERT INTO `tbl_scenario` VALUES (23, 1, 1, 0, 'その他', '次からお選びください', '0005', 5, 1, 29, 1, 1, '2021-05-19 21:00:59', NULL);
INSERT INTO `tbl_scenario` VALUES (29, 1, 1, 23, '会員の特典は？', 'オンラインストアでは､会員登録をしていただいた方々へ､様々な特典サービスをご用意しております。詳細は会員特典についてのページをご確認ください｡', '00050001', 1, 2, 5, 0, 1, '2021-05-19 21:03:12', NULL);
INSERT INTO `tbl_scenario` VALUES (32, 1, 1, 5, 'Anker PowerCore 13000', 'Anker PowerCore 13000の何についてお調べになりたいですか？', '000100010002', 2, 3, 2, 1, 1, '2021-05-23 11:04:42', NULL);
INSERT INTO `tbl_scenario` VALUES (33, 1, 1, 32, '製品サイズについて', 'サイズは約97.5x 80 x 22mmです', '0001000100020001', 1, 4, 2, 0, 1, '2021-05-23 11:05:31', NULL);
INSERT INTO `tbl_scenario` VALUES (34, 1, 1, 32, '重さについて', '製品重量は約255gです', '0001000100020002', 2, 4, 2, 0, 1, '2021-05-23 11:05:50', NULL);
INSERT INTO `tbl_scenario` VALUES (35, 1, 1, 32, '出入力電力について', '入力は5V/2A、出力は5V/3Aです', '0001000100020003', 3, 4, 0, 0, 1, '2021-05-23 11:06:48', NULL);
INSERT INTO `tbl_scenario` VALUES (36, 1, 1, 32, 'カラーバリエーションについて', 'ブラック、ホワイト、レッド、ブルーの4色です', '0001000100020004', 4, 4, 4, 0, 1, '2021-05-23 11:07:39', NULL);
INSERT INTO `tbl_scenario` VALUES (37, 1, 1, 32, '付属品について', '・Anker PowerCore 13000\r\n・Micro USBケーブル\r\n・トラベルポーチ\r\n・18ヶ月保証 + 6ヶ月 (Anker会員登録後) ', '0001000100020005', 5, 4, 3, 0, 1, '2021-05-23 11:08:20', NULL);
INSERT INTO `tbl_scenario` VALUES (38, 1, 1, 32, '取扱説明書が見たい', '以下よりご覧いただけます\r\n\r\nhttps://www.ankerjapan.com/client_info/ANKERJAPAN/view/userweb/pdf/A1275Manual.pdf', '0001000100020006', 6, 4, 3, 0, 1, '2021-05-23 11:09:19', NULL);
INSERT INTO `tbl_scenario` VALUES (39, 1, 1, 32, 'その他', 'お手数ですがご質問内容を直接入力してください', '0001000100020007', 7, 4, 1, 0, 1, '2021-05-23 11:18:26', NULL);
INSERT INTO `tbl_scenario` VALUES (40, 1, 1, 5, 'Anker PowerCore 5000', 'Anker PowerCore 5000の何についてお調べになりたいですか？', '000100010003', 3, 3, 0, 1, 1, '2021-05-23 11:22:05', NULL);
INSERT INTO `tbl_scenario` VALUES (41, 1, 1, 40, '製品サイズについて', '製品サイズは約108 x 33 x 33mmです', '0001000100030001', 1, 4, 0, 0, 1, '2021-05-23 11:22:30', NULL);
INSERT INTO `tbl_scenario` VALUES (42, 1, 1, 40, '重さについて', '製品重量は約134gです', '0001000100030002', 2, 4, 0, 0, 1, '2021-05-23 11:23:08', NULL);
INSERT INTO `tbl_scenario` VALUES (43, 1, 1, 40, '出入力電力について', '入力は5V/2A、出力は5V/2Aです', '0001000100030003', 3, 4, 0, 0, 1, '2021-05-23 11:23:36', NULL);
INSERT INTO `tbl_scenario` VALUES (44, 1, 1, 40, 'カラーバリエーションについて', 'ブラック、ホワイト、ブルー、レッドの4色です', '0001000100030004', 4, 4, 0, 0, 1, '2021-05-23 11:24:01', NULL);
INSERT INTO `tbl_scenario` VALUES (45, 1, 1, 40, '付属品について', '・Anker PowerCore 5000 モバイルバッテリー\r\n・Micro USBケーブル\r\n・トラベルポーチ\r\n・取扱説明書\r\n・18ヶ月保証 + 6ヶ月 (Anker会員登録後) \r\n・カスタマーサポート', '0001000100030005', 5, 4, 0, 0, 1, '2021-05-23 11:24:35', NULL);
INSERT INTO `tbl_scenario` VALUES (46, 1, 1, 40, '取扱説明書が見たい', '以下をご覧ください\r\n\r\nhttps://www.ankerjapan.com/client_info/ANKERJAPAN/view/userweb/pdf/A1621Manual.pdf', '0001000100030006', 6, 4, 0, 0, 1, '2021-05-23 11:26:13', NULL);
INSERT INTO `tbl_scenario` VALUES (47, 1, 1, 40, 'その他', 'お手数ですがご質問内容を直接入力してください', '0001000100030007', 7, 4, 0, 0, 1, '2021-05-23 11:26:31', NULL);
INSERT INTO `tbl_scenario` VALUES (48, 1, 1, 1, '取扱説明書が見たい', '製品を次から選択ください', '00010002', 2, 2, 12, 1, 1, '2021-05-23 11:28:19', NULL);
INSERT INTO `tbl_scenario` VALUES (49, 1, 1, 48, 'Anker PowerCore 13000', '以下よりご覧ください\r\n\r\nhttps://www.ankerjapan.com/client_info/ANKERJAPAN/view/userweb/pdf/A1275Manual.pdf', '000100020001', 1, 3, 6, 0, 1, '2021-05-23 11:29:09', NULL);
INSERT INTO `tbl_scenario` VALUES (50, 1, 1, 48, 'Anker PowerCore 5000', '以下よりご覧ください\r\n\r\nhttps://www.ankerjapan.com/client_info/ANKERJAPAN/view/userweb/pdf/A1621Manual.pdf', '000100020002', 2, 3, 2, 0, 1, '2021-05-23 11:29:33', NULL);
INSERT INTO `tbl_scenario` VALUES (51, 1, 1, 1, 'フルスピード充電とは？', 'Anker独自技術PowerIQとVoltageBoostによる高速充電技術です', '00010003', 3, 2, 9, 0, 1, '2021-05-23 11:31:42', NULL);
INSERT INTO `tbl_scenario` VALUES (53, 1, 1, 1, 'MultiProtectとは？', 'モバイルバッテリーはスマートフォンなどの機器へ給電を行うために、内部に電力を蓄えるバッテリーセルを搭載しています。言い換えれば、モバイルバッテリーを持ち歩くということは、大きなエネルギーを持ち運ぶということです。だからこそAnkerでは、お客様が安心かつ安全に充電を行えるよう、モバイルバッテリーやUSB急速充電器にMultiProtect (多重保護機能) と呼ばれるAnker独自の保護機能パッケージを採用しています。このMultiProtectは、サージプロテクターや温度管理、ショート防止をはじめとした11個の保護システムから成り立っており、モバイルバッテリーやUSB急速充電器を長時間使用しても高い安全性を維持できるよう徹底的に調査、開発がなされています。', '00010005', 5, 2, 1, 0, 1, '2021-05-23 11:37:15', NULL);
INSERT INTO `tbl_scenario` VALUES (54, 1, 1, 6, '充電ケーブルを変えても充電できない', 'モバイルバッテリーを長期間使っていると劣化してきます。モバイルバッテリーの充電回数は、約300〜500回ぐらいです。1日に1回、モバイルバッテリーで充電したとすると約1年〜1年半ぐらいが寿命となります。\r\n\r\n上記にも当てはまらない場合は「18ヶ月製品長期保証」の対象となる場合、同一新品製品との交換を行わせていただきます。\r\nお手数ですが以下よりお問合せをお願い致します\r\n\r\nhttps://sapporo.wixanswers.com/contact', '000200010001', 1, 3, 3, 0, 1, '2021-05-23 11:43:54', NULL);
INSERT INTO `tbl_scenario` VALUES (55, 1, 1, 6, '充電ケーブルを変えたら充電できた', '充電ケーブルに不具合が考えられます。', '000200010002', 2, 3, 2, 0, 1, '2021-05-23 11:45:28', NULL);
INSERT INTO `tbl_scenario` VALUES (56, 1, 1, 2, '充電がすぐ無くなる', 'モバイルバッテリーを長期間使っていると劣化してきます。モバイルバッテリーの充電回数は、約300〜500回ぐらいです。1日に1回、モバイルバッテリーで充電したとすると約1年〜1年半ぐらいが寿命となります。\r\n\r\n充電回数も少なく、モバイルバッテリーの故障が考えられる場合は弊社サポートセンターまでご相談をお願い致します\r\nhttps://sapporo.wixanswers.com/contact', '00020002', 2, 2, 4, 0, 1, '2021-05-23 11:47:44', NULL);
INSERT INTO `tbl_scenario` VALUES (57, 1, 1, 2, '不具合製品の修理をしてほしい', '弊社の全製品には18ヶ月間の製品保証がついておりますので、その期間内にお買い上げの製品に不具合があった場合、カスタマーサポートにお問い合わせください。弊社が不具合であると確認した後、迅速に同一新品製品との交換対応をお承り致します。\r\n\r\n【お問合せ先】\r\nhttps://sapporo.wixanswers.com/contact', '00020003', 3, 2, 3, 0, 1, '2021-05-23 11:49:15', NULL);
INSERT INTO `tbl_scenario` VALUES (58, 1, 1, 2, 'その他', 'お手数ですがご質問内容を直接入力してください', '00020004', 4, 2, 1, 0, 1, '2021-05-23 13:42:45', NULL);
INSERT INTO `tbl_scenario` VALUES (59, 1, 1, 3, '間違った製品を購入してしまった', 'ご注文日から30日以内に、メールやお電話にてカスタマーサポートにお問い合わせください。\r\n\r\nカスタマーサポートより、ご返品の方法についてご案内致します。\r\n製品返品のための返送送料をお客様にてご負担いただくことを条件に､製品代金の全額を返金致します。\r\n\r\nただし、お客様のご判断により着払い等でご返送いただいた場合、弊社では返品をお受けとり致しかねます。あらかじめご了承ください。\r\n\r\n【お問合せ】\r\nhttps://sapporo.wixanswers.com/contact', '00030001', 1, 2, 2, 0, 1, '2021-05-23 13:46:22', NULL);
INSERT INTO `tbl_scenario` VALUES (60, 1, 1, 3, '開封した製品の返品について', 'ご注文日から30日以内に、メールやお電話にてカスタマーサポートにお問い合わせください。\r\nカスタマーサポートより、ご返品の方法についてご案内致します。\r\n製品返品のための返送送料をお客様にてご負担いただくことを条件に､製品代金の全額を返金致します。\r\n\r\nただし、お客様のご判断により着払い等でご返送いただいた場合、弊社では返品をお受けとり致しかねます。あらかじめご了承ください。\r\n\r\n【お問合せ】\r\nhttps://sapporo.wixanswers.com/contact', '00030002', 2, 2, 2, 0, 1, '2021-05-23 13:47:43', NULL);
INSERT INTO `tbl_scenario` VALUES (61, 1, 1, 3, '返品の手続き方法について', '電子メールもしくはお電話でカスタマーサポートにお問い合わせください。\r\nカスタマーサポートより、ご返品の方法についてご案内致します。\r\n\r\n【お問合せ】\r\nhttps://sapporo.wixanswers.com/contact', '00030003', 3, 2, 0, 0, 1, '2021-05-23 13:49:05', NULL);
INSERT INTO `tbl_scenario` VALUES (62, 1, 1, 3, '外箱が破損していた', 'カスタマーサポートにお問い合わせください。お客様に到着した際に箱がつぶれていた場合、迅速に同一新品製品との交換対応をお承り致します。\r\n\r\n【お問合せ】\r\nhttps://sapporo.wixanswers.com/contact', '00030004', 4, 2, 3, 0, 1, '2021-05-23 13:50:00', NULL);
INSERT INTO `tbl_scenario` VALUES (63, 1, 1, 3, '届いた製品に傷がついていた', '全製品には18ヶ月間の製品保証がついておりますので、その期間内にお買い上げの製品に不具合があった場合、カスタマーサポートにお問い合わせください。弊社が不具合であると確認した後、迅速に同一新品製品との交換対応をお承り致します。\r\n\r\n【お問合せ】\r\nhttps://sapporo.wixanswers.com/contact', '00030005', 5, 2, 5, 0, 1, '2021-05-23 13:50:52', NULL);
INSERT INTO `tbl_scenario` VALUES (64, 1, 1, 3, '海外で購入した製品の交換、修理について', '海外で購入した製品を日本で交換/返品することはできません。ご購入元の店舗様宛にお問い合わせください。', '00030006', 6, 2, 1, 0, 1, '2021-05-23 13:51:26', NULL);
INSERT INTO `tbl_scenario` VALUES (65, 1, 1, 3, 'その他', 'お手数ですがご質問内容を直接入力してください', '00030007', 7, 2, 0, 0, 1, '2021-05-23 13:51:57', NULL);
INSERT INTO `tbl_scenario` VALUES (66, 1, 1, 4, '注文のキャンセルについて', '誠に申し訳ございませんが、原則としてご注文後発送手配が完了している場合､お客様のご都合によるご注文のキャンセルはお受け致しかねます｡', '00040001', 1, 2, 7, 0, 1, '2021-05-23 13:52:59', NULL);
INSERT INTO `tbl_scenario` VALUES (67, 1, 1, 4, '注文後の注文内容の変更', '誠に申し訳ございませんが、注文確定後のお客様のご都合によるご注文内容の変更・配送先のご変更は承っておりません｡', '00040002', 2, 2, 2, 0, 1, '2021-05-23 13:53:39', NULL);
INSERT INTO `tbl_scenario` VALUES (68, 1, 1, 4, '支払い方法の変更', '注文確定後のお支払いの変更はできません', '00040003', 3, 2, 0, 0, 1, '2021-05-23 13:54:08', NULL);
INSERT INTO `tbl_scenario` VALUES (69, 1, 1, 4, '配送先の変更', '誠に申し訳ございませんが、注文確定後のお客様のご都合による配送先のご変更はできません。ご了承ください。', '00040004', 4, 2, 2, 0, 1, '2021-05-23 13:54:29', NULL);
INSERT INTO `tbl_scenario` VALUES (70, 1, 1, 4, '支払い方法について', 'お支払方法は､以下のいずれかよりお選びいただけます｡\r\n・クレジットカード\r\n・Amazonペイメント\r\n・atone 翌月後払い (コンビニ)', '00040005', 5, 2, 0, 0, 1, '2021-05-23 13:56:34', NULL);
INSERT INTO `tbl_scenario` VALUES (71, 1, 1, 4, 'この中にない', '以下にお探しのご質問はございますか？', '00040006', 6, 2, 1, 1, 1, '2021-05-23 13:57:48', NULL);
INSERT INTO `tbl_scenario` VALUES (72, 1, 1, 71, '送料はかかりますか', 'ご購入金額が4000円未満の場合､送料540円(税込)が必要となります｡また､ご購入金額が4000円以上のお客様は､送料無料となります｡', '000400060001', 1, 3, 0, 0, 1, '2021-05-23 13:58:20', NULL);
INSERT INTO `tbl_scenario` VALUES (73, 1, 1, 71, '配送業者はどこですか？', '発送業務はアマゾン・ジャパン合同会社様へ外部委託を行っております。\r\n\r\n配送業者はデリバリープロバイダ､ヤマト運輸、日本郵便等（配送業者様は適宜異なる場合がございます。）\r\n\r\nアマゾン・ジャパン合同会社様のシステム仕様により、沖縄県の一部の住所には配送できない場合がございます。その場合につきましては、キャンセル対応とさせていただきます。 コンビニエンスストアまたは、配送業者局留めでのお受け取りはできません。お受け取りできるご自宅等のご住所にてご注文ください。', '000400060002', 2, 3, 0, 0, 1, '2021-05-23 13:59:03', NULL);
INSERT INTO `tbl_scenario` VALUES (74, 1, 1, 71, '配送日時の指定はできますか？', '誠に申し訳ございませんが、指定することはできません｡', '000400060003', 3, 3, 0, 0, 1, '2021-05-23 13:59:25', NULL);
INSERT INTO `tbl_scenario` VALUES (75, 1, 1, 71, '何日で届きますか？', '入金確認後1〜7営業日でお届け致します｡ただし､配送状況により上記日程を超えてのお届けになる場合もございます｡', '000400060004', 4, 3, 0, 0, 1, '2021-05-23 14:00:01', NULL);
INSERT INTO `tbl_scenario` VALUES (76, 1, 1, 71, 'ギフトラッピングはできますか？', '誠に申し訳ございませんが、ご指定は承っておりません｡', '000400060005', 5, 3, 0, 0, 1, '2021-05-23 14:00:44', NULL);
INSERT INTO `tbl_scenario` VALUES (77, 1, 1, 71, '複数製品の同梱指定は可能ですか？', '誠に申し訳ございませんが、ご指定は承っておりません｡', '000400060006', 6, 3, 0, 0, 1, '2021-05-23 14:01:03', NULL);
INSERT INTO `tbl_scenario` VALUES (78, 1, 1, 71, 'その他', 'お手数ですがご質問内容を直接入力してください', '000400060007', 7, 3, 1, 0, 1, '2021-05-23 14:01:29', NULL);
INSERT INTO `tbl_scenario` VALUES (79, 1, 1, 23, 'オペレーターと話したい', '回答はお役に立ちましたか？', '00050002', 2, 2, 7, 0, 1, '2021-05-23 14:03:31', NULL);
INSERT INTO `tbl_scenario` VALUES (80, 1, 1, 23, '問合せ先電話番号が知りたい', '03-4455-7823\r\n\r\n【受付時間】\r\n月～金 9:00～17:00 祝日・お盆・年末年始を除く', '00050003', 3, 2, 3, 0, 1, '2021-05-23 14:04:25', NULL);
INSERT INTO `tbl_scenario` VALUES (82, 1, 1, 23, '回答はお役に立ちましたか？', '回答はお役に立ちましたか？', '00050004', 4, 2, 1, 0, 1, '2021-05-25 22:51:08', NULL);
INSERT INTO `tbl_scenario` VALUES (83, 4, 0, 0, 'タイトル', '内容内容内容内容', '0006', 6, 1, 1, 0, 1, '2021-06-30 02:32:34', NULL);

-- ----------------------------
-- Table structure for tbl_search
-- ----------------------------
DROP TABLE IF EXISTS `tbl_search`;
CREATE TABLE `tbl_search`  (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT ' ユーザーID',
  `search_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `search_cnt` int(11) NOT NULL DEFAULT 1,
  `search_time` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`search_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_setting`;
CREATE TABLE `tbl_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '会社ID',
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `key_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_setting
-- ----------------------------
INSERT INTO `tbl_setting` VALUES (1, 1, 'faq_date', '2021-01-01');
INSERT INTO `tbl_setting` VALUES (2, 1, 'anal_date', '2021-01-01');
INSERT INTO `tbl_setting` VALUES (3, 3, 'anal_date', '2021-05-31');
INSERT INTO `tbl_setting` VALUES (4, 3, 'faq_date', '2021-05-31');
INSERT INTO `tbl_setting` VALUES (5, 4, 'anal_date', '2021-05-31');
INSERT INTO `tbl_setting` VALUES (6, 4, 'faq_date', '2021-05-31');

-- ----------------------------
-- Table structure for tbl_staff
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff`;
CREATE TABLE `tbl_staff`  (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staff_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staff_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del_flag` int(1) NOT NULL DEFAULT 0,
  `create_date` datetime(0) NOT NULL,
  `update_flag` datetime(0) NOT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'login email',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'hashed login password',
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `work_start` int(1) NOT NULL DEFAULT 9 COMMENT '作業開始時間',
  `work_end` int(1) NOT NULL DEFAULT 17 COMMENT '作業終了時間',
  `wix_url` varchar(1025) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'WIX_URL',
  `wix_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'WIX_API_KEY',
  `wix_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'WIX_API_SECRET',
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime(0) NOT NULL,
  `updatedBy` int(11) NULL DEFAULT NULL,
  `updatedDtm` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
INSERT INTO `tbl_users` VALUES (1, 0, 'admin@example.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'システム管理者', '0000000000', 99, 7, 21, 'sapporo', 'fea1272d-3c03-4055-9d2c-a390c246c329', 'GsAniOm010qMsEPCtzrn3dhu0TnkeXQTRzWljbFqS0w', 0, 0, '2015-07-01 18:56:49', 1, '2021-05-20 08:09:39');
INSERT INTO `tbl_users` VALUES (2, 0, 'user1@example.com', '$2y$10$FLHUy.v2QKHRV3aG7OWx9eqiXagKUjNOp/KxQL1Sgd7ATU9ulFWGS', 'ユーザー1', '9890098900', 2, 0, 0, '', '', '', 0, 1, '2016-12-09 17:49:56', 1, '2021-05-20 03:36:38');
INSERT INTO `tbl_users` VALUES (3, 0, 'staff1@example.com', '$2y$10$rN5humYKvUMGmlkWOwrcguSkXjnP2X5SV0XOpkPLiR9bNYwqZpKva', 'スタッフ１', '9890098900', 2, 0, 0, '', '', '', 0, 1, '2016-12-09 17:50:22', 1, '2021-05-20 17:50:55');
INSERT INTO `tbl_users` VALUES (9, 0, 'mogawa@proz.jp', '$2y$10$V2XQX1ut4PKrUwvhJsM0/O4QF1lbtdkESfCFOOTYYzWIGBi/67Lg.', '小川', '0357844515', 2, 0, 0, '', '', '', 0, 1, '2021-05-24 09:31:38', NULL, NULL);
INSERT INTO `tbl_users` VALUES (10, 0, 'na@proz.jp', '$2y$10$XGM0mKe17STXPDoefmmrfuUr86TolP84W52SA6XkTmu.GDXHz9gia', 'na', '7015221100', 2, 0, 0, '', '', '', 0, 1, '2021-05-29 12:47:27', 1, '2021-06-18 09:21:34');

SET FOREIGN_KEY_CHECKS = 1;
