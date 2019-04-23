/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : biu

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 23/04/2019 11:25:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm`  (
  `pval` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限值，shiro的权限控制表达式',
  `parent` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限id',
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `ptype` int(3) NULL DEFAULT NULL COMMENT '权限类型：1.菜单 2.按钮 3.接口 4.特殊',
  `leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点',
  `created` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`pval`) USING BTREE,
  UNIQUE INDEX `pval`(`pval`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO `sys_perm` VALUES ('*', NULL, '所有权限', 0, NULL, '2018-04-19 18:14:12', NULL);
INSERT INTO `sys_perm` VALUES ('a:auth', NULL, '登录模块', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:gradleBuild', 'a:test', '构建gradle', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:mvn:install', 'a:test', 'mvnInstall', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:option', NULL, '选项模块', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:perm', NULL, '系统权限模块', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:role', NULL, '系统角色模块', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:add', 'a:sys:接口', '添加系统用户', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:del', 'a:sys:接口', '删除系统用户', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:info', 'a:sys:接口', '查询系统用户信息', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:info:update', 'a:sys:接口', '更新系统用户的信息', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:list', 'a:sys:接口', '查询所有系统用户', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:role:find', 'a:sys:接口', '查找系统用户的角色', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:user:role:update', 'a:sys:接口', '更新系统用户的角色', 3, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:sys:接口', NULL, '系统用户模块', 3, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('a:test', NULL, '测试模块模块', 3, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('b:user:add', 'm:sys:user', '添加用户', 2, NULL, '2018-06-02 11:00:37', NULL);
INSERT INTO `sys_perm` VALUES ('b:user:delete', 'm:sys:user', '删除用户', 2, NULL, '2018-06-02 11:00:56', NULL);
INSERT INTO `sys_perm` VALUES ('m:menu1', NULL, '菜单1', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu2', NULL, '菜单2', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu3', NULL, '菜单3', 1, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu3:1', 'm:menu3', '菜单3-1', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu3:2', 'm:menu3', '菜单3-2', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu3:3', 'm:menu3', '菜单3-3', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4', NULL, '菜单4', 1, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4:1', 'm:menu4', '菜单4-1', 1, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4:1:a', 'm:menu4:1', '菜单4-1-a', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4:1:b', 'm:menu4:1', '菜单4-1-b', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4:1:c', 'm:menu4:1', '菜单4-1-c', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:menu4:2', 'm:menu4', '菜单4-2', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:sys', NULL, '系统', 1, 0, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:sys:perm', 'm:sys', '权限管理', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:sys:role', 'm:sys', '角色管理', 1, 1, NULL, NULL);
INSERT INTO `sys_perm` VALUES ('m:sys:user', 'm:sys', '用户管理', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `rid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `rname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名，用于显示',
  `rdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `rval` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色值，用于权限判断',
  `created` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`rid`) USING BTREE,
  UNIQUE INDEX `rval`(`rval`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1002748319131680769', '普通用户', '具有一般的权限，不具备系统菜单权限1', 'common', '2018-06-02 11:06:44', '2018-06-02 11:10:57');
INSERT INTO `sys_role` VALUES ('1002806178141937666', '财务', '拥有财务相关权限', 'finance', '2018-06-02 14:56:39', NULL);
INSERT INTO `sys_role` VALUES ('1002806220860923906', '仓管', '拥有财务相关权限', 'stock', '2018-06-02 14:56:49', NULL);
INSERT INTO `sys_role` VALUES ('1002806266750803970', '销售', '拥有财务相关权限', 'sale', '2018-06-02 14:57:00', NULL);
INSERT INTO `sys_role` VALUES ('1002807171923550210', '文员', '拥有文员相关的权限', 'stuff', '2018-06-02 15:00:36', NULL);
INSERT INTO `sys_role` VALUES ('1002807288885911553', '啊', 'asdf', 'sdf', '2018-06-02 15:01:04', NULL);
INSERT INTO `sys_role` VALUES ('1002807344665960449', '阿斯达', 'sdfwerty', 'sgsf', '2018-06-02 15:01:17', NULL);
INSERT INTO `sys_role` VALUES ('1002807369559154689', '阿斯蒂芬', '撒旦法GV', 'asdfgewrgr', '2018-06-02 15:01:23', NULL);
INSERT INTO `sys_role` VALUES ('1002807394460737537', '阿斯蒂芬', '颂德歌功', 'asdgwergreh', '2018-06-02 15:01:29', NULL);
INSERT INTO `sys_role` VALUES ('1002807427771899906', 'asddfgswf', '阿道夫噶', 'drgregerg', '2018-06-02 15:01:37', NULL);
INSERT INTO `sys_role` VALUES ('999999888888777777', '超级管理员', '具有本系统中最高权限', 'root', '2018-04-19 17:34:33', NULL);

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm`  (
  `role_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `perm_val` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `perm_type` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `perm_val`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO `sys_role_perm` VALUES ('1002748319131680769', 'a:perm:update', 3);
INSERT INTO `sys_role_perm` VALUES ('1002748319131680769', 'a:sys:perm', 3);
INSERT INTO `sys_role_perm` VALUES ('1002748319131680769', 'm:sys', 1);
INSERT INTO `sys_role_perm` VALUES ('1002748319131680769', 'm:sys:user', 1);
INSERT INTO `sys_role_perm` VALUES ('999999888888777777', '*', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `uid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名，不可改',
  `nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称，可改',
  `pwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已加密的登录密码',
  `salt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `lock` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定',
  `created` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1002748017179541505', 'guanyu', '关羽', 'n2Wd7JramFVrHcijY4KW1rNTGKnwyYPJ0RDYvy2BdK0=', 'aem4EsAFae5rObEdZP4Xlw==', NULL, '2018-06-02 11:05:32', '2018-06-02 14:40:01');
INSERT INTO `sys_user` VALUES ('1002748102537822209', 'zhangfei', '张飞', 'g+aRBmgVTTPkNLNwJfM64D8rwH94WEgDgckQ4fuQp6w=', 'Sqhvxsnc0HZSQEFKjBB9zQ==', NULL, '2018-06-02 11:05:52', NULL);
INSERT INTO `sys_user` VALUES ('986177923098808322', 'admin', '管理员', 'J/ms7qTJtqmysekuY8/v1TAS+VKqXdH5sB7ulXZOWho=', 'wxKYXuTPST5SG0jMQzVPsg==', 0, '2018-04-17 17:41:53', '2019-04-03 10:13:10');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1002748017179541505', '1002748319131680769');
INSERT INTO `sys_user_role` VALUES ('1002748102537822209', '1002748319131680769');
INSERT INTO `sys_user_role` VALUES ('986177923098808322', '999999888888777777');

SET FOREIGN_KEY_CHECKS = 1;
