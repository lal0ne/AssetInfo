/*
 Navicat Premium Data Transfer

 Source Server         : 10.10.10.226
 Source Server Type    : MySQL
 Source Server Version : 100328
 Source Host           : 10.10.10.226:3306
 Source Schema         : assets

 Target Server Type    : MySQL
 Target Server Version : 100328
 File Encoding         : 65001

 Date: 23/03/2022 16:30:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '版本',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `passwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `protocol_id` int(11) NULL DEFAULT NULL COMMENT '协议ID',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '分组ID',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets
-- ----------------------------

-- ----------------------------
-- Table structure for assets_group
-- ----------------------------
DROP TABLE IF EXISTS `assets_group`;
CREATE TABLE `assets_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分组',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_group
-- ----------------------------

-- ----------------------------
-- Table structure for goadmin_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_menu`;
CREATE TABLE `goadmin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `plugin_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_menu
-- ----------------------------
INSERT INTO `goadmin_menu` VALUES (1, 0, 1, 2, 'Admin', 'fa-tasks', '', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (2, 1, 1, 2, 'Users', 'fa-users', '/info/manager', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (3, 1, 1, 3, 'Roles', 'fa-user', '/info/roles', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (4, 1, 1, 4, 'Permission', 'fa-ban', '/info/permission', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (5, 1, 1, 5, 'Menu', 'fa-bars', '/menu', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (6, 1, 1, 6, 'Operation log', 'fa-history', '/info/op', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (7, 0, 1, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (8, 0, 0, 2, '资产信息', 'fa-bars', '', '资产信息', '', NULL, '2022-03-23 16:15:29', '2022-03-23 16:15:29');
INSERT INTO `goadmin_menu` VALUES (9, 8, 0, 2, '资产', 'fa-book', '/info/assets', '', '', NULL, '2022-03-23 16:18:53', '2022-03-23 16:18:53');
INSERT INTO `goadmin_menu` VALUES (10, 8, 0, 2, '资产组', 'fa-object-group', '/info/assets_group', '', '', NULL, '2022-03-23 16:19:45', '2022-03-23 16:19:45');
INSERT INTO `goadmin_menu` VALUES (11, 8, 0, 2, '协议', 'fa-product-hunt', '/info/protocols', '', '', NULL, '2022-03-23 16:20:39', '2022-03-23 16:20:39');
INSERT INTO `goadmin_menu` VALUES (12, 8, 0, 2, '软件信息', 'fa-bookmark', '/info/software_list', '软件信息', '', NULL, '2022-03-23 16:24:05', '2022-03-23 16:24:05');
INSERT INTO `goadmin_menu` VALUES (13, 8, 0, 2, '软件', 'fa-bar-chart', '/info/software', '', '', NULL, '2022-03-23 16:24:58', '2022-03-23 16:24:58');
INSERT INTO `goadmin_menu` VALUES (14, 0, 0, 2, '漏洞检测', 'fa-bug', '', '漏洞检测', '', NULL, '2022-03-23 16:25:50', '2022-03-23 16:25:50');
INSERT INTO `goadmin_menu` VALUES (15, 14, 0, 2, '漏洞', 'fa-wrench', '/info/vul', '', '', NULL, '2022-03-23 16:27:06', '2022-03-23 16:27:06');
INSERT INTO `goadmin_menu` VALUES (16, 14, 0, 2, '检测结果', 'fa-resistance', '/info/leak', '', '', NULL, '2022-03-23 16:27:54', '2022-03-23 16:27:54');

-- ----------------------------
-- Table structure for goadmin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_operation_log`;
CREATE TABLE `goadmin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_operation_log
-- ----------------------------
INSERT INTO `goadmin_operation_log` VALUES (1, 1, '/admin', 'GET', '127.0.0.1', '', '2022-03-23 16:12:05', '2022-03-23 16:12:05');
INSERT INTO `goadmin_operation_log` VALUES (2, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:12:17', '2022-03-23 16:12:17');
INSERT INTO `goadmin_operation_log` VALUES (3, 1, '/admin/info/generate/new', 'GET', '127.0.0.1', '', '2022-03-23 16:12:22', '2022-03-23 16:12:22');
INSERT INTO `goadmin_operation_log` VALUES (4, 1, '/admin/plugins', 'GET', '127.0.0.1', '', '2022-03-23 16:12:25', '2022-03-23 16:12:25');
INSERT INTO `goadmin_operation_log` VALUES (5, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2022-03-23 16:12:38', '2022-03-23 16:12:38');
INSERT INTO `goadmin_operation_log` VALUES (6, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"ba57bee4-3021-456e-aea8-100f1e3536e5\"],\"header\":[\"资产信息\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"资产信息\"],\"uri\":[\"\"]}', '2022-03-23 16:15:29', '2022-03-23 16:15:29');
INSERT INTO `goadmin_operation_log` VALUES (7, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2022-03-23 16:15:32', '2022-03-23 16:15:32');
INSERT INTO `goadmin_operation_log` VALUES (8, 1, '/admin', 'GET', '127.0.0.1', '', '2022-03-23 16:15:38', '2022-03-23 16:15:38');
INSERT INTO `goadmin_operation_log` VALUES (9, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2022-03-23 16:15:45', '2022-03-23 16:15:45');
INSERT INTO `goadmin_operation_log` VALUES (10, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"5932351e-0e64-42c8-b83c-d6c9c9b519d9\"],\"header\":[\"\"],\"icon\":[\"fa-book\"],\"parent_id\":[\"8\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"资产\"],\"uri\":[\"/info/assets\"]}', '2022-03-23 16:18:53', '2022-03-23 16:18:53');
INSERT INTO `goadmin_operation_log` VALUES (11, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"470c681e-1a0d-493d-9b6c-c8cda3c63fbe\"],\"header\":[\"\"],\"icon\":[\"fa-object-group\"],\"parent_id\":[\"8\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"资产组\"],\"uri\":[\"/info/assets_group\"]}', '2022-03-23 16:19:45', '2022-03-23 16:19:45');
INSERT INTO `goadmin_operation_log` VALUES (12, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"ed01736b-9652-4b51-8417-8e9f5f785052\"],\"header\":[\"\"],\"icon\":[\"fa-product-hunt\"],\"parent_id\":[\"8\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"协议\"],\"uri\":[\"/info/protocols\"]}', '2022-03-23 16:20:39', '2022-03-23 16:20:39');
INSERT INTO `goadmin_operation_log` VALUES (13, 1, '/admin', 'GET', '127.0.0.1', '', '2022-03-23 16:20:42', '2022-03-23 16:20:42');
INSERT INTO `goadmin_operation_log` VALUES (14, 1, '/admin', 'GET', '127.0.0.1', '', '2022-03-23 16:20:43', '2022-03-23 16:20:43');
INSERT INTO `goadmin_operation_log` VALUES (15, 1, '/admin', 'GET', '127.0.0.1', '', '2022-03-23 16:20:44', '2022-03-23 16:20:44');
INSERT INTO `goadmin_operation_log` VALUES (16, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2022-03-23 16:20:58', '2022-03-23 16:20:58');
INSERT INTO `goadmin_operation_log` VALUES (17, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"ebbb1152-539d-4ffc-b9e9-abbf956b58e0\"],\"header\":[\"软件信息\"],\"icon\":[\"fa-bookmark\"],\"parent_id\":[\"8\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"软件信息\"],\"uri\":[\"/info/software_list\"]}', '2022-03-23 16:24:05', '2022-03-23 16:24:05');
INSERT INTO `goadmin_operation_log` VALUES (18, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"0f12df6c-7123-4df7-95f2-c1cf261d8eb4\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"parent_id\":[\"8\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"软件\"],\"uri\":[\"/info/software\"]}', '2022-03-23 16:24:58', '2022-03-23 16:24:58');
INSERT INTO `goadmin_operation_log` VALUES (19, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"99a6f6c6-09e1-47ae-8f08-87b40da6f452\"],\"header\":[\"漏洞检测\"],\"icon\":[\"fa-bug\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"漏洞检测\"],\"uri\":[\"\"]}', '2022-03-23 16:25:50', '2022-03-23 16:25:50');
INSERT INTO `goadmin_operation_log` VALUES (20, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"e3d82328-7a52-470c-ad76-97e50bc83414\"],\"header\":[\"\"],\"icon\":[\"fa-wrench\"],\"parent_id\":[\"14\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"漏洞\"],\"uri\":[\"/info/vul\"]}', '2022-03-23 16:27:06', '2022-03-23 16:27:06');
INSERT INTO `goadmin_operation_log` VALUES (21, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"5f58c16a-dc1c-4a71-8ba4-6ab28907c13f\"],\"header\":[\"\"],\"icon\":[\"fa-resistance\"],\"parent_id\":[\"14\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"检测结果\"],\"uri\":[\"/info/leak\"]}', '2022-03-23 16:27:55', '2022-03-23 16:27:55');
INSERT INTO `goadmin_operation_log` VALUES (22, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2022-03-23 16:27:59', '2022-03-23 16:27:59');
INSERT INTO `goadmin_operation_log` VALUES (23, 1, '/admin/info/assets', 'GET', '127.0.0.1', '', '2022-03-23 16:28:03', '2022-03-23 16:28:03');
INSERT INTO `goadmin_operation_log` VALUES (24, 1, '/admin/info/assets_group', 'GET', '127.0.0.1', '', '2022-03-23 16:28:05', '2022-03-23 16:28:05');
INSERT INTO `goadmin_operation_log` VALUES (25, 1, '/admin/info/protocols', 'GET', '127.0.0.1', '', '2022-03-23 16:28:06', '2022-03-23 16:28:06');
INSERT INTO `goadmin_operation_log` VALUES (26, 1, '/admin/info/software_list', 'GET', '127.0.0.1', '', '2022-03-23 16:28:06', '2022-03-23 16:28:06');
INSERT INTO `goadmin_operation_log` VALUES (27, 1, '/admin/info/software', 'GET', '127.0.0.1', '', '2022-03-23 16:28:07', '2022-03-23 16:28:07');
INSERT INTO `goadmin_operation_log` VALUES (28, 1, '/admin/info/vul', 'GET', '127.0.0.1', '', '2022-03-23 16:28:09', '2022-03-23 16:28:09');
INSERT INTO `goadmin_operation_log` VALUES (29, 1, '/admin/info/leak', 'GET', '127.0.0.1', '', '2022-03-23 16:28:10', '2022-03-23 16:28:10');
INSERT INTO `goadmin_operation_log` VALUES (30, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:28:18', '2022-03-23 16:28:18');
INSERT INTO `goadmin_operation_log` VALUES (31, 1, '/admin/edit/site', 'POST', '127.0.0.1', '{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"E:/github/AssetInfo/logs/access.log\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"bootstrap_file_path\":[\"E:/github/AssetInfo/bootstrap.go\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"local\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"E:/github/AssetInfo/logs/error.log\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"go_mod_file_path\":[\"E:/github/AssetInfo/go.mod\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"E:/github/AssetInfo/logs/info.log\"],\"language\":[\"zh\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"72000\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}', '2022-03-23 16:28:31', '2022-03-23 16:28:31');
INSERT INTO `goadmin_operation_log` VALUES (32, 1, '/admin/info/site', 'GET', '127.0.0.1', '', '2022-03-23 16:28:32', '2022-03-23 16:28:32');
INSERT INTO `goadmin_operation_log` VALUES (33, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:28:32', '2022-03-23 16:28:32');
INSERT INTO `goadmin_operation_log` VALUES (34, 1, '/admin/edit/site', 'POST', '127.0.0.1', '{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"E:/github/AssetInfo/logs/access.log\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"bootstrap_file_path\":[\"E:/github/AssetInfo/bootstrap.go\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"local\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"E:/github/AssetInfo/logs/error.log\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"go_mod_file_path\":[\"E:/github/AssetInfo/go.mod\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"E:/github/AssetInfo/logs/info.log\"],\"language\":[\"zh\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"AssetInfo\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"72000\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"AssetInfo\"]}', '2022-03-23 16:29:17', '2022-03-23 16:29:17');
INSERT INTO `goadmin_operation_log` VALUES (35, 1, '/admin/info/site', 'GET', '127.0.0.1', '', '2022-03-23 16:29:19', '2022-03-23 16:29:19');
INSERT INTO `goadmin_operation_log` VALUES (36, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:29:19', '2022-03-23 16:29:19');
INSERT INTO `goadmin_operation_log` VALUES (37, 1, '/admin/info/site', 'GET', '127.0.0.1', '', '2022-03-23 16:29:24', '2022-03-23 16:29:24');
INSERT INTO `goadmin_operation_log` VALUES (38, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:29:24', '2022-03-23 16:29:24');
INSERT INTO `goadmin_operation_log` VALUES (39, 1, '/admin/info/site/edit', 'GET', '127.0.0.1', '', '2022-03-23 16:29:34', '2022-03-23 16:29:34');

-- ----------------------------
-- Table structure for goadmin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_permissions`;
CREATE TABLE `goadmin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_permissions
-- ----------------------------
INSERT INTO `goadmin_permissions` VALUES (1, 'All permission', '*', '', '*', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET,PUT,POST,DELETE', '/', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_permissions` VALUES (3, 'assets 查询', 'assets_query', 'GET', '/info/assets', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (4, 'assets 编辑页显示', 'assets_show_edit', 'GET', '/info/assets/edit', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (5, 'assets 新建记录页显示', 'assets_show_create', 'GET', '/info/assets/new', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (6, 'assets 编辑', 'assets_edit', 'POST', '/edit/assets', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (7, 'assets 新建', 'assets_create', 'POST', '/new/assets', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (8, 'assets 删除', 'assets_delete', 'POST', '/delete/assets', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (9, 'assets 导出', 'assets_export', 'POST', '/export/assets', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (10, 'assets_group 查询', 'assets_group_query', 'GET', '/info/assets_group', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (11, 'assets_group 编辑页显示', 'assets_group_show_edit', 'GET', '/info/assets_group/edit', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (12, 'assets_group 新建记录页显示', 'assets_group_show_create', 'GET', '/info/assets_group/new', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (13, 'assets_group 编辑', 'assets_group_edit', 'POST', '/edit/assets_group', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (14, 'assets_group 新建', 'assets_group_create', 'POST', '/new/assets_group', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (15, 'assets_group 删除', 'assets_group_delete', 'POST', '/delete/assets_group', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (16, 'assets_group 导出', 'assets_group_export', 'POST', '/export/assets_group', '2022-03-23 16:09:15', '2022-03-23 16:09:15');
INSERT INTO `goadmin_permissions` VALUES (17, 'leak 查询', 'leak_query', 'GET', '/info/leak', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (18, 'leak 编辑页显示', 'leak_show_edit', 'GET', '/info/leak/edit', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (19, 'leak 新建记录页显示', 'leak_show_create', 'GET', '/info/leak/new', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (20, 'leak 编辑', 'leak_edit', 'POST', '/edit/leak', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (21, 'leak 新建', 'leak_create', 'POST', '/new/leak', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (22, 'leak 删除', 'leak_delete', 'POST', '/delete/leak', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (23, 'leak 导出', 'leak_export', 'POST', '/export/leak', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (24, 'protocols 查询', 'protocols_query', 'GET', '/info/protocols', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (25, 'protocols 编辑页显示', 'protocols_show_edit', 'GET', '/info/protocols/edit', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (26, 'protocols 新建记录页显示', 'protocols_show_create', 'GET', '/info/protocols/new', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (27, 'protocols 编辑', 'protocols_edit', 'POST', '/edit/protocols', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (28, 'protocols 新建', 'protocols_create', 'POST', '/new/protocols', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (29, 'protocols 删除', 'protocols_delete', 'POST', '/delete/protocols', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (30, 'protocols 导出', 'protocols_export', 'POST', '/export/protocols', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (31, 'software 查询', 'software_query', 'GET', '/info/software', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (32, 'software 编辑页显示', 'software_show_edit', 'GET', '/info/software/edit', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (33, 'software 新建记录页显示', 'software_show_create', 'GET', '/info/software/new', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (34, 'software 编辑', 'software_edit', 'POST', '/edit/software', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (35, 'software 新建', 'software_create', 'POST', '/new/software', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (36, 'software 删除', 'software_delete', 'POST', '/delete/software', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (37, 'software 导出', 'software_export', 'POST', '/export/software', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (38, 'software_list 查询', 'software_list_query', 'GET', '/info/software_list', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (39, 'software_list 编辑页显示', 'software_list_show_edit', 'GET', '/info/software_list/edit', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (40, 'software_list 新建记录页显示', 'software_list_show_create', 'GET', '/info/software_list/new', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (41, 'software_list 编辑', 'software_list_edit', 'POST', '/edit/software_list', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (42, 'software_list 新建', 'software_list_create', 'POST', '/new/software_list', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (43, 'software_list 删除', 'software_list_delete', 'POST', '/delete/software_list', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (44, 'software_list 导出', 'software_list_export', 'POST', '/export/software_list', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (45, 'vul 查询', 'vul_query', 'GET', '/info/vul', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (46, 'vul 编辑页显示', 'vul_show_edit', 'GET', '/info/vul/edit', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (47, 'vul 新建记录页显示', 'vul_show_create', 'GET', '/info/vul/new', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (48, 'vul 编辑', 'vul_edit', 'POST', '/edit/vul', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (49, 'vul 新建', 'vul_create', 'POST', '/new/vul', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (50, 'vul 删除', 'vul_delete', 'POST', '/delete/vul', '2022-03-23 16:09:16', '2022-03-23 16:09:16');
INSERT INTO `goadmin_permissions` VALUES (51, 'vul 导出', 'vul_export', 'POST', '/export/vul', '2022-03-23 16:09:16', '2022-03-23 16:09:16');

-- ----------------------------
-- Table structure for goadmin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_menu`;
CREATE TABLE `goadmin_role_menu`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_menu
-- ----------------------------
INSERT INTO `goadmin_role_menu` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (1, 7, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (2, 7, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (1, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (2, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (1, 9, '2022-03-23 16:18:53', '2022-03-23 16:18:53');
INSERT INTO `goadmin_role_menu` VALUES (1, 10, '2022-03-23 16:19:45', '2022-03-23 16:19:45');
INSERT INTO `goadmin_role_menu` VALUES (1, 11, '2022-03-23 16:20:39', '2022-03-23 16:20:39');
INSERT INTO `goadmin_role_menu` VALUES (1, 12, '2022-03-23 16:24:05', '2022-03-23 16:24:05');
INSERT INTO `goadmin_role_menu` VALUES (1, 13, '2022-03-23 16:24:58', '2022-03-23 16:24:58');
INSERT INTO `goadmin_role_menu` VALUES (1, 14, '2022-03-23 16:25:50', '2022-03-23 16:25:50');
INSERT INTO `goadmin_role_menu` VALUES (1, 15, '2022-03-23 16:27:06', '2022-03-23 16:27:06');
INSERT INTO `goadmin_role_menu` VALUES (1, 16, '2022-03-23 16:27:54', '2022-03-23 16:27:54');

-- ----------------------------
-- Table structure for goadmin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_permissions`;
CREATE TABLE `goadmin_role_permissions`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  UNIQUE INDEX `admin_role_permissions`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_permissions
-- ----------------------------
INSERT INTO `goadmin_role_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (1, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_users`;
CREATE TABLE `goadmin_role_users`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  UNIQUE INDEX `admin_user_roles`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_users
-- ----------------------------
INSERT INTO `goadmin_role_users` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_users` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_roles
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_roles`;
CREATE TABLE `goadmin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_roles
-- ----------------------------
INSERT INTO `goadmin_roles` VALUES (1, 'Administrator', 'administrator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_roles` VALUES (2, 'Operator', 'operator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_session
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_session`;
CREATE TABLE `goadmin_session`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_session
-- ----------------------------
INSERT INTO `goadmin_session` VALUES (1, 'e1ced52d-ab6a-4bb1-a714-9e84820b94af', '{\"user_id\":1}', '2022-03-23 16:12:05', '2022-03-23 16:12:05');
INSERT INTO `goadmin_session` VALUES (2, '84b6b091-790a-4405-9ce6-03e921e9bdeb', '__csrf_token__', '2022-03-23 16:12:17', '2022-03-23 16:12:17');
INSERT INTO `goadmin_session` VALUES (3, 'e8d1f2d5-4b37-49d7-b97c-32d47da195d9', '__csrf_token__', '2022-03-23 16:12:22', '2022-03-23 16:12:22');
INSERT INTO `goadmin_session` VALUES (5, '9a55f016-1d19-4515-8884-19df3a27b9af', '__csrf_token__', '2022-03-23 16:15:29', '2022-03-23 16:15:29');
INSERT INTO `goadmin_session` VALUES (6, 'a15c366f-8458-45b4-a4fc-999a414aaa0b', '__csrf_token__', '2022-03-23 16:15:32', '2022-03-23 16:15:32');
INSERT INTO `goadmin_session` VALUES (10, '96328e11-fd3d-42d8-a27c-19745019b02b', '__csrf_token__', '2022-03-23 16:20:39', '2022-03-23 16:20:39');
INSERT INTO `goadmin_session` VALUES (16, '8352536e-3d08-4358-b5ee-c80d2fb5c562', '__csrf_token__', '2022-03-23 16:27:55', '2022-03-23 16:27:55');
INSERT INTO `goadmin_session` VALUES (17, '308ef01b-66e4-4b5f-b063-415d440bf136', '__csrf_token__', '2022-03-23 16:27:59', '2022-03-23 16:27:59');
INSERT INTO `goadmin_session` VALUES (19, 'e1b5cb03-9294-4ece-8c62-673de176dd47', '__csrf_token__', '2022-03-23 16:28:31', '2022-03-23 16:28:31');
INSERT INTO `goadmin_session` VALUES (21, '623460ba-ffce-4b51-85e4-70b928091363', '__csrf_token__', '2022-03-23 16:29:17', '2022-03-23 16:29:17');
INSERT INTO `goadmin_session` VALUES (22, '8595ffc5-4106-4768-b288-9afb08e41b97', '__csrf_token__', '2022-03-23 16:29:19', '2022-03-23 16:29:19');
INSERT INTO `goadmin_session` VALUES (23, 'f22d2575-bf67-4e77-8a36-076a8ff0a557', '__csrf_token__', '2022-03-23 16:29:24', '2022-03-23 16:29:24');
INSERT INTO `goadmin_session` VALUES (24, 'a797d2c6-3b15-4e53-be25-47b22aecf8d4', '__csrf_token__', '2022-03-23 16:29:34', '2022-03-23 16:29:34');

-- ----------------------------
-- Table structure for goadmin_site
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_site`;
CREATE TABLE `goadmin_site`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_site
-- ----------------------------
INSERT INTO `goadmin_site` VALUES (1, 'logger_rotate_compress', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (2, 'error_log_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (3, 'theme', 'adminlte', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (4, 'env', 'local', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (5, 'login_logo', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (6, 'animation_delay', '0.00', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (7, 'exclude_theme_components', 'null', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (8, 'operation_log_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (9, 'language', 'zh', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (10, 'login_url', '/login', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (11, 'error_log_path', 'E:/github/AssetInfo/logs/error.log', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (12, 'animation_duration', '0.00', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (13, 'app_id', 'EqBOi0BFPwtDriver', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (14, 'index_url', '/', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (15, 'debug', 'true', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (16, 'info_log_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (17, 'logger_encoder_level_key', 'level', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (18, 'logger_encoder_encoding', 'console', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (19, 'custom_500_html', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (20, 'domain', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (21, 'color_scheme', 'skin-black', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (22, 'file_upload_engine', '{\"name\":\"local\"}', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (23, 'custom_foot_html', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (24, 'auth_user_table', 'goadmin_users', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (25, 'animation_type', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (26, 'site_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (27, 'logger_encoder_caller_key', 'caller', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (28, 'logger_encoder_stacktrace_key', 'stacktrace', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (29, 'custom_403_html', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (30, 'hide_visitor_user_center_entrance', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (31, 'allow_del_operation_log', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (32, 'access_log_path', 'E:/github/AssetInfo/logs/access.log', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (33, 'logger_rotate_max_age', '30', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (34, 'logger_encoder_time_key', 'ts', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (35, 'hide_config_center_entrance', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (36, 'hide_plugin_entrance', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (37, 'sql_log', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (38, 'session_life_time', '72000', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (39, 'footer_info', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (40, 'logger_level', '0', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (41, 'logger_encoder_level', 'capitalColor', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (42, 'extra', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (43, 'hide_app_info_entrance', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (44, 'open_admin_api', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (45, 'bootstrap_file_path', 'E:/github/AssetInfo/bootstrap.go', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (46, 'logger_rotate_max_backups', '5', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (47, 'go_mod_file_path', 'E:/github/AssetInfo/go.mod', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (48, 'login_title', 'AssetInfo', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (49, 'access_assets_log_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (50, 'logger_rotate_max_size', '10', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (51, 'url_prefix', 'admin', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (52, 'hide_tool_entrance', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (53, 'prohibit_config_modification', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (54, 'logger_encoder_caller', 'full', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (55, 'custom_head_html', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (56, 'custom_404_html', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (57, 'asset_root_path', './public/', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (58, 'logger_encoder_message_key', 'msg', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (59, 'logger_encoder_duration', 'string', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (60, 'asset_url', '', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (61, 'no_limit_login_ip', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (62, 'logger_encoder_name_key', 'logger', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (63, 'logo', '<b>Go</b>Admin', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (64, 'mini_logo', '<b>G</b>A', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (65, 'info_log_path', 'E:/github/AssetInfo/logs/info.log', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (66, 'access_log_off', 'false', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (67, 'logger_encoder_time', 'iso8601', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (68, 'title', 'AssetInfo', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');

-- ----------------------------
-- Table structure for goadmin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_user_permissions`;
CREATE TABLE `goadmin_user_permissions`  (
  `user_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  UNIQUE INDEX `admin_user_permissions`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_user_permissions
-- ----------------------------
INSERT INTO `goadmin_user_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_user_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_users`;
CREATE TABLE `goadmin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_users
-- ----------------------------
INSERT INTO `goadmin_users` VALUES (1, 'admin', '$2a$10$.ObIFGjNCYuvNidQjmf/D.6NlmJI.OwVnMcc6nTZhaylnaONloNl6', 'admin', '', 'tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_users` VALUES (2, 'operator', '$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.', 'Operator', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for leak
-- ----------------------------
DROP TABLE IF EXISTS `leak`;
CREATE TABLE `leak`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `assets_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `vul_id` int(11) NULL DEFAULT NULL COMMENT '漏洞ID',
  `result` int(2) NULL DEFAULT NULL COMMENT '结果',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leak
-- ----------------------------

-- ----------------------------
-- Table structure for protocols
-- ----------------------------
DROP TABLE IF EXISTS `protocols`;
CREATE TABLE `protocols`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `protocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '协议',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `protocol`(`protocol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of protocols
-- ----------------------------

-- ----------------------------
-- Table structure for software
-- ----------------------------
DROP TABLE IF EXISTS `software`;
CREATE TABLE `software`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of software
-- ----------------------------

-- ----------------------------
-- Table structure for software_list
-- ----------------------------
DROP TABLE IF EXISTS `software_list`;
CREATE TABLE `software_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `assets_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `software_id` int(11) NULL DEFAULT NULL COMMENT '软件ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of software_list
-- ----------------------------

-- ----------------------------
-- Table structure for vul
-- ----------------------------
DROP TABLE IF EXISTS `vul`;
CREATE TABLE `vul`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '影响范围',
  `created_at` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vul
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
