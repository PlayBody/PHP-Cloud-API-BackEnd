/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : devotion_db

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 12/10/2021 16:54:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advises
-- ----------------------------
DROP TABLE IF EXISTS `advises`;
CREATE TABLE `advises`  (
  `advise_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `teacher_id` int(6) NULL DEFAULT NULL,
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `movie_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`advise_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advises
-- ----------------------------
INSERT INTO `advises` VALUES (1, 2, 1, '質問があります。質問があります。質問があります。', 'アドバイスです。アドバイスです。アドバイスです。アドバ\r\nイスです。アドバイスです。アドバイスです。アドバイスで\r\nす。アドバイスです。アドバイスです。22222222222222', 'video.mp4', 1, '2021-09-29 00:24:40', '2021-09-30 04:44:30');
INSERT INTO `advises` VALUES (2, 3, 1, '質問があります。質問があります。質問があります。', NULL, NULL, 1, '2021-09-30 00:24:40', '2021-09-30 00:24:40');
INSERT INTO `advises` VALUES (3, 29, 1, '質問があります。質問があります。質問があります。', NULL, 'advise-video20211002174719090557.mp4', 1, '2021-10-02 17:47:22', '2021-10-02 17:47:22');
INSERT INTO `advises` VALUES (4, 29, 3, '333333333333333333333333333333333333333333333', NULL, 'advise-video20211002175321066230.mp4', 1, '2021-10-02 17:53:25', '2021-10-02 17:53:25');
INSERT INTO `advises` VALUES (5, 30, 2, '質問があります。質問があります。質問があります。', 'アドバイスです。アドバイスです。アドバイスです。アドバ\r\nイスです。アドバイスです。アドバイスです。アドバイスで\r\nす。アドバイスです。アドバイスです。22222222222222', 'advise-video20211002200214939283.mp4', 1, '2021-10-02 20:02:16', '2021-10-02 20:02:16');
INSERT INTO `advises` VALUES (6, 30, 3, 'asdasdasdasdasd', NULL, 'advise-video20211002200305846669.mp4', 1, '2021-10-02 20:03:08', '2021-10-02 20:03:08');
INSERT INTO `advises` VALUES (7, 31, 2, '1234', NULL, 'advise-video20211007063356698515.mp4', 1, '2021-10-07 06:33:58', '2021-10-07 06:33:58');

-- ----------------------------
-- Table structure for app_versions
-- ----------------------------
DROP TABLE IF EXISTS `app_versions`;
CREATE TABLE `app_versions`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `os_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `build_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_versions
-- ----------------------------
INSERT INTO `app_versions` VALUES (1, 'com.cloud.posandroid', 'android', '1.0.1', '3', '2021-08-13 19:13:55', '2021-08-13 19:13:59');
INSERT INTO `app_versions` VALUES (2, 'com.cloud.posandroid', 'android', '1.0.2', '4', '2021-08-16 23:48:14', '2021-08-16 23:48:16');
INSERT INTO `app_versions` VALUES (3, 'com.cloud.posandroid', 'android', '1.0.2', '10', '2021-08-20 15:28:02', '2021-08-28 18:28:05');
INSERT INTO `app_versions` VALUES (4, 'cloud.pos.appios', 'ios', '1.0.2', '4', '2021-09-01 08:22:21', '2021-09-01 08:22:21');

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances`  (
  `attendance_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NULL DEFAULT NULL,
  `staff_id` int(6) NOT NULL,
  `attendance_status` int(1) NULL DEFAULT NULL,
  `attendance_time` datetime(0) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES (1, 1, 6, 1, '2021-08-25 01:23:57', 1, '2021-08-25 01:23:57', '2021-08-25 01:23:57');
INSERT INTO `attendances` VALUES (2, 1, 6, 2, '2021-08-25 01:47:53', 1, '2021-08-25 01:47:53', '2021-08-25 01:47:53');
INSERT INTO `attendances` VALUES (3, 1, 6, 1, '2021-08-25 01:48:39', 1, '2021-08-25 01:48:39', '2021-08-25 01:48:39');
INSERT INTO `attendances` VALUES (4, 1, 6, 2, '2021-08-25 01:49:59', 1, '2021-08-25 01:49:59', '2021-08-25 01:49:59');
INSERT INTO `attendances` VALUES (5, 1, 6, 1, '2021-08-25 01:51:18', 1, '2021-08-25 01:51:18', '2021-08-25 01:51:18');
INSERT INTO `attendances` VALUES (6, 1, 6, 2, '2021-08-25 02:02:25', 1, '2021-08-25 02:02:25', '2021-08-25 02:02:25');
INSERT INTO `attendances` VALUES (7, 1, 6, 1, '2021-08-25 08:38:24', 1, '2021-08-25 08:38:24', '2021-08-25 08:38:24');
INSERT INTO `attendances` VALUES (8, 1, 2, 1, '2021-08-25 12:47:02', 1, '2021-08-25 12:47:02', '2021-08-25 12:47:02');
INSERT INTO `attendances` VALUES (9, 1, 7, 1, '2021-08-25 14:01:59', 1, '2021-08-25 14:01:59', '2021-08-25 14:01:59');
INSERT INTO `attendances` VALUES (10, 1, 2, 2, '2021-08-25 18:55:09', 1, '2021-08-25 18:55:09', '2021-08-25 18:55:09');
INSERT INTO `attendances` VALUES (11, 1, 2, 1, '2021-09-01 17:27:13', 1, '2021-09-01 17:27:13', '2021-09-01 17:27:13');
INSERT INTO `attendances` VALUES (12, 20, 22, 1, '2021-09-04 01:11:46', 1, '2021-09-04 01:11:46', '2021-09-04 01:11:46');
INSERT INTO `attendances` VALUES (13, 20, 22, 2, '2021-09-04 01:11:52', 1, '2021-09-04 01:11:52', '2021-09-04 01:11:52');
INSERT INTO `attendances` VALUES (14, 1, 2, 2, '2021-09-13 09:40:58', 1, '2021-09-13 09:40:58', '2021-09-13 09:40:58');
INSERT INTO `attendances` VALUES (15, 1, 2, 1, '2021-09-13 09:41:03', 1, '2021-09-13 09:41:03', '2021-09-13 09:41:03');
INSERT INTO `attendances` VALUES (16, 1, 2, 2, '2021-10-10 09:04:11', 1, '2021-10-10 09:04:11', '2021-10-10 09:04:11');
INSERT INTO `attendances` VALUES (17, 1, 2, 1, '2021-10-10 09:45:26', 1, '2021-10-10 09:45:26', '2021-10-10 09:45:26');
INSERT INTO `attendances` VALUES (18, 1, 2, 1, '2021-10-10 09:45:26', 1, '2021-10-10 09:45:26', '2021-10-10 09:45:26');
INSERT INTO `attendances` VALUES (19, 1, 2, 2, '2021-10-10 09:45:33', 1, '2021-10-10 09:45:33', '2021-10-10 09:45:33');
INSERT INTO `attendances` VALUES (20, 2, 2, 1, '2021-10-10 09:45:38', 1, '2021-10-10 09:45:38', '2021-10-10 09:45:38');
INSERT INTO `attendances` VALUES (21, 2, 2, 2, '2021-10-10 10:02:08', 1, '2021-10-10 10:02:08', '2021-10-10 10:02:08');
INSERT INTO `attendances` VALUES (22, 1, 2, 1, '2021-10-10 10:02:14', 1, '2021-10-10 10:02:14', '2021-10-10 10:02:14');
INSERT INTO `attendances` VALUES (23, 1, 2, 2, '2021-10-10 10:02:47', 1, '2021-10-10 10:02:47', '2021-10-10 10:02:47');
INSERT INTO `attendances` VALUES (24, 2, 2, 1, '2021-10-10 10:03:59', 1, '2021-10-10 10:03:59', '2021-10-10 10:03:59');
INSERT INTO `attendances` VALUES (25, 2, 2, 2, '2021-10-10 10:04:01', 1, '2021-10-10 10:04:01', '2021-10-10 10:04:01');
INSERT INTO `attendances` VALUES (26, 1, 2, 1, '2021-10-10 14:24:01', 1, '2021-10-10 14:24:01', '2021-10-10 14:24:01');

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
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `company_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_license` int(6) NULL DEFAULT NULL,
  `company_license_use` int(6) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 'Majori-Caグループ', 'conceptbar.info', 5, 1, 1, '2021-08-22 08:51:01', '2021-08-22 08:51:05');
INSERT INTO `companies` VALUES (2, '株式会社アスクリエイトりらくーかん', 'riraku-kan.jp', 5, 1, 1, '2021-08-23 10:40:25', '2021-08-23 10:40:27');
INSERT INTO `companies` VALUES (3, '株式会社アスクリエイトコリとりステーション＆手温', 'koritori.jp', 5, 1, 1, '2021-08-23 10:41:37', '2021-08-23 10:41:40');
INSERT INTO `companies` VALUES (4, 'Libero Entertainment ', 'libero-school.com', 5, 1, 1, '2021-08-23 10:42:19', '2021-08-23 10:42:21');

-- ----------------------------
-- Table structure for company_sites
-- ----------------------------
DROP TABLE IF EXISTS `company_sites`;
CREATE TABLE `company_sites`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `site_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company_sites
-- ----------------------------
INSERT INTO `company_sites` VALUES (1, 1, 'https://shop.conceptbar.info', '2021-10-01 01:06:19', '2021-10-01 01:06:22');
INSERT INTO `company_sites` VALUES (2, 2, 'https://ticket.riraku-kan.jp', '2021-10-01 01:06:38', '2021-10-01 01:06:40');
INSERT INTO `company_sites` VALUES (3, 3, 'https://ticket.koritori.jp', '2021-10-01 01:06:52', '2021-10-01 01:06:55');
INSERT INTO `company_sites` VALUES (4, 4, 'https://shop.libero-school.com', '2021-10-01 01:07:05', '2021-10-01 01:07:07');

-- ----------------------------
-- Table structure for connect_home_menus
-- ----------------------------
DROP TABLE IF EXISTS `connect_home_menus`;
CREATE TABLE `connect_home_menus`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_use` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of connect_home_menus
-- ----------------------------
INSERT INTO `connect_home_menus` VALUES (1, 1, '予約', 'connect_reserve', 1, '2021-10-10 10:12:58', '2021-10-10 10:35:17');
INSERT INTO `connect_home_menus` VALUES (2, 1, 'チェックイン', 'connect_check_in', 1, '2021-10-10 10:12:58', '2021-10-10 10:35:00');
INSERT INTO `connect_home_menus` VALUES (3, 1, 'メッセージ', 'connect_message', 1, '2021-10-10 10:12:58', '2021-10-10 10:12:58');
INSERT INTO `connect_home_menus` VALUES (4, 1, 'スタンプ', 'connect_coupon', 1, '2021-10-10 10:12:58', '2021-10-10 10:12:58');
INSERT INTO `connect_home_menus` VALUES (5, 1, '通販', 'connect_sale', 1, '2021-10-10 10:12:58', '2021-10-10 10:12:58');
INSERT INTO `connect_home_menus` VALUES (6, 1, '先生のアドバイス', 'connect_advise', 1, '2021-10-10 10:12:58', '2021-10-10 10:12:58');
INSERT INTO `connect_home_menus` VALUES (7, 1, '履歴', 'connect_history', 1, '2021-10-10 10:12:58', '2021-10-10 10:35:06');
INSERT INTO `connect_home_menus` VALUES (8, 1, '店舗一覧', 'connect_organ', 1, '2021-10-10 10:12:58', '2021-10-10 10:34:55');

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `coupon_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `coupon_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upper_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_date` date NULL DEFAULT NULL,
  `condition` int(1) NULL DEFAULT NULL,
  `use_organ_id` int(6) NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_use` int(1) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `user_id` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 1, 'クーポン', NULL, NULL, NULL, NULL, '2021-09-26', 1, 2, '○○○○○○\n○○○○○○\n○○○○○○\n○○○○○○', 1, 1, NULL, '2021-09-14 23:21:58', '2021-09-14 23:22:43');
INSERT INTO `coupons` VALUES (3, 1, '12323', NULL, NULL, NULL, NULL, '2021-09-16', 1, 0, '232323323\n', 1, 1, NULL, '2021-09-15 00:00:08', '2021-09-15 00:31:38');
INSERT INTO `coupons` VALUES (4, 1, '1234', '12345', '5', NULL, NULL, '2021-09-20', 1, 0, 'wwwwwwwwww\nwwwwwwwwwww\n', 1, 1, NULL, '2021-09-15 11:18:05', '2021-09-15 11:18:05');
INSERT INTO `coupons` VALUES (5, 1, '111', '44444444', '3', NULL, NULL, '2021-09-22', 1, 0, '444444444\n', 1, 1, 30, '2021-09-15 11:19:27', '2021-09-15 11:19:27');
INSERT INTO `coupons` VALUES (6, 1, 'fffffffff', 'ff12345', NULL, '2000', NULL, '2021-09-22', 1, 1, 'ffffffffffff\nffffffff', 1, 1, NULL, '2021-09-15 11:20:30', '2021-09-15 11:20:30');
INSERT INTO `coupons` VALUES (7, 1, '12', '12345', '2', NULL, '2000', '2021-09-19', 1, 1, 'weqweqwrsdfsdfsdfsdf', 1, 1, 30, '2021-09-15 14:53:24', '2021-09-15 14:53:24');
INSERT INTO `coupons` VALUES (8, 1, '112123123', '435345', NULL, '1234', NULL, '2021-09-20', 2, 0, '234234', 1, 1, NULL, '2021-09-15 14:54:11', '2021-09-15 14:54:11');

-- ----------------------------
-- Table structure for crm_user_device_tbl
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_device_tbl`;
CREATE TABLE `crm_user_device_tbl`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_user_device_tbl
-- ----------------------------
INSERT INTO `crm_user_device_tbl` VALUES (5, 6, '90ac89fb67150954', 0, '2021-08-11 18:49:21', '2021-08-11 18:49:21');

-- ----------------------------
-- Table structure for crm_user_tbl
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_tbl`;
CREATE TABLE `crm_user_tbl`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_user_tbl
-- ----------------------------
INSERT INTO `crm_user_tbl` VALUES (6, '777', '777', '777', '1', '1981-10-06', 0, '2021-08-11 18:49:21', '2021-08-11 18:49:21');

-- ----------------------------
-- Table structure for device_tokens
-- ----------------------------
DROP TABLE IF EXISTS `device_tokens`;
CREATE TABLE `device_tokens`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `user_type` int(1) NULL DEFAULT NULL COMMENT '1:staff, 2:user',
  `device_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_tokens
-- ----------------------------
INSERT INTO `device_tokens` VALUES (1, 1, 1, 'eMkF2AhwTgSIrEEZC7ysWm:APA91bGnS3VoeuubSlflUO84Nnxs5lRt66Z5dTm3qWYwGA9WxUDnJhdvGiy_d10gJW_Os_N6HHA26XZxxjWC8U1r2F0HOLUkD4oigY9rMqrY_lASCmefjd3cO4l8vnxgdeTwQDtmfuqU', '2021-09-24 09:57:31', '2021-09-24 23:48:25');
INSERT INTO `device_tokens` VALUES (2, 2, 1, 'fsIL4nv_QZW_sECMXoxBI9:APA91bFOIo67mtnTcaiirS24IexIXAPhHUyOwndSg0i_Y4WWyC1IC2g3Z-R46fyGlswXi90ArzY2N6goJydad9kH1-gXWb__Q8iTq5gIJlcnQq__CGqKhYN2FBfsQpHnwYCewkAomNxE', '2021-09-27 21:31:45', '2021-10-10 14:12:26');

-- ----------------------------
-- Table structure for fitnesses
-- ----------------------------
DROP TABLE IF EXISTS `fitnesses`;
CREATE TABLE `fitnesses`  (
  `fitness_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `group_id` int(6) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`fitness_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fitnesses
-- ----------------------------
INSERT INTO `fitnesses` VALUES (1, 1, 39, '21', '2021-10-10 11:34:10', '2021-10-10 11:34:10');
INSERT INTO `fitnesses` VALUES (2, 1, 39, 'sdsd', '2021-10-10 11:35:35', '2021-10-10 11:35:35');
INSERT INTO `fitnesses` VALUES (3, 1, NULL, 'sssss', '2021-10-10 11:36:01', '2021-10-10 11:36:01');

-- ----------------------------
-- Table structure for group_users
-- ----------------------------
DROP TABLE IF EXISTS `group_users`;
CREATE TABLE `group_users`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `group_id` int(6) NULL DEFAULT NULL,
  `user_id` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_users
-- ----------------------------
INSERT INTO `group_users` VALUES (49, 39, 3, '2021-09-08 22:41:16', '2021-09-08 22:41:16');
INSERT INTO `group_users` VALUES (51, 40, 2, '2021-09-08 23:15:17', '2021-09-08 23:15:17');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `group_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `creator_id` int(6) NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (39, 1, 1, 'testGroup2', 1, '2021-09-08 22:41:14', '2021-09-08 22:45:37');
INSERT INTO `groups` VALUES (40, 1, 1, 'フィットネス', 1, '2021-09-08 23:15:15', '2021-09-08 23:25:58');

-- ----------------------------
-- Table structure for history_table_menus
-- ----------------------------
DROP TABLE IF EXISTS `history_table_menus`;
CREATE TABLE `history_table_menus`  (
  `history_table_menu_id` int(6) NOT NULL AUTO_INCREMENT,
  `history_table_id` int(6) NULL DEFAULT NULL,
  `menu_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_price` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(6) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`history_table_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_table_menus
-- ----------------------------
INSERT INTO `history_table_menus` VALUES (1, 2, 'varition1', '3000', 2, 1, '2021-08-25 01:45:51', '2021-08-25 01:45:51');
INSERT INTO `history_table_menus` VALUES (2, 2, 'xd', '888', 2, 1, '2021-08-25 01:45:51', '2021-08-25 01:45:51');
INSERT INTO `history_table_menus` VALUES (3, 3, 'varition1', '3000', 2, 1, '2021-08-25 02:00:57', '2021-08-25 02:00:57');
INSERT INTO `history_table_menus` VALUES (4, 3, 'yyy', '900', 2, 1, '2021-08-25 02:00:57', '2021-08-25 02:00:57');
INSERT INTO `history_table_menus` VALUES (5, 4, 'varition1', '3000', 2, 1, '2021-08-25 02:01:05', '2021-08-25 02:01:05');
INSERT INTO `history_table_menus` VALUES (6, 4, '12', '122', 2, 1, '2021-08-25 02:01:05', '2021-08-25 02:01:05');
INSERT INTO `history_table_menus` VALUES (7, 4, '????', '85', 3, 1, '2021-08-25 02:01:05', '2021-08-25 02:01:05');
INSERT INTO `history_table_menus` VALUES (8, 5, 'varition1', '3000', 2, 1, '2021-08-25 02:01:13', '2021-08-25 02:01:13');
INSERT INTO `history_table_menus` VALUES (9, 5, 'menu1', '2000', 1, 1, '2021-08-25 02:01:13', '2021-08-25 02:01:13');
INSERT INTO `history_table_menus` VALUES (10, 5, 'ttt', '500', 2, 1, '2021-08-25 02:01:13', '2021-08-25 02:01:13');
INSERT INTO `history_table_menus` VALUES (11, 6, 'varition1', '3000', 1, 1, '2021-08-25 08:40:19', '2021-08-25 08:40:19');
INSERT INTO `history_table_menus` VALUES (12, 8, 'varition1', '3000', 4, 1, '2021-08-25 12:48:38', '2021-08-25 12:48:38');
INSERT INTO `history_table_menus` VALUES (13, 11, '30分コース', '4000', 2, 1, '2021-09-13 14:00:02', '2021-09-13 14:00:02');
INSERT INTO `history_table_menus` VALUES (14, 13, '30分コース', '4000', 3, 1, '2021-09-13 15:37:45', '2021-09-13 15:37:45');
INSERT INTO `history_table_menus` VALUES (15, 15, 'スタッフドリンク', '1000', 1, 1, '2021-09-13 15:39:03', '2021-09-13 15:39:03');
INSERT INTO `history_table_menus` VALUES (16, 17, '30分コース', '4000', 2, 1, '2021-09-13 15:49:00', '2021-09-13 15:49:00');
INSERT INTO `history_table_menus` VALUES (17, 18, 'm', '888', 2, 1, '2021-09-13 18:42:34', '2021-09-13 18:42:34');
INSERT INTO `history_table_menus` VALUES (18, 18, '555', '444', 1, 1, '2021-09-13 18:42:34', '2021-09-13 18:42:34');
INSERT INTO `history_table_menus` VALUES (19, 19, 'ありおバック', '3000', 1, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (20, 19, 'えまバック', '500', 2, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (21, 19, 'チェキ', '2000', 2, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (22, 19, 'スタッフドリンク', '1000', 1, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (23, 19, '30分コース', '4000', 2, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (24, 19, '60分コース', '6000', 2, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (25, 19, '555', '444', 2, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_table_menus` VALUES (26, 20, '555', '444', 3, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (27, 20, '60分コース', '6000', 2, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (28, 20, '30分コース', '4000', 3, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (29, 20, 'tyyuiio', '-1231', 2, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (30, 20, 'www', '980', 2, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (31, 20, 'uuuu', '300', 4, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_table_menus` VALUES (32, 22, '30分コース', '4000', 1, 1, '2021-09-26 19:49:26', '2021-09-26 19:49:26');
INSERT INTO `history_table_menus` VALUES (33, 23, '60分コース', '6000', 2, 1, '2021-09-26 20:38:51', '2021-09-26 20:38:51');
INSERT INTO `history_table_menus` VALUES (34, 23, 'えまバック', '500', 1, 1, '2021-09-26 20:38:51', '2021-09-26 20:38:51');
INSERT INTO `history_table_menus` VALUES (35, 23, 'ttt', '-2000', 2, 1, '2021-09-26 20:38:51', '2021-09-26 20:38:51');

-- ----------------------------
-- Table structure for history_tables
-- ----------------------------
DROP TABLE IF EXISTS `history_tables`;
CREATE TABLE `history_tables`  (
  `order_table_history_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NULL DEFAULT NULL,
  `table_position` int(255) NULL DEFAULT NULL,
  `table_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` double(10, 0) NULL DEFAULT NULL,
  `user_id` int(6) NULL DEFAULT NULL,
  `table_charge_amount` double(10, 0) NULL DEFAULT NULL,
  `set_amount` double(10, 0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `pay_method` int(1) NULL DEFAULT NULL,
  `person_count` int(6) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_table_history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_tables
-- ----------------------------
INSERT INTO `history_tables` VALUES (1, 1, 1, '席1', 3000, 1, 1000, 2000, '2021-08-25 01:44:23', '2021-08-25 01:44:28', NULL, NULL, 1, '2021-08-25 01:44:28', '2021-08-25 01:44:28');
INSERT INTO `history_tables` VALUES (2, 1, 1, '席1', 10776, 1, 1000, 2000, '2021-08-25 01:45:11', '2021-08-25 01:45:51', NULL, NULL, 1, '2021-08-25 01:45:51', '2021-08-25 01:45:51');
INSERT INTO `history_tables` VALUES (3, 1, 1, '席1', 10800, 1, 1000, 2000, '2021-08-25 01:51:26', '2021-08-25 02:00:57', NULL, NULL, 1, '2021-08-25 02:00:57', '2021-08-25 02:00:57');
INSERT INTO `history_tables` VALUES (4, 1, 2, '席2', 9499, 1, 1000, 2000, '2021-08-25 01:55:53', '2021-08-25 02:01:05', NULL, NULL, 1, '2021-08-25 02:01:05', '2021-08-25 02:01:05');
INSERT INTO `history_tables` VALUES (5, 1, 3, '席3', 12000, 1, 1000, 2000, '2021-08-25 01:52:38', '2021-08-25 02:01:13', NULL, NULL, 1, '2021-08-25 02:01:13', '2021-08-25 02:01:13');
INSERT INTO `history_tables` VALUES (6, 1, 5, '席5', 6000, 1, 1000, 2000, '2021-08-25 08:38:45', '2021-08-25 08:40:19', NULL, NULL, 1, '2021-08-25 08:40:19', '2021-08-25 08:40:19');
INSERT INTO `history_tables` VALUES (7, 1, 5, '席5', 3000, 1, 1000, 2000, '2021-08-25 11:24:59', '2021-08-25 11:25:02', NULL, NULL, 1, '2021-08-25 11:25:02', '2021-08-25 11:25:02');
INSERT INTO `history_tables` VALUES (8, 1, 1, '席1', 15000, 1, 1000, 2000, '2021-08-25 12:48:19', '2021-08-25 12:48:38', NULL, NULL, 1, '2021-08-25 12:48:38', '2021-08-25 12:48:38');
INSERT INTO `history_tables` VALUES (9, 1, 1, '席1', 2300, 2, 0, 2300, '2021-08-25 21:48:40', '2021-08-25 21:49:27', NULL, NULL, 1, '2021-08-25 21:49:27', '2021-08-25 21:49:27');
INSERT INTO `history_tables` VALUES (10, 1, 2, '席2', 2000, 1, 2000, 0, '2021-09-03 08:53:46', '2021-09-03 08:53:49', NULL, NULL, 1, '2021-09-03 08:53:49', '2021-09-03 08:53:49');
INSERT INTO `history_tables` VALUES (11, 1, 1, '席1', 15500, 1, 2300, 5200, '2021-09-13 11:54:49', '2021-09-13 14:00:02', NULL, NULL, 1, '2021-09-13 14:00:02', '2021-09-13 14:00:02');
INSERT INTO `history_tables` VALUES (12, 1, 2, '席2', 2300, 1, 2300, 0, '2021-09-13 15:06:45', '2021-09-13 15:36:35', NULL, NULL, 1, '2021-09-13 15:36:35', '2021-09-13 15:36:35');
INSERT INTO `history_tables` VALUES (13, 1, 2, '席2', 14300, 1, 2300, 0, '2021-09-13 15:37:28', '2021-09-13 15:37:45', 1, NULL, 1, '2021-09-13 15:37:45', '2021-09-13 15:37:45');
INSERT INTO `history_tables` VALUES (14, 1, 3, '席3', 2300, 1, 2300, 0, '2021-09-13 15:38:15', '2021-09-13 15:38:23', 1, NULL, 1, '2021-09-13 15:38:23', '2021-09-13 15:38:23');
INSERT INTO `history_tables` VALUES (15, 1, 3, '席3', 3300, 1, 2300, 0, '2021-09-13 15:38:48', '2021-09-13 15:39:03', 2, NULL, 1, '2021-09-13 15:39:03', '2021-09-13 15:39:03');
INSERT INTO `history_tables` VALUES (16, 1, 2, '席2', 2300, 1, 2300, 0, '2021-09-13 15:46:58', '2021-09-13 15:47:02', 1, NULL, 1, '2021-09-13 15:47:02', '2021-09-13 15:47:02');
INSERT INTO `history_tables` VALUES (17, 1, 6, '席6', 10300, 1, 2300, 0, '2021-09-13 15:48:50', '2021-09-13 15:49:00', 1, 9, 1, '2021-09-13 15:49:00', '2021-09-13 15:49:00');
INSERT INTO `history_tables` VALUES (18, 1, 2, '席2', 4520, 1, 2300, 0, '2021-09-13 18:41:43', '2021-09-13 18:42:34', 1, 1, 1, '2021-09-13 18:42:34', '2021-09-13 18:42:34');
INSERT INTO `history_tables` VALUES (19, 1, 1, '12334', 72488, 1, 2300, 40300, '2021-09-25 01:45:29', '2021-09-25 17:17:24', 1, 1, 1, '2021-09-25 17:17:24', '2021-09-25 17:17:24');
INSERT INTO `history_tables` VALUES (20, 1, 2, '席2', 45230, 1, 2300, 16900, '2021-09-25 15:10:52', '2021-09-25 21:53:15', 1, 1, 1, '2021-09-25 21:53:15', '2021-09-25 21:53:15');
INSERT INTO `history_tables` VALUES (21, 1, 2, '席2', 2300, 1, 2300, 0, '2021-09-25 21:57:29', '2021-09-25 21:57:54', 2, 1, 1, '2021-09-25 21:57:54', '2021-09-25 21:57:54');
INSERT INTO `history_tables` VALUES (22, 1, 1, '12334', 60900, 1, 2300, 54600, '2021-09-25 22:43:17', '2021-09-26 19:49:26', 1, 1, 1, '2021-09-26 19:49:26', '2021-09-26 19:49:26');
INSERT INTO `history_tables` VALUES (23, 1, 19, '席19', 22500, 1, 2300, 11700, '2021-09-26 16:00:13', '2021-09-26 20:38:51', 1, 1, 1, '2021-09-26 20:38:51', '2021-09-26 20:38:51');
INSERT INTO `history_tables` VALUES (24, 1, 1, '12334', 686100, 1, 2300, 683800, '2021-09-27 22:43:00', '2021-10-08 21:50:18', 1, 1, 1, '2021-10-08 21:50:18', '2021-10-08 21:50:18');

-- ----------------------------
-- Table structure for menu_reviews
-- ----------------------------
DROP TABLE IF EXISTS `menu_reviews`;
CREATE TABLE `menu_reviews`  (
  `menu_review_id` int(6) NOT NULL AUTO_INCREMENT,
  `menu_id` int(6) NULL DEFAULT NULL,
  `user_id` int(6) NULL DEFAULT NULL,
  `service_review` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price_review` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `review_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_review_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_reviews
-- ----------------------------
INSERT INTO `menu_reviews` VALUES (1, 2, 31, '3', '4', 'ssssssssssssssss', '2021-10-07 08:00:11', '2021-10-07 08:12:27');
INSERT INTO `menu_reviews` VALUES (2, 7, 31, '4', '5', 'の他（ご意見・ご要望）', '2021-10-07 08:12:43', '2021-10-07 08:12:49');

-- ----------------------------
-- Table structure for menu_variations
-- ----------------------------
DROP TABLE IF EXISTS `menu_variations`;
CREATE TABLE `menu_variations`  (
  `variation_id` int(6) NOT NULL AUTO_INCREMENT,
  `menu_id` int(6) NULL DEFAULT NULL,
  `variation_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variation_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variation_back_staff_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variation_back_staff` int(6) NULL DEFAULT NULL,
  `variation_back_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`variation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_variations
-- ----------------------------
INSERT INTO `menu_variations` VALUES (5, 2, 'ありおバック', '3000', 'staff', 13, '100', 1, '2021-08-25 01:41:51', '2021-09-05 21:37:03');
INSERT INTO `menu_variations` VALUES (15, 2, 'えまバック', '500', 'staff', 17, '100', 1, '2021-09-01 11:37:00', '2021-09-05 21:37:10');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `menu_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NULL DEFAULT NULL,
  `menu_type` int(1) NULL DEFAULT NULL COMMENT '1:pos, 2:crm',
  `menu_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_tax` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_week` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_start_time` time(0) NULL DEFAULT NULL,
  `menu_end_time` time(0) NULL DEFAULT NULL,
  `menu_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT 0,
  `sort_no` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (2, 1, NULL, 'チェキ', NULL, '2000', '500', '10', NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-08-25 01:26:32', '2021-09-01 11:37:03');
INSERT INTO `menus` VALUES (5, 1, NULL, 'スタッフドリンク', NULL, '1000', '10', '10', NULL, NULL, NULL, NULL, NULL, 1, 2, '2021-08-31 20:56:58', '2021-09-05 21:36:54');
INSERT INTO `menus` VALUES (7, 1, 2, '30分コース', '選ばれたマッサージ師による30分コース。\nお手軽にご利用いただけます。', '4000', NULL, NULL, 'Wed', '18:52:00', '18:53:00', 'お手軽に体験していただけるので初めて\nご利用の方、時間がない方に人気です。\n足を重点的にほぐしてほしいなど、一人\n一人のご要望に合わせた対応も可能です。', NULL, 1, 3, '2021-09-12 18:55:16', '2021-09-12 18:55:16');
INSERT INTO `menus` VALUES (18, 1, 2, '60分コース', '111選ばれたマッサージ師による60分コース。\nしっかりとコリをほぐします・', '6000', NULL, NULL, 'Fri', '15:00:00', '16:00:00', 'asasdasdasdasdasdasdasd\njwdfd', 'menus-20210913163238190010.jpg', 1, 4, '2021-09-13 16:17:57', '2021-09-13 16:32:38');
INSERT INTO `menus` VALUES (22, 1, 2, '555', '444', '444', NULL, NULL, 'Thu', '00:00:00', '00:00:00', NULL, NULL, 1, 5, '2021-09-13 17:38:16', '2021-09-13 17:38:16');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `message_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `company_id` int(6) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '1:fromUser, 2:toUser',
  `read_flag` int(1) NULL DEFAULT NULL COMMENT '1:read',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_infos
-- ----------------------------
DROP TABLE IF EXISTS `oauth_infos`;
CREATE TABLE `oauth_infos`  (
  `id` int(6) NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_infos
-- ----------------------------
INSERT INTO `oauth_infos` VALUES (1, '1030504326049-j24gppuapc8n2r3u515vg4oqioh1l2ue.apps.googleusercontent.com', 'iM9UWn7pwf0ziKSAgCjxYe_Y', '1//048usnRe3bfsYCgYIARAAGAQSNwF-L9IrfgzMs1e9qaCMCF2dtuh3WuL9pvkiHFM_xk2-DSUEP_jJbin1Vvqj3Fr5JayV4I11Cak', '2021-09-24 02:55:29', '2021-09-24 02:55:32');

-- ----------------------------
-- Table structure for organ_amounts
-- ----------------------------
DROP TABLE IF EXISTS `organ_amounts`;
CREATE TABLE `organ_amounts`  (
  `organ_amount_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NULL DEFAULT NULL,
  `amount_date` date NULL DEFAULT NULL,
  `amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`organ_amount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organ_menus
-- ----------------------------
DROP TABLE IF EXISTS `organ_menus`;
CREATE TABLE `organ_menus`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu_id` int(6) NULL DEFAULT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organ_settings
-- ----------------------------
DROP TABLE IF EXISTS `organ_settings`;
CREATE TABLE `organ_settings`  (
  `setting_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NULL DEFAULT NULL,
  `table_count` int(6) NULL DEFAULT NULL,
  `menu_count` int(6) NULL DEFAULT NULL,
  `set_time` time(0) NULL DEFAULT NULL,
  `set_amount` double(10, 0) NULL DEFAULT NULL,
  `table_amount` double(10, 0) NULL DEFAULT NULL,
  `active_start_time` time(0) NULL DEFAULT NULL,
  `active_end_time` time(0) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organs
-- ----------------------------
DROP TABLE IF EXISTS `organs`;
CREATE TABLE `organs`  (
  `organ_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `organ_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_count` int(6) NULL DEFAULT NULL,
  `menu_count` int(6) NULL DEFAULT NULL,
  `set_time` time(0) NULL DEFAULT NULL,
  `set_amount` double(10, 0) NULL DEFAULT NULL,
  `table_amount` double(10, 0) NULL DEFAULT NULL,
  `active_start_time` time(0) NULL DEFAULT NULL,
  `active_end_time` time(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_balance` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_business_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close_business_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`organ_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organs
-- ----------------------------
INSERT INTO `organs` VALUES (1, 1, 'Majori-Ca1', 'organs-20210908190448323026.jpg', 22, NULL, '00:30:00', 1300, 2300, '19:00:00', '05:30:00', '0640804', '12', '札幌市中央区南4条西3丁目1-1第3グリーンビル4階', '12345646\nqweertttreef', '0112069868', '36.4871', '139.5408', '100', '6200', '', '', 1, '2021-08-16 23:16:30', '2021-10-10 10:46:06');
INSERT INTO `organs` VALUES (2, 1, 'Shangri-La 2nd', 'organs-20210908170917179359.jpg', NULL, NULL, '00:30:00', 1300, 2300, '19:00:00', '02:00:00', '06408045', '124', '124', NULL, '', '36.4871', '137.5408', NULL, NULL, '', '', 1, '2021-08-22 01:03:10', '2021-09-08 17:09:17');
INSERT INTO `organs` VALUES (3, 1, 'Selfi-yu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-23 10:59:15', '2021-08-23 10:59:18');
INSERT INTO `organs` VALUES (4, 2, '伏見店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-23 11:09:27', '2021-08-23 11:09:29');
INSERT INTO `organs` VALUES (9, 2, '金山店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:11:25', '2021-08-25 01:11:25');
INSERT INTO `organs` VALUES (10, 2, '名古屋駅前店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:11:36', '2021-08-25 01:11:36');
INSERT INTO `organs` VALUES (11, 2, '名駅３丁目店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:11:47', '2021-08-25 01:11:47');
INSERT INTO `organs` VALUES (12, 2, 'トヨタ前山店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:11:56', '2021-08-25 01:11:56');
INSERT INTO `organs` VALUES (14, 3, 'アピタ長久手店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:12:24', '2021-08-25 01:12:24');
INSERT INTO `organs` VALUES (15, 3, 'ギャラリエアピタ知立店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:12:33', '2021-08-25 01:12:33');
INSERT INTO `organs` VALUES (16, 3, 'マーサ21店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:12:44', '2021-08-25 01:12:44');
INSERT INTO `organs` VALUES (17, 3, 'JR名古屋駅地下店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:12:55', '2021-08-25 01:12:55');
INSERT INTO `organs` VALUES (18, 3, 'イオンモール木曽川店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:13:04', '2021-08-25 01:13:04');
INSERT INTO `organs` VALUES (19, 3, 'モレラ岐阜店', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:13:18', '2021-08-25 01:13:18');
INSERT INTO `organs` VALUES (20, 4, '名古屋名駅校', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:13:40', '2021-08-25 01:13:40');
INSERT INTO `organs` VALUES (21, 4, '津島・愛西校', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:13:52', '2021-08-25 01:13:52');
INSERT INTO `organs` VALUES (22, 4, '今池校', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:14:00', '2021-08-25 01:14:00');

-- ----------------------------
-- Table structure for question_favorites
-- ----------------------------
DROP TABLE IF EXISTS `question_favorites`;
CREATE TABLE `question_favorites`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_favorites
-- ----------------------------
INSERT INTO `question_favorites` VALUES (1, 1, '1234', '12314\n', 1, '2021-09-15 23:08:39', '2021-09-15 23:08:39');
INSERT INTO `question_favorites` VALUES (2, 1, '98765432', 'yt54327654362436236234623464wegtaw3tfgaw\nasdasdfasdfasdfasdfasdfsdfasdf\nasdfasdfasdfasdfasdfasdfasdf', 1, '2021-09-15 23:25:19', '2021-09-15 23:25:19');
INSERT INTO `question_favorites` VALUES (3, 1, '334', '234234\n234', 1, '2021-09-15 23:32:06', '2021-09-15 23:32:06');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `question_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `question_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer_id` int(6) NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 3, '新規会員登録について', '新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。', 18, '新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。', 1, '2021-09-30 05:04:32', '2021-09-30 05:04:36');
INSERT INTO `questions` VALUES (2, 4, '友達紹介 クーポンについて', '新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。\r\n新規会員登録ができません。新規会員登録ができません。', NULL, NULL, 1, '2021-09-30 05:05:32', '2021-09-30 05:05:32');
INSERT INTO `questions` VALUES (3, 30, '新規会員登録について', '新規会員登録ができません。新規会員登録ができません。\n新規会員登録ができません。新規会員登録ができません。\n新規会員登録ができません。新規会員登録ができません。\n新規会員登録ができません。新規会員登録ができません。\n', NULL, NULL, 1, '2021-10-03 10:43:41', '2021-10-03 10:43:41');
INSERT INTO `questions` VALUES (4, 30, 'sdddddddddd', 'dddddddddddddd\ndddddddddddddddddddddddd\nddddddddddddd', NULL, NULL, 1, '2021-10-03 10:44:11', '2021-10-03 10:44:11');
INSERT INTO `questions` VALUES (6, 30, 'sssssss', 'ssssssssssssssssssss', NULL, NULL, 1, '2021-10-03 10:46:05', '2021-10-03 10:46:05');
INSERT INTO `questions` VALUES (7, 31, 'ssss', 'ss', NULL, NULL, 1, '2021-10-06 18:40:08', '2021-10-06 18:40:08');

-- ----------------------------
-- Table structure for reserve_menus
-- ----------------------------
DROP TABLE IF EXISTS `reserve_menus`;
CREATE TABLE `reserve_menus`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `reserve_id` int(6) NULL DEFAULT NULL,
  `menu_id` int(6) NULL DEFAULT NULL,
  `menu_variation_id` int(6) NULL DEFAULT NULL,
  `menu_price` int(10) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserve_menus
-- ----------------------------
INSERT INTO `reserve_menus` VALUES (7, 46, 5, NULL, NULL, '2021-09-11 23:04:28', '2021-09-11 23:04:28');
INSERT INTO `reserve_menus` VALUES (8, 47, 2, NULL, NULL, '2021-09-11 23:05:34', '2021-09-11 23:05:34');
INSERT INTO `reserve_menus` VALUES (9, 47, 5, NULL, NULL, '2021-09-11 23:05:34', '2021-09-11 23:05:34');
INSERT INTO `reserve_menus` VALUES (10, 53, 2, NULL, NULL, '2021-09-30 16:08:56', '2021-09-30 16:08:56');
INSERT INTO `reserve_menus` VALUES (11, 54, 2, NULL, NULL, '2021-09-30 16:13:53', '2021-09-30 16:13:53');
INSERT INTO `reserve_menus` VALUES (12, 55, 5, NULL, NULL, '2021-09-30 16:49:10', '2021-09-30 16:49:10');
INSERT INTO `reserve_menus` VALUES (13, 55, 2, NULL, NULL, '2021-09-30 16:49:10', '2021-09-30 16:49:10');
INSERT INTO `reserve_menus` VALUES (14, 56, 2, NULL, NULL, '2021-09-30 20:58:08', '2021-09-30 20:58:08');
INSERT INTO `reserve_menus` VALUES (15, 56, 7, NULL, NULL, '2021-09-30 20:58:08', '2021-09-30 20:58:08');
INSERT INTO `reserve_menus` VALUES (16, 57, 22, NULL, NULL, '2021-09-30 20:59:39', '2021-09-30 20:59:39');
INSERT INTO `reserve_menus` VALUES (17, 57, 7, NULL, NULL, '2021-09-30 20:59:39', '2021-09-30 20:59:39');
INSERT INTO `reserve_menus` VALUES (18, 58, 2, NULL, NULL, '2021-09-30 23:28:02', '2021-09-30 23:28:02');
INSERT INTO `reserve_menus` VALUES (19, 58, 7, NULL, NULL, '2021-09-30 23:28:02', '2021-09-30 23:28:02');
INSERT INTO `reserve_menus` VALUES (20, 59, 18, NULL, NULL, '2021-09-30 23:29:09', '2021-09-30 23:29:09');
INSERT INTO `reserve_menus` VALUES (21, 59, 7, NULL, NULL, '2021-09-30 23:29:09', '2021-09-30 23:29:09');
INSERT INTO `reserve_menus` VALUES (22, 60, 2, NULL, NULL, '2021-09-30 23:30:06', '2021-09-30 23:30:06');
INSERT INTO `reserve_menus` VALUES (23, 61, 5, NULL, NULL, '2021-09-30 23:30:49', '2021-09-30 23:30:49');
INSERT INTO `reserve_menus` VALUES (26, 66, 2, NULL, NULL, '2021-09-30 23:33:48', '2021-09-30 23:33:48');
INSERT INTO `reserve_menus` VALUES (27, 67, 2, NULL, 50, '2021-10-03 10:48:39', '2021-10-03 10:48:39');
INSERT INTO `reserve_menus` VALUES (28, 68, 5, NULL, 50, '2021-10-05 18:57:52', '2021-10-05 18:57:52');
INSERT INTO `reserve_menus` VALUES (29, 69, 2, NULL, 5000, '2021-10-07 05:27:09', '2021-10-07 05:27:09');
INSERT INTO `reserve_menus` VALUES (30, 70, 2, NULL, NULL, '2021-10-10 16:12:49', '2021-10-10 16:12:49');

-- ----------------------------
-- Table structure for reserves
-- ----------------------------
DROP TABLE IF EXISTS `reserves`;
CREATE TABLE `reserves`  (
  `reserve_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `staff_id` int(6) NULL DEFAULT NULL,
  `reserve_time` datetime(0) NULL DEFAULT NULL,
  `reserve_exit_time` datetime(0) NULL DEFAULT NULL,
  `reserve_status` int(1) NULL DEFAULT NULL COMMENT '1:reserve 2:complete',
  `visible` int(11) NULL DEFAULT NULL,
  `coupon_id` int(6) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`reserve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserves
-- ----------------------------
INSERT INTO `reserves` VALUES (46, 12, 1, NULL, '2021-09-15 02:00:00', NULL, NULL, 1, NULL, '2021-09-11 23:04:28', '2021-09-11 23:04:28');
INSERT INTO `reserves` VALUES (47, 12, 1, 15, '2021-09-12 20:00:00', NULL, NULL, 1, NULL, '2021-09-11 23:05:34', '2021-09-11 23:05:34');
INSERT INTO `reserves` VALUES (48, 12, 1, 15, '2021-09-14 02:00:00', NULL, NULL, 1, NULL, '2021-09-11 23:21:04', '2021-09-11 23:21:04');
INSERT INTO `reserves` VALUES (49, 13, 1, NULL, '2021-09-12 21:00:00', NULL, NULL, 1, NULL, '2021-09-11 23:28:49', '2021-09-11 23:28:49');
INSERT INTO `reserves` VALUES (50, 13, 1, 15, '2021-09-16 02:00:00', NULL, NULL, 1, NULL, '2021-09-12 00:05:32', '2021-09-12 00:05:32');
INSERT INTO `reserves` VALUES (51, 13, 1, 15, '2021-09-17 05:00:00', NULL, NULL, 1, NULL, '2021-09-12 00:09:31', '2021-09-12 00:09:31');
INSERT INTO `reserves` VALUES (52, 13, 1, 15, '2021-09-15 02:00:00', NULL, NULL, 1, NULL, '2021-09-12 00:17:47', '2021-09-12 00:17:47');
INSERT INTO `reserves` VALUES (53, 19, 1, NULL, '2021-10-01 19:00:00', NULL, NULL, 1, NULL, '2021-09-30 16:08:56', '2021-09-30 16:08:56');
INSERT INTO `reserves` VALUES (54, 20, 1, NULL, '2021-09-30 19:00:00', NULL, NULL, 1, NULL, '2021-09-30 16:13:53', '2021-09-30 16:13:53');
INSERT INTO `reserves` VALUES (55, 21, 1, NULL, '2021-10-01 20:00:00', NULL, NULL, 1, NULL, '2021-09-30 16:49:10', '2021-09-30 16:49:10');
INSERT INTO `reserves` VALUES (56, 24, 1, NULL, '2021-10-02 20:00:00', NULL, 1, 1, NULL, '2021-09-30 20:58:07', '2021-09-30 20:58:07');
INSERT INTO `reserves` VALUES (57, 24, 1, NULL, '2021-10-01 20:00:00', NULL, 1, 1, 5, '2021-09-30 20:59:39', '2021-09-30 20:59:39');
INSERT INTO `reserves` VALUES (58, 28, 1, 7, '2021-10-01 22:00:00', NULL, 1, 1, NULL, '2021-09-30 23:28:02', '2021-09-30 23:28:02');
INSERT INTO `reserves` VALUES (59, 28, 1, 17, '2021-10-02 21:00:00', NULL, 1, 1, NULL, '2021-09-30 23:29:09', '2021-09-30 23:29:09');
INSERT INTO `reserves` VALUES (60, 28, 1, NULL, '2021-09-30 21:00:00', NULL, 1, 1, NULL, '2021-09-30 23:30:06', '2021-09-30 23:30:06');
INSERT INTO `reserves` VALUES (61, 28, 1, NULL, '2021-10-02 20:00:00', NULL, 1, 1, NULL, '2021-09-30 23:30:49', '2021-09-30 23:30:49');
INSERT INTO `reserves` VALUES (62, 28, 1, NULL, '2021-10-02 20:00:00', NULL, 1, 1, NULL, '2021-09-30 23:30:51', '2021-09-30 23:30:51');
INSERT INTO `reserves` VALUES (63, 28, 1, NULL, '2021-10-02 20:00:00', NULL, 1, 1, NULL, '2021-09-30 23:31:02', '2021-09-30 23:31:02');
INSERT INTO `reserves` VALUES (64, 28, 1, NULL, '2021-10-02 20:00:00', NULL, 1, 1, NULL, '2021-09-30 23:32:25', '2021-09-30 23:32:25');
INSERT INTO `reserves` VALUES (66, 31, 1, NULL, '2021-10-01 20:00:00', NULL, 1, 1, NULL, '2021-09-30 23:33:48', '2021-09-30 23:33:48');
INSERT INTO `reserves` VALUES (67, 31, 1, NULL, '2021-10-04 20:00:00', NULL, 2, 1, NULL, '2021-10-03 10:48:39', '2021-10-03 10:48:39');
INSERT INTO `reserves` VALUES (68, 31, 1, NULL, '2021-10-06 20:00:00', NULL, 1, 1, NULL, '2021-10-05 18:57:52', '2021-10-05 18:57:52');
INSERT INTO `reserves` VALUES (69, 31, 1, NULL, '2021-10-08 20:00:00', NULL, 1, 1, NULL, '2021-10-07 05:27:09', '2021-10-07 05:27:09');
INSERT INTO `reserves` VALUES (70, 33, 1, NULL, '2021-10-13 20:00:00', NULL, 1, 1, NULL, '2021-10-10 16:12:49', '2021-10-10 16:12:49');

-- ----------------------------
-- Table structure for setting_count_shifts
-- ----------------------------
DROP TABLE IF EXISTS `setting_count_shifts`;
CREATE TABLE `setting_count_shifts`  (
  `id` int(6) NOT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `from_time` datetime(0) NULL DEFAULT NULL,
  `to_time` datetime(0) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_count_shifts
-- ----------------------------
INSERT INTO `setting_count_shifts` VALUES (44, 1, '2021-09-01 01:00:00', '2021-09-01 03:00:00', 2, '2021-09-01 01:06:05', '2021-09-01 01:06:23');
INSERT INTO `setting_count_shifts` VALUES (45, 22, '2021-09-14 19:30:00', '2021-09-14 21:00:00', 1, '2021-09-13 19:49:27', '2021-09-13 19:49:27');
INSERT INTO `setting_count_shifts` VALUES (46, 22, '2021-09-21 19:30:00', '2021-09-21 21:00:00', 1, '2021-09-13 19:50:07', '2021-09-13 19:50:07');
INSERT INTO `setting_count_shifts` VALUES (47, 20, '2021-09-19 19:00:00', '2021-09-19 22:00:00', 2, '2021-09-13 19:52:49', '2021-09-13 19:52:49');
INSERT INTO `setting_count_shifts` VALUES (48, 1, '2021-09-16 19:30:00', '2021-09-16 20:30:00', 1, '2021-09-13 22:17:42', '2021-09-13 22:17:42');
INSERT INTO `setting_count_shifts` VALUES (49, 17, '2021-09-23 16:00:00', '2021-09-23 20:00:00', 3, '2021-09-22 23:03:13', '2021-09-23 15:51:22');
INSERT INTO `setting_count_shifts` VALUES (52, 17, '2021-09-24 10:00:00', '2021-09-24 20:00:00', 2, '2021-09-23 12:36:55', '2021-09-23 15:50:42');
INSERT INTO `setting_count_shifts` VALUES (53, 17, '2021-09-26 10:00:00', '2021-09-26 20:00:00', 3, '2021-09-23 12:38:04', '2021-09-23 15:52:19');
INSERT INTO `setting_count_shifts` VALUES (54, 17, '2021-09-27 10:00:00', '2021-09-27 20:00:00', 2, '2021-09-23 12:38:20', '2021-09-23 15:52:31');
INSERT INTO `setting_count_shifts` VALUES (55, 17, '2021-09-28 10:00:00', '2021-09-28 20:00:00', 2, '2021-09-23 12:38:48', '2021-09-23 15:53:01');
INSERT INTO `setting_count_shifts` VALUES (56, 17, '2021-09-29 10:00:00', '2021-09-29 20:00:00', 2, '2021-09-23 12:39:03', '2021-09-23 15:53:06');
INSERT INTO `setting_count_shifts` VALUES (58, 11, '2021-09-22 15:00:00', '2021-09-22 20:00:00', 1, '2021-09-23 14:11:35', '2021-09-23 14:11:35');
INSERT INTO `setting_count_shifts` VALUES (59, 11, '2021-09-24 15:00:00', '2021-09-24 20:00:00', 1, '2021-09-23 14:12:01', '2021-09-23 14:12:15');
INSERT INTO `setting_count_shifts` VALUES (60, 11, '2021-09-26 13:00:00', '2021-09-26 23:00:00', 1, '2021-09-23 14:12:56', '2021-09-23 14:12:56');
INSERT INTO `setting_count_shifts` VALUES (61, 17, '2021-09-23 10:00:00', '2021-09-23 20:00:00', 2, '2021-09-23 15:51:40', '2021-09-23 15:51:40');
INSERT INTO `setting_count_shifts` VALUES (62, 17, '2021-09-30 10:00:00', '2021-09-30 20:00:00', 2, '2021-09-23 15:53:17', '2021-09-23 15:53:17');
INSERT INTO `setting_count_shifts` VALUES (70, 18, '2021-09-25 10:00:00', '2021-09-25 21:00:00', 5, '2021-09-23 16:58:41', '2021-09-23 16:58:41');
INSERT INTO `setting_count_shifts` VALUES (71, 18, '2021-09-26 10:00:00', '2021-09-26 21:00:00', 5, '2021-09-23 16:58:56', '2021-09-23 16:58:56');
INSERT INTO `setting_count_shifts` VALUES (73, 18, '2021-09-27 18:00:00', '2021-09-27 21:00:00', 2, '2021-09-23 16:59:30', '2021-09-23 17:00:15');
INSERT INTO `setting_count_shifts` VALUES (75, 18, '2021-09-27 10:00:00', '2021-09-27 11:00:00', 2, '2021-09-23 17:00:29', '2021-09-23 17:00:29');
INSERT INTO `setting_count_shifts` VALUES (76, 18, '2021-09-27 11:00:00', '2021-09-27 18:00:00', 4, '2021-09-23 17:00:45', '2021-09-23 17:00:45');
INSERT INTO `setting_count_shifts` VALUES (90, 1, '2021-10-02 20:30:00', '2021-10-02 22:00:00', 5, '2021-09-23 19:14:20', '2021-09-23 19:32:27');
INSERT INTO `setting_count_shifts` VALUES (91, 1, '2021-10-02 22:00:00', '2021-10-02 23:00:00', 5, '2021-09-23 19:14:25', '2021-09-23 19:16:23');
INSERT INTO `setting_count_shifts` VALUES (97, 1, '2021-10-02 19:00:00', '2021-10-02 23:59:00', 5, '2021-09-23 19:25:36', '2021-09-23 19:35:57');
INSERT INTO `setting_count_shifts` VALUES (106, 1, '2021-10-03 19:00:00', '2021-10-03 23:59:00', 4, '2021-09-23 19:36:26', '2021-09-23 19:36:26');
INSERT INTO `setting_count_shifts` VALUES (108, 4, '2021-09-25 12:00:00', '2021-09-25 23:00:00', 4, '2021-09-23 20:58:15', '2021-09-23 20:58:31');
INSERT INTO `setting_count_shifts` VALUES (109, 4, '2021-09-25 10:00:00', '2021-09-25 12:00:00', 2, '2021-09-23 20:58:44', '2021-09-23 20:58:44');
INSERT INTO `setting_count_shifts` VALUES (114, 17, '2021-09-25 18:00:00', '2021-09-25 20:00:00', 2, '2021-09-25 00:49:23', '2021-09-25 00:50:16');
INSERT INTO `setting_count_shifts` VALUES (115, 17, '2021-09-25 12:00:00', '2021-09-25 17:00:00', 3, '2021-09-25 00:49:50', '2021-09-25 00:50:38');
INSERT INTO `setting_count_shifts` VALUES (116, 18, '2021-09-28 18:00:00', '2021-09-28 21:00:00', 2, '2021-09-25 12:33:59', '2021-09-25 12:34:43');
INSERT INTO `setting_count_shifts` VALUES (117, 18, '2021-09-28 11:00:00', '2021-09-28 18:00:00', 4, '2021-09-25 12:34:27', '2021-09-25 12:35:07');
INSERT INTO `setting_count_shifts` VALUES (118, 18, '2021-09-28 10:00:00', '2021-09-28 11:00:00', 2, '2021-09-25 12:35:19', '2021-09-25 12:35:19');
INSERT INTO `setting_count_shifts` VALUES (119, 18, '2021-09-29 16:00:00', '2021-09-29 21:00:00', 2, '2021-09-25 12:36:04', '2021-09-25 12:36:04');
INSERT INTO `setting_count_shifts` VALUES (120, 18, '2021-09-29 12:00:00', '2021-09-29 16:00:00', 3, '2021-09-25 12:40:37', '2021-09-25 12:40:37');
INSERT INTO `setting_count_shifts` VALUES (121, 18, '2021-09-29 10:00:00', '2021-09-29 12:00:00', 2, '2021-09-25 12:40:46', '2021-09-25 12:40:46');
INSERT INTO `setting_count_shifts` VALUES (122, 1, '2021-10-01 00:00:00', '2021-10-01 03:00:00', 5, '2021-09-29 14:53:40', '2021-09-29 14:53:40');
INSERT INTO `setting_count_shifts` VALUES (123, 1, '2021-10-02 00:00:00', '2021-10-02 03:00:00', 5, '2021-09-29 14:54:00', '2021-09-29 14:54:00');
INSERT INTO `setting_count_shifts` VALUES (124, 1, '2021-10-03 00:00:00', '2021-10-03 03:00:00', 5, '2021-09-29 14:54:53', '2021-09-29 14:54:53');
INSERT INTO `setting_count_shifts` VALUES (125, 1, '2021-10-04 00:00:00', '2021-10-04 02:00:00', 4, '2021-09-29 14:55:36', '2021-09-29 14:55:36');
INSERT INTO `setting_count_shifts` VALUES (126, 1, '2021-10-06 19:00:00', '2021-10-06 23:59:00', 4, '2021-10-02 22:04:56', '2021-10-02 22:04:56');
INSERT INTO `setting_count_shifts` VALUES (127, 1, '2021-10-07 00:00:00', '2021-10-07 02:00:00', 4, '2021-10-02 22:05:22', '2021-10-02 22:05:22');
INSERT INTO `setting_count_shifts` VALUES (128, 1, '2021-10-07 19:00:00', '2021-10-07 23:59:00', 4, '2021-10-02 22:06:14', '2021-10-02 22:06:14');
INSERT INTO `setting_count_shifts` VALUES (129, 1, '2021-10-08 00:00:00', '2021-10-08 02:00:00', 4, '2021-10-02 22:06:25', '2021-10-02 22:06:25');
INSERT INTO `setting_count_shifts` VALUES (130, 1, '2021-10-08 19:00:00', '2021-10-08 23:59:00', 5, '2021-10-02 22:06:43', '2021-10-02 22:06:43');
INSERT INTO `setting_count_shifts` VALUES (131, 1, '2021-10-09 00:00:00', '2021-10-09 03:00:00', 5, '2021-10-02 22:06:58', '2021-10-02 22:06:58');
INSERT INTO `setting_count_shifts` VALUES (132, 1, '2021-10-09 19:00:00', '2021-10-09 23:59:00', 5, '2021-10-02 22:07:13', '2021-10-02 22:07:13');
INSERT INTO `setting_count_shifts` VALUES (133, 1, '2021-10-10 00:00:00', '2021-10-10 03:00:00', 5, '2021-10-02 22:07:26', '2021-10-02 22:07:26');
INSERT INTO `setting_count_shifts` VALUES (134, 1, '2021-10-04 19:00:00', '2021-10-04 23:59:00', 4, '2021-10-02 22:08:24', '2021-10-02 22:08:24');
INSERT INTO `setting_count_shifts` VALUES (135, 1, '2021-10-05 00:00:00', '2021-10-05 02:00:00', 4, '2021-10-02 22:08:43', '2021-10-02 22:08:43');
INSERT INTO `setting_count_shifts` VALUES (136, 1, '2021-10-10 19:00:00', '2021-10-10 23:59:00', 4, '2021-10-02 22:09:44', '2021-10-02 22:09:44');
INSERT INTO `setting_count_shifts` VALUES (137, 1, '2021-10-11 00:00:00', '2021-10-11 02:00:00', 4, '2021-10-02 22:10:00', '2021-10-02 22:10:00');
INSERT INTO `setting_count_shifts` VALUES (140, 18, '2021-10-03 13:00:00', '2021-10-03 19:00:00', 4, '2021-10-03 17:19:17', '2021-10-03 17:22:09');
INSERT INTO `setting_count_shifts` VALUES (141, 18, '2021-10-03 11:00:00', '2021-10-03 13:00:00', 3, '2021-10-03 17:19:43', '2021-10-03 17:21:58');
INSERT INTO `setting_count_shifts` VALUES (142, 18, '2021-10-03 19:00:00', '2021-10-03 21:00:00', 2, '2021-10-03 17:20:01', '2021-10-03 17:20:01');
INSERT INTO `setting_count_shifts` VALUES (143, 18, '2021-10-04 19:00:00', '2021-10-04 21:00:00', 2, '2021-10-03 17:20:13', '2021-10-03 17:20:13');
INSERT INTO `setting_count_shifts` VALUES (144, 18, '2021-10-05 19:00:00', '2021-10-05 21:00:00', 2, '2021-10-03 17:20:20', '2021-10-03 17:20:20');
INSERT INTO `setting_count_shifts` VALUES (145, 18, '2021-10-06 19:00:00', '2021-10-06 21:00:00', 2, '2021-10-03 17:20:27', '2021-10-03 17:20:27');
INSERT INTO `setting_count_shifts` VALUES (146, 18, '2021-10-07 19:00:00', '2021-10-07 21:00:00', 2, '2021-10-03 17:20:35', '2021-10-03 17:20:35');
INSERT INTO `setting_count_shifts` VALUES (147, 18, '2021-10-08 19:00:00', '2021-10-08 21:00:00', 2, '2021-10-03 17:20:43', '2021-10-03 17:20:43');
INSERT INTO `setting_count_shifts` VALUES (148, 18, '2021-10-09 19:00:00', '2021-10-09 21:00:00', 2, '2021-10-03 17:20:52', '2021-10-03 17:20:52');
INSERT INTO `setting_count_shifts` VALUES (149, 18, '2021-10-09 12:00:00', '2021-10-09 19:00:00', 4, '2021-10-03 17:21:07', '2021-10-03 17:21:07');
INSERT INTO `setting_count_shifts` VALUES (150, 18, '2021-10-09 10:00:00', '2021-10-09 11:00:00', 2, '2021-10-03 17:21:18', '2021-10-03 17:21:18');
INSERT INTO `setting_count_shifts` VALUES (151, 18, '2021-10-09 11:00:00', '2021-10-09 12:00:00', 3, '2021-10-03 17:21:39', '2021-10-03 17:21:39');
INSERT INTO `setting_count_shifts` VALUES (152, 18, '2021-10-03 10:00:00', '2021-10-03 11:00:00', 2, '2021-10-03 17:22:16', '2021-10-03 17:22:16');
INSERT INTO `setting_count_shifts` VALUES (153, 18, '2021-10-04 12:00:00', '2021-10-04 19:00:00', 3, '2021-10-03 17:22:40', '2021-10-03 17:22:40');
INSERT INTO `setting_count_shifts` VALUES (154, 18, '2021-10-05 12:00:00', '2021-10-05 19:00:00', 3, '2021-10-03 17:22:52', '2021-10-03 17:22:52');
INSERT INTO `setting_count_shifts` VALUES (155, 18, '2021-10-06 12:00:00', '2021-10-06 19:00:00', 3, '2021-10-03 17:23:00', '2021-10-03 17:23:14');
INSERT INTO `setting_count_shifts` VALUES (156, 18, '2021-10-07 12:00:00', '2021-10-07 19:00:00', 3, '2021-10-03 17:23:10', '2021-10-03 17:23:10');
INSERT INTO `setting_count_shifts` VALUES (157, 18, '2021-10-08 12:00:00', '2021-10-08 19:00:00', 3, '2021-10-03 17:23:21', '2021-10-03 17:23:21');
INSERT INTO `setting_count_shifts` VALUES (158, 18, '2021-10-04 10:00:00', '2021-10-04 12:00:00', 2, '2021-10-03 17:23:28', '2021-10-03 17:23:28');
INSERT INTO `setting_count_shifts` VALUES (159, 18, '2021-10-05 10:00:00', '2021-10-05 12:00:00', 2, '2021-10-03 17:23:36', '2021-10-03 17:23:36');
INSERT INTO `setting_count_shifts` VALUES (160, 18, '2021-10-06 10:00:00', '2021-10-06 12:00:00', 2, '2021-10-03 17:23:42', '2021-10-03 17:23:42');
INSERT INTO `setting_count_shifts` VALUES (161, 18, '2021-10-07 10:00:00', '2021-10-07 12:00:00', 2, '2021-10-03 17:23:50', '2021-10-03 17:23:50');
INSERT INTO `setting_count_shifts` VALUES (162, 18, '2021-10-08 10:00:00', '2021-10-08 12:00:00', 2, '2021-10-03 17:23:56', '2021-10-03 17:23:56');
INSERT INTO `setting_count_shifts` VALUES (163, 18, '2021-10-10 19:00:00', '2021-10-10 21:00:00', 2, '2021-10-03 17:24:10', '2021-10-03 17:24:10');
INSERT INTO `setting_count_shifts` VALUES (164, 18, '2021-10-10 10:00:00', '2021-10-10 11:00:00', 2, '2021-10-03 17:24:25', '2021-10-03 17:24:25');
INSERT INTO `setting_count_shifts` VALUES (165, 18, '2021-10-10 11:00:00', '2021-10-10 13:00:00', 3, '2021-10-03 17:24:40', '2021-10-03 17:24:51');
INSERT INTO `setting_count_shifts` VALUES (166, 18, '2021-10-10 13:00:00', '2021-10-10 19:00:00', 4, '2021-10-03 17:25:03', '2021-10-03 17:25:03');
INSERT INTO `setting_count_shifts` VALUES (167, 18, '2021-10-11 10:00:00', '2021-10-11 21:00:00', 2, '2021-10-03 17:25:22', '2021-10-03 17:25:22');
INSERT INTO `setting_count_shifts` VALUES (168, 18, '2021-10-12 10:00:00', '2021-10-12 21:00:00', 2, '2021-10-03 17:25:30', '2021-10-03 17:25:30');
INSERT INTO `setting_count_shifts` VALUES (169, 18, '2021-10-13 10:00:00', '2021-10-13 21:00:00', 2, '2021-10-03 17:25:39', '2021-10-03 17:25:39');
INSERT INTO `setting_count_shifts` VALUES (170, 18, '2021-10-14 10:00:00', '2021-10-14 21:00:00', 2, '2021-10-03 17:25:54', '2021-10-03 17:25:54');
INSERT INTO `setting_count_shifts` VALUES (171, 18, '2021-10-15 10:00:00', '2021-10-15 21:00:00', 2, '2021-10-03 17:26:04', '2021-10-03 17:26:04');
INSERT INTO `setting_count_shifts` VALUES (172, 18, '2021-10-16 19:00:00', '2021-10-16 21:00:00', 2, '2021-10-03 17:26:12', '2021-10-03 17:26:12');
INSERT INTO `setting_count_shifts` VALUES (173, 18, '2021-10-16 12:00:00', '2021-10-16 19:00:00', 4, '2021-10-03 17:26:29', '2021-10-03 17:26:29');
INSERT INTO `setting_count_shifts` VALUES (174, 18, '2021-10-16 10:00:00', '2021-10-16 12:00:00', 3, '2021-10-03 17:26:36', '2021-10-03 17:26:36');
INSERT INTO `setting_count_shifts` VALUES (175, 18, '2021-10-17 19:00:00', '2021-10-17 21:00:00', 2, '2021-10-03 17:26:51', '2021-10-03 17:26:51');
INSERT INTO `setting_count_shifts` VALUES (176, 18, '2021-10-18 10:00:00', '2021-10-18 21:00:00', 2, '2021-10-03 17:27:03', '2021-10-03 17:27:52');
INSERT INTO `setting_count_shifts` VALUES (177, 18, '2021-10-19 10:00:00', '2021-10-19 21:00:00', 2, '2021-10-03 17:27:12', '2021-10-03 17:28:02');
INSERT INTO `setting_count_shifts` VALUES (178, 18, '2021-10-20 10:00:00', '2021-10-20 21:00:00', 2, '2021-10-03 17:27:20', '2021-10-03 17:28:12');
INSERT INTO `setting_count_shifts` VALUES (179, 18, '2021-10-21 10:00:00', '2021-10-21 21:00:00', 2, '2021-10-03 17:27:26', '2021-10-03 17:28:19');
INSERT INTO `setting_count_shifts` VALUES (180, 18, '2021-10-22 10:00:00', '2021-10-22 21:00:00', 2, '2021-10-03 17:27:33', '2021-10-03 17:28:27');
INSERT INTO `setting_count_shifts` VALUES (181, 18, '2021-10-23 19:00:00', '2021-10-23 21:00:00', 2, '2021-10-03 17:27:39', '2021-10-03 17:27:39');
INSERT INTO `setting_count_shifts` VALUES (182, 18, '2021-10-17 10:00:00', '2021-10-17 13:00:00', 3, '2021-10-03 17:28:39', '2021-10-03 17:28:39');
INSERT INTO `setting_count_shifts` VALUES (183, 18, '2021-10-23 10:00:00', '2021-10-23 13:00:00', 3, '2021-10-03 17:28:47', '2021-10-03 17:28:47');
INSERT INTO `setting_count_shifts` VALUES (184, 18, '2021-10-17 13:00:00', '2021-10-17 19:00:00', 5, '2021-10-03 17:28:58', '2021-10-03 17:28:58');
INSERT INTO `setting_count_shifts` VALUES (185, 18, '2021-10-23 13:00:00', '2021-10-23 19:00:00', 5, '2021-10-03 17:29:10', '2021-10-03 17:29:10');
INSERT INTO `setting_count_shifts` VALUES (186, 18, '2021-10-25 10:00:00', '2021-10-25 21:00:00', 3, '2021-10-03 17:29:34', '2021-10-03 17:29:34');
INSERT INTO `setting_count_shifts` VALUES (187, 18, '2021-10-26 10:00:00', '2021-10-26 21:00:00', 2, '2021-10-03 17:29:44', '2021-10-03 17:29:44');
INSERT INTO `setting_count_shifts` VALUES (188, 18, '2021-10-27 10:00:00', '2021-10-27 21:00:00', 3, '2021-10-03 17:29:54', '2021-10-03 17:29:54');
INSERT INTO `setting_count_shifts` VALUES (189, 18, '2021-10-28 10:00:00', '2021-10-28 21:00:00', 2, '2021-10-03 17:30:01', '2021-10-03 17:30:01');
INSERT INTO `setting_count_shifts` VALUES (190, 18, '2021-10-29 10:00:00', '2021-10-29 21:00:00', 2, '2021-10-03 17:30:10', '2021-10-03 17:30:10');
INSERT INTO `setting_count_shifts` VALUES (191, 18, '2021-10-24 10:00:00', '2021-10-24 11:00:00', 2, '2021-10-03 17:30:16', '2021-10-03 17:30:16');
INSERT INTO `setting_count_shifts` VALUES (192, 18, '2021-10-30 10:00:00', '2021-10-30 11:00:00', 2, '2021-10-03 17:30:20', '2021-10-03 17:30:20');
INSERT INTO `setting_count_shifts` VALUES (193, 18, '2021-10-24 11:00:00', '2021-10-24 19:00:00', 4, '2021-10-03 17:30:31', '2021-10-03 17:30:31');
INSERT INTO `setting_count_shifts` VALUES (194, 18, '2021-10-30 11:00:00', '2021-10-30 21:00:00', 4, '2021-10-03 17:30:47', '2021-10-03 17:30:47');
INSERT INTO `setting_count_shifts` VALUES (195, 18, '2021-10-24 19:00:00', '2021-10-24 21:00:00', 1, '2021-10-03 17:30:56', '2021-10-03 17:30:56');
INSERT INTO `setting_count_shifts` VALUES (196, 18, '2021-10-31 10:00:00', '2021-10-31 21:00:00', 4, '2021-10-03 17:31:06', '2021-10-03 17:31:06');
INSERT INTO `setting_count_shifts` VALUES (197, 18, '2021-09-30 10:00:00', '2021-09-30 21:00:00', 4, '2021-10-03 17:31:25', '2021-10-03 17:31:25');
INSERT INTO `setting_count_shifts` VALUES (198, 18, '2021-10-01 10:00:00', '2021-10-01 21:00:00', 3, '2021-10-03 17:31:32', '2021-10-03 17:31:32');
INSERT INTO `setting_count_shifts` VALUES (199, 18, '2021-10-02 10:00:00', '2021-10-02 21:00:00', 5, '2021-10-03 17:31:41', '2021-10-03 17:31:41');
INSERT INTO `setting_count_shifts` VALUES (200, 1, '2021-10-11 19:00:00', '2021-10-11 23:59:00', 4, '2021-10-04 19:27:25', '2021-10-04 19:27:25');
INSERT INTO `setting_count_shifts` VALUES (201, 1, '2021-10-12 00:00:00', '2021-10-12 02:00:00', 4, '2021-10-04 19:27:37', '2021-10-04 19:27:37');
INSERT INTO `setting_count_shifts` VALUES (202, 1, '2021-10-13 19:00:00', '2021-10-13 23:59:00', 4, '2021-10-04 19:28:38', '2021-10-04 19:28:38');
INSERT INTO `setting_count_shifts` VALUES (203, 1, '2021-10-14 00:00:00', '2021-10-14 02:00:00', 4, '2021-10-04 19:28:50', '2021-10-04 19:28:50');
INSERT INTO `setting_count_shifts` VALUES (204, 1, '2021-10-14 19:00:00', '2021-10-14 23:59:00', 4, '2021-10-04 19:29:05', '2021-10-04 19:29:05');
INSERT INTO `setting_count_shifts` VALUES (205, 1, '2021-10-15 00:00:00', '2021-10-15 02:00:00', 4, '2021-10-04 19:29:20', '2021-10-04 19:29:20');
INSERT INTO `setting_count_shifts` VALUES (206, 1, '2021-10-15 19:00:00', '2021-10-15 23:59:00', 5, '2021-10-04 19:29:37', '2021-10-04 19:29:37');
INSERT INTO `setting_count_shifts` VALUES (207, 1, '2021-10-16 00:00:00', '2021-10-16 03:00:00', 5, '2021-10-04 19:29:56', '2021-10-04 19:29:56');
INSERT INTO `setting_count_shifts` VALUES (208, 1, '2021-10-16 19:00:00', '2021-10-16 23:59:00', 5, '2021-10-04 19:30:31', '2021-10-04 19:30:31');
INSERT INTO `setting_count_shifts` VALUES (209, 1, '2021-10-17 00:00:00', '2021-10-17 03:00:00', 5, '2021-10-04 19:30:45', '2021-10-04 19:30:45');
INSERT INTO `setting_count_shifts` VALUES (210, 1, '2021-10-17 19:00:00', '2021-10-17 23:59:00', 4, '2021-10-04 19:30:59', '2021-10-04 19:30:59');
INSERT INTO `setting_count_shifts` VALUES (211, 1, '2021-10-18 00:00:00', '2021-10-18 02:00:00', 4, '2021-10-04 19:31:07', '2021-10-04 19:31:07');
INSERT INTO `setting_count_shifts` VALUES (212, 1, '2021-10-18 19:00:00', '2021-10-18 23:59:00', 4, '2021-10-04 19:31:16', '2021-10-04 19:31:16');
INSERT INTO `setting_count_shifts` VALUES (213, 1, '2021-10-19 00:00:00', '2021-10-19 02:00:00', 4, '2021-10-04 19:31:24', '2021-10-04 19:31:24');
INSERT INTO `setting_count_shifts` VALUES (214, 1, '2021-10-20 19:00:00', '2021-10-20 23:59:00', 4, '2021-10-04 19:31:45', '2021-10-04 19:31:45');
INSERT INTO `setting_count_shifts` VALUES (215, 1, '2021-10-21 00:00:00', '2021-10-21 02:00:00', 4, '2021-10-04 19:32:01', '2021-10-04 19:32:01');
INSERT INTO `setting_count_shifts` VALUES (216, 1, '2021-10-21 19:00:00', '2021-10-21 23:59:00', 4, '2021-10-04 19:32:26', '2021-10-04 19:32:26');
INSERT INTO `setting_count_shifts` VALUES (217, 1, '2021-10-22 00:00:00', '2021-10-22 02:00:00', 4, '2021-10-04 19:32:55', '2021-10-04 19:32:55');
INSERT INTO `setting_count_shifts` VALUES (218, 1, '2021-10-22 19:00:00', '2021-10-22 23:59:00', 5, '2021-10-04 19:33:13', '2021-10-04 19:33:13');
INSERT INTO `setting_count_shifts` VALUES (219, 1, '2021-10-23 00:00:00', '2021-10-23 03:00:00', 5, '2021-10-04 19:33:32', '2021-10-04 19:33:32');
INSERT INTO `setting_count_shifts` VALUES (220, 1, '2021-10-23 19:00:00', '2021-10-23 23:59:00', 5, '2021-10-04 19:34:00', '2021-10-04 19:34:00');
INSERT INTO `setting_count_shifts` VALUES (221, 1, '2021-10-24 00:00:00', '2021-10-24 03:00:00', 5, '2021-10-04 19:34:10', '2021-10-04 19:34:10');
INSERT INTO `setting_count_shifts` VALUES (222, 1, '2021-10-24 19:00:00', '2021-10-24 23:59:00', 4, '2021-10-04 19:34:29', '2021-10-04 19:34:29');
INSERT INTO `setting_count_shifts` VALUES (223, 1, '2021-10-25 00:00:00', '2021-10-25 02:00:00', 4, '2021-10-04 19:34:35', '2021-10-04 19:34:35');
INSERT INTO `setting_count_shifts` VALUES (224, 1, '2021-10-25 19:00:00', '2021-10-25 23:59:00', 4, '2021-10-04 19:34:44', '2021-10-04 19:34:44');
INSERT INTO `setting_count_shifts` VALUES (225, 1, '2021-10-26 00:00:00', '2021-10-26 02:00:00', 4, '2021-10-04 19:34:51', '2021-10-04 19:34:51');
INSERT INTO `setting_count_shifts` VALUES (226, 1, '2021-10-27 19:00:00', '2021-10-27 23:59:00', 4, '2021-10-04 19:35:13', '2021-10-04 19:35:13');
INSERT INTO `setting_count_shifts` VALUES (227, 1, '2021-10-28 00:00:00', '2021-10-28 02:00:00', 4, '2021-10-04 19:35:33', '2021-10-04 19:35:33');
INSERT INTO `setting_count_shifts` VALUES (228, 1, '2021-10-28 19:00:00', '2021-10-28 23:59:00', 4, '2021-10-04 19:35:47', '2021-10-04 19:35:47');
INSERT INTO `setting_count_shifts` VALUES (229, 1, '2021-10-29 00:00:00', '2021-10-29 02:00:00', 4, '2021-10-04 19:36:07', '2021-10-04 19:36:07');
INSERT INTO `setting_count_shifts` VALUES (230, 1, '2021-10-29 00:00:00', '2021-10-29 02:00:00', 4, '2021-10-04 19:36:08', '2021-10-04 19:36:08');
INSERT INTO `setting_count_shifts` VALUES (231, 1, '2021-10-29 19:00:00', '2021-10-29 23:59:00', 5, '2021-10-04 19:36:56', '2021-10-04 19:36:56');
INSERT INTO `setting_count_shifts` VALUES (232, 1, '2021-10-30 00:00:00', '2021-10-30 03:00:00', 5, '2021-10-04 19:37:07', '2021-10-04 19:37:07');
INSERT INTO `setting_count_shifts` VALUES (233, 1, '2021-10-30 19:00:00', '2021-10-30 23:59:00', 5, '2021-10-04 19:37:32', '2021-10-04 19:37:32');
INSERT INTO `setting_count_shifts` VALUES (234, 1, '2021-10-31 00:00:00', '2021-10-31 03:00:00', 5, '2021-10-04 19:37:46', '2021-10-04 19:37:46');
INSERT INTO `setting_count_shifts` VALUES (235, 1, '2021-10-31 19:00:00', '2021-10-31 23:59:00', 4, '2021-10-04 19:37:56', '2021-10-04 19:37:56');
INSERT INTO `setting_count_shifts` VALUES (236, 1, '2021-11-01 00:00:00', '2021-11-01 02:00:00', 4, '2021-10-04 19:38:05', '2021-10-04 19:38:05');
INSERT INTO `setting_count_shifts` VALUES (237, 1, '2021-10-01 18:30:00', '2021-10-01 23:59:00', 5, '2021-10-04 19:40:34', '2021-10-04 19:40:43');
INSERT INTO `setting_count_shifts` VALUES (238, 1, '2021-10-02 18:30:00', '2021-10-02 23:59:00', 5, '2021-10-04 19:40:54', '2021-10-04 19:40:54');
INSERT INTO `setting_count_shifts` VALUES (239, 1, '2021-10-03 18:30:00', '2021-10-03 23:59:00', 4, '2021-10-04 19:41:36', '2021-10-04 19:41:36');
INSERT INTO `setting_count_shifts` VALUES (240, 1, '2021-10-04 18:30:00', '2021-10-04 23:59:00', 4, '2021-10-04 19:41:48', '2021-10-04 19:41:48');
INSERT INTO `setting_count_shifts` VALUES (241, 1, '2021-10-06 18:30:00', '2021-10-06 23:59:00', 4, '2021-10-04 19:41:56', '2021-10-04 19:41:56');
INSERT INTO `setting_count_shifts` VALUES (242, 1, '2021-10-07 18:30:00', '2021-10-07 23:59:00', 4, '2021-10-04 19:42:07', '2021-10-04 19:42:07');
INSERT INTO `setting_count_shifts` VALUES (243, 1, '2021-10-08 18:30:00', '2021-10-08 23:59:00', 5, '2021-10-04 19:42:16', '2021-10-04 19:42:16');
INSERT INTO `setting_count_shifts` VALUES (244, 1, '2021-10-09 18:30:00', '2021-10-09 23:59:00', 5, '2021-10-04 19:42:25', '2021-10-04 19:42:25');
INSERT INTO `setting_count_shifts` VALUES (245, 1, '2021-10-10 18:30:00', '2021-10-10 23:59:00', 4, '2021-10-04 19:42:36', '2021-10-04 19:42:36');
INSERT INTO `setting_count_shifts` VALUES (246, 1, '2021-10-11 18:30:00', '2021-10-11 23:59:00', 4, '2021-10-04 19:42:43', '2021-10-04 19:42:43');
INSERT INTO `setting_count_shifts` VALUES (247, 1, '2021-10-13 18:30:00', '2021-10-13 23:59:00', 4, '2021-10-04 19:42:50', '2021-10-04 19:42:50');
INSERT INTO `setting_count_shifts` VALUES (248, 1, '2021-10-14 18:30:00', '2021-10-14 23:59:00', 4, '2021-10-04 19:42:57', '2021-10-04 19:42:57');
INSERT INTO `setting_count_shifts` VALUES (249, 1, '2021-10-15 18:30:00', '2021-10-15 23:59:00', 5, '2021-10-04 19:43:06', '2021-10-04 19:43:14');
INSERT INTO `setting_count_shifts` VALUES (250, 1, '2021-10-16 18:30:00', '2021-10-16 23:59:00', 5, '2021-10-04 19:43:21', '2021-10-04 19:43:21');
INSERT INTO `setting_count_shifts` VALUES (251, 1, '2021-10-17 18:30:00', '2021-10-17 23:59:00', 4, '2021-10-04 19:43:32', '2021-10-04 19:43:32');
INSERT INTO `setting_count_shifts` VALUES (252, 1, '2021-10-18 18:30:00', '2021-10-18 23:59:00', 4, '2021-10-04 19:43:43', '2021-10-04 19:43:43');
INSERT INTO `setting_count_shifts` VALUES (253, 1, '2021-10-20 18:30:00', '2021-10-20 23:59:00', 4, '2021-10-04 19:43:50', '2021-10-04 19:43:50');
INSERT INTO `setting_count_shifts` VALUES (254, 1, '2021-10-21 18:30:00', '2021-10-21 23:59:00', 4, '2021-10-04 19:43:58', '2021-10-04 19:43:58');
INSERT INTO `setting_count_shifts` VALUES (255, 1, '2021-10-22 18:30:00', '2021-10-22 23:59:00', 5, '2021-10-04 19:44:06', '2021-10-04 19:44:06');
INSERT INTO `setting_count_shifts` VALUES (256, 1, '2021-10-23 18:30:00', '2021-10-23 23:59:00', 5, '2021-10-04 19:44:14', '2021-10-04 19:44:14');
INSERT INTO `setting_count_shifts` VALUES (257, 1, '2021-10-24 18:30:00', '2021-10-24 23:59:00', 4, '2021-10-04 19:44:31', '2021-10-04 19:44:36');
INSERT INTO `setting_count_shifts` VALUES (258, 1, '2021-10-25 18:30:00', '2021-10-25 23:59:00', 4, '2021-10-04 19:44:44', '2021-10-04 19:44:44');
INSERT INTO `setting_count_shifts` VALUES (259, 1, '2021-10-27 18:30:00', '2021-10-27 23:59:00', 4, '2021-10-04 19:44:52', '2021-10-04 19:44:52');
INSERT INTO `setting_count_shifts` VALUES (260, 1, '2021-10-28 18:30:00', '2021-10-28 23:59:00', 4, '2021-10-04 19:44:58', '2021-10-04 19:44:58');
INSERT INTO `setting_count_shifts` VALUES (261, 1, '2021-10-29 18:30:00', '2021-10-29 23:59:00', 5, '2021-10-04 19:45:06', '2021-10-04 19:45:06');
INSERT INTO `setting_count_shifts` VALUES (262, 1, '2021-10-30 18:30:00', '2021-10-30 23:59:00', 5, '2021-10-04 19:45:13', '2021-10-04 19:45:13');
INSERT INTO `setting_count_shifts` VALUES (263, 1, '2021-10-31 18:30:00', '2021-10-31 23:59:00', 4, '2021-10-04 19:45:25', '2021-10-04 19:45:25');
INSERT INTO `setting_count_shifts` VALUES (264, 4, '2021-10-06 16:00:00', '2021-10-06 18:00:00', 5, '2021-10-05 22:29:44', '2021-10-05 22:31:27');
INSERT INTO `setting_count_shifts` VALUES (265, 4, '2021-10-06 19:00:00', '2021-10-06 23:00:00', 3, '2021-10-05 22:30:48', '2021-10-05 22:36:48');
INSERT INTO `setting_count_shifts` VALUES (267, 4, '2021-10-06 14:00:00', '2021-10-06 16:00:00', 4, '2021-10-05 22:36:08', '2021-10-05 22:37:26');
INSERT INTO `setting_count_shifts` VALUES (268, 4, '2021-10-07 20:00:00', '2021-10-07 23:00:00', 2, '2021-10-05 22:37:50', '2021-10-05 22:38:28');
INSERT INTO `setting_count_shifts` VALUES (269, 4, '2021-10-06 10:00:00', '2021-10-06 23:00:00', 3, '2021-10-05 22:58:50', '2021-10-05 22:58:50');
INSERT INTO `setting_count_shifts` VALUES (270, 4, '2021-10-07 17:00:00', '2021-10-07 23:00:00', 5, '2021-10-05 22:59:09', '2021-10-05 22:59:32');
INSERT INTO `setting_count_shifts` VALUES (271, 4, '2021-10-07 10:00:00', '2021-10-07 17:00:00', 3, '2021-10-05 22:59:49', '2021-10-05 22:59:49');
INSERT INTO `setting_count_shifts` VALUES (272, 4, '2021-10-09 20:00:00', '2021-10-09 23:00:00', 3, '2021-10-05 22:59:58', '2021-10-05 23:01:21');
INSERT INTO `setting_count_shifts` VALUES (273, 4, '2021-10-08 20:00:00', '2021-10-08 23:00:00', 2, '2021-10-05 23:00:10', '2021-10-05 23:00:10');
INSERT INTO `setting_count_shifts` VALUES (274, 4, '2021-10-08 15:00:00', '2021-10-08 20:00:00', 5, '2021-10-05 23:00:24', '2021-10-05 23:00:24');
INSERT INTO `setting_count_shifts` VALUES (275, 4, '2021-10-08 12:00:00', '2021-10-08 15:00:00', 3, '2021-10-05 23:00:50', '2021-10-05 23:00:50');
INSERT INTO `setting_count_shifts` VALUES (276, 4, '2021-10-08 10:00:00', '2021-10-08 12:00:00', 2, '2021-10-05 23:01:07', '2021-10-05 23:01:07');
INSERT INTO `setting_count_shifts` VALUES (277, 4, '2021-10-09 16:00:00', '2021-10-09 20:00:00', 5, '2021-10-05 23:02:46', '2021-10-05 23:02:46');
INSERT INTO `setting_count_shifts` VALUES (278, 4, '2021-10-09 12:00:00', '2021-10-09 16:00:00', 3, '2021-10-05 23:03:12', '2021-10-05 23:03:12');
INSERT INTO `setting_count_shifts` VALUES (279, 4, '2021-10-09 10:00:00', '2021-10-09 12:00:00', 2, '2021-10-05 23:03:41', '2021-10-05 23:03:41');

-- ----------------------------
-- Table structure for setting_init_shifts
-- ----------------------------
DROP TABLE IF EXISTS `setting_init_shifts`;
CREATE TABLE `setting_init_shifts`  (
  `id` int(6) NOT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `staff_id` int(6) NULL DEFAULT NULL,
  `weekday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'monday:1~sunday:7',
  `from_time` time(0) NULL DEFAULT NULL,
  `to_time` time(0) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_init_shifts
-- ----------------------------
INSERT INTO `setting_init_shifts` VALUES (34, 1, 2, 'Sun', '01:00:00', '03:00:00', '2021-09-01 00:55:31', '2021-09-01 01:01:09');
INSERT INTO `setting_init_shifts` VALUES (37, 22, 5, 'Tue', '19:30:00', '21:00:00', '2021-09-13 19:51:03', '2021-09-13 19:51:03');
INSERT INTO `setting_init_shifts` VALUES (38, 20, 5, 'Sun', '19:00:00', '22:00:00', '2021-09-13 19:56:21', '2021-09-13 19:56:21');
INSERT INTO `setting_init_shifts` VALUES (39, 20, 5, 'Sun', '19:00:00', '22:00:00', '2021-09-13 19:56:34', '2021-09-13 19:56:34');
INSERT INTO `setting_init_shifts` VALUES (40, 22, 5, 'Wed', '20:30:00', '22:00:00', '2021-09-13 20:01:15', '2021-09-13 20:01:15');
INSERT INTO `setting_init_shifts` VALUES (41, 22, 5, 'Thu', '18:00:00', '19:30:00', '2021-09-13 20:01:32', '2021-09-13 20:01:32');
INSERT INTO `setting_init_shifts` VALUES (42, 22, 5, 'Fri', '19:00:00', '22:15:00', '2021-09-13 20:01:47', '2021-09-13 20:01:47');
INSERT INTO `setting_init_shifts` VALUES (43, 20, 5, 'Sun', '12:00:00', '22:00:00', '2021-09-13 20:02:12', '2021-09-13 20:02:12');
INSERT INTO `setting_init_shifts` VALUES (44, 20, 5, 'Mon', '18:00:00', '21:30:00', '2021-09-13 20:02:33', '2021-09-13 20:03:20');
INSERT INTO `setting_init_shifts` VALUES (45, 20, 5, 'Tue', '18:00:00', '22:00:00', '2021-09-13 20:02:48', '2021-09-13 20:03:25');
INSERT INTO `setting_init_shifts` VALUES (46, 20, 5, 'Wed', '19:00:00', '22:00:00', '2021-09-13 20:03:10', '2021-09-13 20:03:10');
INSERT INTO `setting_init_shifts` VALUES (47, 20, 5, 'Thu', '18:00:00', '22:30:00', '2021-09-13 20:03:39', '2021-09-13 20:03:39');
INSERT INTO `setting_init_shifts` VALUES (48, 20, 5, 'Fri', '18:30:00', '21:45:00', '2021-09-13 20:04:04', '2021-09-13 20:04:04');
INSERT INTO `setting_init_shifts` VALUES (49, 20, 5, 'Sat', '14:00:00', '21:00:00', '2021-09-13 20:04:16', '2021-09-13 20:04:16');
INSERT INTO `setting_init_shifts` VALUES (50, 21, 5, 'Sun', '15:15:00', '16:45:00', '2021-09-13 20:04:46', '2021-09-13 20:04:46');
INSERT INTO `setting_init_shifts` VALUES (51, 21, 5, 'Thu', '18:00:00', '20:00:00', '2021-09-13 20:05:16', '2021-09-13 20:05:16');
INSERT INTO `setting_init_shifts` VALUES (53, 17, 29, 'Thu', '10:00:00', '20:00:00', '2021-09-22 23:09:03', '2021-09-22 23:09:03');
INSERT INTO `setting_init_shifts` VALUES (54, 17, 29, 'Fri', '10:00:00', '20:00:00', '2021-09-23 12:35:29', '2021-09-23 12:35:29');
INSERT INTO `setting_init_shifts` VALUES (55, 17, 29, 'Sat', '10:00:00', '20:00:00', '2021-09-23 12:35:43', '2021-09-23 12:35:43');
INSERT INTO `setting_init_shifts` VALUES (61, 18, 26, 'Fri', '10:30:00', '20:30:00', '2021-09-23 16:50:04', '2021-10-03 17:36:39');
INSERT INTO `setting_init_shifts` VALUES (62, 18, 26, 'Sat', '11:00:00', '12:00:00', '2021-09-23 17:36:26', '2021-09-23 17:36:26');
INSERT INTO `setting_init_shifts` VALUES (65, 4, 31, 'Sat', '11:00:00', '13:00:00', '2021-09-23 21:04:01', '2021-09-23 21:04:01');
INSERT INTO `setting_init_shifts` VALUES (66, 4, 28, 'Fri', '12:30:00', '13:30:00', '2021-09-24 12:13:55', '2021-09-24 12:13:55');
INSERT INTO `setting_init_shifts` VALUES (67, 4, 31, 'Tue', '10:30:00', '19:00:00', '2021-10-02 16:49:08', '2021-10-02 16:49:08');
INSERT INTO `setting_init_shifts` VALUES (69, 18, 26, 'Sun', '10:00:00', '21:00:00', '2021-10-03 17:18:56', '2021-10-03 17:36:09');
INSERT INTO `setting_init_shifts` VALUES (70, 16, 26, 'Sun', '10:00:00', '21:00:00', '2021-10-03 17:35:57', '2021-10-03 17:35:57');
INSERT INTO `setting_init_shifts` VALUES (71, 18, 26, 'Mon', '10:00:00', '21:00:00', '2021-10-03 17:36:17', '2021-10-03 17:36:17');
INSERT INTO `setting_init_shifts` VALUES (72, 18, 26, 'Wed', '10:00:00', '18:00:00', '2021-10-03 17:36:24', '2021-10-03 17:36:24');
INSERT INTO `setting_init_shifts` VALUES (73, 18, 26, 'Thu', '14:30:00', '20:30:00', '2021-10-03 17:36:30', '2021-10-03 17:36:30');
INSERT INTO `setting_init_shifts` VALUES (74, 18, 26, 'Sat', '10:00:00', '16:00:00', '2021-10-03 17:36:47', '2021-10-03 17:36:47');
INSERT INTO `setting_init_shifts` VALUES (75, 4, 41, 'Mon', '10:00:00', '17:00:00', '2021-10-05 17:30:39', '2021-10-05 17:30:39');
INSERT INTO `setting_init_shifts` VALUES (76, 4, 41, 'Tue', '10:00:00', '18:00:00', '2021-10-05 17:30:53', '2021-10-05 17:30:53');
INSERT INTO `setting_init_shifts` VALUES (77, 4, 41, 'Thu', '13:00:00', '19:00:00', '2021-10-05 17:31:07', '2021-10-05 17:32:01');
INSERT INTO `setting_init_shifts` VALUES (78, 4, 41, 'Sun', '10:00:00', '19:00:00', '2021-10-05 17:31:22', '2021-10-05 17:31:22');
INSERT INTO `setting_init_shifts` VALUES (79, 4, 41, 'Wed', '10:00:00', '18:00:00', '2021-10-05 17:31:33', '2021-10-05 17:31:33');
INSERT INTO `setting_init_shifts` VALUES (80, 4, 41, 'Sat', '10:00:00', '18:00:00', '2021-10-05 17:32:18', '2021-10-05 17:32:18');
INSERT INTO `setting_init_shifts` VALUES (81, 4, 41, 'Fri', '10:00:00', '11:00:00', '2021-10-05 17:32:28', '2021-10-05 17:32:28');
INSERT INTO `setting_init_shifts` VALUES (82, 18, 24, 'Tue', '10:00:00', '19:00:00', '2021-10-09 12:18:05', '2021-10-09 12:18:05');
INSERT INTO `setting_init_shifts` VALUES (83, 18, 24, 'Mon', '12:00:00', '21:00:00', '2021-10-09 12:18:19', '2021-10-09 12:18:19');

-- ----------------------------
-- Table structure for shifts
-- ----------------------------
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE `shifts`  (
  `shift_id` int(6) NOT NULL,
  `staff_id` int(6) NULL DEFAULT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `from_time` datetime(0) NULL DEFAULT NULL,
  `to_time` datetime(0) NULL DEFAULT NULL,
  `shift_type` int(1) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES (1, 6, 1, '2021-08-25 11:30:00', '2021-08-25 12:30:00', 1, 1, '2021-08-25 01:48:49', '2021-08-25 01:48:49');
INSERT INTO `shifts` VALUES (2, 6, 1, '2021-08-24 10:00:00', '2021-08-24 11:30:00', 1, 1, '2021-08-25 01:48:57', '2021-08-25 01:48:57');
INSERT INTO `shifts` VALUES (3, 6, 1, '2021-08-23 13:30:00', '2021-08-23 14:30:00', 1, 1, '2021-08-25 08:39:42', '2021-08-25 08:39:42');
INSERT INTO `shifts` VALUES (4, 7, 1, '2021-08-25 11:00:00', '2021-08-25 12:30:00', 1, 1, '2021-08-25 14:02:06', '2021-08-25 14:02:06');
INSERT INTO `shifts` VALUES (5, 2, 1, '2021-08-22 02:30:00', '2021-08-22 10:00:00', 1, 1, '2021-08-28 18:48:48', '2021-08-28 18:48:48');
INSERT INTO `shifts` VALUES (6, 5, 22, '2021-09-21 19:30:00', '2021-09-21 21:00:00', 1, 1, '2021-09-13 19:55:48', '2021-09-13 19:55:48');
INSERT INTO `shifts` VALUES (8, 5, 22, '2021-09-21 19:30:00', '2021-09-21 21:00:00', 1, 1, '2021-09-13 19:59:11', '2021-09-13 19:59:11');
INSERT INTO `shifts` VALUES (9, 5, 22, '2021-09-14 19:30:00', '2021-09-14 21:00:00', 1, 1, '2021-09-13 19:59:40', '2021-09-13 19:59:40');
INSERT INTO `shifts` VALUES (10, 2, 1, '2021-09-16 19:30:00', '2021-09-16 20:20:00', 1, 1, '2021-09-13 22:17:57', '2021-09-13 22:17:57');
INSERT INTO `shifts` VALUES (12, 29, 17, '2021-09-23 10:00:00', '2021-09-23 13:00:00', 1, 1, '2021-09-22 23:07:53', '2021-09-22 23:07:53');
INSERT INTO `shifts` VALUES (13, 29, 17, '2021-09-24 10:00:00', '2021-09-24 14:00:00', 1, 1, '2021-09-23 13:03:37', '2021-09-23 13:03:37');
INSERT INTO `shifts` VALUES (14, 29, 17, '2021-09-25 13:00:00', '2021-09-25 20:00:00', 1, 1, '2021-09-23 13:03:54', '2021-09-23 13:03:54');
INSERT INTO `shifts` VALUES (17, 27, 11, '2021-09-26 13:00:00', '2021-09-26 14:00:00', 1, 1, '2021-09-23 14:13:38', '2021-09-23 14:13:38');
INSERT INTO `shifts` VALUES (23, 26, 18, '2021-09-24 10:30:00', '2021-09-24 19:30:00', 1, 1, '2021-09-23 17:36:47', '2021-09-23 17:36:47');
INSERT INTO `shifts` VALUES (24, 26, 18, '2021-09-25 11:00:00', '2021-09-25 12:00:00', 1, 1, '2021-09-23 17:36:47', '2021-09-23 17:36:47');
INSERT INTO `shifts` VALUES (27, 31, 4, '2021-09-25 11:00:00', '2021-09-25 12:00:00', 1, 1, '2021-09-23 21:04:34', '2021-09-23 21:04:34');
INSERT INTO `shifts` VALUES (28, 31, 4, '2021-09-25 13:00:00', '2021-09-25 18:00:00', 1, 1, '2021-09-23 21:04:58', '2021-09-23 21:04:58');
INSERT INTO `shifts` VALUES (30, 29, 17, '2021-09-23 16:00:00', '2021-09-23 20:00:00', 1, 1, '2021-09-24 13:00:52', '2021-09-24 13:00:52');
INSERT INTO `shifts` VALUES (32, 24, 18, '2021-09-27 12:00:00', '2021-09-27 15:00:00', 1, 1, '2021-09-24 15:14:26', '2021-09-24 15:14:26');
INSERT INTO `shifts` VALUES (33, 24, 18, '2021-09-26 15:30:00', '2021-09-26 21:00:00', 1, 1, '2021-09-24 15:14:45', '2021-09-24 15:14:45');
INSERT INTO `shifts` VALUES (34, 29, 18, '2021-09-25 12:00:00', '2021-09-25 21:00:00', 1, 1, '2021-09-24 23:50:40', '2021-09-24 23:50:40');
INSERT INTO `shifts` VALUES (35, 29, 18, '2021-09-26 13:00:00', '2021-09-26 21:00:00', 1, 1, '2021-09-24 23:51:17', '2021-09-24 23:51:17');
INSERT INTO `shifts` VALUES (37, 29, 18, '2021-09-27 11:00:00', '2021-09-27 15:00:00', 1, 1, '2021-09-25 00:45:20', '2021-09-25 00:45:20');
INSERT INTO `shifts` VALUES (38, 29, 18, '2021-09-28 18:00:00', '2021-09-28 21:00:00', 1, 1, '2021-09-26 01:37:45', '2021-09-26 01:37:45');
INSERT INTO `shifts` VALUES (40, 8, 1, '2021-10-01 19:00:00', '2021-10-01 23:00:00', 1, 1, '2021-09-29 12:27:16', '2021-09-29 12:27:16');
INSERT INTO `shifts` VALUES (41, 12, 1, '2021-10-02 19:00:00', '2021-10-02 23:59:00', 1, 1, '2021-09-29 14:31:17', '2021-09-29 14:33:10');
INSERT INTO `shifts` VALUES (42, 12, 1, '2021-10-03 00:00:00', '2021-10-03 03:00:00', 1, 1, '2021-09-29 14:31:49', '2021-09-29 21:04:18');
INSERT INTO `shifts` VALUES (43, 13, 1, '2021-10-01 19:00:00', '2021-10-01 23:59:00', 1, 1, '2021-09-29 17:56:45', '2021-09-29 17:56:45');
INSERT INTO `shifts` VALUES (44, 13, 1, '2021-10-02 19:00:00', '2021-10-02 23:00:00', 1, 1, '2021-09-29 17:57:08', '2021-09-29 17:57:33');
INSERT INTO `shifts` VALUES (45, 13, 1, '2021-10-02 00:00:00', '2021-10-02 03:00:00', 1, 1, '2021-09-29 17:58:09', '2021-09-29 17:58:09');
INSERT INTO `shifts` VALUES (46, 13, 1, '2021-10-03 19:00:00', '2021-10-03 23:00:00', 1, 1, '2021-09-29 17:58:27', '2021-09-29 17:58:27');
INSERT INTO `shifts` VALUES (47, 13, 1, '2021-10-03 00:00:00', '2021-10-03 02:00:00', 1, 1, '2021-09-29 17:58:36', '2021-09-29 17:58:36');
INSERT INTO `shifts` VALUES (48, 11, 1, '2021-10-01 20:30:00', '2021-10-01 23:59:00', 1, 1, '2021-09-29 18:30:10', '2021-09-29 18:30:10');
INSERT INTO `shifts` VALUES (49, 11, 1, '2021-10-02 20:30:00', '2021-10-02 23:59:00', 1, 1, '2021-09-29 18:30:29', '2021-09-29 18:30:29');
INSERT INTO `shifts` VALUES (50, 11, 1, '2021-10-02 00:00:00', '2021-10-02 03:00:00', 1, 1, '2021-09-29 18:30:43', '2021-09-29 18:30:43');
INSERT INTO `shifts` VALUES (51, 11, 1, '2021-10-03 00:00:00', '2021-10-03 03:00:00', 1, 1, '2021-09-29 18:31:12', '2021-09-29 18:31:12');
INSERT INTO `shifts` VALUES (52, 11, 1, '2021-10-04 00:00:00', '2021-10-04 02:00:00', 1, 1, '2021-09-29 18:31:38', '2021-09-29 18:31:38');
INSERT INTO `shifts` VALUES (53, 11, 1, '2021-10-03 20:00:00', '2021-10-03 23:59:00', 1, 1, '2021-09-29 18:31:58', '2021-09-29 18:31:58');
INSERT INTO `shifts` VALUES (54, 12, 1, '2021-10-03 19:00:00', '2021-10-03 23:59:00', 1, 1, '2021-09-29 21:04:48', '2021-09-29 21:04:48');
INSERT INTO `shifts` VALUES (55, 12, 1, '2021-10-04 00:00:00', '2021-10-04 02:00:00', 1, 1, '2021-09-29 21:05:18', '2021-09-29 21:05:18');
INSERT INTO `shifts` VALUES (56, 14, 1, '2021-10-01 19:00:00', '2021-10-01 23:59:00', 1, 1, '2021-09-30 20:46:08', '2021-09-30 20:46:08');
INSERT INTO `shifts` VALUES (58, 14, 1, '2021-10-02 00:00:00', '2021-10-02 03:00:00', 1, 1, '2021-09-30 20:47:10', '2021-09-30 20:47:10');
INSERT INTO `shifts` VALUES (59, 14, 1, '2021-10-02 19:00:00', '2021-10-02 23:59:00', 1, 1, '2021-09-30 20:47:24', '2021-09-30 20:47:24');
INSERT INTO `shifts` VALUES (60, 14, 1, '2021-10-03 00:00:00', '2021-10-03 03:00:00', 1, 1, '2021-09-30 20:47:37', '2021-09-30 20:47:37');
INSERT INTO `shifts` VALUES (61, 14, 1, '2021-10-03 19:00:00', '2021-10-03 23:59:00', 1, 1, '2021-09-30 20:47:51', '2021-09-30 20:47:51');
INSERT INTO `shifts` VALUES (62, 14, 1, '2021-10-04 00:00:00', '2021-10-04 02:00:00', 1, 1, '2021-09-30 20:48:07', '2021-09-30 20:48:07');
INSERT INTO `shifts` VALUES (63, 12, 1, '2021-10-04 19:00:00', '2021-10-04 23:59:00', 1, 1, '2021-10-03 03:33:56', '2021-10-03 03:33:56');
INSERT INTO `shifts` VALUES (64, 12, 1, '2021-10-05 00:00:00', '2021-10-05 02:00:00', 1, 1, '2021-10-03 03:34:09', '2021-10-03 03:34:09');
INSERT INTO `shifts` VALUES (65, 12, 1, '2021-10-07 20:00:00', '2021-10-07 23:59:00', 1, 1, '2021-10-03 03:34:36', '2021-10-03 03:34:36');
INSERT INTO `shifts` VALUES (66, 26, 18, '2021-10-03 10:00:00', '2021-10-03 11:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (67, 26, 18, '2021-10-04 10:00:00', '2021-10-04 12:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (68, 26, 18, '2021-10-06 10:00:00', '2021-10-06 12:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (69, 26, 18, '2021-10-07 14:30:00', '2021-10-07 19:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (70, 26, 18, '2021-10-08 10:30:00', '2021-10-08 12:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (71, 26, 18, '2021-10-09 11:00:00', '2021-10-09 12:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (72, 26, 18, '2021-10-09 10:00:00', '2021-10-09 11:00:00', 1, 1, '2021-10-04 13:38:01', '2021-10-04 13:38:01');
INSERT INTO `shifts` VALUES (73, 29, 18, '2021-10-06 12:00:00', '2021-10-06 19:00:00', 1, 1, '2021-10-05 11:23:24', '2021-10-05 11:23:44');
INSERT INTO `shifts` VALUES (76, 29, 18, '2021-10-08 19:00:00', '2021-10-08 21:00:00', 1, 1, '2021-10-05 11:25:50', '2021-10-05 11:26:02');
INSERT INTO `shifts` VALUES (77, 29, 18, '2021-10-08 12:00:00', '2021-10-08 19:00:00', 1, 1, '2021-10-05 11:26:15', '2021-10-05 11:26:15');
INSERT INTO `shifts` VALUES (78, 29, 18, '2021-10-09 19:00:00', '2021-10-09 21:00:00', 1, 1, '2021-10-05 11:26:47', '2021-10-05 11:27:40');
INSERT INTO `shifts` VALUES (79, 29, 18, '2021-10-09 12:00:00', '2021-10-09 19:00:00', 1, 1, '2021-10-05 11:27:50', '2021-10-05 11:27:50');
INSERT INTO `shifts` VALUES (80, 29, 18, '2021-10-09 11:00:00', '2021-10-09 12:00:00', 1, 1, '2021-10-05 11:27:55', '2021-10-05 11:27:55');
INSERT INTO `shifts` VALUES (81, 29, 18, '2021-10-10 19:00:00', '2021-10-10 21:00:00', 1, 1, '2021-10-05 11:28:15', '2021-10-05 11:28:15');
INSERT INTO `shifts` VALUES (82, 29, 18, '2021-10-10 13:00:00', '2021-10-10 19:00:00', 1, 1, '2021-10-05 11:28:24', '2021-10-05 11:28:24');
INSERT INTO `shifts` VALUES (83, 29, 18, '2021-10-10 12:00:00', '2021-10-10 13:00:00', 1, 1, '2021-10-05 11:28:32', '2021-10-05 11:28:52');
INSERT INTO `shifts` VALUES (84, 29, 18, '2021-10-11 13:00:00', '2021-10-11 21:00:00', 1, 1, '2021-10-05 11:29:11', '2021-10-05 11:29:11');
INSERT INTO `shifts` VALUES (85, 29, 18, '2021-10-12 10:00:00', '2021-10-12 14:00:00', 1, 1, '2021-10-05 11:29:26', '2021-10-05 11:29:26');
INSERT INTO `shifts` VALUES (86, 29, 18, '2021-10-13 13:00:00', '2021-10-13 21:00:00', 1, 1, '2021-10-05 11:29:45', '2021-10-05 11:29:45');
INSERT INTO `shifts` VALUES (87, 29, 18, '2021-10-15 14:00:00', '2021-10-15 21:00:00', 1, 1, '2021-10-05 13:10:57', '2021-10-05 13:10:57');
INSERT INTO `shifts` VALUES (88, 29, 18, '2021-10-16 19:00:00', '2021-10-16 21:00:00', 1, 1, '2021-10-05 13:11:17', '2021-10-05 13:11:28');
INSERT INTO `shifts` VALUES (89, 29, 18, '2021-10-16 12:00:00', '2021-10-16 19:00:00', 1, 1, '2021-10-05 13:11:38', '2021-10-05 13:11:38');
INSERT INTO `shifts` VALUES (90, 29, 18, '2021-10-16 11:00:00', '2021-10-16 12:00:00', 1, 1, '2021-10-05 13:11:54', '2021-10-05 13:11:54');
INSERT INTO `shifts` VALUES (91, 29, 18, '2021-10-17 19:00:00', '2021-10-17 21:00:00', 1, 1, '2021-10-05 13:12:11', '2021-10-05 13:12:11');
INSERT INTO `shifts` VALUES (92, 29, 18, '2021-10-17 13:00:00', '2021-10-17 19:00:00', 1, 1, '2021-10-05 13:12:21', '2021-10-05 13:12:21');
INSERT INTO `shifts` VALUES (93, 29, 18, '2021-10-17 11:00:00', '2021-10-17 13:00:00', 1, 1, '2021-10-05 13:12:38', '2021-10-05 13:12:38');
INSERT INTO `shifts` VALUES (94, 29, 18, '2021-10-18 13:00:00', '2021-10-18 21:00:00', 1, 1, '2021-10-05 13:12:51', '2021-10-05 13:12:51');
INSERT INTO `shifts` VALUES (95, 29, 18, '2021-10-19 14:00:00', '2021-10-19 21:00:00', 1, 1, '2021-10-05 13:13:45', '2021-10-05 13:13:45');
INSERT INTO `shifts` VALUES (96, 29, 18, '2021-10-20 10:00:00', '2021-10-20 14:00:00', 1, 1, '2021-10-05 13:13:57', '2021-10-05 13:13:57');
INSERT INTO `shifts` VALUES (97, 29, 18, '2021-10-22 13:00:00', '2021-10-22 21:00:00', 1, 1, '2021-10-05 13:14:20', '2021-10-05 13:14:20');
INSERT INTO `shifts` VALUES (98, 29, 18, '2021-10-23 19:00:00', '2021-10-23 21:00:00', 1, 1, '2021-10-05 13:14:29', '2021-10-05 13:14:29');
INSERT INTO `shifts` VALUES (99, 29, 18, '2021-10-23 13:00:00', '2021-10-23 19:00:00', 1, 1, '2021-10-05 13:14:34', '2021-10-05 13:14:34');
INSERT INTO `shifts` VALUES (100, 29, 18, '2021-10-23 11:00:00', '2021-10-23 13:00:00', 1, 1, '2021-10-05 13:14:42', '2021-10-05 13:14:42');
INSERT INTO `shifts` VALUES (101, 29, 18, '2021-10-24 19:00:00', '2021-10-24 21:00:00', 1, 1, '2021-10-05 13:15:06', '2021-10-05 13:15:21');
INSERT INTO `shifts` VALUES (102, 29, 18, '2021-10-24 12:00:00', '2021-10-24 19:00:00', 1, 1, '2021-10-05 13:15:35', '2021-10-05 13:15:35');
INSERT INTO `shifts` VALUES (103, 29, 18, '2021-10-25 13:00:00', '2021-10-25 21:00:00', 1, 1, '2021-10-05 13:15:51', '2021-10-05 13:15:51');
INSERT INTO `shifts` VALUES (104, 29, 18, '2021-10-26 13:00:00', '2021-10-26 21:00:00', 1, 1, '2021-10-05 13:15:59', '2021-10-05 13:15:59');
INSERT INTO `shifts` VALUES (105, 29, 18, '2021-10-27 10:00:00', '2021-10-27 14:00:00', 1, 1, '2021-10-05 13:16:09', '2021-10-05 13:16:09');
INSERT INTO `shifts` VALUES (106, 29, 18, '2021-10-29 14:00:00', '2021-10-29 21:00:00', 1, 1, '2021-10-05 13:16:23', '2021-10-05 13:16:23');
INSERT INTO `shifts` VALUES (107, 29, 18, '2021-10-30 11:00:00', '2021-10-30 21:00:00', 1, 1, '2021-10-05 13:16:34', '2021-10-05 13:16:34');
INSERT INTO `shifts` VALUES (108, 29, 18, '2021-10-31 11:00:00', '2021-10-31 21:00:00', 1, 1, '2021-10-05 13:16:47', '2021-10-05 13:16:47');
INSERT INTO `shifts` VALUES (109, 29, 18, '2021-10-01 13:00:00', '2021-10-01 21:00:00', 1, 1, '2021-10-05 13:22:56', '2021-10-05 13:22:56');
INSERT INTO `shifts` VALUES (110, 29, 18, '2021-10-02 12:00:00', '2021-10-02 21:00:00', 1, 1, '2021-10-05 13:23:11', '2021-10-05 13:23:11');
INSERT INTO `shifts` VALUES (111, 29, 18, '2021-10-03 19:00:00', '2021-10-03 21:00:00', 1, 1, '2021-10-05 13:24:57', '2021-10-05 13:24:57');
INSERT INTO `shifts` VALUES (112, 29, 18, '2021-10-03 13:00:00', '2021-10-03 19:00:00', 1, 1, '2021-10-05 13:25:04', '2021-10-05 13:25:04');
INSERT INTO `shifts` VALUES (113, 29, 18, '2021-10-03 12:00:00', '2021-10-03 13:00:00', 1, 1, '2021-10-05 13:25:20', '2021-10-05 13:25:20');
INSERT INTO `shifts` VALUES (114, 29, 18, '2021-10-04 19:00:00', '2021-10-04 21:00:00', 1, 1, '2021-10-05 13:25:54', '2021-10-05 13:26:05');
INSERT INTO `shifts` VALUES (115, 29, 18, '2021-10-04 13:00:00', '2021-10-04 19:00:00', 1, 1, '2021-10-05 13:26:14', '2021-10-05 13:26:36');
INSERT INTO `shifts` VALUES (116, 41, 4, '2021-10-06 10:00:00', '2021-10-06 18:00:00', 1, 1, '2021-10-05 23:05:07', '2021-10-05 23:05:48');
INSERT INTO `shifts` VALUES (117, 41, 4, '2021-10-07 13:00:00', '2021-10-07 17:00:00', 1, 1, '2021-10-05 23:05:07', '2021-10-05 23:05:07');
INSERT INTO `shifts` VALUES (118, 41, 4, '2021-10-08 10:00:00', '2021-10-08 11:00:00', 1, 1, '2021-10-05 23:05:07', '2021-10-05 23:06:38');
INSERT INTO `shifts` VALUES (120, 28, 4, '2021-10-08 12:30:00', '2021-10-08 13:30:00', 1, 1, '2021-10-06 09:55:29', '2021-10-06 09:55:29');
INSERT INTO `shifts` VALUES (124, 24, 18, '2021-10-11 12:00:00', '2021-10-11 21:00:00', 1, 1, '2021-10-09 12:18:32', '2021-10-09 12:18:32');
INSERT INTO `shifts` VALUES (125, 24, 18, '2021-10-12 10:00:00', '2021-10-12 19:00:00', 1, 1, '2021-10-09 12:18:32', '2021-10-09 12:18:32');
INSERT INTO `shifts` VALUES (126, 24, 18, '2021-10-10 11:00:00', '2021-10-10 13:00:00', 1, 1, '2021-10-09 12:18:51', '2021-10-09 12:18:51');
INSERT INTO `shifts` VALUES (127, 24, 18, '2021-10-10 13:00:00', '2021-10-10 16:00:00', 1, 1, '2021-10-09 12:19:28', '2021-10-09 12:19:28');
INSERT INTO `shifts` VALUES (128, 24, 18, '2021-10-15 16:00:00', '2021-10-15 21:00:00', 1, 1, '2021-10-09 12:20:08', '2021-10-09 12:20:08');

-- ----------------------------
-- Table structure for staff_organs
-- ----------------------------
DROP TABLE IF EXISTS `staff_organs`;
CREATE TABLE `staff_organs`  (
  `id` int(6) NOT NULL,
  `staff_id` int(6) NULL DEFAULT NULL,
  `organ_id` int(6) NULL DEFAULT NULL,
  `auth` int(1) NULL DEFAULT NULL COMMENT '1:staff,4:admin'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff_organs
-- ----------------------------
INSERT INTO `staff_organs` VALUES (1, 2, 1, 1);
INSERT INTO `staff_organs` VALUES (2, 2, 2, 1);
INSERT INTO `staff_organs` VALUES (3, 2, 3, 1);
INSERT INTO `staff_organs` VALUES (4, 3, 4, 1);
INSERT INTO `staff_organs` VALUES (5, 3, 9, 1);
INSERT INTO `staff_organs` VALUES (6, 3, 10, 1);
INSERT INTO `staff_organs` VALUES (7, 3, 11, 1);
INSERT INTO `staff_organs` VALUES (8, 3, 12, 1);
INSERT INTO `staff_organs` VALUES (9, 4, 14, 1);
INSERT INTO `staff_organs` VALUES (10, 4, 15, 1);
INSERT INTO `staff_organs` VALUES (11, 4, 16, 1);
INSERT INTO `staff_organs` VALUES (12, 4, 17, 1);
INSERT INTO `staff_organs` VALUES (13, 4, 18, 1);
INSERT INTO `staff_organs` VALUES (14, 4, 19, 1);
INSERT INTO `staff_organs` VALUES (15, 5, 22, 1);
INSERT INTO `staff_organs` VALUES (16, 5, 20, 1);
INSERT INTO `staff_organs` VALUES (17, 5, 21, 1);
INSERT INTO `staff_organs` VALUES (18, 6, 1, 1);
INSERT INTO `staff_organs` VALUES (19, 7, 1, 1);
INSERT INTO `staff_organs` VALUES (20, 7, 2, 1);
INSERT INTO `staff_organs` VALUES (21, 8, 1, 1);
INSERT INTO `staff_organs` VALUES (22, 9, 2, 1);
INSERT INTO `staff_organs` VALUES (23, 10, 3, 1);
INSERT INTO `staff_organs` VALUES (24, 11, 1, 1);
INSERT INTO `staff_organs` VALUES (25, 12, 1, 1);
INSERT INTO `staff_organs` VALUES (26, 13, 1, 1);
INSERT INTO `staff_organs` VALUES (27, 14, 1, 1);
INSERT INTO `staff_organs` VALUES (28, 15, 1, 1);
INSERT INTO `staff_organs` VALUES (29, 16, 1, 1);
INSERT INTO `staff_organs` VALUES (30, 17, 1, 1);
INSERT INTO `staff_organs` VALUES (31, 18, 1, 1);
INSERT INTO `staff_organs` VALUES (32, 19, 20, 1);
INSERT INTO `staff_organs` VALUES (33, 19, 22, 1);
INSERT INTO `staff_organs` VALUES (34, 20, 20, 1);
INSERT INTO `staff_organs` VALUES (35, 20, 22, 1);
INSERT INTO `staff_organs` VALUES (36, 21, 20, 1);
INSERT INTO `staff_organs` VALUES (37, 21, 21, 1);
INSERT INTO `staff_organs` VALUES (38, 21, 22, 1);
INSERT INTO `staff_organs` VALUES (39, 22, 20, 1);
INSERT INTO `staff_organs` VALUES (40, 22, 21, 1);
INSERT INTO `staff_organs` VALUES (41, 22, 22, 1);
INSERT INTO `staff_organs` VALUES (44, 25, 4, 1);
INSERT INTO `staff_organs` VALUES (48, 26, 16, 1);
INSERT INTO `staff_organs` VALUES (49, 26, 18, 1);
INSERT INTO `staff_organs` VALUES (52, 29, 17, 1);
INSERT INTO `staff_organs` VALUES (53, 30, 19, 1);
INSERT INTO `staff_organs` VALUES (54, 30, 18, 1);
INSERT INTO `staff_organs` VALUES (55, 30, 15, 1);
INSERT INTO `staff_organs` VALUES (56, 30, 17, 1);
INSERT INTO `staff_organs` VALUES (57, 30, 16, 1);
INSERT INTO `staff_organs` VALUES (58, 30, 14, 1);
INSERT INTO `staff_organs` VALUES (59, 31, 12, 1);
INSERT INTO `staff_organs` VALUES (60, 31, 11, 1);
INSERT INTO `staff_organs` VALUES (61, 31, 9, 1);
INSERT INTO `staff_organs` VALUES (62, 31, 4, 1);
INSERT INTO `staff_organs` VALUES (63, 31, 10, 1);
INSERT INTO `staff_organs` VALUES (64, 32, 17, 1);
INSERT INTO `staff_organs` VALUES (65, 33, 17, 1);
INSERT INTO `staff_organs` VALUES (66, 34, 17, 1);
INSERT INTO `staff_organs` VALUES (67, 35, 17, 1);
INSERT INTO `staff_organs` VALUES (68, 36, 17, 1);
INSERT INTO `staff_organs` VALUES (69, 37, 17, 1);
INSERT INTO `staff_organs` VALUES (70, 38, 17, 1);
INSERT INTO `staff_organs` VALUES (71, 39, 17, 1);
INSERT INTO `staff_organs` VALUES (73, 40, 4, 1);
INSERT INTO `staff_organs` VALUES (74, 27, 4, 1);
INSERT INTO `staff_organs` VALUES (75, 28, 4, 1);
INSERT INTO `staff_organs` VALUES (76, 23, 18, 1);
INSERT INTO `staff_organs` VALUES (77, 29, 18, 1);
INSERT INTO `staff_organs` VALUES (78, 24, 18, 1);
INSERT INTO `staff_organs` VALUES (79, 41, 4, 1);
INSERT INTO `staff_organs` VALUES (80, 42, 12, 1);
INSERT INTO `staff_organs` VALUES (81, 42, 4, 1);
INSERT INTO `staff_organs` VALUES (82, 42, 10, 1);
INSERT INTO `staff_organs` VALUES (83, 42, 9, 1);
INSERT INTO `staff_organs` VALUES (84, 42, 11, 1);

-- ----------------------------
-- Table structure for staff_settings
-- ----------------------------
DROP TABLE IF EXISTS `staff_settings`;
CREATE TABLE `staff_settings`  (
  `setting_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NULL DEFAULT NULL,
  `push` int(1) NULL DEFAULT NULL,
  `face` int(1) NULL DEFAULT NULL,
  `position` int(1) NULL DEFAULT NULL,
  `camera` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff_settings
-- ----------------------------
INSERT INTO `staff_settings` VALUES (5, 2, 1, 1, 0, 0);
INSERT INTO `staff_settings` VALUES (6, 1, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (7, 5, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (8, 20, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (9, 22, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (10, 21, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (11, 19, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (12, 12, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (13, 14, 1, 1, NULL, NULL);
INSERT INTO `staff_settings` VALUES (14, 6, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs`  (
  `staff_id` int(6) NOT NULL,
  `company_id` int(6) NULL DEFAULT NULL,
  `staff_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_auth` int(1) NULL DEFAULT NULL COMMENT '1:staff,2:boss,3,system_manager',
  `staff_nick` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_mail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_sex` int(1) NULL DEFAULT NULL,
  `staff_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_birthday` date NULL DEFAULT NULL,
  `staff_belongs` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_salary_months` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_salary_days` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_salary_minutes` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_salary_times` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_test_additional_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_quality_additional_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO `staffs` VALUES (1, NULL, NULL, 4, 'システム管理者', '勝本', '秀夫', '000', 'admin@example.com', 1, '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '1990-10-17', NULL, NULL, NULL, NULL, NULL, 'avatar-20210816230838.jpg', NULL, NULL, 1, '2021-08-16 23:06:59', '2021-08-16 23:08:38');
INSERT INTO `staffs` VALUES (2, 1, NULL, 3, 'こーた', '粕谷', '洸太', '09059880327', '1031kota0327@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1989-03-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:16:27', '2021-08-31 20:58:32');
INSERT INTO `staffs` VALUES (3, 2, NULL, 3, NULL, '関根', '社長', '111', 'sekine.ascente@i.softbank.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:17:42', '2021-09-19 12:55:07');
INSERT INTO `staffs` VALUES (4, 3, NULL, 3, '藤岡', '藤岡', '室長', '1111', 'fujioka2@ascente.co.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:18:52', '2021-09-19 12:55:23');
INSERT INTO `staffs` VALUES (5, 4, NULL, 3, 'Ryo', '所属', 'オーナー', '222', 'company3@example.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:19:55', '2021-08-25 01:19:55');
INSERT INTO `staffs` VALUES (6, 1, NULL, 2, 'けんさく', '高橋', '店長', '08018744422', 'noid.1001@icloud.com', 1, '0b22954ffee64a39c7e7535a535bee6fb5e9b606', '1983-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:21:57', '2021-10-04 01:27:15');
INSERT INTO `staffs` VALUES (7, 1, NULL, 1, 'うどんげ', '杉本', 'ゆうき', '052', 'a@a.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-25', NULL, NULL, NULL, '15', '400', NULL, NULL, NULL, 1, '2021-08-25 12:36:57', '2021-08-25 12:43:33');
INSERT INTO `staffs` VALUES (8, 1, NULL, 1, 'めい', 'めい', 'めい', '09022222222', 'bunbukutyagama0116@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-25 16:03:55', '2021-08-31 19:45:27');
INSERT INTO `staffs` VALUES (9, 1, NULL, 2, 'しょうへい', '鳴海', '翔平', '08060919970', 'nrm-212@icloud.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2001-08-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-30 02:06:08', '2021-08-30 14:45:45');
INSERT INTO `staffs` VALUES (11, 1, NULL, 1, 'しゅう', '田辺', 'りな', '09016470586', 'shu@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1992-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-30 09:45:27', '2021-09-29 18:35:16');
INSERT INTO `staffs` VALUES (12, 1, NULL, 1, 'りなてぃ', '伊深', '里菜', '09068762263', 'a@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1996-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:47:45', '2021-09-29 12:08:46');
INSERT INTO `staffs` VALUES (13, 1, NULL, 1, 'ありお', '加藤', '亜衣梨', '08055877458', '1@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:49:03', '2021-08-31 19:49:03');
INSERT INTO `staffs` VALUES (14, 1, NULL, 1, 'はる', '池田', '遥香', '09050775554', 'ab@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:50:28', '2021-08-31 19:50:28');
INSERT INTO `staffs` VALUES (15, 1, NULL, 1, 'やもり', '家守', '柚奈', '09086316379', 'd@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:51:23', '2021-08-31 19:51:23');
INSERT INTO `staffs` VALUES (16, 1, NULL, 1, 'ゆとり', '中村', '琴美', '09076420805', 'ade@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:52:04', '2021-08-31 19:52:04');
INSERT INTO `staffs` VALUES (17, 1, NULL, 1, 'えま', '近藤', '優希', '08040400105', 'dm@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:52:53', '2021-08-31 19:52:53');
INSERT INTO `staffs` VALUES (18, 1, NULL, 1, 'りん', '福井', '杏奈', '07020056804', 'jm@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '2021-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-31 19:53:31', '2021-08-31 19:53:31');
INSERT INTO `staffs` VALUES (19, 4, NULL, 1, 'SAYAKA', '宮嶋', 'さやか', '09029462769', 'sayacmluvpoyoxoxo@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1995-10-01', NULL, '150000', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-03 23:26:26', '2021-09-04 12:21:35');
INSERT INTO `staffs` VALUES (20, 4, NULL, 1, 'Yuya', '北川', '雄也', '09039328150', 'fancyboy-yuya0815@i.softbank.jp', 1, 'a57ba5a8d0e3fd848b27b285f0cc8bb827dba3b1', '1995-08-15', NULL, '150000', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-03 23:42:36', '2021-09-04 01:11:06');
INSERT INTO `staffs` VALUES (21, 4, NULL, 2, 'AI', '山下', '藍', '09066448021', 'aichapi1208@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1996-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-03 23:53:36', '2021-09-13 13:15:55');
INSERT INTO `staffs` VALUES (22, 4, NULL, 2, 'AKIRA', '山下', '昭', '09034454173', 'aki020311ra@ezweb.ne.jp', 1, '03908a0dd6f47a8fbde31d69cac9b870d05b9583', '1970-06-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-03 23:55:41', '2021-09-04 00:14:46');
INSERT INTO `staffs` VALUES (23, 3, NULL, 1, NULL, '高橋', '店長', '000', 'jirowyjirowy@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 10:53:57', '2021-09-23 15:16:24');
INSERT INTO `staffs` VALUES (24, 3, NULL, 1, 'マンゴー', '竹中', '店長', '000', 'harunoharutan@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 10:55:50', '2021-10-09 12:21:27');
INSERT INTO `staffs` VALUES (25, 2, NULL, 2, NULL, '斎藤', '統括', '000', 'whitevenus.healing@i.softbank.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 11:05:44', '2021-09-23 15:15:13');
INSERT INTO `staffs` VALUES (26, 3, NULL, 2, NULL, '後藤', 'マネージャ', '000', 'ashp5833@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1980-07-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 11:07:03', '2021-09-23 16:51:47');
INSERT INTO `staffs` VALUES (27, 2, NULL, 1, NULL, '久保田', '店長', '09070238622', 'ychuantian59@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1984-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 11:07:42', '2021-09-23 19:02:36');
INSERT INTO `staffs` VALUES (28, 2, NULL, 1, NULL, '五島', '店長', '000', 'mg5p.rin@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 11:08:58', '2021-09-23 15:14:49');
INSERT INTO `staffs` VALUES (29, 3, NULL, 2, NULL, '瀧下', '店長', '000', 'rice10gohan@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1987-01-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-17 11:11:44', '2021-09-23 15:17:06');
INSERT INTO `staffs` VALUES (30, 3, NULL, 3, NULL, '関根', '社長', '000', 'sekine.ascente2@i.softbank.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-19 12:51:51', '2021-09-19 12:53:39');
INSERT INTO `staffs` VALUES (31, 2, NULL, 3, 'FUJI', '藤岡', '室長', '000', 'fujioka@ascente.co.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-19 12:54:45', '2021-10-02 16:47:26');
INSERT INTO `staffs` VALUES (32, 3, NULL, 1, 'しのぶ', '伊佐地', 'しのぶ', '09063329305', 'double-joker.0704@ezweb.ne.jp', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1985-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 20:47:34', '2021-09-23 16:15:56');
INSERT INTO `staffs` VALUES (33, 3, NULL, 1, 'やまだい', '山野', '大輔', '080', '@ezweb.co.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1972-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 20:55:13', '2021-09-22 20:55:13');
INSERT INTO `staffs` VALUES (34, 3, NULL, 1, 'asm', '池田', 'あさみ', '090', 'asm@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1975-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 20:56:52', '2021-09-22 20:56:52');
INSERT INTO `staffs` VALUES (35, 3, NULL, 1, 'たにしげ', '谷田', '繁', '090', 'shige@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1970-07-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 20:58:55', '2021-09-22 20:58:55');
INSERT INTO `staffs` VALUES (36, 3, NULL, 1, 'まちこ', '小林', '眞智子', '090', '@ezweb.ne.jp', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1970-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 21:00:17', '2021-09-23 15:16:34');
INSERT INTO `staffs` VALUES (37, 3, NULL, 1, 'さきの', '杉野', '早紀', '080', 's@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1991-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 21:02:32', '2021-09-22 21:02:32');
INSERT INTO `staffs` VALUES (38, 3, NULL, 1, 'さとう', '佐藤', '隼人', '080', 'sh@gmail.com', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1997-02-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 21:03:53', '2021-09-22 21:04:04');
INSERT INTO `staffs` VALUES (39, 3, NULL, 1, 'ゆりえ', '中村', '百合枝', '080', 'yn@gmail.com', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1972-02-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-22 21:05:45', '2021-09-23 15:16:53');
INSERT INTO `staffs` VALUES (40, 2, NULL, 1, '久保田', '久保田', '亮二', '09070238622', 'amuro-gorugo13@docomo.ne.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '1984-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-23 02:56:34', '2021-09-23 15:14:26');
INSERT INTO `staffs` VALUES (41, 2, NULL, 2, '安井', '安井', '店長', '000', 'k49angelo@docomo.ne.jp', 2, '8cb2237d0679ca88db6464eac60da96345513964', '1981-04-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-09-25 15:10:25', '2021-09-25 18:39:12');
INSERT INTO `staffs` VALUES (42, 2, NULL, 3, 'やまだ', '山田', '専務', '000', 'yamada@ascente.co.jp', 1, '8cb2237d0679ca88db6464eac60da96345513964', '2021-10-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-10-08 11:51:21', '2021-10-08 11:51:21');

-- ----------------------------
-- Table structure for table_menus
-- ----------------------------
DROP TABLE IF EXISTS `table_menus`;
CREATE TABLE `table_menus`  (
  `table_menu_id` int(6) NOT NULL AUTO_INCREMENT,
  `table_id` int(6) NULL DEFAULT NULL,
  `menu_id` int(6) NULL DEFAULT NULL,
  `variation_id` int(6) NULL DEFAULT NULL,
  `quantity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`table_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tables
-- ----------------------------
DROP TABLE IF EXISTS `tables`;
CREATE TABLE `tables`  (
  `table_id` int(6) NOT NULL AUTO_INCREMENT,
  `organ_id` int(6) NOT NULL,
  `position` int(6) NULL DEFAULT NULL,
  `table_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 0,
  `user_id` int(6) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `person_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tables
-- ----------------------------
INSERT INTO `tables` VALUES (1, 1, 1, '12334', 0, NULL, NULL, NULL, '1', 1, '2021-08-25 01:44:07', '2021-10-08 21:50:25');
INSERT INTO `tables` VALUES (2, 1, 2, '白領域を', 0, NULL, NULL, NULL, '1', 1, '2021-08-25 01:44:07', '2021-09-27 22:43:24');
INSERT INTO `tables` VALUES (3, 1, 3, '席3', 0, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:44:07', '2021-09-13 15:39:06');
INSERT INTO `tables` VALUES (4, 1, 4, '席4', 0, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:44:07', '2021-08-25 01:44:07');
INSERT INTO `tables` VALUES (5, 1, 5, '席5', 0, NULL, NULL, NULL, NULL, 1, '2021-08-25 01:44:08', '2021-08-25 11:25:04');
INSERT INTO `tables` VALUES (6, 1, 6, '席6', 0, NULL, NULL, NULL, '9', 1, '2021-09-03 08:53:20', '2021-09-13 15:49:03');
INSERT INTO `tables` VALUES (7, 1, 7, '席7', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (8, 1, 8, '席8', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (9, 1, 9, '席9', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (10, 1, 10, '席10', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (11, 1, 11, '席11', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (12, 1, 12, '席12', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (13, 1, 13, '席13', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (14, 1, 14, '席14', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (15, 1, 15, '席15', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (16, 1, 16, '席16', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (17, 1, 17, '席17', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (18, 1, 18, '席18', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (19, 1, 19, '席19', 0, NULL, NULL, NULL, '1', 1, '2021-09-03 08:53:20', '2021-09-26 20:38:55');
INSERT INTO `tables` VALUES (20, 1, 20, '席20', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (21, 1, 21, '席21', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');
INSERT INTO `tables` VALUES (22, 1, 22, '席22', 0, NULL, NULL, NULL, NULL, 1, '2021-09-03 08:53:20', '2021-09-03 08:53:20');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `teacher_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 1, 'AI先生', 1, '2021-09-29 00:01:21', '2021-09-29 00:01:21');
INSERT INTO `teachers` VALUES (2, 1, '○○先生', 1, '2021-09-29 00:01:46', '2021-09-29 00:01:46');
INSERT INTO `teachers` VALUES (3, 1, '765432', 1, '2021-09-29 00:13:38', '2021-09-29 00:13:38');

-- ----------------------------
-- Table structure for user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `user_coupons`;
CREATE TABLE `user_coupons`  (
  `user_coupon_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NULL DEFAULT NULL,
  `coupon_id` int(6) NULL DEFAULT NULL,
  `use_flag` int(1) NULL DEFAULT NULL COMMENT '1: new : 0:use',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_coupons
-- ----------------------------
INSERT INTO `user_coupons` VALUES (19, 2, 4, 1, '2021-10-10 02:03:21', '2021-10-10 02:03:21');
INSERT INTO `user_coupons` VALUES (20, 3, 4, 1, '2021-10-10 02:03:21', '2021-10-10 02:03:21');
INSERT INTO `user_coupons` VALUES (21, 4, 4, 1, '2021-10-10 02:03:21', '2021-10-10 02:03:21');
INSERT INTO `user_coupons` VALUES (22, 5, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (23, 6, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (24, 7, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (25, 8, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (26, 9, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (27, 10, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (28, 11, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (29, 12, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (30, 13, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (31, 14, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (32, 15, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (33, 16, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (34, 17, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (35, 18, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (36, 19, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (37, 20, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (38, 21, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (39, 22, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (40, 23, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (41, 24, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (42, 28, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (43, 29, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (44, 30, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (45, 31, 4, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (46, 2, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (47, 3, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (48, 4, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (49, 5, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (50, 6, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (51, 7, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (52, 8, 3, 1, '2021-10-10 02:03:22', '2021-10-10 02:03:22');
INSERT INTO `user_coupons` VALUES (53, 9, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (54, 10, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (55, 11, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (56, 12, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (57, 13, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (58, 14, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (59, 15, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (60, 16, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (61, 17, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (62, 18, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (63, 19, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (64, 20, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (65, 21, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (66, 22, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (67, 23, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (68, 24, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (69, 28, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (70, 29, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (71, 30, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');
INSERT INTO `user_coupons` VALUES (72, 31, 3, 1, '2021-10-10 02:03:23', '2021-10-10 02:03:23');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(6) NOT NULL AUTO_INCREMENT,
  `company_id` int(6) NULL DEFAULT NULL,
  `user_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_nick` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` int(1) NULL DEFAULT NULL,
  `user_birthday` date NULL DEFAULT NULL,
  `user_ticket` int(1) NULL DEFAULT NULL,
  `user_device_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, NULL, '99999999999', NULL, NULL, NULL, NULL, '一見', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-17 21:52:42', '2021-08-17 21:52:45');
INSERT INTO `users` VALUES (2, 1, '89898989897', NULL, NULL, 'tesq', 'test', 'やまちゃん', 'sss@test.com', '111', 1, '1990-01-17', 0, NULL, 1, '2021-08-17 21:24:22', '2021-08-17 21:24:25');
INSERT INTO `users` VALUES (3, 1, '11111111111', NULL, NULL, 'sdf', 'sdf', NULL, 'test@test.com', '222', 2, NULL, 0, NULL, 1, '2021-08-21 17:04:42', '2021-08-21 17:04:45');
INSERT INTO `users` VALUES (4, 1, NULL, NULL, NULL, NULL, NULL, 'test', 'ttt@test.com', '0869633121', 1, '2017-02-26', 0, NULL, 1, '2021-09-10 21:15:51', '2021-09-10 21:35:09');
INSERT INTO `users` VALUES (5, 1, NULL, NULL, NULL, 'cah', 'test', 'www', 'hgh@mm.pp1', '123456789', 1, '2010-09-12', 0, NULL, 1, '2021-09-10 21:42:02', '2021-09-28 02:15:55');
INSERT INTO `users` VALUES (6, 1, NULL, NULL, NULL, NULL, NULL, 'seltsd', 'test2.te@test.com', '123456689', 1, '2021-09-10', 0, NULL, 1, '2021-09-10 22:27:23', '2021-09-10 22:27:23');
INSERT INTO `users` VALUES (7, 1, NULL, NULL, NULL, NULL, NULL, 'sss', 'yui@lgf.ccc', '99933', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 01:30:22', '2021-09-11 01:41:37');
INSERT INTO `users` VALUES (8, 1, NULL, NULL, NULL, NULL, NULL, '123', '123@d.ywad', '123', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 01:55:59', '2021-09-11 07:59:11');
INSERT INTO `users` VALUES (9, 1, NULL, NULL, NULL, NULL, NULL, 'test', 'tyi@ddd.com', '123456', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 09:47:59', '2021-09-11 09:47:59');
INSERT INTO `users` VALUES (10, 1, NULL, NULL, NULL, NULL, NULL, 'new', 'input@sample.com', '1233444', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 10:25:58', '2021-09-11 10:25:58');
INSERT INTO `users` VALUES (11, 1, NULL, NULL, NULL, NULL, NULL, 'erest', '123@fsd.sd', '2233', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 17:10:21', '2021-09-11 17:10:21');
INSERT INTO `users` VALUES (12, 1, NULL, NULL, NULL, NULL, NULL, '23', '123', '123', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 17:40:25', '2021-09-11 17:40:25');
INSERT INTO `users` VALUES (13, 1, NULL, NULL, NULL, NULL, NULL, '222', '222@l.d', '222', 1, '2021-09-11', 0, NULL, 1, '2021-09-11 23:26:49', '2021-09-11 23:26:49');
INSERT INTO `users` VALUES (14, 1, NULL, NULL, NULL, NULL, NULL, 'test', 'test1@test.com', '1111', 1, '2021-09-13', 0, NULL, 1, '2021-09-13 18:07:47', '2021-09-13 18:07:47');
INSERT INTO `users` VALUES (15, 1, NULL, NULL, NULL, NULL, NULL, '111', '111@d.cod', '111', 1, '2021-09-14', 0, NULL, 1, '2021-09-14 15:30:57', '2021-09-14 15:30:57');
INSERT INTO `users` VALUES (16, 1, NULL, NULL, NULL, NULL, NULL, '222', '222@w.ert', '222', 1, '2021-09-14', 0, NULL, 1, '2021-09-14 16:07:52', '2021-09-14 16:07:52');
INSERT INTO `users` VALUES (17, 1, NULL, NULL, NULL, NULL, NULL, '22', '222', '222', 1, '2021-09-14', 0, NULL, 1, '2021-09-14 18:30:03', '2021-09-14 18:30:03');
INSERT INTO `users` VALUES (18, 1, NULL, NULL, NULL, NULL, NULL, 'twer', 'wer', 'we', 1, '2021-09-17', 0, NULL, 1, '2021-09-17 10:59:08', '2021-09-17 10:59:09');
INSERT INTO `users` VALUES (19, 1, NULL, NULL, NULL, NULL, NULL, 'qqq', 'qqq', 'qqq', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 16:07:26', '2021-09-30 16:07:26');
INSERT INTO `users` VALUES (20, 1, NULL, NULL, NULL, NULL, NULL, '33', '33', '33', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 16:13:39', '2021-09-30 16:13:39');
INSERT INTO `users` VALUES (21, 1, NULL, NULL, NULL, NULL, NULL, 'test', '1223123', 'tes@test.com', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 16:48:57', '2021-09-30 16:48:57');
INSERT INTO `users` VALUES (22, 1, NULL, NULL, NULL, NULL, NULL, 'ttt', 'ttt', 'tttt', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 17:07:01', '2021-09-30 17:07:01');
INSERT INTO `users` VALUES (23, 1, NULL, NULL, NULL, NULL, NULL, '111', '1111', '1111', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 17:30:16', '2021-09-30 17:30:16');
INSERT INTO `users` VALUES (24, 1, NULL, NULL, NULL, NULL, NULL, 'ttt', '111', 'retet@dsg.com', 1, '2021-09-30', 0, NULL, 1, '2021-09-30 18:29:50', '2021-09-30 18:29:50');
INSERT INTO `users` VALUES (28, 1, NULL, NULL, NULL, NULL, NULL, 'myTest', 'test1@sample.com', '1234567890', 1, '2021-09-30', 0, 'fzEIFAivRImrsPYN345hj6:APA91bGRriRq8mPuzncWEBWEUP1rJKB-PxB8zwc5d82OdFee0tvNMFS78GcG_7H99JmS7Wwdk2oTQLzTkZgWifqung72BdV6sV5McLsRkHeTJxihEzd7RULQsr9SNeW23gdsY0VAEImE', 1, '2021-09-30 23:17:20', '2021-09-30 23:17:20');
INSERT INTO `users` VALUES (29, 1, NULL, NULL, NULL, NULL, NULL, 'test1', 'sss@eee.yhh', '123434534', 1, '2021-10-01', 0, 'c8WcR2kGR4iBNKkeeurSv1:APA91bHUuLX5ZINymPBXLDdNMBYKWawhSJr8cUPQtriw7C91tR-KOhLojDCZNtsh2CLsMBDpoquHiNTGrJ6bElVg-4XLjNo01cTPEHenmLcGr2VlhCzeeXurYoZWxbBRjfGQ6XXc1nnH', 1, '2021-10-01 22:06:31', '2021-10-01 22:06:31');
INSERT INTO `users` VALUES (30, 1, '66538284162', 'connect!66538284162!conceptbar.info!001!51', '1', NULL, NULL, 'sss1', '222.dfdfs', '123434', 1, '2021-10-02', 0, 'd5yAxdjYQ7KWsJiEhzB3VA:APA91bEMvM6M6tNUb90P021CaSTCs9PnaPCGMs5MzWyxeYPWbXqs0hp_XJRJ4UF2hKHpbIhiSXuvaZk-LwR3J1-hk5ELoZ04lPc3ULfpxRJLUUL9EAx-wMO9JvNi5aIT0K9EDt10dPdb', 1, '2021-10-02 19:59:29', '2021-10-05 16:49:11');
INSERT INTO `users` VALUES (31, 1, '40540156804', 'connect!40540156804!conceptbar.info!001!37', '1', 'test', 'user', 'sss', 'test11@test.com', '123456789', 1, '2021-10-10', 0, 'eVNPHHCHTQyjYkn-pvw1Cu:APA91bHMJ9M7IRA-zaFeQJJiZIqGEH9EdaIYIa2479vE3qkrEn1oSWLnEJsyUJfQhNj2UtvaxRJmw4LJpLIcXvgrfF3GDNoV6q24XUeaAtqYtZzBmJgbTpwEXCvwYeshItMOhbgvR0MW', 1, '2021-10-10 07:47:52', '2021-10-10 07:47:52');
INSERT INTO `users` VALUES (33, 1, '33130851686', 'connect!33130851686!conceptbar.info!001!44', '1', 'ww', 'ww', 'ww', 'ww', 'ww', 1, '2021-10-10', 0, 'fupmAMrjQPmnQLrLz4vTQL:APA91bG4O7VD-0LypmaCx-wOi_UzjDeZwMI0rgRDEtLTVaIUZIJOJMvRNFgXfODBVGXPud_x9B3BNrm9geLd2bray1s4JT3e66KqYiCkOep1vFq-I9rMgqg-kHv-p785QUqwlq5mwm4l', 1, '2021-10-10 15:53:36', '2021-10-10 15:53:36');

SET FOREIGN_KEY_CHECKS = 1;
