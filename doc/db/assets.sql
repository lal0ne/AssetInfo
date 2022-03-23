# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8_unicode_ci NULL COMMENT '名称',
  `version` varchar(255) COLLATE utf8_unicode_ci NULL COMMENT '版本',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP',
  `uname` varchar(255) COLLATE utf8_unicode_ci NULL COMMENT '账号',
  `passwd` varchar(255) COLLATE utf8_unicode_ci NULL COMMENT '密码',
  `protocol_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '协议ID',
  `group_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '分组ID',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table assets_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets_group`;

CREATE TABLE `assets_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(255) UNIQUE COLLATE utf8_unicode_ci NOT NULL COMMENT '分组',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table protocols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `protocols`;

CREATE TABLE `protocols` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `protocol` varchar(255) UNIQUE COLLATE utf8_unicode_ci NOT NULL COMMENT '协议',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table software
# ------------------------------------------------------------

DROP TABLE IF EXISTS `software`;

CREATE TABLE `software` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) UNIQUE COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table software_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `software_list`;

CREATE TABLE `software_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `assets_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '资产ID',
  `software_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '软件ID',
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table vul
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vul`;

CREATE TABLE `vul` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) UNIQUE COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '影响范围',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table leak
# ------------------------------------------------------------

DROP TABLE IF EXISTS `leak`;

CREATE TABLE `leak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `assets_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '资产ID',
  `vul_id` int(11) COLLATE utf8_unicode_ci NULL COMMENT '漏洞ID',
  `result` int(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
