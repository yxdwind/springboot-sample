/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.210
 Source Server Type    : MySQL
 Source Server Version : 100122
 Source Host           : 192.168.1.210:3306
 Source Schema         : smartfactory

 Target Server Type    : MySQL
 Target Server Version : 100122
 File Encoding         : 65001

 Date: 02/12/2019 19:05:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session`  (
  `PRIMARY_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SESSION_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`) USING BTREE,
  UNIQUE INDEX `SPRING_SESSION_IX1`(`SESSION_ID`) USING BTREE,
  INDEX `SPRING_SESSION_IX2`(`EXPIRY_TIME`) USING BTREE,
  INDEX `SPRING_SESSION_IX3`(`PRINCIPAL_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spring_session
-- ----------------------------
INSERT INTO `spring_session` VALUES ('d97e7ebd-ec94-42a9-8385-f5cc471ae79f', 'e80fe20e-6126-46ec-b703-930fa9a3dc62', 1575275239984, 1575275239984, 3600, 1575278839984, NULL);
INSERT INTO `spring_session` VALUES ('f47e5a43-795d-4b14-a6ee-273f65075432', '73acd4de-7d44-4dd7-bb73-fafd97bf1a08', 1575275255961, 1575275255961, 3600, 1575278855961, NULL);

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes`  (
  `SESSION_PRIMARY_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`) USING BTREE,
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------
INSERT INTO `spring_session_attributes` VALUES ('d97e7ebd-ec94-42a9-8385-f5cc471ae79f', 'user', 0xACED000573720026636F6D2E7366742E736D617274666163746F72792E7379732E6D6F64656C2E5379735573657272FBADA37C84CBD30200104C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000764656C466C61677400124C6A6176612F6C616E672F537472696E673B4C000667656E64657271007E00024C000669634361726471007E00024C0002696471007E00024C000669644361726471007E00024C00056A6F624E6F71007E00024C00096C6F67696E4E616D6571007E00024C00066D6F62696C6571007E00024C00046E616D6571007E00024C00056F7267496471007E00024C000870617373776F726471007E00024C000A726F6C6549644C6973747400104C6A6176612F7574696C2F4C6973743B4C000473616C7471007E00024C0004736F72747400134C6A6176612F6C616E672F496E74656765723B4C000A7570646174654461746571007E000178707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1062451078740001307074000132740001317400043239373774000074000561646D696E740000740009E7AEA1E79086E59198740001317400203331663330386262323530376138646266643165396565363466346331333434737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000077040000000078740012333834383136363435353732333935303038707371007E000677080000016EB6290D3078);
INSERT INTO `spring_session_attributes` VALUES ('f47e5a43-795d-4b14-a6ee-273f65075432', 'user', 0xACED000573720026636F6D2E7366742E736D617274666163746F72792E7379732E6D6F64656C2E5379735573657272FBADA37C84CBD30200104C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000764656C466C61677400124C6A6176612F6C616E672F537472696E673B4C000667656E64657271007E00024C000669634361726471007E00024C0002696471007E00024C000669644361726471007E00024C00056A6F624E6F71007E00024C00096C6F67696E4E616D6571007E00024C00066D6F62696C6571007E00024C00046E616D6571007E00024C00056F7267496471007E00024C000870617373776F726471007E00024C000A726F6C6549644C6973747400104C6A6176612F7574696C2F4C6973743B4C000473616C7471007E00024C0004736F72747400134C6A6176612F6C616E672F496E74656765723B4C000A7570646174654461746571007E000178707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1062451078740001307074000132740001317400043239373774000074000561646D696E740000740009E7AEA1E79086E59198740001317400203331663330386262323530376138646266643165396565363466346331333434737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000077040000000078740012333834383136363435353732333935303038707371007E000677080000016EB6290D3078);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('48879c9b733e45d9856ed231128a8ecb', '请7', '请7', 'qing7', '0', '0', '2019-11-28 14:21:27', '2019-11-28 14:21:27');
INSERT INTO `sys_dict` VALUES ('565216538a09445f916a776f6f30d8f4', '请8', '请8', '请8', '0', '0', '2019-11-28 14:21:38', '2019-11-28 14:21:38');
INSERT INTO `sys_dict` VALUES ('74ba0ccf83674ddb8dd112fc6e6763ca', '请4', '青 44', '请4', '0', '0', '2019-11-28 14:19:37', '2019-11-28 14:19:37');
INSERT INTO `sys_dict` VALUES ('7ffba6b41a5f4fe9a8e2f53bba997f89', '请6', '请667', '请6', '0', '0', '2019-11-28 14:21:13', '2019-11-28 14:21:13');
INSERT INTO `sys_dict` VALUES ('814db3a606bb4d17bb06ac82bc4a3f3e', '请10', '请10', '请10', '0', '0', '2019-11-28 14:22:15', '2019-11-28 14:22:15');
INSERT INTO `sys_dict` VALUES ('91e500430fae4208bbc1872386a6f283', '11', '11', '111', '0', '0', '2019-11-28 17:53:35', '2019-11-28 17:53:35');
INSERT INTO `sys_dict` VALUES ('97ce09d01bb2480894a1e620de26c4f1', '请5', '请5', '请5', '0', '0', '2019-11-28 14:20:55', '2019-11-28 14:20:55');
INSERT INTO `sys_dict` VALUES ('9dcecf039fdd47429d9f592cf4aedbcb', '请3', '请3', '请3', '0', '0', '2019-11-28 14:15:05', '2019-11-28 14:15:05');
INSERT INTO `sys_dict` VALUES ('a09c34470edd465484211dd1cddb5669', '请1', '问11', '女2', '0', '0', '2019-11-06 16:39:51', '2019-11-08 09:05:18');
INSERT INTO `sys_dict` VALUES ('a09c34470edd474299611dd1cddb5aac', '请2', '问22', '女2', '1', '0', '2019-11-06 16:39:51', '2019-11-07 18:34:42');
INSERT INTO `sys_dict` VALUES ('b2dede5b64514d0781f612857735d5be', '请9', '请9', '请90', '0', '0', '2019-11-28 14:21:50', '2019-11-28 14:21:50');

-- ----------------------------
-- Table structure for sys_dict_list
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_list`;
CREATE TABLE `sys_dict_list`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典ID',
  `sort` int(2) DEFAULT NULL COMMENT '序号',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '键值',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_list
