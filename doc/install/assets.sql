/*
 Navicat Premium Data Transfer

 Source Server         : XXX.XXX.XXX.XXX
 Source Server Type    : MySQL
 Source Server Version : 100328
 Source Host           : XXX.XXX.XXX.XXX:3306
 Source Schema         : assets

 Target Server Type    : MySQL
 Target Server Version : 100328
 File Encoding         : 65001

 Date: 25/03/2022 15:12:49
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
  `group_id` int(11) NULL DEFAULT NULL COMMENT '分组ID',
  `protocol_id` int(11) NULL DEFAULT NULL COMMENT '协议ID',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_group
-- ----------------------------
DROP TABLE IF EXISTS `assets_group`;
CREATE TABLE `assets_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分组',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `goadmin_menu` VALUES (12, 14, 0, 2, '软件信息', 'fa-bookmark', '/info/software_list', '软件信息', '', NULL, '2022-03-23 16:24:05', '2022-03-24 14:41:47');
INSERT INTO `goadmin_menu` VALUES (13, 14, 0, 2, '软件', 'fa-bar-chart', '/info/software', '', '', NULL, '2022-03-23 16:24:58', '2022-03-24 14:41:54');
INSERT INTO `goadmin_menu` VALUES (14, 0, 0, 2, '软件信息', 'fa-book', '', '软件信息', '', NULL, '2022-03-23 16:25:50', '2022-03-24 14:42:45');
INSERT INTO `goadmin_menu` VALUES (15, 17, 0, 2, '漏洞', 'fa-wrench', '/info/vul', '', '', NULL, '2022-03-23 16:27:06', '2022-03-24 14:41:29');
INSERT INTO `goadmin_menu` VALUES (16, 17, 0, 2, '检测结果', 'fa-resistance', '/info/leak', '', '', NULL, '2022-03-23 16:27:54', '2022-03-24 14:41:35');
INSERT INTO `goadmin_menu` VALUES (17, 0, 0, 2, '漏洞检测', 'fa-bug', '', '', '', NULL, '2022-03-24 14:41:16', '2022-03-24 14:41:16');
INSERT INTO `goadmin_menu` VALUES (18, 0, 0, 2, '设置', 'fa-cog', '', '仪表盘', '', NULL, '2022-03-25 11:15:29', '2022-03-28 15:43:54');
INSERT INTO `goadmin_menu` VALUES (19, 18, 0, 2, 'SmallBox', 'fa-bookmark-o', '/info/smallbox', '', '', NULL, '2022-03-28 15:39:04', '2022-03-28 15:39:04');
INSERT INTO `goadmin_menu` VALUES (20, 18, 0, 2, 'LineBox', 'fa-bookmark', '/info/linelbox', '', '', NULL, '2022-03-28 16:51:40', '2022-03-28 16:51:40');

SET FOREIGN_KEY_CHECKS = 1;


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
) ENGINE = InnoDB AUTO_INCREMENT = 328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `goadmin_permissions` VALUES (52, 'smallbox 查询', 'smallbox_query', 'GET', '/info/smallbox', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (53, 'smallbox 编辑页显示', 'smallbox_show_edit', 'GET', '/info/smallbox/edit', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (54, 'smallbox 新建记录页显示', 'smallbox_show_create', 'GET', '/info/smallbox/new', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (55, 'smallbox 编辑', 'smallbox_edit', 'POST', '/edit/smallbox', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (56, 'smallbox 新建', 'smallbox_create', 'POST', '/new/smallbox', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (57, 'smallbox 删除', 'smallbox_delete', 'POST', '/delete/smallbox', '2022-03-25 14:14:27', '2022-03-25 14:14:27');
INSERT INTO `goadmin_permissions` VALUES (58, 'smallbox 导出', 'smallbox_export', 'POST', '/export/smallbox', '2022-03-25 14:14:27', '2022-03-25 14:14:27');

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
INSERT INTO `goadmin_role_menu` VALUES (1, 17, '2022-03-24 14:41:16', '2022-03-24 14:41:16');
INSERT INTO `goadmin_role_menu` VALUES (1, 15, '2022-03-24 14:41:28', '2022-03-24 14:41:28');
INSERT INTO `goadmin_role_menu` VALUES (1, 16, '2022-03-24 14:41:35', '2022-03-24 14:41:35');
INSERT INTO `goadmin_role_menu` VALUES (1, 12, '2022-03-24 14:41:46', '2022-03-24 14:41:46');
INSERT INTO `goadmin_role_menu` VALUES (1, 13, '2022-03-24 14:41:53', '2022-03-24 14:41:53');
INSERT INTO `goadmin_role_menu` VALUES (1, 14, '2022-03-24 14:42:44', '2022-03-24 14:42:44');
INSERT INTO `goadmin_role_menu` VALUES (1, 18, '2022-03-25 14:31:11', '2022-03-25 14:31:11');

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_session
-- ----------------------------
INSERT INTO `goadmin_session` VALUES (80, 'ede464fc-f1fa-43db-8841-bb7e22574f2f', '__csrf_token__', '2022-03-24 17:50:53', '2022-03-24 17:50:53');
INSERT INTO `goadmin_session` VALUES (81, '8415ad5a-f7cd-45c9-b32e-155780426c8f', '__csrf_token__', '2022-03-24 17:50:56', '2022-03-24 17:50:56');
INSERT INTO `goadmin_session` VALUES (82, '78923997-0ccc-4bad-9ab8-368eed44db48', '{\"user_id\":1}', '2022-03-25 10:37:30', '2022-03-25 10:37:30');
INSERT INTO `goadmin_session` VALUES (84, 'e1d20112-d38c-47f3-ae6c-a03890961601', '__csrf_token__', '2022-03-25 11:15:29', '2022-03-25 11:15:29');
INSERT INTO `goadmin_session` VALUES (85, '32f3809a-b511-458c-b4ae-9f28271b8eef', '__csrf_token__', '2022-03-25 11:15:35', '2022-03-25 11:15:35');
INSERT INTO `goadmin_session` VALUES (86, 'e461edbc-9b9e-4997-aacc-666a3ea718d5', '__csrf_token__', '2022-03-25 14:30:36', '2022-03-25 14:30:36');
INSERT INTO `goadmin_session` VALUES (88, '7936d7c4-5250-460e-b0aa-9dc80a47decc', '__csrf_token__', '2022-03-25 14:31:11', '2022-03-25 14:31:11');
INSERT INTO `goadmin_session` VALUES (89, 'f65aeb05-3762-409c-b06d-4fd3696f6adb', '__csrf_token__', '2022-03-25 14:31:32', '2022-03-25 14:31:32');
INSERT INTO `goadmin_session` VALUES (90, 'd6d95a18-f895-430c-84f3-cc0519d75bd0', '__csrf_token__', '2022-03-25 14:32:18', '2022-03-25 14:32:18');
INSERT INTO `goadmin_session` VALUES (91, 'b1ab7193-ad51-44ca-9f4d-fb4d1a738f29', '__csrf_token__', '2022-03-25 14:47:43', '2022-03-25 14:47:43');
INSERT INTO `goadmin_session` VALUES (92, '8719f995-0abc-4a40-9c4c-a70e68020256', '__csrf_token__', '2022-03-25 15:00:20', '2022-03-25 15:00:20');
INSERT INTO `goadmin_session` VALUES (94, '30e32e9d-2c97-49ed-9ef3-abc74e1927a4', '__csrf_token__', '2022-03-25 15:06:07', '2022-03-25 15:06:07');

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
INSERT INTO `goadmin_site` VALUES (3, 'theme', 'adminlte_sep', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
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
INSERT INTO `goadmin_site` VALUES (63, 'logo', '        <b>Asset</b>Info\n    ', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
INSERT INTO `goadmin_site` VALUES (64, 'mini_logo', '        <b>Assets</b>\n    ', NULL, 1, '2022-03-23 16:11:26', '2022-03-23 16:11:26');
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
INSERT INTO `goadmin_users` VALUES (1, 'admin', '$2a$10$NdpSqa0ZML9aJ/wn1tN1UOnHKjDmwqMxq/PUn6VpNmUpeJhNSZFci', 'admin', '', 'tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
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
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for protocols
-- ----------------------------
DROP TABLE IF EXISTS `protocols`;
CREATE TABLE `protocols`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `protocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '协议',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `protocol`(`protocol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of protocols
-- ----------------------------
INSERT INTO `protocols` VALUES (1, 'SSH', '0000-00-00 00:00:00', '2022-03-23 17:53:11');
INSERT INTO `protocols` VALUES (2, 'Telnet', '2022-03-24 14:38:20', '2022-03-24 14:38:20');

-- ----------------------------
-- Table structure for smallbox
-- ----------------------------
DROP TABLE IF EXISTS `smallbox`;
CREATE TABLE `smallbox`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'icon',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'URL',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '颜色',
  `table` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据表',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '查询语句',
  `status` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '状态',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smallbox
-- ----------------------------
INSERT INTO `smallbox` VALUES (1, '资产', 'ion-ios-gear-outline', '/admin/info/assets', '#ff0000', 'assets', '', 1, '2022-03-25 15:05:42', '2022-03-25 15:05:42');
INSERT INTO `smallbox` VALUES (2, '软件', 'ion-ios-cart-outline', '/admin/info/software_list', '#ffff00', 'software_list', '', 1, '2022-03-25 15:08:07', '2022-03-25 15:08:07');
INSERT INTO `smallbox` VALUES (3, '漏洞', 'fa-user', '/admin/info/vul', '#ff0000', 'vul', '', 1, '2022-03-25 15:09:21', '2022-03-25 15:09:21');
INSERT INTO `smallbox` VALUES (4, '待确认', 'ion-ios-cart-outline', '/admin/info/leak', '', 'leak', 'result = 3', 1, '2022-03-25 15:10:13', '2022-03-25 15:10:13');

-- ----------------------------
-- Table structure for software
-- ----------------------------
DROP TABLE IF EXISTS `software`;
CREATE TABLE `software`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of software
-- ----------------------------
INSERT INTO `software` VALUES (1, 'OpenSSL', '2022-03-24 14:43:40', '2022-03-24 14:43:40');

-- ----------------------------
-- Table structure for software_list
-- ----------------------------
DROP TABLE IF EXISTS `software_list`;
CREATE TABLE `software_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `assets_id` int(11) NULL DEFAULT NULL COMMENT '资产ID',
  `software_id` int(11) NULL DEFAULT NULL COMMENT '软件ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
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
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vul
-- ----------------------------
INSERT INTO `vul` VALUES (1, 'CVE-2022-0778', '3.0.0、3.0.1、1.1.1-1.1.1m、1.0.2-1.0.2zc', '2022-03-24 14:46:15', '2022-03-24 14:46:15');

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for linelbox
-- ----------------------------
DROP TABLE IF EXISTS `linelbox`;
CREATE TABLE `linelbox`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '颜色',
  `table` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据表',
  `line_tension` int(5) NOT NULL DEFAULT 1 COMMENT '光滑度',
  `fill` tinyint(1) NOT NULL DEFAULT 0 COMMENT '填充',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT current_timestamp(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of linelbox
-- ----------------------------
INSERT INTO `linelbox` VALUES (1, '资产', '#99cc00', 'assets', 1, 0, 1, '2022-03-28 16:53:07', '2022-03-28 16:53:07');
INSERT INTO `linelbox` VALUES (2, '软件', '#00994d', 'software_list', 1, 0, 1, '2022-03-28 16:56:35', '2022-03-28 16:56:35');
INSERT INTO `linelbox` VALUES (3, '漏洞', '#ff6500', 'vul', 1, 0, 1, '2022-03-28 16:57:23', '2022-03-28 16:57:23');
INSERT INTO `linelbox` VALUES (4, '漏洞检测', '#e30039', 'leak', 1, 0, 1, '2022-03-28 16:57:52', '2022-03-28 16:57:52');

SET FOREIGN_KEY_CHECKS = 1;