-- ----------------------------
INSERT INTO `sys_dict_list` VALUES ('3ab79019a0854025a336d2ab4a5f1bb6', '48879c9b733e45d9856ed231128a8ecb', 12, '123', '213', 'qwe', '0', '0', '2019-11-28 15:53:21', '2019-11-28 15:53:21');
INSERT INTO `sys_dict_list` VALUES ('4960dfe5bd9d4904a4e9d611ded38bf0', '48879c9b733e45d9856ed231128a8ecb', 1, '1', '1', '1', '0', '0', '2019-11-28 14:34:44', '2019-11-28 14:34:44');
INSERT INTO `sys_dict_list` VALUES ('9c950ea122204d90bc55fd9b79680253', 'e5f6046c9822410496bde2aee434d24c', 1, '是DVD', '是不是bf', '飞', '0', '0', '2019-11-07 16:40:55', '2019-11-07 16:40:55');
INSERT INTO `sys_dict_list` VALUES ('b1999b337766467a830debcd72f9a368', 'a09c34470edd465484211dd1cddb5669', 2, '列表2', '列表2', '列表2', '0', '0', '2019-11-28 14:08:58', '2019-11-28 14:08:58');
INSERT INTO `sys_dict_list` VALUES ('c7f01751dd5646d883b2f89dcff9b157', '48879c9b733e45d9856ed231128a8ecb', 333, '12', '213', '', '0', '0', '2019-11-28 15:53:45', '2019-11-28 15:53:45');
INSERT INTO `sys_dict_list` VALUES ('fe25acc5bb864d9b8db786a346383da6', '9dcecf039fdd47429d9f592cf4aedbcb', 10, '大个', '被我q', '把市委办', '0', '0', '2019-11-28 14:15:39', '2019-11-28 14:15:39');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `english_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '英文名',
  `href` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问地址',
  `sort` int(3) DEFAULT NULL COMMENT '序号',
  `ico` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `target` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目标',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('01645bb6ca5a47e08b93bdd6f4d96d23', '809b1e54749a4649a903d5b951c4c05c', '规则主体', '', '/WarningSubject', 3, NULL, NULL, '2019-11-14 16:43:12', '2019-11-29 10:09:30', '0');
INSERT INTO `sys_menu` VALUES ('0a67630b54714785a381d5b7888d8bec', '14e98b37248e450fb6ddef4a90aae443', '用户设置', '', '/SystemUser', 2, NULL, NULL, '2019-11-14 16:45:39', NULL, '0');
INSERT INTO `sys_menu` VALUES ('14e98b37248e450fb6ddef4a90aae443', '997310aa6f734db2b48260dac27a2686', '系统设置', '', '/SystemSetting', 1, NULL, NULL, '2019-11-14 16:44:47', NULL, '0');
INSERT INTO `sys_menu` VALUES ('167314c192ab4b0d99e11c2b188c4da4', '', '资产管理', '', '/PropertyManage', 2, 'el-icon-document', NULL, '2019-11-14 16:37:48', NULL, '0');
INSERT INTO `sys_menu` VALUES ('19dd474b713d41b9a344cc304ac303c7', 'bbd284d9a8144937bf0e74974d72b5d2', '巡更任务', '', '/PatrolTask', 1, NULL, NULL, '2019-11-14 16:39:43', NULL, '0');
INSERT INTO `sys_menu` VALUES ('25b7a75858de4261bf67c96a0d7b1998', 'eec2f907d75d4c01b0812aea8cf75cb5', '历史轨迹', '', '/HistoryRoute', 2, NULL, NULL, '2019-11-14 16:41:06', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2b1be257ebfa4d36b98c2270c4290831', '809b1e54749a4649a903d5b951c4c05c', '告警规则-规则主体配置', '', '/WarningRuleListConfigure', 4, NULL, NULL, '2019-11-14 16:42:49', NULL, '0');
INSERT INTO `sys_menu` VALUES ('369f6c3f405e416f8c68fae7308fde50', 'eec2f907d75d4c01b0812aea8cf75cb5', '实时定位', '', '/CurrentPosition', 1, NULL, NULL, '2019-11-14 16:40:37', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4093f49a0ad04b4aa4fbfb723ef69a66', 'dbbedb504c854d1a8be5afcccbff4167', '考勤记录', '', '/', 1, NULL, NULL, '2019-11-14 16:37:04', NULL, '0');
INSERT INTO `sys_menu` VALUES ('418a857a8cbd46db9e3397aa41701132', 'c35aabb8e7e64daf9f8869dfa32bd711', '区域信息', '', '/AreaInfo', 1, NULL, NULL, '2019-11-14 16:38:59', NULL, '0');
INSERT INTO `sys_menu` VALUES ('49eeb390f01f440494c90c9d9f0d67aa', 'dbbedb504c854d1a8be5afcccbff4167', '考勤规则', '', '/AttendanceRuleList', 2, NULL, NULL, '2019-11-14 16:37:24', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4e24bf5b3ab7432aa4eedc6f4c241405', 'a4ce69de3f1e4821a818634d96867d6f', '违规记录', '', '/violators', 1, NULL, NULL, '2019-11-14 16:43:57', NULL, '0');
INSERT INTO `sys_menu` VALUES ('52c24928023d46328e700033f670c445', '809b1e54749a4649a903d5b951c4c05c', '告警功能管理', '', '/WarningState', 6, NULL, NULL, '2019-11-14 16:43:41', NULL, '0');
INSERT INTO `sys_menu` VALUES ('5c5fd9143cc041dfb7b50f65eda71df9', '', '111111', '11111', '1111', 111, NULL, NULL, '2019-11-27 18:03:14', '2019-11-27 18:03:54', '1');
INSERT INTO `sys_menu` VALUES ('629c7ec1f2ca46cd86aa4663933ccab4', '14e98b37248e450fb6ddef4a90aae443', '角色设置', '', '/SystemCharactar', 3, NULL, NULL, '2019-11-14 16:45:58', NULL, '0');
INSERT INTO `sys_menu` VALUES ('647367c2d3744ab087efc392c89512be', '997310aa6f734db2b48260dac27a2686', '日志管理', '', '/LogManage', 4, NULL, NULL, '2019-11-14 16:48:26', NULL, '0');
INSERT INTO `sys_menu` VALUES ('6845e20393c945d189ee6d8ea81f41cd', '8562eb8bc6eb4820b349358bdea3bda2', '字典', '', '/Dictionary', 1, NULL, NULL, '2019-11-14 16:47:49', NULL, '0');
INSERT INTO `sys_menu` VALUES ('7135c4fad3fd4c7387920801c89c1369', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '服务器管理', '', '/deviceServer', 1, NULL, NULL, '2019-11-14 16:39:59', NULL, '0');
INSERT INTO `sys_menu` VALUES ('7732db73df1c4fb79e29e9d5382a9108', '14e98b37248e450fb6ddef4a90aae443', '菜单设置', '', '/SystemMenu', 4, NULL, NULL, '2019-11-14 16:46:16', NULL, '0');
INSERT INTO `sys_menu` VALUES ('77dcc6d374704ffbba1b452d4041ddd7', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '标签管理', '', '/deviceTag', 5, NULL, NULL, '2019-11-14 16:41:15', NULL, '0');
INSERT INTO `sys_menu` VALUES ('78fa8a860ba9463095c8297aa8a93f61', 'f4b846a3edc54350b95ee17765f82362', '追踪配置', '', '/linkageConfiguration', 1, NULL, NULL, '2019-11-14 16:42:49', NULL, '0');
INSERT INTO `sys_menu` VALUES ('809b1e54749a4649a903d5b951c4c05c', '', '告警管理', '', '/WarningManage', 6, 'el-icon-message-solid', NULL, '2019-11-14 16:41:34', NULL, '0');
INSERT INTO `sys_menu` VALUES ('8562eb8bc6eb4820b349358bdea3bda2', '997310aa6f734db2b48260dac27a2686', '字典管理', '', '/Dictionary', 3, NULL, NULL, '2019-11-14 16:47:28', NULL, '0');
INSERT INTO `sys_menu` VALUES ('872a0c8554a840df927326bf69741b1e', '647367c2d3744ab087efc392c89512be', '标签日志', '', '/TagLog', 2, NULL, NULL, '2019-11-14 16:49:11', NULL, '0');
INSERT INTO `sys_menu` VALUES ('8fded08805bf4171a62c656fe9e96de2', '809b1e54749a4649a903d5b951c4c05c', '告警规则', '', '/WarningRuleList', 2, NULL, NULL, '2019-11-14 16:42:01', NULL, '0');
INSERT INTO `sys_menu` VALUES ('94e0cfc7a5dd4ab69df12a825010419a', 'f4b846a3edc54350b95ee17765f82362', '追踪管理', '', '/linkageState', 2, NULL, NULL, '2019-11-14 16:43:13', NULL, '0');
INSERT INTO `sys_menu` VALUES ('997310aa6f734db2b48260dac27a2686', '', '系统管理', '', '/SystemManage', 7, 'el-icon-setting', NULL, '2019-11-14 16:44:27', NULL, '0');
INSERT INTO `sys_menu` VALUES ('a2c9ac45e2134a4796e33ecc4342e766', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '语音屏管理', '', '/deviceVoiceScreen', 7, NULL, NULL, '2019-11-14 16:41:58', NULL, '0');
INSERT INTO `sys_menu` VALUES ('a4ce69de3f1e4821a818634d96867d6f', '', '违规记录', '', '/violators', 17, 'el-icon-s-marketing', NULL, '2019-11-14 16:43:35', NULL, '0');
INSERT INTO `sys_menu` VALUES ('a6f986bc62714f67ad8dde79f51c37af', '809b1e54749a4649a903d5b951c4c05c', '告警规则-类型', '', '/WarningRuleListType', 1, NULL, NULL, '2019-11-14 16:42:23', '2019-11-29 10:09:12', '0');
INSERT INTO `sys_menu` VALUES ('b28ecafa52574f8da738d344cfeb949d', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '门禁管理', '', '/deviceEntrance', 6, NULL, NULL, '2019-11-14 16:41:33', NULL, '0');
INSERT INTO `sys_menu` VALUES ('b2dde984df39452c8404b49031e1a1fe', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '参数管理', '', '/parametermanage', 1, NULL, NULL, '2019-11-14 16:46:58', NULL, '0');
INSERT INTO `sys_menu` VALUES ('b7b134c7c0dd4ae6b7d7a34b4acd27b3', '997310aa6f734db2b48260dac27a2686', '参数设置', '', '/ParamSetting', 2, NULL, NULL, '2019-11-14 16:46:40', NULL, '0');
INSERT INTO `sys_menu` VALUES ('bbd284d9a8144937bf0e74974d72b5d2', '', '巡更管理', '', '/PatrolManage', 4, 'el-icon-rank', NULL, '2019-11-14 16:39:21', NULL, '0');
INSERT INTO `sys_menu` VALUES ('c35aabb8e7e64daf9f8869dfa32bd711', '', '区域管理', '', '/AreaManage', 3, 'el-icon-s-help', NULL, '2019-11-14 16:38:37', NULL, '0');
INSERT INTO `sys_menu` VALUES ('c46e3ed20b8f4780a3e6ebcdbc7a751c', 'bbd284d9a8144937bf0e74974d72b5d2', '巡更记录', '', '/PatrolRecord', 2, NULL, NULL, '2019-11-14 16:39:59', NULL, '0');
INSERT INTO `sys_menu` VALUES ('cfbb2c81b626442d9513d8373c8a1c81', '647367c2d3744ab087efc392c89512be', '操作日志', '', '/OperateLog', 1, NULL, NULL, '2019-11-14 16:48:53', NULL, '0');
INSERT INTO `sys_menu` VALUES ('d2032c49e0bf4a47a06c4f55284b94be', '14e98b37248e450fb6ddef4a90aae443', '机构设置', '', '/SystemOrganization', 1, NULL, NULL, '2019-11-14 16:45:12', NULL, '0');
INSERT INTO `sys_menu` VALUES ('dbbedb504c854d1a8be5afcccbff4167', '', '考勤管理', '', '/AttendanceManage', 1, 'el-icon-s-claim', NULL, '2019-11-14 16:36:46', NULL, '0');
INSERT INTO `sys_menu` VALUES ('e17db1b03ca042abbbe8f8df98670a35', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '工作站管理', '', '/deviceWorkStation', 2, NULL, NULL, '2019-11-14 16:40:19', NULL, '0');
INSERT INTO `sys_menu` VALUES ('ea7703dd23ef4990aaf2751dff86b54f', '167314c192ab4b0d99e11c2b188c4da4', '资产信息', '', '/PropertyInfo', 1, NULL, NULL, '2019-11-14 16:38:09', NULL, '0');
INSERT INTO `sys_menu` VALUES ('eec2f907d75d4c01b0812aea8cf75cb5', '', '定位消息', '', '/PositionInfo', 5, 'el-icon-map-location', NULL, '2019-11-14 16:40:17', NULL, '0');
INSERT INTO `sys_menu` VALUES ('f21500971444435daad64d5866cd0e10', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '基站管理', '', '/deviceBaseStation', 3, NULL, NULL, '2019-11-14 16:40:35', '2019-11-14 16:40:41', '0');
INSERT INTO `sys_menu` VALUES ('f4b846a3edc54350b95ee17765f82362', '', '追踪管理', '', '/Linkage', 16, 'el-icon-s-marketing', NULL, '2019-11-14 16:42:25', NULL, '0');
INSERT INTO `sys_menu` VALUES ('f4caddb93fb74705843e6aca17631b8c', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '摄像机管理', '', '/deviceCamera', 4, NULL, NULL, '2019-11-14 16:41:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('f8fef41111084442b418d4015ab57f89', '167314c192ab4b0d99e11c2b188c4da4', '资产类型', '', '/PropertyType', 2, NULL, NULL, '2019-11-14 16:38:23', NULL, '0');
INSERT INTO `sys_menu` VALUES ('fb780a1b7e5a4bccae2ad1bce57ffeea', '', '设备管理', '', '/attendance', 15, 'el-icon-s-platform', NULL, '2019-11-14 16:39:00', '2019-11-14 16:39:08', '0');
INSERT INTO `sys_menu` VALUES ('fb7e396efdcb45a4bddadd2c977a4f96', '809b1e54749a4649a903d5b951c4c05c', '告警记录', '', '/WarningRecord', 5, NULL, NULL, '2019-11-14 16:41:47', '2019-11-29 10:09:43', '0');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `sort` int(2) DEFAULT NULL COMMENT '序号',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('0ef89614f9054686b2d010ba862c9068', '5', '123', '31123', 1, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('0f3bdf0452ac465785d23ebc4571683a', '5', 'Java组领导', '986502', 22, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('1', NULL, '研发部', '1001', 1, '0', '2019-10-30 11:07:16', '2019-11-01 11:07:24');
INSERT INTO `sys_org` VALUES ('2', '1', 'JAVA组', '1001001', 1, '0', '2019-10-31 11:27:27', '2019-11-01 11:27:37');
INSERT INTO `sys_org` VALUES ('2534a3db0fe7452686daca240936cfee', '4', '测试一组', '5123652', 1, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('3', '1', '前端组', '1001002', 2, '0', '2019-10-31 11:28:29', '2019-10-31 11:28:32');
INSERT INTO `sys_org` VALUES ('4', '1', '测试组', '1001003', 3, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('446ebde544444bf0a76a03dc3f4413d2', '5', 'Java组专员', '952032', 20, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('44e50f0943144246a193681b3e98855e', 'cadc4bfa70354c2e8e046ec23f4901ac', '测试11', '11', 11, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('46e0fd6a91f74d4084cd9cbf55ee511b', '5', 'JAVA二组', '1001001002', 1, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('5', '2', 'JAVA一组', '1001001001', 1, '0', NULL, NULL);
INSERT INTO `sys_org` VALUES ('a77619f46ad844a48e375855168147ff', '3', '前端一组', '1212', 123123, '0', NULL, '2019-12-02 14:04:13');
INSERT INTO `sys_org` VALUES ('bfbe1c71a32f481e87a2f892777e434e', '2', 'JAVA三组', '1111111', 322, '0', NULL, '2019-11-04 15:59:36');
INSERT INTO `sys_org` VALUES ('c3126155c48849a585133b8d417ed14f', '2', 'JAVA二组', '1001001003', 20, '0', NULL, '2019-11-27 15:21:11');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '键值',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否启用',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('1aadcd84cd7649aaa689e168fcda0ce2', '5', '5', '5', '0', '5', '0', '2019-11-27 18:07:18', '2019-11-27 18:07:18');
INSERT INTO `sys_param` VALUES ('bbda66b9e7304c13aa3539da49bc386a', '3', '3', '3', '0', '3', '0', '2019-11-27 18:07:09', '2019-11-27 18:07:09');
INSERT INTO `sys_param` VALUES ('c32242a3cc7342049f04cf02b37492ab', '8', '8', '8', '0', '8', '0', '2019-11-27 18:07:32', '2019-11-27 18:07:32');
INSERT INTO `sys_param` VALUES ('c729faa00f984addaaf2615b0e690275', '6', '6', '6', '0', '6', '0', '2019-11-27 18:07:22', '2019-11-27 18:07:22');
INSERT INTO `sys_param` VALUES ('ddb9096c47274cd9856025e3b5cc9680', '7', '7', '7', '0', '7', '0', '2019-11-27 18:07:28', '2019-11-27 18:07:28');
INSERT INTO `sys_param` VALUES ('ebd89bdf9bca4d5b8ebeae46ce06bdff', '9', '9', '9', '0', '9', '0', '2019-11-27 18:07:38', '2019-11-27 18:07:38');
INSERT INTO `sys_param` VALUES ('ed8ba9d0e79a476ab60d7894ac5a5d11', '', 'ddvg', 'dshhfr', '0', 'swhrh', '0', '2019-11-08 09:05:58', '2019-11-08 18:27:30');
INSERT INTO `sys_param` VALUES ('f08ff49a799448f9a50d15cc1f0d3611', '4', '4', '4', '0', '4', '0', '2019-11-27 18:07:14', '2019-11-27 18:07:14');
INSERT INTO `sys_param` VALUES ('f60ce2799b1d4f81b052572566e714cc', '撒网v', '大学城但是', '下顺槽', '0', 'v但是', '0', '2019-11-08 10:09:58', '2019-11-08 10:09:58');
INSERT INTO `sys_param` VALUES ('f993f9dbc1d8449491adc4a73a65e43c', '2', '2', '2', '0', '2', '0', '2019-11-27 18:07:04', '2019-11-27 18:07:04');
INSERT INTO `sys_param` VALUES ('ff0504eeec7a4f4ab5f0b1c485a70326', '撒从v是', '比你那', '的深V', '1', '的想法', '0', '2019-11-08 14:22:13', '2019-11-08 17:21:30');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构id',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `sort` int(2) DEFAULT NULL COMMENT '序号',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('00608635bbf846709118985721e154ca', '2', 'java组二号', 9, '2019-11-27 17:57:44', '2019-12-02 14:11:56', '0');
INSERT INTO `sys_role` VALUES ('1', '1', '研发部二号', 2, NULL, '2019-12-02 14:09:00', '0');
INSERT INTO `sys_role` VALUES ('132c2cb66be343698bacf8f308adae37', '4', '测试组三号', 5, '2019-11-27 17:57:11', '2019-12-02 14:10:27', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '研发部一号', 1, NULL, '2019-12-02 14:08:25', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '研发部三号', 3, NULL, '2019-12-02 14:09:11', '0');
INSERT INTO `sys_role` VALUES ('510a5072f6614976b49afe5dca3a00b1', '3', '前端组二号', 8, '2019-11-27 17:57:36', '2019-12-02 14:11:20', '0');
INSERT INTO `sys_role` VALUES ('51a90516c8dd4295a437b9b356ef4f93', '4', '测试组一号', 3, '2019-11-27 17:55:22', '2019-12-02 14:09:46', '0');
INSERT INTO `sys_role` VALUES ('540bddf1c52b48298064edb2b0ed1ca4', '3', '前端组一号', 1, '2019-11-29 18:23:21', '2019-12-02 14:11:28', '0');
INSERT INTO `sys_role` VALUES ('5707044b794c4abe83b1ea51d76373ce', '4', '测试组二号', 4, '2019-11-27 17:57:01', '2019-12-02 14:10:16', '0');
INSERT INTO `sys_role` VALUES ('666530616e7a4db0b8083e3214880f5d', '4', '测试组四号', 10, '2019-11-27 17:57:52', '2019-12-02 14:12:14', '0');
INSERT INTO `sys_role` VALUES ('70904a97a5b64c0ca43d7e6061238c99', '2', 'java组一号', 1, '2019-11-29 18:24:33', '2019-12-02 14:05:47', '0');
INSERT INTO `sys_role` VALUES ('77509cb4934247ac8f32e6fc3501754c', '3', '前端组一号', NULL, '2019-11-29 18:23:51', '2019-12-02 14:06:09', '0');
INSERT INTO `sys_role` VALUES ('81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'java二组一号', 6, '2019-11-27 17:57:20', '2019-12-02 14:10:43', '0');
INSERT INTO `sys_role` VALUES ('8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '测试一组二号', 12, '2019-11-29 18:21:36', '2019-12-02 14:07:09', '0');
INSERT INTO `sys_role` VALUES ('93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '测试一组一号', 1, '2019-11-27 17:55:09', '2019-12-02 14:07:18', '0');
INSERT INTO `sys_role` VALUES ('95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '前端一组一号', 9, '2019-11-29 18:25:00', '2019-12-02 14:04:44', '0');
INSERT INTO `sys_role` VALUES ('978b09f7c3bb42619fb0a6d30e44ad57', '1', '研发部四号', 15432, '2019-11-28 14:45:56', '2019-12-02 14:12:34', '0');
INSERT INTO `sys_role` VALUES ('f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', 'java组专员一号', 7, '2019-11-27 17:57:28', '2019-12-02 14:11:09', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色Id',
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构id',
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单id',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('00421e8879e74589bf392deaa28a0525', '70904a97a5b64c0ca43d7e6061238c99', '2', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('00b1bae7d1084755aa7a6f6f14dd2304', '1', '1', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('00f700fc329b4c0aa163d8ccef56fe0e', '00608635bbf846709118985721e154ca', '2', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('01066cf53b134af1a4026c6a97dc8ae2', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('01072c747cb44cc9b980ad364b09dfd7', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('01edc6ad77224b06921c133289d0af19', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0211347176864ff3b30de6a94fb50feb', '00608635bbf846709118985721e154ca', '2', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('02a2b01a60904fd7a51b58f207212fa6', '77509cb4934247ac8f32e6fc3501754c', '3', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('02c2d32d7492454bbe9eab74e5dae240', '3', '1', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('02eab7f4855841a784fe78cc402e25b6', '132c2cb66be343698bacf8f308adae37', '4', '52c24928023d46328e700033f670c445', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0321dfc1b1c949048976e592abbb9492', '510a5072f6614976b49afe5dca3a00b1', '3', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('037abb368b9d48d7a33a5113adef06a5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('03e9d94743154ec4b61faa5a84d4204a', '3', '1', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('04c6b6ef29e3461682813790284d2977', '3', '1', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('058b5564dfbe43439cc019cb12427ef6', '540bddf1c52b48298064edb2b0ed1ca4', '3', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('05dc4e3388424b27a367dc94ed498079', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('05e4d1521ba64812be9c49251c17034f', '70904a97a5b64c0ca43d7e6061238c99', '2', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('067c881a6eb841f69692e1c829f2af8c', '3', '1', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('06a39edb8d3f49cbb303dbde3c0f41cd', '70904a97a5b64c0ca43d7e6061238c99', '2', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('07e95453a5a344dfb380a8e8b1fe904a', '2', '1', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('083ae5ce4d71440f8576e2d981228a27', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('08606d5c075b4502a8fb98198281d23e', '510a5072f6614976b49afe5dca3a00b1', '3', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:11:20', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('09211165286b4f33a6fe86d4faa7d010', '77509cb4934247ac8f32e6fc3501754c', '3', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0934f9c7c72149e6a9084cff4524d3ab', '5707044b794c4abe83b1ea51d76373ce', '4', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:10:14', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('09c64a2196334f968b1ec137a3d80308', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('09dd7533101c4fea9d5413e5c7f1cf3d', '70904a97a5b64c0ca43d7e6061238c99', '2', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0ab09c05461f4ab29fbe5b3af0bc3459', '510a5072f6614976b49afe5dca3a00b1', '3', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0b2fdf4445b54a2eb224c0be027fd44e', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0b6f829346e6461d8910ebdcd21d7b8e', '2', '1', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0c23ad75bfb14a81b90f00c292ca2485', '70904a97a5b64c0ca43d7e6061238c99', '2', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0e7ee2f43a2f4ad8912d8d9266ac50bb', '3', '1', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('0eec58b2ec9940229b181a550cec877d', '3', '1', '52c24928023d46328e700033f670c445', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('10e09c7fb33f42d5b48680a17dde5f7d', '70904a97a5b64c0ca43d7e6061238c99', '2', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('116a3524860a443bacc44aa55cca73fc', '2', '1', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('11a0c8c8f9b84ce3aaa806443f371231', '3', '1', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('11b6ebb71c454887b41c99596729a6ca', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('12037ec5d3a341a9b3d10e107bc00962', '77509cb4934247ac8f32e6fc3501754c', '3', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('12e2ab71359a4e4a8affb11906c96c2d', '3', '1', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1389c1daccd64471ba47b9fec5b25108', '1', '1', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1485caf1714449a9879b8e29bd5ed768', '132c2cb66be343698bacf8f308adae37', '4', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('152ac0e8223b4d8086ccecc458870c47', '70904a97a5b64c0ca43d7e6061238c99', '2', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('175da8e564d14d6b860f652139f60278', '2', '1', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('176cc8cf7faa40fbbacb42435c3da545', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('17d6ad1b8f03449bbdf73b2d9ba91331', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1904672fb7684dbdb53a69f538179619', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('19563113a5544e4aa8512f05ff8f3924', '1', '1', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('196e6677468143e8b92c04c39d5cfcee', '540bddf1c52b48298064edb2b0ed1ca4', '3', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1a8ca87086a349d2921043768c35e4f9', '3', '1', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1b0e922f6fec494abc7518cb7fa780f1', '00608635bbf846709118985721e154ca', '2', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1bb61ea7b3db4facba73433ee61b4a38', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:07:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1c6bec98a1a742c2b50f8174d56630c9', '132c2cb66be343698bacf8f308adae37', '4', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1ceef6a7474c4bf9a23cbdab12bc7166', '5707044b794c4abe83b1ea51d76373ce', '4', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1d896f842a824a3dad5cef9e15a58413', '132c2cb66be343698bacf8f308adae37', '4', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('1eb2f9c8d1de4411a6434d7dfd7b3314', '2', '1', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('20c31e4dbc914098975fdd026b818618', '70904a97a5b64c0ca43d7e6061238c99', '2', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('20e236b8699146808c93c0ba7c00c266', '51a90516c8dd4295a437b9b356ef4f93', '4', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('20f5a4fdbd2248389769feeca30cdfab', '1', '1', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('21d4163d635e4cf29ab53c1761f839a5', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2270b2e17021489f83c44a8ea1de2fcb', '510a5072f6614976b49afe5dca3a00b1', '3', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('22e83b4f68c64812a0d62aa7d370a708', '132c2cb66be343698bacf8f308adae37', '4', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('231298f4e92e4c14bd272d25f9ca3c7c', '77509cb4934247ac8f32e6fc3501754c', '3', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2396071f4016414f9a2e17d6b77ef520', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('23e1bc186f3244aa93076a2decefd589', '2', '1', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('24362494713e4fd6862fae21902c0deb', '666530616e7a4db0b8083e3214880f5d', '4', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('247e984936624c9f9779a7bb622a0260', '5707044b794c4abe83b1ea51d76373ce', '4', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:10:14', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('248291b6f91b46c7b49dfef0637ec43b', '510a5072f6614976b49afe5dca3a00b1', '3', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:11:20', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('25549c81b2a54545b7925646711d47c2', '2', '1', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2554c1021746447fbd778a470e40fce7', '2', '1', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2578b5cc684c448a9c614f780467a769', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('263659688a7b463792f93cafc6d96e01', '3', '1', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2653cef7ebd84ca1976d81842e93f0b0', '1', '1', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('26f0f384dcd84538b5fdd1046ef4cff8', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('26f5b17e245d4568b39cb7394a06244c', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('276543345c65419c87afdabe2fc785ea', '666530616e7a4db0b8083e3214880f5d', '4', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('27d7405d217243829392675e3b05f9f6', '77509cb4934247ac8f32e6fc3501754c', '3', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('288572ea20654d2d80366834de3e2915', '2', '1', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('28a998ddf0af453f80cc6b2dcd015e02', '3', '1', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('28b40f1181bf4a9c802fc5291e38ed4f', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('28c5173d613844b1a6ba156957b258b9', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('296899f4357d4663adec7944657dd70c', '5707044b794c4abe83b1ea51d76373ce', '4', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('296d281a30084944b1f050623ebc0141', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2a128d7a63f24971ae79182ff4eaedb3', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2b5571e6b26f4285a2e848b1cd1fa456', '1', '1', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2b967aab24ca4e5f87e89cbd0d7fe954', '540bddf1c52b48298064edb2b0ed1ca4', '3', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2c7a127d88ce4c948adb82b857c5ebfe', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:07:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2ca6eb2d31a64ea4b05b149c144ebd7c', '77509cb4934247ac8f32e6fc3501754c', '3', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2d63c6e8825b4a7fbd36a3d8a237fbb6', '00608635bbf846709118985721e154ca', '2', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2e6f26f6efdb42089f8589a0cc6647e0', '51a90516c8dd4295a437b9b356ef4f93', '4', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2e736bb608c441f594d0ea607c461b9b', '2', '1', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2e7bec9c563a486b8861d5d2322a0a67', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2e99444dfc504ae7814f4e80c0ad8cd2', '132c2cb66be343698bacf8f308adae37', '4', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2f2acd0f703f4d07b062b5c93e5cdb22', '3', '1', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:09:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2f3526550bbd48b2a2223fd7729f4246', '510a5072f6614976b49afe5dca3a00b1', '3', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:11:20', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2f4ff0caa3af42079d23400ee8420f4f', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('2f9c574fb8d24ac6b64b631d1755a6c4', '77509cb4934247ac8f32e6fc3501754c', '3', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('30ae09529d654fc58c4d9e297031e243', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('33e1b5d673b84fbf83cb40bc559fc253', '540bddf1c52b48298064edb2b0ed1ca4', '3', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3403ec11280247c386b8902c8cc580d4', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3421ed7731ac4e79b2c8661c3a078e3a', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '52c24928023d46328e700033f670c445', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3428fb2c8ecd4831b1ca6a1996cee2bd', '3', '1', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('34473163e9484beb91c3310d2bc78088', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('349a11a1da754a84ac39d6a28519d9a6', '77509cb4934247ac8f32e6fc3501754c', '3', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('34ab924685c94820a8eff8d029a91e96', '132c2cb66be343698bacf8f308adae37', '4', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('34cc48ec3f0a49ada9d4368039a65fb4', '77509cb4934247ac8f32e6fc3501754c', '3', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('34d71a26c16f4bed843fa471b1a698b2', '5707044b794c4abe83b1ea51d76373ce', '4', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('34ffc3661fc0458c891bbda3ab7f50e9', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('36aa9570476c462b8e278effd9f25bfc', '51a90516c8dd4295a437b9b356ef4f93', '4', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('36cd1a6380fa45e79a7eaa42fdedd6ec', '70904a97a5b64c0ca43d7e6061238c99', '2', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('36f3ac5cede244a9a53dc4c7af17b441', '77509cb4934247ac8f32e6fc3501754c', '3', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('38466973378d4d518a74eae5cace9fb1', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('39d13e4ef1b34ebfadd5bc6caf172b57', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('39f2bd363ffc44588da9e3ab25280f59', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3a03bbd92dde432b9c9413a820075d52', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '52c24928023d46328e700033f670c445', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3b8511992656461783ef908e6cb4b547', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:04:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3bb8fbc9d5c94af2b4f3145187331af4', '1', '1', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3c1cf13ad78643348abd38afef23b908', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3c8f829252c04017981ca169983355a0', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3cfde80734e64328a15682ad4f4ca2b9', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3e2919f9105e4173bd9110611078bb11', '00608635bbf846709118985721e154ca', '2', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3e4b6c93ba7f438eb15e4dde63d89f88', '666530616e7a4db0b8083e3214880f5d', '4', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3e94699eec2d447cb4864d03ab89f71a', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3f18c280804d4d2faf1086fe0175af39', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('3f3bcbff9a92475587117bdca3f31159', '2', '1', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('40294dbdfc1e4793a9f14dfd54773f2e', '1', '1', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:09:00', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4137102fc7584e1c9d6b7e819cdf5fdd', '132c2cb66be343698bacf8f308adae37', '4', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('42a1b18ae8a94f61a3b0d6bec3816762', '3', '1', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('42c2c8ec33594d2db2ed18480f08a641', '1', '1', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4384795afc7c450d9ea628a21aa962c1', '2', '1', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:08:25', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('43bcbfa8e90442509e71b2ca3061b678', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4414192100524511be9786d317ac016b', '77509cb4934247ac8f32e6fc3501754c', '3', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('446c073e48d04fa4a52f5744cda73be5', '540bddf1c52b48298064edb2b0ed1ca4', '3', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('447de7ecc93542c7b43954f3f7127573', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('44810e2963954d9c90ffd10ea3dbf35c', '77509cb4934247ac8f32e6fc3501754c', '3', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('44821012011c4fd2b802b4e516bb2c88', '2', '1', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('44a893a2b650422ba85373bdf8ed9c9b', '77509cb4934247ac8f32e6fc3501754c', '3', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('44c68f967c3d4c77b7d104a898b67c7c', '2', '1', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:08:25', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('44cce81f8fd34a98a778cdfe22effba0', '1', '1', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('458393a82c5143caab61f14ac3d3a8c5', '666530616e7a4db0b8083e3214880f5d', '4', '52c24928023d46328e700033f670c445', '2019-12-02 14:12:14', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('476920caf1294e67ad2e01eb8dca7093', '2', '1', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('47d4af798ff4497294f99cf572057af0', '00608635bbf846709118985721e154ca', '2', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4818aced41ea4c8284f3250f97d65b30', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4988aaf5d507435590e5b0bf56e77c11', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('49ab51426305422f846b2c02a3ef2dc4', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4a1c7d9ddce6450fb73f1124f8c2d614', '1', '1', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:09:00', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4b0ec7cf79c24bcf9e514801840d8e7b', '3', '1', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4b9758f88c274cc48db544e807c1def4', '70904a97a5b64c0ca43d7e6061238c99', '2', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4cf5a3d6345c4231babfed857ccd5812', '5707044b794c4abe83b1ea51d76373ce', '4', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4d32618525a64434b62568727595a744', '3', '1', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4de987659f34402a826e0175b4d6c2fb', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4df35af8c54142e0aeb73e44cf09d035', '5707044b794c4abe83b1ea51d76373ce', '4', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4e3434d004d94d8ba266e1b710e57ba8', '3', '1', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4ea71598d8a540c7841ee7b100b74cf2', '77509cb4934247ac8f32e6fc3501754c', '3', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4eb56747d9d446d984922e9edad17a9a', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:04:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4ee0d5cf794a41ce95037bb031c32756', '666530616e7a4db0b8083e3214880f5d', '4', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4fa4fd410e35462d8d8b7934d848de35', '2', '1', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4fae86f156ee4e1090ecd04fb5eb5d38', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('4fc7971189104b80a0f3cb0eb6273227', '70904a97a5b64c0ca43d7e6061238c99', '2', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5013aca439c44bf58e0a9b70ef5c51bf', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('502470ae03174def8a1f437c8b9b09ef', '77509cb4934247ac8f32e6fc3501754c', '3', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('507d300c63324f489d92f90159301283', '70904a97a5b64c0ca43d7e6061238c99', '2', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:05:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('512c0f0d4bf146278eee056328ebf6ef', '1', '1', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('51d59909a4f9429aa66323190c1bcc95', '77509cb4934247ac8f32e6fc3501754c', '3', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('52b6688d872f4ae3a0db643b84dec9dd', '666530616e7a4db0b8083e3214880f5d', '4', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('533686b0c47c4aaf9445553e9af7502f', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('536005a9ba2043c788ab575129bcd4b9', '5707044b794c4abe83b1ea51d76373ce', '4', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('53ad9acde1ab4b9caa929f698ccc1c04', 'f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:11:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('545bccefc23246d89674c1ff55275d1e', '3', '1', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('548757bae55b472da39ca6430cb77ac2', '3', '1', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('54bb3c04ba174014b0447faef05bba7d', '5707044b794c4abe83b1ea51d76373ce', '4', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('54e0ae3b36764e3aa0182bb240c002be', '70904a97a5b64c0ca43d7e6061238c99', '2', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('54f3ae563b274225bdcdea11329a23a5', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '52c24928023d46328e700033f670c445', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('55a070d575594e7894b66ca33ea4ba51', '2', '1', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('563eb25a93214e6abc8b27ae612b5778', '666530616e7a4db0b8083e3214880f5d', '4', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:12:14', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('57034cbed44f466392edabb257a1f9fe', '77509cb4934247ac8f32e6fc3501754c', '3', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('57619a844bae47e18ded37780681537e', '2', '1', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5770171aab0643f6a300531bb71c3302', '77509cb4934247ac8f32e6fc3501754c', '3', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('57abc44d7ea9438db89a49582fe28bf3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:12:33', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('582ea24680d447049923a3b2bf06a8a6', '2', '1', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('58473ece73ee4bb39132727f5261440e', '77509cb4934247ac8f32e6fc3501754c', '3', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('584ba1d7f05b4c83abef2d8b13369d6c', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('58aff7054a2c474aaafc8647f805a301', '2', '1', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('58ef2c78000a4ffabc11321dc51c3c40', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('592514079aad4bd0bee123049190d996', '2', '1', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('59efad81e5694021b633545cfeca1597', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5a2b1a1e169f420ca682d09d5c0f0c13', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5a6f9f3f76c84518a0fbf6d62b45c8ad', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5ba613780ca44dcc850dfab6d579eb68', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5cfec5b9a87e4b34aa5a68a05e6ee25a', '666530616e7a4db0b8083e3214880f5d', '4', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5d689fad9ace4527accd34e4bddf9f47', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5e39217b70714ddfaa1e15996a4e5149', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5e4c5623b4b549acb43ee2582cf14281', '3', '1', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:09:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5e4f3314b8b442baa68d5c80c44217f0', '00608635bbf846709118985721e154ca', '2', '52c24928023d46328e700033f670c445', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5ee4c24a1df647bbb1d8ca50399db902', '510a5072f6614976b49afe5dca3a00b1', '3', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('5fa12106dd0b438c94d01d71d9bf87ef', '1', '1', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6233df79dbe34d56a2c86a21878f8bca', '70904a97a5b64c0ca43d7e6061238c99', '2', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('641c496d3e3044c08bbb1cd119b6278d', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6443b0dc7ac949eba56eb9b15c0ee3a4', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('64883b6be83e40d3a3af12c79e4f1da7', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('64a7ec0b6cfa4b5a85bca3b7014ed087', '2', '1', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('65a428a425ad48c2a7dc6fc8fb6c8c3d', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('661ffeac99494ac4a280922ba357e261', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6783585b6989467186f964b00f068223', '5707044b794c4abe83b1ea51d76373ce', '4', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6806ee55564b443ca59a3356bb49ec7a', '132c2cb66be343698bacf8f308adae37', '4', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('68bd39d1afec4999ac093b7deb57d44a', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('696b0965694541c6ace6f87ab650d268', '51a90516c8dd4295a437b9b356ef4f93', '4', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:09:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('69b96a936f7b4128885b6ccdc9b332eb', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6a42fd77700946e5ac8a85acc48b895a', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6a5d1173385b447490e0c7283bc63d24', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6aebab148487465488d607dda9693098', '77509cb4934247ac8f32e6fc3501754c', '3', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6b131a272e84445b898f56dac1c0d2da', '2', '1', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6e299893676c452d91072af51e3fcca2', '132c2cb66be343698bacf8f308adae37', '4', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6e4004fad84248f3a64ea22de063b08e', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6f03ed3785974987ac324c8c0c5bedc2', '3', '1', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('6f496a0700974ca1b60233aea6dc72e0', '3', '1', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('707d2390f7e246f297b4a956e585fc4d', '70904a97a5b64c0ca43d7e6061238c99', '2', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('70dda1f1ba494a57bcbcbf8d1b23e251', '2', '1', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('711cb5c6c29241e78d9db9067cc0a54e', '51a90516c8dd4295a437b9b356ef4f93', '4', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:09:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7159639d17e244d59dea64950c296758', '2', '1', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('71c5de524a4c405482005f0ff0e57431', '1', '1', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('721456462a9a43938b39239353059f8f', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('735c5d2412c4479c8b618e79bc4f9d0c', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('736e218687144e99bf1762f7d1cab9d6', '3', '1', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7461d4c57f7e44409c6dc3405d890179', '77509cb4934247ac8f32e6fc3501754c', '3', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('74f132cc079f4b1c82b74fc374a9e7b0', '3', '1', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('751eee249bf64d0b8d6acc9813a45bb0', '70904a97a5b64c0ca43d7e6061238c99', '2', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('75983ede909d46faa94fe65a0f7369da', '77509cb4934247ac8f32e6fc3501754c', '3', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7617f817991942f59bad6677411dbf93', '70904a97a5b64c0ca43d7e6061238c99', '2', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7620a03d8c1146d5a4c62abe31d5a4eb', '132c2cb66be343698bacf8f308adae37', '4', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('762271c774c548739fe3b6ec9ae63f64', '70904a97a5b64c0ca43d7e6061238c99', '2', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('77935e3d734a45a6a324febbf881de88', '1', '1', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('77d80081e2b549a2bf99fbb36deeaced', '70904a97a5b64c0ca43d7e6061238c99', '2', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('787d4a9a7dd249af955edb14349f7b2f', '00608635bbf846709118985721e154ca', '2', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('792b0269fc48454d8d1357105d46789a', '3', '1', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('796ba9d7609a454a92fc2b983d9200ff', '132c2cb66be343698bacf8f308adae37', '4', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('79964b6066e5405d985660a573f7b150', '540bddf1c52b48298064edb2b0ed1ca4', '3', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('79f330dcb8aa41888fed6ea5cf5fc4e0', '5707044b794c4abe83b1ea51d76373ce', '4', '52c24928023d46328e700033f670c445', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7a4613e0f80b49d7bdacdc4a76c57537', '132c2cb66be343698bacf8f308adae37', '4', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7aa8574feb8e494296380ac071d5006a', '1', '1', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7b1119010ea14264b1df53888192c29b', '2', '1', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7b7e7f0e7c494eadb235f2a6d6d33af8', '666530616e7a4db0b8083e3214880f5d', '4', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7bc2c1c6e7184a94aa25b00a3c083c05', '77509cb4934247ac8f32e6fc3501754c', '3', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7c9f6e3694054948bf722bd6286cc257', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7ca90277bc484e52952692579eff5cd5', '70904a97a5b64c0ca43d7e6061238c99', '2', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:05:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7d7d938909d04b3a886b1fa82c2d89fd', '77509cb4934247ac8f32e6fc3501754c', '3', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7dcd5d786f2d473b928d83bbc63339c0', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7e1c9e6f69f14540957f1847f1d7ab3a', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7f4044ae70214680a1ab497140e29398', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('7fbbcde5ea314189b7a7f67642f834fe', '51a90516c8dd4295a437b9b356ef4f93', '4', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:09:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('80190f6e3ae64584ba5b21c1c37be505', '5707044b794c4abe83b1ea51d76373ce', '4', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8043ab260a154341a026bc8eaba62eef', '77509cb4934247ac8f32e6fc3501754c', '3', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8088c65bb9f14ed38d903c98b9a04849', '2', '1', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('81795b5d7c0c485da49bbdf2806444cf', '3', '1', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('831756839ae94faa989560d89126a342', '3', '1', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8352d8876208448e88b024f418527e97', '77509cb4934247ac8f32e6fc3501754c', '3', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('837698212be44231875c2389fc1aff80', '1', '1', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('84e366ed3f6b481faf943bb851e8c492', '1', '1', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('85745f85b05242a09de57bd6a3c77a4e', '70904a97a5b64c0ca43d7e6061238c99', '2', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('866467b7aad349e0b23f1fe8a2e388a7', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('86c37d6ac9194b11a03a3fddf01ee271', '2', '1', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('86d7e5a141744376a644bb3b35bdc562', 'f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:11:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('875ace9e4bfb4b318865626b5ff85cc6', '70904a97a5b64c0ca43d7e6061238c99', '2', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('87f8ce527d4643b4928e6a268d65b44e', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('881c94d4e96141a4a09cd59bc9b6e608', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('88f5acbf3e044987b9468071728c12a8', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8993930cdde44c9f8e26c58dec7cac56', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('89ac0b67b93f4d748ec985ef2f581019', '70904a97a5b64c0ca43d7e6061238c99', '2', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('89d9ad4f9275430898c6857bded4df38', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8a40b8364f5e4783bd63034b5bd66b93', '2', '1', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8a83be7b0962468b93702d35f5b554b1', '00608635bbf846709118985721e154ca', '2', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8ae763c8984140d4959cd2cbdff53046', '3', '1', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8b6e300e19ad470584db5106947d6bb1', '00608635bbf846709118985721e154ca', '2', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8cf491c8b88343d88df56ad5bfb76d11', '1', '1', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:09:00', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8d09148e0bbf43898c568b40a6dc9971', '70904a97a5b64c0ca43d7e6061238c99', '2', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8d1e1203a272488b81a9894ed10e36f4', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8dbaad4183854415a74d4c597b70a53a', '2', '1', '94e0cfc7a5dd4ab69df12a825010419a', '2019-12-02 14:08:25', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8e205e8385fa4c9181697d39fc652da4', '77509cb4934247ac8f32e6fc3501754c', '3', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8f13c1f10d384c35a78f5778728e016d', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '52c24928023d46328e700033f670c445', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('8fe555482ce5475e89a32918739351fc', '70904a97a5b64c0ca43d7e6061238c99', '2', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('903046d47f924341a1d4219afd14b86b', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('90bdc93b24654e898a47ce36f4ce6f38', '77509cb4934247ac8f32e6fc3501754c', '3', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('915dab1174d14c6faf15735b27459f15', '1', '1', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('931dbd2e4e414301a37356323782bd20', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9341b23dc1784cf8894b12b36177c39b', '2', '1', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('934f12d5eb75481086b8732f44a6308e', '70904a97a5b64c0ca43d7e6061238c99', '2', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9411437438864f90b43c92d6861ad3a0', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('94cc127fb6094d30bb3c3ad044604863', '00608635bbf846709118985721e154ca', '2', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('95182188d709463d90a661449ebf1dd4', '1', '1', '52c24928023d46328e700033f670c445', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9527464c50cd4ddbaa8ff905cf005f96', '2', '1', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('952d4ca34b284531a4040ff280aa4f15', '132c2cb66be343698bacf8f308adae37', '4', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('953a46f9a6934c578d4d8851f9633781', '2', '1', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9715fc25f27a41fdaded8694ecd047e1', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('97f16c4b8e414121970fbaf589053dc2', '51a90516c8dd4295a437b9b356ef4f93', '4', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('97fdf48d3dbc4ce58a28a750580f1e53', '1', '1', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('99c25dd194b9432f80feeda2ab28fd85', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:12:33', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('99f5494df0474fc5ba321dacab013834', '1', '1', 'f4caddb93fb74705843e6aca17631b8c', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9a3eebce2172486eae69ce13fcfe6443', '2', '1', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9afa5c39944a42c79a4da46d39e04ab0', '70904a97a5b64c0ca43d7e6061238c99', '2', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9b763d26153b44ccb13ffdb2d1c555b7', '3', '1', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9b94e3a1162c4fafb13afacc0f467c94', '70904a97a5b64c0ca43d7e6061238c99', '2', '52c24928023d46328e700033f670c445', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9c1f12b2274543a3a9f3e7d62f0ce9c2', '77509cb4934247ac8f32e6fc3501754c', '3', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9cdc7cd0f3cd4b0582118a6b2e083d1c', '3', '1', '77dcc6d374704ffbba1b452d4041ddd7', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9d133631a63d43dca604146100c9b75c', '510a5072f6614976b49afe5dca3a00b1', '3', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9e00b2e4d65e48c287184cb7be36a41d', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9e056ee11366406b9e29b63d0c361b3c', '3', '1', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9ecbabb7e77244ee94737a5d4426ae95', '51a90516c8dd4295a437b9b356ef4f93', '4', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9ecd85f554f74257b946e827e4937617', '540bddf1c52b48298064edb2b0ed1ca4', '3', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9f5707f1cb7e4546871ba7400b408aa2', '510a5072f6614976b49afe5dca3a00b1', '3', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9fe23d82d2f44a8491cf7d1ac56388e5', '1', '1', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('9ff9d80d7de54cf6b8874ec73a78f242', '1', '1', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a03a992f30ed4e3186c2b28fab140c63', '77509cb4934247ac8f32e6fc3501754c', '3', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a05890c3ebbe4cd9b0bb2760437a7fe4', '2', '1', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a0c61911c143470db205bca6bd8eabc8', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a179b59c6a61408a9b526e4e6a0676e0', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a1e0f6faa80844c28dd39e6547072590', '132c2cb66be343698bacf8f308adae37', '4', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:10:26', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a20576581fe54da396c68f2e256b0dfd', '77509cb4934247ac8f32e6fc3501754c', '3', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a3ddc9df8f3e4e288c0df59a496cb31f', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a41bc368be5b4095b2a5f0718e682e37', '5707044b794c4abe83b1ea51d76373ce', '4', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a435efabcf2d4b7c91a12a8968bff322', '1', '1', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a485deec74c248d794c30af5c2005608', '510a5072f6614976b49afe5dca3a00b1', '3', '52c24928023d46328e700033f670c445', '2019-12-02 14:11:20', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a491cf024c974ec3893edb6d8515b2b1', '3', '1', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a54514e0f8174e2eb8a1bc31b2268f0b', '2', '1', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a59ced081e504f02b70718be0fbed188', '3', '1', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a5c438895a234e92b4b9d223dfdc3f2c', '00608635bbf846709118985721e154ca', '2', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a5ecadb3b19a4ca384a82f600f86c355', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:12:33', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a63d162956f143fea322784b6bba8f89', '70904a97a5b64c0ca43d7e6061238c99', '2', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a6aba18b5f9c424cbe95082cfa2712ce', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a72556cbdf8049f0a90043e5cd25de92', '666530616e7a4db0b8083e3214880f5d', '4', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a74cd06b5a4241bd9140a59006b94cf6', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a78cd6cfc7d3461c873778301a23d27b', '540bddf1c52b48298064edb2b0ed1ca4', '3', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a7a89aae3b5d445db266d9908b4f1341', '77509cb4934247ac8f32e6fc3501754c', '3', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a835f81c670a4e3cb0c7613a60014066', '1', '1', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a91953cca8f94e0d830f702c8e2cc624', '666530616e7a4db0b8083e3214880f5d', '4', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a96b98a8a08445e9bb54e4c3e763e7fb', '132c2cb66be343698bacf8f308adae37', '4', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a9de3a3ca2c14bfdaba1f23907e692d5', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '7135c4fad3fd4c7387920801c89c1369', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('a9e87ba4e45f468c80af70bc65b1e3d2', '51a90516c8dd4295a437b9b356ef4f93', '4', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:09:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('aa4e1df5070e4a4d8967343fda8c546d', '77509cb4934247ac8f32e6fc3501754c', '3', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('abe75fc9a79544ebb9112e9aa4c65968', '3', '1', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('abf96b62388146fba24a041594927a41', '77509cb4934247ac8f32e6fc3501754c', '3', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('abfdbf87116743149b6369b4717c311e', '1', '1', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ac551dca7eca4ff7a940bf60f95c3cef', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ace29eadb20e4d96878d888221001ffb', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ae0c64ee5b9c4afbb68e9338faa67011', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ae85d00de2b942d9865bb5428747fa02', '00608635bbf846709118985721e154ca', '2', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('aebb786db5ce4c1cbc9048fb1f5ce8bd', '510a5072f6614976b49afe5dca3a00b1', '3', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('aed6fa161f934b39b51e91b1ae45e18e', '3', '1', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('af5ce128aba744c09e388a2aaf828c67', '666530616e7a4db0b8083e3214880f5d', '4', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b034d46499df4fc19d3370ecbada8af7', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b2c7a8599396435db569923786388401', 'f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:11:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b2f37d22b11b4177b55687826ad61ed3', 'f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:11:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b424540452844e839feba129aa800b37', '3', '1', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b42d525f45ff4ce7a6ec3d88af60ee11', '540bddf1c52b48298064edb2b0ed1ca4', '3', '52c24928023d46328e700033f670c445', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b4bbe93492c64a77b6f17b648fa82140', '77509cb4934247ac8f32e6fc3501754c', '3', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b599f75979a84fa99fb631896a7317e3', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b65aaca52abe4d37abe99e3880a2376d', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b664098780124be2a03d4fc3cd369f3d', '3', '1', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b689e28e21934b4c810916454fd4cbe1', '1', '1', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b6cedb2a953b4d59b038f68d1486ab92', '70904a97a5b64c0ca43d7e6061238c99', '2', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b7648b81574a428c90d753c74f140837', '540bddf1c52b48298064edb2b0ed1ca4', '3', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b787631a5adc4644a44f7c78c3386ea3', '70904a97a5b64c0ca43d7e6061238c99', '2', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b8a3cf6058374325bc586e11aae7dde8', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b8d7214073314d80844c1539d9d28fe3', '5707044b794c4abe83b1ea51d76373ce', '4', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b905bae1aa264146b1874fefcf0f01f9', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b91c6a61451340e6b4b6a65ebba5e115', '77509cb4934247ac8f32e6fc3501754c', '3', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b946d47190d24b86b0ad680c8ecdf220', '1', '1', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('b95451d37d404d92a2440189d9cde5e3', '1', '1', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ba0cbafc70e9494e92e01b17bc349b87', '2', '1', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ba53c371781f466eb85f9f6a920743b8', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ba74e8f534d34cbd9cab09241a0aa7f6', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '4093f49a0ad04b4aa4fbfb723ef69a66', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bb9af2df5f9c4ea6b08e78f90ee5e498', '666530616e7a4db0b8083e3214880f5d', '4', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bc000923f927400db9f20d57c74c1f74', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bc43b4a60f634432838f83924a66f0a4', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bc5e0e77f55f495ca214eb4db51fd7ab', '00608635bbf846709118985721e154ca', '2', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bcc868eacc7341fea567b6ed7ef41a5e', '2', '1', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bd23b1d5e24a4eb79af20054ccffd848', '510a5072f6614976b49afe5dca3a00b1', '3', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bdd8ef055b6b498f8d105894b66fc824', '77509cb4934247ac8f32e6fc3501754c', '3', '52c24928023d46328e700033f670c445', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bee7e6764613435db9c0c2499a7bc789', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bf27b3a6f9bd4769b6478b1a8092d87b', '666530616e7a4db0b8083e3214880f5d', '4', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bf840810a3c44a11a1d1a2ff9c363b5b', '132c2cb66be343698bacf8f308adae37', '4', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('bfef9d9f0acc40a1adfcb59b241a7d4a', '70904a97a5b64c0ca43d7e6061238c99', '2', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c0101ca334e145c5a4f65c01ab25a33b', '1', '1', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c0f07d79514b4b7696ebc157aa93a28f', '510a5072f6614976b49afe5dca3a00b1', '3', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c0f84217974d49a89495750ed93e9047', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c1682a2b99ed438bb1cfb2e733760f99', '2', '1', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c31ba9ef43c04476ab1401e542cf626f', '2', '1', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:08:24', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c408e531bdf04abc97c7bc4f7732bd42', '5707044b794c4abe83b1ea51d76373ce', '4', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c42204d805dd474586b8e082b7895cf4', '1', '1', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c4944db573d54cbfadf58f05b4530ea3', '3', '1', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c55ab866322b47ada4bfa6511a238687', '510a5072f6614976b49afe5dca3a00b1', '3', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c60cc05a0b9345df80541eb05b0e6de0', '2', '1', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c6dc3ee9bee24974a4875df9275b8b99', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:11:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c7023b8c1f184ecdba538f8fb481534c', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c74dd6e21d6b41888663d775dc3d85d0', '3', '1', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c7713a1571ed4aba91e3130358edbbf9', '666530616e7a4db0b8083e3214880f5d', '4', '2b1be257ebfa4d36b98c2270c4290831', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c7bc29ce8ca04172b961c7e2e1db35d0', '77509cb4934247ac8f32e6fc3501754c', '3', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c847249db6f649aea0ac2105efe4bcf5', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c8741031a9da466e98e1f97027eaa638', '00608635bbf846709118985721e154ca', '2', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c96b755bdc7f4f5d82e9b10497c0fd86', '2', '1', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:08:25', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c987667df0b844de920038b05a75a008', '3', '1', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('c9ee1bd3f3104dcaa9ee05381c9ef53a', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ca0911fa84d1488e920cc20ada7e9123', '70904a97a5b64c0ca43d7e6061238c99', '2', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ccfbd039474c44c3b88c3708a41968b6', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('cd68ead0ce4d4b84aafb5df8ee3d1de4', '1', '1', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('cd8e6e4cedb840fdbb70db7387069371', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ce8a8eb2b1204a2e8c6ae88db70d4855', '3', '1', '14e98b37248e450fb6ddef4a90aae443', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('cefc975dffed4824928661fb88019373', '1', '1', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('cf99c54444774a42a8197738ff7d10f8', '51a90516c8dd4295a437b9b356ef4f93', '4', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('cfbe1b8b8f914511835c63bfb1efc5e2', '1', '1', '872a0c8554a840df927326bf69741b1e', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d13d61aeaf114c59bebfc98518054bd0', '3', '1', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d2217fbfa405479aa70ab1048eba869e', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d31b0b361fe34a03927c50b9f7ae7d9f', '00608635bbf846709118985721e154ca', '2', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d32c842b9075499caa3dfd0ed2b734a9', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d3c4026bc9cf462186706c7b2f78ad02', '00608635bbf846709118985721e154ca', '2', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:11:55', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d4214c6dc27f4c26b08fca603a6d55ed', '510a5072f6614976b49afe5dca3a00b1', '3', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d4412dd9369b404fa5f9c615289533a0', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d52ae69c36d0439e8a1210245317d550', '70904a97a5b64c0ca43d7e6061238c99', '2', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:05:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d5581a98528846d38b0abf1306fcb983', '1', '1', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d76fe909f3f14f70ac47cbafc2c45d3a', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d7e1be068d0a4fd0a252e8a8b26dc546', '1', '1', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('d94b29fc90774e7687a9416e4fe24bde', '666530616e7a4db0b8083e3214880f5d', '4', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('da5d0d121ef849b0b420ee258f0d96ac', '1', '1', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('da7af9781f7749e48d5f368ace72aa7e', '1', '1', '647367c2d3744ab087efc392c89512be', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('dc858b09862e4e7dbb9bbc6ec42593c0', '70904a97a5b64c0ca43d7e6061238c99', '2', '0a67630b54714785a381d5b7888d8bec', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('dd72d607714e4dba900cc2a22f141476', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('dd92a2e3470442a09cb92dd86f9acfeb', '3', '1', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ddd6d4ed373d4bffa5af115396e39622', '77509cb4934247ac8f32e6fc3501754c', '3', 'f21500971444435daad64d5866cd0e10', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('de1d5c0a015d481998c3b6e15c109645', '70904a97a5b64c0ca43d7e6061238c99', '2', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('de773f43b437472b8e2191a17ca2197b', '77509cb4934247ac8f32e6fc3501754c', '3', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('de8fcf9651bd4c998448d0697eef2223', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('de9244980d1d4122b018213787740d6d', '70904a97a5b64c0ca43d7e6061238c99', '2', '25b7a75858de4261bf67c96a0d7b1998', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('df612aa64cec4f8bb694bfdc9506e8d5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('dfcbc8b395704a65b646f5b81617a928', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'b7b134c7c0dd4ae6b7d7a34b4acd27b3', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('dfec4a2fa22745e9917b33825a03dc70', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e0db6b81dbf64805a3707b290818bfe2', '77509cb4934247ac8f32e6fc3501754c', '3', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:06:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e107c45cbfd747b6a39307b6d7b3eec2', '70904a97a5b64c0ca43d7e6061238c99', '2', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e24ad42cb85a4b2081f2b3ed468da6e2', '666530616e7a4db0b8083e3214880f5d', '4', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e261966004584b9b9d69c975bf6e71d1', '978b09f7c3bb42619fb0a6d30e44ad57', '1', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:12:33', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e27d4bf74c7b429b842e55359e1d0e22', '3', '1', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:09:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e2d686f44a9d431f9870e2e64bcf734b', '1', '1', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e2f0c67f545c4e6eb96e729467eb9174', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e3243301e0b649c39583510b25027475', '2', '1', '418a857a8cbd46db9e3397aa41701132', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e358aedf3fb6489fa6cfe985f29d46a6', '70904a97a5b64c0ca43d7e6061238c99', '2', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e483616f874a49399187d23b9ba3f753', '2', '1', '78fa8a860ba9463095c8297aa8a93f61', '2019-12-02 14:08:25', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e4b7de60c3f84c83ae3f4a56e3682ebd', '3', '1', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e54a17f66c2d4090b7d2e099ff4f4f80', '70904a97a5b64c0ca43d7e6061238c99', '2', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e68930376b224b79be8e2aa33830f41d', '5707044b794c4abe83b1ea51d76373ce', '4', '49eeb390f01f440494c90c9d9f0d67aa', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e6e9d5a77909451a9fbd28cd2c89efc7', '510a5072f6614976b49afe5dca3a00b1', '3', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('e7fa6efbd1f94ff5a39dd56e78d41ff7', '3', '1', 'd2032c49e0bf4a47a06c4f55284b94be', '2019-12-02 14:09:10', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ea73207bd115482fa7c12be3919d5a04', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'a4ce69de3f1e4821a818634d96867d6f', '2019-12-02 14:07:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ea828a1387df4e2a8797fa54bb35437b', '3', '1', '4e24bf5b3ab7432aa4eedc6f4c241405', '2019-12-02 14:09:11', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('eaa5f1c2676a44a68da4e51bc02e6ed9', '1', '1', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ead1eeeeec4a4e41aff84a68f3dc7045', '77509cb4934247ac8f32e6fc3501754c', '3', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ead7f62b7b144c6b8e73332568014c29', '70904a97a5b64c0ca43d7e6061238c99', '2', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('eafe8c5591694d4395c8f45c1465917c', '1', '1', '6845e20393c945d189ee6d8ea81f41cd', '2019-12-02 14:08:59', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('eb9a55b18254427184ce94322b6f5185', '510a5072f6614976b49afe5dca3a00b1', '3', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ebe1f9bac2bd4014927c3acb4722f329', '540bddf1c52b48298064edb2b0ed1ca4', '3', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:11:28', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ec3df9b300f44dfa8872e5c084092481', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', 'dbbedb504c854d1a8be5afcccbff4167', '2019-12-02 14:04:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ed16cc88d31743a7aefb26c5922154dc', '70904a97a5b64c0ca43d7e6061238c99', '2', 'b28ecafa52574f8da738d344cfeb949d', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ed259e5478e14c23bdcdea26d0010f6c', '2', '1', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ed3b769742494c609221211f730beec6', '2', '1', '52c24928023d46328e700033f670c445', '2019-12-02 14:08:23', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ed67949e62b443f385b37c201d537647', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:07:18', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ed731c709b9d472bb9023799cb69b7da', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:10:42', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ee09c62c55aa4b0da6ab2f8d1ed59620', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ee5ce620f43341f7b6a553064a73209c', '2', '1', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:08:22', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ee85f15eb0974d9c9e232033b36cd62b', '5707044b794c4abe83b1ea51d76373ce', '4', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('efe32d3ce9644b0d89cdcf96908d5d54', '70904a97a5b64c0ca43d7e6061238c99', '2', 'a2c9ac45e2134a4796e33ecc4342e766', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f00cd4b433f448a49227a9ce67c6d14b', '666530616e7a4db0b8083e3214880f5d', '4', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:12:13', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f0379a4493ce4498a223934fefd0508e', '5707044b794c4abe83b1ea51d76373ce', '4', 'fb7e396efdcb45a4bddadd2c977a4f96', '2019-12-02 14:10:15', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f112bd16535a4a2db6c5fe5bb7cae5d6', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'cfbb2c81b626442d9513d8373c8a1c81', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f11472f659174e1b8b147889729a7490', '77509cb4934247ac8f32e6fc3501754c', '3', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f179c136bccb4b09a68b12390e4f8357', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'fb780a1b7e5a4bccae2ad1bce57ffeea', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f184ec2fac8449518c6fe925678be9f4', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f1f699e227f748119c19680c0beda1ab', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '997310aa6f734db2b48260dac27a2686', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f2195cf3103c4d69b718443bd9449d9e', '70904a97a5b64c0ca43d7e6061238c99', '2', '167314c192ab4b0d99e11c2b188c4da4', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f3097ef9dc674fe48adf86ffeed0ab5c', '1', '1', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f34b9e2358dd4115b83c577d79e899ef', 'f5ffd4e20b104966901edc9520c7f276', '446ebde544444bf0a76a03dc3f4413d2', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:11:09', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f3e976c6197c4c138fca75b2e63a2e8d', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'ea7703dd23ef4990aaf2751dff86b54f', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f50bb9528fda4a0a9a1fae044112ab23', '95e5df1dd98d4d5e9898657d166bc78f', 'a77619f46ad844a48e375855168147ff', 'eec2f907d75d4c01b0812aea8cf75cb5', '2019-12-02 14:04:44', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f58b6100d16b4d1cb2b4b37a776d74fb', '1', '1', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f59abfb7f32b4bd1b3fc879e176648dc', '510a5072f6614976b49afe5dca3a00b1', '3', 'bbd284d9a8144937bf0e74974d72b5d2', '2019-12-02 14:11:19', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f6e23ce7f236439ebbed4bd096205475', '77509cb4934247ac8f32e6fc3501754c', '3', '629c7ec1f2ca46cd86aa4663933ccab4', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f73b9acc8da64e39a008f27c52035154', '978b09f7c3bb42619fb0a6d30e44ad57', '1', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:12:34', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f759788a79dd403885a859e25abb5942', '77509cb4934247ac8f32e6fc3501754c', '3', 'b2dde984df39452c8404b49031e1a1fe', '2019-12-02 14:06:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f7ae1fe8b644480caea42a6a9a5b59d7', '1', '1', 'c35aabb8e7e64daf9f8869dfa32bd711', '2019-12-02 14:08:57', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f7d430408591436a9b1ba7c4ef1103e6', '70904a97a5b64c0ca43d7e6061238c99', '2', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:05:45', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f8218a77f350407aa54cfa612be48a27', '00608635bbf846709118985721e154ca', '2', '01645bb6ca5a47e08b93bdd6f4d96d23', '2019-12-02 14:11:56', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f912cdf3812c47ae9e2d0571eefdb1af', '77509cb4934247ac8f32e6fc3501754c', '3', '369f6c3f405e416f8c68fae7308fde50', '2019-12-02 14:06:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f92e6e50a5be4d9d8971de8462989d42', '70904a97a5b64c0ca43d7e6061238c99', '2', '8562eb8bc6eb4820b349358bdea3bda2', '2019-12-02 14:05:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f9c7129fe6634b1b943ef46d38d66514', '132c2cb66be343698bacf8f308adae37', '4', '19dd474b713d41b9a344cc304ac303c7', '2019-12-02 14:10:27', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('f9e0130d4fb442b39fb124caf677e64a', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', 'c46e3ed20b8f4780a3e6ebcdbc7a751c', '2019-12-02 14:07:16', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fa0b2fec9ec2422e833fccbc682b60a0', '93408d02dfcf42a297806401550e583b', '2534a3db0fe7452686daca240936cfee', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:07:17', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fa917755d6da460da239b4394138a11f', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:07:06', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fbe347a29e0141189899b6cf265d839d', '70904a97a5b64c0ca43d7e6061238c99', '2', 'e17db1b03ca042abbbe8f8df98670a35', '2019-12-02 14:05:47', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fcec7d5bbee14eb1b6f8446f4776355e', '81288a08258d4c84b527e11daba38977', 'c3126155c48849a585133b8d417ed14f', 'a6f986bc62714f67ad8dde79f51c37af', '2019-12-02 14:10:43', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fcedb161bb1249b0ad4d127681896e1b', '51a90516c8dd4295a437b9b356ef4f93', '4', 'f8fef41111084442b418d4015ab57f89', '2019-12-02 14:09:46', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fd3e423a1361412ea6a4f1e7b5e06f32', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', '809b1e54749a4649a903d5b951c4c05c', '2019-12-02 14:07:07', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fd611c5cc8684870b906cdf4d16c613b', '8f11948dfbd5400bb4a4efe5060cbe8c', '2534a3db0fe7452686daca240936cfee', 'f4b846a3edc54350b95ee17765f82362', '2019-12-02 14:07:08', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('fe242efbe11a478d9b23933d2fad52e8', '1', '1', '7732db73df1c4fb79e29e9d5382a9108', '2019-12-02 14:08:58', NULL, '0');
INSERT INTO `sys_role_menu` VALUES ('ff361aa229a24959ad76d7ee19bcb8a8', '77509cb4934247ac8f32e6fc3501754c', '3', '8fded08805bf4171a62c656fe9e96de2', '2019-12-02 14:06:08', NULL, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构id',
  `job_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'salt',
  `ic_card` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主键ID号',
  `id_card` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'id卡号',
  `sort` int(2) DEFAULT NULL COMMENT '序号',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('05f66cdd3dfc425ebe341bed13bc350a', '1', '10045', '刘呜呜', NULL, '18264851957', 'liuwuwu', 'd67f497afb88f8986c15c594a719e3bc', '397495651941879808', '0912369170', '2998', NULL, '0', NULL, '2019-12-02 16:08:32');
INSERT INTO `sys_user` VALUES ('1', '1', '', '管理员', NULL, '', 'admin', '31f308bb2507a8dbfd1e9ee64f4c1344', '384816645572395008', '2', '2977', NULL, '0', '2019-10-28 11:21:46', '2019-11-29 15:56:14');
INSERT INTO `sys_user` VALUES ('6ae742148556417e8522a9cb363da539', '1', '174', '鹿满满', NULL, '13521412129', 'lumanman', 'a4f75c5345921617d54d46ff9017be84', '397510488298229760', '3967957385', 'AA02', NULL, '0', NULL, '2019-12-02 16:08:27');
INSERT INTO `sys_user` VALUES ('85e45b275e884d138b3b1845c870c79c', '1', '1423512', '张曼曼', NULL, '18435390298', 'zhangmanman', 'a2cd2ee440a4d73dec22107502ac4e55', '397836102540595200', '3377116773', '9DDF', NULL, '0', NULL, '2019-12-02 16:08:11');
INSERT INTO `sys_user` VALUES ('87f68fa8f77c4699811d866e434d3912', '4', '1002', '李空空', NULL, '13521411159', 'likongkong', 'a393d8485b34c692a15cc5398b93c35e', '397849735144280064', '0912369170', '2762', NULL, '0', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user` VALUES ('94d751daea684201af824490faf28c91', '3', '10078', '利快快', NULL, '4521254', 'likuaikuai', 'c7205d35ae1d87db663b0c388aedc0ef', '397837967919550464', '3377172085', '9DC2', NULL, '0', NULL, '2019-11-29 17:08:38');
INSERT INTO `sys_user` VALUES ('b1ba93b7db3a49bc933326484b29c3b3', '1', '1004', '王晓晓', NULL, '18546957418', 'wangxiaoxiao', '123456', NULL, '0912991042', '29BD', NULL, '0', NULL, '2019-12-02 16:08:05');
INSERT INTO `sys_user` VALUES ('ead6e5b11a1b45a489a729187fca40f5', '1', '1006', '张酷酷', NULL, '15241295478', 'zhangkuku', 'c3f75ca9af7125e6ea71069db75d439c', '397849201419096064', '5635151154', '274D', NULL, '0', NULL, '2019-12-02 15:47:34');
INSERT INTO `sys_user` VALUES ('ef0323314c5d4b379f63281c1db3c2d5', '1', '1523651', '张朵朵', NULL, '15236852526', 'zhangduoduo', '8cbd6386b8bf49fc1d77e5a735822d5e', '397848757925974016', '3377171589', '9DCE', NULL, '0', NULL, '2019-12-02 16:08:16');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '删除标识',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (' ', '1', '2', '1', NULL, '2019-11-29 15:56:14');
INSERT INTO `sys_user_role` VALUES ('0532441ea13744a497422dbf401c98ed', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 14:29:08');
INSERT INTO `sys_user_role` VALUES ('05d8784cd3544e2da6d536d61f70e325', '94d751daea684201af824490faf28c91', '1', '1', NULL, '2019-11-29 17:08:38');
INSERT INTO `sys_user_role` VALUES ('08047aa3868a4438a86614f9d56a898b', '05f66cdd3dfc425ebe341bed13bc350a', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('0831425fbfd446a19cc656bbdc34076e', '74bfc7e424b748a38bf5cd2aab47caf7', '2', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('08abe152923e4400aea3b80c1b2bd924', '87f68fa8f77c4699811d866e434d3912', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 15:35:58');
INSERT INTO `sys_user_role` VALUES ('0e43794fcbb64bbbad7bb113c5347b85', '1', '3', '1', NULL, '2019-11-29 15:56:14');
INSERT INTO `sys_user_role` VALUES ('1089b8f736d14bb1854873905760c424', '87f68fa8f77c4699811d866e434d3912', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 09:16:51');
INSERT INTO `sys_user_role` VALUES ('11cae1aaccfa4b40af69cc42cfb0693c', 'ef0323314c5d4b379f63281c1db3c2d5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-12-02 16:08:16');
INSERT INTO `sys_user_role` VALUES ('153174bf657a4533a16571bd008bb84d', '87f68fa8f77c4699811d866e434d3912', '81288a08258d4c84b527e11daba38977', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('162d91a9a8ba4f889b2bba102ca3cac8', '94d751daea684201af824490faf28c91', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 17:08:38');
INSERT INTO `sys_user_role` VALUES ('16ed8bc779ec4ed7bedbcca6fdb5dced', '6ae742148556417e8522a9cb363da539', '1', '1', NULL, '2019-12-02 16:08:27');
INSERT INTO `sys_user_role` VALUES ('20074379760c405cb0ef5a6e3681486e', '85e45b275e884d138b3b1845c870c79c', '3', '1', NULL, '2019-12-02 16:08:11');
INSERT INTO `sys_user_role` VALUES ('2032be6557fa4d23a2d92894728ec2d9', '74bfc7e424b748a38bf5cd2aab47caf7', '64e47828f1a04ddba48bbd65e1038206', '1', NULL, '2019-11-28 20:47:50');
INSERT INTO `sys_user_role` VALUES ('24a84c6956624ddfa718bcf23558314a', 'ead6e5b11a1b45a489a729187fca40f5', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('263d8b5bd7294da4a82142a81f1fc08b', '85e45b275e884d138b3b1845c870c79c', '2', '1', NULL, '2019-11-29 17:03:47');
INSERT INTO `sys_user_role` VALUES ('295f5bfe223b49159524dd080f879e59', '87f68fa8f77c4699811d866e434d3912', 'f5ffd4e20b104966901edc9520c7f276', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('2b6d8217c8e3481ca6c2a99e2c9070ad', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 18:13:49');
INSERT INTO `sys_user_role` VALUES ('2df1f0c5ce794bb39403a3453891b870', '87f68fa8f77c4699811d866e434d3912', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 14:28:54');
INSERT INTO `sys_user_role` VALUES ('2e97032ccca24017b9a5c11bd21c09f3', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 17:52:29');
INSERT INTO `sys_user_role` VALUES ('2fec349e4f404f30bae1e43910483660', '05f66cdd3dfc425ebe341bed13bc350a', '1', '1', NULL, '2019-11-29 15:07:57');
INSERT INTO `sys_user_role` VALUES ('3798d0d20d134a12b3ee98dea1c15592', '6ae742148556417e8522a9cb363da539', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('39055f7389c7486388d7df5e68f813e5', '87f68fa8f77c4699811d866e434d3912', '51a90516c8dd4295a437b9b356ef4f93', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('3bcefbbfb929421bb0c164c9995db96f', '1', '1', '1', NULL, '2019-11-29 15:56:14');
INSERT INTO `sys_user_role` VALUES ('3c605a4ab969444092933b0a22fb5e1f', '87f68fa8f77c4699811d866e434d3912', '510a5072f6614976b49afe5dca3a00b1', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('3d3da5a4b46649508c60540496d0d86c', 'ed0c41361c644c408c4a92df9b7d2e97', '2', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('4542479f750142f8906680521f9c7771', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 14:29:13');
INSERT INTO `sys_user_role` VALUES ('4b2efd9a612647dc869c30a590b7824e', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 18:00:44');
INSERT INTO `sys_user_role` VALUES ('4c342e5684a14128af642322c307833b', 'ef0323314c5d4b379f63281c1db3c2d5', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('4c3b478ea2454c6b8c0ffd7a0e297f08', '87f68fa8f77c4699811d866e434d3912', '00608635bbf846709118985721e154ca', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('4d89d064b79f4ad98a303ea36bd1c6c0', '85e45b275e884d138b3b1845c870c79c', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('4decf104e3ef447a8ec56a6879468662', '1', '3', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('5a0399bdcf52401891739759486710b1', '85e45b275e884d138b3b1845c870c79c', '1', '1', NULL, '2019-11-29 17:03:47');
INSERT INTO `sys_user_role` VALUES ('5a19988bc66c4406a4f6c0bc790bbdaf', 'ef0323314c5d4b379f63281c1db3c2d5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 18:14:29');
INSERT INTO `sys_user_role` VALUES ('5e34e198d2594a04924bdee2cb8e694d', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 18:02:07');
INSERT INTO `sys_user_role` VALUES ('5ef4102f9fe342698d05f657ad11d282', '05f66cdd3dfc425ebe341bed13bc350a', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('610633cf874b4bd4b6bfb3e1ad4f0a83', '87f68fa8f77c4699811d866e434d3912', '132c2cb66be343698bacf8f308adae37', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('61d9e53648074ad5bb3b363302225f1c', '87f68fa8f77c4699811d866e434d3912', '93408d02dfcf42a297806401550e583b', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('653ed69d69384d32852225542c22e293', 'ed0c41361c644c408c4a92df9b7d2e97', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('6606ab5ef63a418cbc06c80259b6fe88', '1', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('695d890fe3b34c9aa7a250ab5e773308', '87f68fa8f77c4699811d866e434d3912', '5707044b794c4abe83b1ea51d76373ce', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('6f405f8d4c074ba79c40abfc0d4f48f3', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 18:13:49');
INSERT INTO `sys_user_role` VALUES ('71f8031d0e7a4fdeb85b6695d6bc6e03', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 09:16:55');
INSERT INTO `sys_user_role` VALUES ('7533307f0cbd4755b6f91b29005d8a6f', '05f66cdd3dfc425ebe341bed13bc350a', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 09:53:49');
INSERT INTO `sys_user_role` VALUES ('77726cf657194d40883f1e29f89c8b10', '05f66cdd3dfc425ebe341bed13bc350a', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-12-02 16:08:32');
INSERT INTO `sys_user_role` VALUES ('77f3449c571644bea182c3b5cf3f430d', '1', '2', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('7933703f33834833afab90ef3d80980d', 'e5706b2658e54eb4abe235aa424cf9ab', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('7a5b8f8d4faa4cad823215abec048018', '85e45b275e884d138b3b1845c870c79c', '3', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('7b3827bb160044659258047d2f00f29c', '87f68fa8f77c4699811d866e434d3912', '5707044b794c4abe83b1ea51d76373ce', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('7befe4d941114e829d8ad82acb6b6e9c', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 17:52:29');
INSERT INTO `sys_user_role` VALUES ('7d7ab42a0a5a4fe7b5ac8bd9cb6a3250', 'ead6e5b11a1b45a489a729187fca40f5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 17:51:46');
INSERT INTO `sys_user_role` VALUES ('7fbda271aedd4852b04b467264d106ba', '74bfc7e424b748a38bf5cd2aab47caf7', '64e47828f1a04ddba48bbd65e1038206', '1', NULL, '2019-11-28 20:49:03');
INSERT INTO `sys_user_role` VALUES ('8296870a06424bb4837800210dcef01c', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 17:54:16');
INSERT INTO `sys_user_role` VALUES ('839545120047408688f83288d26114f4', '74bfc7e424b748a38bf5cd2aab47caf7', '1', '1', NULL, '2019-11-29 09:13:31');
INSERT INTO `sys_user_role` VALUES ('8405eebed5d9496fb63f650ae8f31183', '05f66cdd3dfc425ebe341bed13bc350a', '1', '1', NULL, '2019-12-02 16:08:32');
INSERT INTO `sys_user_role` VALUES ('85982ea7eeed4f8288080fa535d84cb2', '87f68fa8f77c4699811d866e434d3912', '81288a08258d4c84b527e11daba38977', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('895758afa81c4a5db3d36a577b16af22', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 17:57:04');
INSERT INTO `sys_user_role` VALUES ('89712f57f78848eda24965bf43b673dd', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 17:55:52');
INSERT INTO `sys_user_role` VALUES ('8e48b3a13fea44689091bf8289c8b845', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 18:00:44');
INSERT INTO `sys_user_role` VALUES ('950024737268447f9cf348224219b71a', 'ef0323314c5d4b379f63281c1db3c2d5', '2', '1', NULL, '2019-11-29 18:01:11');
INSERT INTO `sys_user_role` VALUES ('9a3d43c0965e468ea1aef629c99a1c6c', '85e45b275e884d138b3b1845c870c79c', '1', '1', NULL, '2019-12-02 16:08:11');
INSERT INTO `sys_user_role` VALUES ('9ccbf39d1ce243d5bfa822d83f60ae37', '87f68fa8f77c4699811d866e434d3912', '132c2cb66be343698bacf8f308adae37', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('a1e0a81c04d247cbb689c16073363c01', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 18:01:11');
INSERT INTO `sys_user_role` VALUES ('a245b42fb0e34eb89b69928a28750c57', '05f66cdd3dfc425ebe341bed13bc350a', '1', '1', NULL, '2019-11-29 09:53:49');
INSERT INTO `sys_user_role` VALUES ('a3ecd979fffb4c0e83a8601ba5bfbcc3', 'ead6e5b11a1b45a489a729187fca40f5', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-12-02 15:47:34');
INSERT INTO `sys_user_role` VALUES ('a666a95295054dc9974aa31e4dc595f0', '85e45b275e884d138b3b1845c870c79c', '2', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('ab67f505d14f4683b09ca5ccb605ffe8', '85e45b275e884d138b3b1845c870c79c', '3', '1', NULL, '2019-11-29 17:03:47');
INSERT INTO `sys_user_role` VALUES ('ad89978cfbc04298ae87a59bbcf1b9e1', '87f68fa8f77c4699811d866e434d3912', '666530616e7a4db0b8083e3214880f5d', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('adf5dcbf4b9749eb8ca431fdf6a04ef5', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 17:55:52');
INSERT INTO `sys_user_role` VALUES ('aee99a43025b4cf7a43e7e6ca1906769', '05f66cdd3dfc425ebe341bed13bc350a', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 15:07:57');
INSERT INTO `sys_user_role` VALUES ('b08287ac3be542e9b3bea70781b24374', '3532fe3b527942fd8be40a0c53eb7ce2', '93408d02dfcf42a297806401550e583b', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('b13a9972e0da4de9bca4d942c67521db', '74bfc7e424b748a38bf5cd2aab47caf7', '2', '1', NULL, '2019-11-29 09:13:31');
INSERT INTO `sys_user_role` VALUES ('b484d9c2d98e491db87519fde4f05c94', '87f68fa8f77c4699811d866e434d3912', '510a5072f6614976b49afe5dca3a00b1', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('ba8811b3d98d44eba79cc09ea8eaa974', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-12-02 16:08:05');
INSERT INTO `sys_user_role` VALUES ('c3d4ba565b874e8a9a7785e45e843c53', '87f68fa8f77c4699811d866e434d3912', '93408d02dfcf42a297806401550e583b', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('c65d7a314d0e4c1fa3d67cbf3f6c45cf', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 17:57:04');
INSERT INTO `sys_user_role` VALUES ('cbb2cf4f02c5437ea471a6e16a53ed0b', '6ae742148556417e8522a9cb363da539', '1', '1', NULL, '2019-11-29 09:16:46');
INSERT INTO `sys_user_role` VALUES ('cea1c3c2f2bc42b999b888312311d456', '87f68fa8f77c4699811d866e434d3912', '00608635bbf846709118985721e154ca', '1', NULL, '2019-12-02 10:10:53');
INSERT INTO `sys_user_role` VALUES ('ceefff8b81d14d889bc0c5b3fb1a846f', '87f68fa8f77c4699811d866e434d3912', '3', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('cf7d28d3774f4a56a714ddc4f2bad18f', '87f68fa8f77c4699811d866e434d3912', '666530616e7a4db0b8083e3214880f5d', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('d14b3359f20e45f2b4d7dcf252cfa065', '6ae742148556417e8522a9cb363da539', '1', '1', NULL, '2019-11-29 13:46:51');
INSERT INTO `sys_user_role` VALUES ('dc5e69845d2f431289ef133300c46fe5', '94d751daea684201af824490faf28c91', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('dd7e59fad5814e588c80a1895745cc89', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '1', NULL, '2019-11-29 09:22:13');
INSERT INTO `sys_user_role` VALUES ('df8cbec3883a4cd1bd3802cd766fca8e', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 17:55:13');
INSERT INTO `sys_user_role` VALUES ('dfd42ed73add49299b70dcf33290dc27', '6ae742148556417e8522a9cb363da539', '1', '1', NULL, '2019-11-29 14:29:10');
INSERT INTO `sys_user_role` VALUES ('e40b1d5336934068a03fc31a1e000e0b', '87f68fa8f77c4699811d866e434d3912', 'f5ffd4e20b104966901edc9520c7f276', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('e52c6da7798c4fb6b494423c7a22e19b', 'b1ba93b7db3a49bc933326484b29c3b3', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('e7024115f3754dd79c356441bead897f', '6ae742148556417e8522a9cb363da539', '1', '1', NULL, '2019-11-29 09:21:18');
INSERT INTO `sys_user_role` VALUES ('ea857e73ef244945a96537fc464b9092', '1', '978b09f7c3bb42619fb0a6d30e44ad57', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('ecbcd52e6ad84a38ac1d64fd173af02a', '94d751daea684201af824490faf28c91', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('ed519e8cfd6b4085af44aada8c7bd836', '85e45b275e884d138b3b1845c870c79c', '2', '1', NULL, '2019-12-02 16:08:11');
INSERT INTO `sys_user_role` VALUES ('ee3fce04bbc54292bb42b33eb13373ac', '87f68fa8f77c4699811d866e434d3912', '51a90516c8dd4295a437b9b356ef4f93', '1', NULL, '2019-11-29 17:53:54');
INSERT INTO `sys_user_role` VALUES ('eedef5e0ede04f089e8cbb2795c8a992', '74bfc7e424b748a38bf5cd2aab47caf7', '1', '0', NULL, NULL);
INSERT INTO `sys_user_role` VALUES ('f900538db711480485cf6096e02e85ba', 'ef0323314c5d4b379f63281c1db3c2d5', '3', '1', NULL, '2019-11-29 18:02:07');

SET FOREIGN_KEY_CHECKS = 1;
