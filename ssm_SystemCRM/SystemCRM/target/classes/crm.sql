/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 21/11/2020 12:14:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm_base
-- ----------------------------
DROP TABLE IF EXISTS `crm_base`;
CREATE TABLE `crm_base`  (
  `base_id` int NOT NULL AUTO_INCREMENT COMMENT '基础表ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `adders` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'adders',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'phone',
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_base
-- ----------------------------

-- ----------------------------
-- Table structure for crm_business_info
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_info`;
CREATE TABLE `crm_business_info`  (
  `bus_id` int NOT NULL AUTO_INCREMENT COMMENT '商业信息ID',
  `cid` int NOT NULL COMMENT '客户id',
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `marketing_mode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营销方式',
  `value` int NULL DEFAULT NULL COMMENT '价值',
  `total_amount` int NULL DEFAULT NULL COMMENT '产品总数',
  `due_date` date NULL DEFAULT NULL COMMENT '预计成交日期',
  `practical_date` date NULL DEFAULT NULL COMMENT '实际交付日期',
  `create_date` date NULL DEFAULT NULL COMMENT '商机创建时间',
  `update_date` date NULL DEFAULT NULL COMMENT '修改时间',
  `total_price` double NULL DEFAULT NULL COMMENT '商业金额',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`bus_id`) USING BTREE,
  INDEX `fk_businessinfo_customer`(`cid`) USING BTREE,
  INDEX `fk_reference_26`(`uid`) USING BTREE,
  CONSTRAINT `fk_businessinfo_customer` FOREIGN KEY (`cid`) REFERENCES `crm_customer` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reference_26` FOREIGN KEY (`uid`) REFERENCES `crm_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_business_info
-- ----------------------------

-- ----------------------------
-- Table structure for crm_compact
-- ----------------------------
DROP TABLE IF EXISTS `crm_compact`;
CREATE TABLE `crm_compact`  (
  `compact_id` int NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `customer_id` int NULL DEFAULT NULL COMMENT '客户_id',
  `bus_id` int NULL DEFAULT NULL COMMENT '商业ID',
  `compact` int NULL DEFAULT NULL COMMENT '合同编号',
  `compact_time` date NULL DEFAULT NULL COMMENT '合同时间',
  `party_a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '甲方',
  `party_b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '乙方',
  `text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同内容',
  PRIMARY KEY (`compact_id`) USING BTREE,
  INDEX `fk_compact_businessinfo`(`bus_id`) USING BTREE,
  INDEX `fk_customer_compact`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_compact_businessinfo` FOREIGN KEY (`bus_id`) REFERENCES `crm_business_info` (`bus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_customer_compact` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_compact
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contacts
-- ----------------------------
DROP TABLE IF EXISTS `crm_contacts`;
CREATE TABLE `crm_contacts`  (
  `contacts_id` int NOT NULL AUTO_INCREMENT COMMENT '联系人ID',
  `cid` int NULL DEFAULT NULL COMMENT '客户id',
  `bus_id` int NULL DEFAULT NULL COMMENT '商业ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `post` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人岗位',
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人部门',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人性别',
  `salt_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人称呼',
  `mobile_phone1` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话1',
  `mobile_phone2` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话2',
  `work_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `wx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `qq` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `zip_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` date NULL DEFAULT NULL COMMENT '更新时间',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系人信息备注',
  PRIMARY KEY (`contacts_id`) USING BTREE,
  INDEX `fk_customer_contact`(`cid`) USING BTREE,
  INDEX `fk_contacts_businessinfo_fk`(`bus_id`) USING BTREE,
  CONSTRAINT `fk_contacts_businessinfo_fk` FOREIGN KEY (`bus_id`) REFERENCES `crm_business_info` (`bus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_customer_contact` FOREIGN KEY (`cid`) REFERENCES `crm_customer` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer`  (
  `cid` int NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `uid` int NULL DEFAULT NULL COMMENT '用户_id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'phone',
  `fax` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `other` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它联系方式',
  `industry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `annual_revenue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年营业额',
  `bank_of_deposit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行帐号',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` date NULL DEFAULT NULL COMMENT '更新时间',
  `last_time` date NULL DEFAULT NULL COMMENT '最近跟进时间',
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_user_customer`(`uid`) USING BTREE,
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`uid`) REFERENCES `crm_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户(企业，组织或个人)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES (1, 1, NULL, '1', '1', '1', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_department
-- ----------------------------
DROP TABLE IF EXISTS `crm_department`;
CREATE TABLE `crm_department`  (
  `department_id` int NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `department_parent_id` int NULL DEFAULT NULL COMMENT '上级部门_id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'createtime',
  `last_change_time` datetime(0) NULL DEFAULT NULL COMMENT 'lastchangetime',
  `status` tinyint NULL DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`department_id`) USING BTREE,
  INDEX `fk_rdepartment`(`department_parent_id`) USING BTREE,
  CONSTRAINT `fk_rdepartment` FOREIGN KEY (`department_parent_id`) REFERENCES `crm_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_department
-- ----------------------------
INSERT INTO `crm_department` VALUES (1, NULL, '董事会', '2020-10-07 20:15:49', NULL, 1);
INSERT INTO `crm_department` VALUES (2, 1, '总经理', '2020-11-03 09:33:30', NULL, 1);
INSERT INTO `crm_department` VALUES (3, 1, '账务部', '2020-11-03 09:33:30', NULL, 1);
INSERT INTO `crm_department` VALUES (4, 1, '销售部', '2020-11-03 09:33:30', NULL, 1);
INSERT INTO `crm_department` VALUES (5, 1, '开发部', '2020-11-03 09:33:30', NULL, 1);

-- ----------------------------
-- Table structure for crm_employee
-- ----------------------------
DROP TABLE IF EXISTS `crm_employee`;
CREATE TABLE `crm_employee`  (
  `employee_id` int NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `department_id` int NULL DEFAULT NULL COMMENT '部门_id',
  `position_id` int NULL DEFAULT NULL COMMENT 'position_id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sex',
  `married` tinyint(1) NULL DEFAULT NULL COMMENT '婚否',
  `education` tinyint NULL DEFAULT NULL COMMENT '学历',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `sid` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `adders` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `hire_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `term_date` date NULL DEFAULT NULL COMMENT '离职日期',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`employee_id`) USING BTREE,
  INDEX `fk_employee_department`(`department_id`) USING BTREE,
  INDEX `fk_reference_25`(`position_id`) USING BTREE,
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`department_id`) REFERENCES `crm_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reference_25` FOREIGN KEY (`position_id`) REFERENCES `crm_position` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_employee
-- ----------------------------
INSERT INTO `crm_employee` VALUES (1, 2, 1, '1', '1', 1, 1, '1', '1', NULL, NULL, '2020-11-10', NULL, NULL);
INSERT INTO `crm_employee` VALUES (2, 2, 2, '问问', '1', 2, 5, '1', 'aa', '1', NULL, '2020-11-18', NULL, NULL);
INSERT INTO `crm_employee` VALUES (38, 1, 2, '谭茜升', '1', 1, 3, '18580094819', '1790627910@qq.com', '513021199811290319', '1长度', '2020-11-30', NULL, 5);
INSERT INTO `crm_employee` VALUES (47, 1, 2, '谭茜升', '0', 1, 7, NULL, '1790627910@qq.com', '513021199811290319', '重庆', '2020-12-01', NULL, 5);
INSERT INTO `crm_employee` VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-29', NULL, NULL);
INSERT INTO `crm_employee` VALUES (49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-29', NULL, NULL);
INSERT INTO `crm_employee` VALUES (50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-15', NULL, NULL);
INSERT INTO `crm_employee` VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23', NULL, NULL);
INSERT INTO `crm_employee` VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-29', NULL, NULL);
INSERT INTO `crm_employee` VALUES (56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-30', NULL, NULL);
INSERT INTO `crm_employee` VALUES (57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-29', NULL, NULL);
INSERT INTO `crm_employee` VALUES (58, 2, 2, '谭茜升', '1', 1, 6, NULL, NULL, '513021199811290319', NULL, '2020-11-24', NULL, NULL);
INSERT INTO `crm_employee` VALUES (59, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-29', NULL, NULL);
INSERT INTO `crm_employee` VALUES (61, 1, 2, '谭茜升', '1', NULL, 2, NULL, '1790627910@qq.com', '523', '1222', '2020-10-31', NULL, 1);
INSERT INTO `crm_employee` VALUES (62, 1, 1, '1111', '1', NULL, NULL, NULL, NULL, '123', NULL, '2020-10-31', NULL, NULL);
INSERT INTO `crm_employee` VALUES (63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '去222', NULL, '2020-11-01', NULL, NULL);

-- ----------------------------
-- Table structure for crm_follow_up_records
-- ----------------------------
DROP TABLE IF EXISTS `crm_follow_up_records`;
CREATE TABLE `crm_follow_up_records`  (
  `records_id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `bus_id` int NULL DEFAULT NULL COMMENT '商业信息ID',
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `method` tinyint NULL DEFAULT NULL COMMENT '跟进方式',
  `create_time` date NULL DEFAULT NULL COMMENT '跟进时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '记录内容',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`records_id`) USING BTREE,
  INDEX `fk_reference_27`(`uid`) USING BTREE,
  INDEX `fk_followuprecorde_businessinfo_fk`(`bus_id`) USING BTREE,
  CONSTRAINT `fk_followuprecorde_businessinfo_fk` FOREIGN KEY (`bus_id`) REFERENCES `crm_business_info` (`bus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reference_27` FOREIGN KEY (`uid`) REFERENCES `crm_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '跟进记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_follow_up_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_fucntion
-- ----------------------------
DROP TABLE IF EXISTS `crm_fucntion`;
CREATE TABLE `crm_fucntion`  (
  `fucntion_id` int NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`fucntion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能操作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_fucntion
-- ----------------------------

-- ----------------------------
-- Table structure for crm_fucntion_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_fucntion_permission`;
CREATE TABLE `crm_fucntion_permission`  (
  `function_id` int NOT NULL COMMENT '功能id',
  `crm_id` int NOT NULL COMMENT '权限_id',
  PRIMARY KEY (`function_id`, `crm_id`) USING BTREE,
  INDEX `fk_fucntion_permission2`(`crm_id`) USING BTREE,
  CONSTRAINT `fk_fucntion_permission` FOREIGN KEY (`function_id`) REFERENCES `crm_fucntion` (`fucntion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fucntion_permission2` FOREIGN KEY (`crm_id`) REFERENCES `crm_permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能与权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_fucntion_permission
-- ----------------------------

-- ----------------------------
-- Table structure for crm_menu
-- ----------------------------
DROP TABLE IF EXISTS `crm_menu`;
CREATE TABLE `crm_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `next_id` int NULL DEFAULT NULL COMMENT '下级菜单',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `fk_submenu`(`next_id`) USING BTREE,
  CONSTRAINT `fk_submenu` FOREIGN KEY (`next_id`) REFERENCES `crm_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_menu
-- ----------------------------

-- ----------------------------
-- Table structure for crm_menu_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_menu_permission`;
CREATE TABLE `crm_menu_permission`  (
  `menu_id` int NOT NULL COMMENT '菜单id',
  `crm_id` int NOT NULL COMMENT '权限_id',
  PRIMARY KEY (`menu_id`, `crm_id`) USING BTREE,
  INDEX `fk_menu_permission2`(`crm_id`) USING BTREE,
  CONSTRAINT `fk_menu_permission` FOREIGN KEY (`menu_id`) REFERENCES `crm_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_menu_permission2` FOREIGN KEY (`crm_id`) REFERENCES `crm_permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限与菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_menu_permission
-- ----------------------------

-- ----------------------------
-- Table structure for crm_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission`;
CREATE TABLE `crm_permission`  (
  `permission_id` int NOT NULL AUTO_INCREMENT COMMENT '权限_id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_permission
-- ----------------------------
INSERT INTO `crm_permission` VALUES (1, '1', NULL);

-- ----------------------------
-- Table structure for crm_position
-- ----------------------------
DROP TABLE IF EXISTS `crm_position`;
CREATE TABLE `crm_position`  (
  `position_id` int NOT NULL AUTO_INCREMENT COMMENT '职位ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `status` tinyint NULL DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_position
-- ----------------------------
INSERT INTO `crm_position` VALUES (1, '董事', 1);
INSERT INTO `crm_position` VALUES (2, '总经理', 1);
INSERT INTO `crm_position` VALUES (3, '经理', 1);
INSERT INTO `crm_position` VALUES (4, '主管', 1);
INSERT INTO `crm_position` VALUES (5, '员工', 1);

-- ----------------------------
-- Table structure for crm_product
-- ----------------------------
DROP TABLE IF EXISTS `crm_product`;
CREATE TABLE `crm_product`  (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `compact_id` int NOT NULL COMMENT '合同ID',
  `product_type_id` int NOT NULL COMMENT '产品类型ID',
  `sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品SN',
  `product_date` date NULL DEFAULT NULL COMMENT '生产日期',
  `production_date` date NULL DEFAULT NULL COMMENT '出厂日期',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_productype_and_product`(`product_type_id`) USING BTREE,
  INDEX `fk_producttype_compact`(`compact_id`) USING BTREE,
  CONSTRAINT `fk_producttype_compact` FOREIGN KEY (`compact_id`) REFERENCES `crm_compact` (`compact_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_productype_and_product` FOREIGN KEY (`product_type_id`) REFERENCES `crm_product_type` (`product_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_product
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_type`;
CREATE TABLE `crm_product_type`  (
  `product_type_id` int NOT NULL AUTO_INCREMENT COMMENT '产品类型ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `prod_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品系列',
  `product_feature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品特性',
  PRIMARY KEY (`product_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_product_type
-- ----------------------------

-- ----------------------------
-- Table structure for crm_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT 'role_id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for crm_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_permission`;
CREATE TABLE `crm_role_permission`  (
  `role_id` int NOT NULL COMMENT 'role_id',
  `permission_id` int NOT NULL COMMENT '权限_id',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `fk_role_permission2`(`permission_id`) USING BTREE,
  CONSTRAINT `fk_role_permission` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_role_permission2` FOREIGN KEY (`permission_id`) REFERENCES `crm_permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_role_permission
-- ----------------------------
INSERT INTO `crm_role_permission` VALUES (1, 1);

-- ----------------------------
-- Table structure for crm_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_user`;
CREATE TABLE `crm_user`  (
  `uid` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `dep_id` int NULL DEFAULT NULL COMMENT '部门_id',
  `employee_id` int NULL DEFAULT NULL COMMENT '员工id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `user_pwd` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'password',
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'createDate',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `fk_user_employee`(`employee_id`) USING BTREE,
  INDEX `fk_department_user`(`dep_id`) USING BTREE,
  CONSTRAINT `fk_department_user` FOREIGN KEY (`dep_id`) REFERENCES `crm_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_employee` FOREIGN KEY (`employee_id`) REFERENCES `crm_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1237 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_user
-- ----------------------------
INSERT INTO `crm_user` VALUES (1, 1, 1, '谭茜升', '123', NULL, NULL);
INSERT INTO `crm_user` VALUES (13, 1, 1, '迪丽热巴7', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (14, 1, 1, '迪丽热巴8', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (15, 1, 1, '迪丽热巴8', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (16, 1, 1, '古力娜扎9', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (18, 1, 1, '迪丽热巴10', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (19, 1, 1, '迪丽热巴11', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (20, 1, 1, '古力娜扎12', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (21, 1, 1, '古力娜扎12', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (22, 1, 1, '迪丽热巴13', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (23, 1, 1, '迪丽热巴14', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (24, 1, 1, '迪丽热巴14', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (25, 1, 1, '古力娜扎15', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (26, 1, 1, '迪丽热巴16', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (27, 1, 1, '迪丽热巴16', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (28, 1, 1, '迪丽热巴17', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (29, 1, 1, '古力娜扎18', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (30, 1, 1, '古力娜扎18', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (31, 1, 1, '迪丽热巴19', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (32, 1, 1, '迪丽热巴20', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (33, 1, 1, '迪丽热巴20', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (34, 1, 1, '古力娜扎21', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (35, 1, 1, '迪丽热巴22', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (36, 1, 1, '迪丽热巴22', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (37, 1, 1, '迪丽热巴23', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (38, 1, 1, '古力娜扎24', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (39, 1, 1, '古力娜扎24', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (40, 1, 1, '迪丽热巴25', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (41, 1, 1, '迪丽热巴26', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (42, 1, 1, '迪丽热巴26', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (43, 1, 1, '古力娜扎27', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (44, 1, 1, '迪丽热巴28', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (45, 1, 1, '迪丽热巴28', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (46, 1, 1, '迪丽热巴29', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (47, 1, 1, '古力娜扎30', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (48, 1, 1, '古力娜扎30', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (49, 1, 1, '迪丽热巴31', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (50, 1, 1, '迪丽热巴32', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (51, 1, 1, '迪丽热巴32', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (52, 1, 1, '古力娜扎33', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (53, 1, 1, '迪丽热巴34', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (54, 1, 1, '迪丽热巴34', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (55, 1, 1, '迪丽热巴35', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (56, 1, 1, '古力娜扎36', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (57, 1, 1, '古力娜扎36', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (58, 1, 1, '迪丽热巴37', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (59, 1, 1, '迪丽热巴38', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (60, 1, 1, '迪丽热巴38', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (61, 1, 1, '古力娜扎39', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (62, 1, 1, '迪丽热巴40', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (63, 1, 1, '迪丽热巴40', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (64, 1, 1, '迪丽热巴41', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (65, 1, 1, '古力娜扎42', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (66, 1, 1, '古力娜扎42', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (67, 1, 1, '迪丽热巴43', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (68, 1, 1, '迪丽热巴44', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (69, 1, 1, '迪丽热巴44', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (70, 1, 1, '古力娜扎45', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (71, 1, 1, '迪丽热巴46', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (72, 1, 1, '迪丽热巴46', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (73, 1, 1, '迪丽热巴47', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (74, 1, 1, '古力娜扎48', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (75, 1, 1, '古力娜扎48', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (76, 1, 1, '迪丽热巴49', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (77, 1, 1, '迪丽热巴50', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (78, 1, 1, '迪丽热巴50', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (79, 1, 1, '古力娜扎51', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (80, 1, 1, '迪丽热巴52', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (81, 1, 1, '迪丽热巴52', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (82, 1, 1, '迪丽热巴53', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (83, 1, 1, '古力娜扎54', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (84, 1, 1, '古力娜扎54', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (85, 1, 1, '迪丽热巴55', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (86, 1, 1, '迪丽热巴56', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (87, 1, 1, '迪丽热巴56', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (88, 1, 1, '古力娜扎57', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (89, 1, 1, '迪丽热巴58', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (90, 1, 1, '迪丽热巴58', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (91, 1, 1, '迪丽热巴59', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (92, 1, 1, '古力娜扎60', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (93, 1, 1, '古力娜扎60', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (94, 1, 1, '迪丽热巴61', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (95, 1, 1, '迪丽热巴62', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (96, 1, 1, '迪丽热巴62', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (97, 1, 1, '古力娜扎63', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (98, 1, 1, '迪丽热巴64', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (99, 1, 1, '迪丽热巴64', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (100, 1, 1, '迪丽热巴65', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (101, 1, 1, '古力娜扎66', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (102, 1, 1, '古力娜扎66', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (103, 1, 1, '迪丽热巴67', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (104, 1, 1, '迪丽热巴68', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (105, 1, 1, '迪丽热巴68', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (106, 1, 1, '古力娜扎69', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (107, 1, 1, '迪丽热巴70', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (108, 1, 1, '迪丽热巴70', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (109, 1, 1, '迪丽热巴71', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (110, 1, 1, '古力娜扎72', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (111, 1, 1, '古力娜扎72', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (112, 1, 1, '迪丽热巴73', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (113, 1, 1, '迪丽热巴74', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (114, 1, 1, '迪丽热巴74', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (115, 1, 1, '古力娜扎75', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (116, 1, 1, '迪丽热巴76', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (117, 1, 1, '迪丽热巴76', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (118, 1, 1, '迪丽热巴77', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (119, 1, 1, '古力娜扎78', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (120, 1, 1, '古力娜扎78', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (121, 1, 1, '迪丽热巴79', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (122, 1, 1, '迪丽热巴80', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (123, 1, 1, '迪丽热巴80', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (124, 1, 1, '古力娜扎81', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (125, 1, 1, '迪丽热巴82', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (126, 1, 1, '迪丽热巴82', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (127, 1, 1, '迪丽热巴83', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (128, 1, 1, '古力娜扎84', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (129, 1, 1, '古力娜扎84', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (130, 1, 1, '迪丽热巴85', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (131, 1, 1, '迪丽热巴86', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (132, 1, 1, '迪丽热巴86', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (133, 1, 1, '古力娜扎87', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (134, 1, 1, '迪丽热巴88', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (135, 1, 1, '迪丽热巴88', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (136, 1, 1, '迪丽热巴89', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (137, 1, 1, '古力娜扎90', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (138, 1, 1, '古力娜扎90', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (139, 1, 1, '迪丽热巴91', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (140, 1, 1, '迪丽热巴92', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (141, 1, 1, '迪丽热巴92', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (142, 1, 1, '古力娜扎93', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (143, 1, 1, '迪丽热巴94', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (144, 1, 1, '迪丽热巴94', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (145, 1, 1, '迪丽热巴95', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (146, 1, 1, '古力娜扎96', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (147, 1, 1, '古力娜扎96', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (148, 1, 1, '迪丽热巴97', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (149, 1, 1, '迪丽热巴98', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (150, 1, 1, '迪丽热巴98', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (151, 1, 1, '古力娜扎99', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (152, 1, 1, '迪丽热巴100', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (153, 1, 1, '迪丽热巴100', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (154, 1, 1, '迪丽热巴101', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (155, 1, 1, '古力娜扎102', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (156, 1, 1, '古力娜扎102', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (157, 1, 1, '迪丽热巴103', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (158, 1, 1, '迪丽热巴104', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (159, 1, 1, '迪丽热巴104', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (160, 1, 1, '古力娜扎105', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (161, 1, 1, '迪丽热巴106', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (162, 1, 1, '迪丽热巴106', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (163, 1, 1, '迪丽热巴107', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (164, 1, 1, '古力娜扎108', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (165, 1, 1, '古力娜扎108', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (166, 1, 1, '迪丽热巴109', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (167, 1, 1, '迪丽热巴110', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (168, 1, 1, '迪丽热巴110', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (169, 1, 1, '古力娜扎111', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (170, 1, 1, '迪丽热巴112', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (171, 1, 1, '迪丽热巴112', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (172, 1, 1, '迪丽热巴113', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (173, 1, 1, '古力娜扎114', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (174, 1, 1, '古力娜扎114', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (175, 1, 1, '迪丽热巴115', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (176, 1, 1, '迪丽热巴116', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (177, 1, 1, '迪丽热巴116', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (178, 1, 1, '古力娜扎117', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (179, 1, 1, '迪丽热巴118', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (180, 1, 1, '迪丽热巴118', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (181, 1, 1, '迪丽热巴119', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (182, 1, 1, '古力娜扎120', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (183, 1, 1, '古力娜扎120', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (184, 1, 1, '迪丽热巴121', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (185, 1, 1, '迪丽热巴122', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (186, 1, 1, '迪丽热巴122', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (187, 1, 1, '古力娜扎123', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (188, 1, 1, '迪丽热巴124', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (189, 1, 1, '迪丽热巴124', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (190, 1, 1, '迪丽热巴125', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (191, 1, 1, '古力娜扎126', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (192, 1, 1, '古力娜扎126', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (193, 1, 1, '迪丽热巴127', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (194, 1, 1, '迪丽热巴128', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (195, 1, 1, '迪丽热巴128', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (196, 1, 1, '古力娜扎129', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (197, 1, 1, '迪丽热巴130', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (198, 1, 1, '迪丽热巴130', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (199, 1, 1, '迪丽热巴131', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (200, 1, 1, '古力娜扎132', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (201, 1, 1, '古力娜扎132', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (202, 1, 1, '迪丽热巴133', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (203, 1, 1, '迪丽热巴134', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (204, 1, 1, '迪丽热巴134', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (205, 1, 1, '古力娜扎135', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (206, 1, 1, '迪丽热巴136', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (207, 1, 1, '迪丽热巴136', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (208, 1, 1, '迪丽热巴137', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (209, 1, 1, '古力娜扎138', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (210, 1, 1, '古力娜扎138', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (211, 1, 1, '迪丽热巴139', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (212, 1, 1, '迪丽热巴140', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (213, 1, 1, '迪丽热巴140', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (214, 1, 1, '古力娜扎141', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (215, 1, 1, '迪丽热巴142', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (216, 1, 1, '迪丽热巴142', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (217, 1, 1, '迪丽热巴143', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (218, 1, 1, '古力娜扎144', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (219, 1, 1, '古力娜扎144', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (220, 1, 1, '迪丽热巴145', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (221, 1, 1, '迪丽热巴146', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (222, 1, 1, '迪丽热巴146', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (223, 1, 1, '古力娜扎147', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (224, 1, 1, '迪丽热巴148', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (225, 1, 1, '迪丽热巴148', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (226, 1, 1, '迪丽热巴149', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (227, 1, 1, '古力娜扎150', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (228, 1, 1, '古力娜扎150', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (229, 1, 1, '迪丽热巴151', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (230, 1, 1, '迪丽热巴152', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (231, 1, 1, '迪丽热巴152', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (232, 1, 1, '古力娜扎153', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (233, 1, 1, '迪丽热巴154', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (234, 1, 1, '迪丽热巴154', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (235, 1, 1, '迪丽热巴155', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (236, 1, 1, '古力娜扎156', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (237, 1, 1, '古力娜扎156', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (238, 1, 1, '迪丽热巴157', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (239, 1, 1, '迪丽热巴158', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (240, 1, 1, '迪丽热巴158', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (241, 1, 1, '古力娜扎159', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (242, 1, 1, '迪丽热巴160', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (243, 1, 1, '迪丽热巴160', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (244, 1, 1, '迪丽热巴161', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (245, 1, 1, '古力娜扎162', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (246, 1, 1, '古力娜扎162', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (247, 1, 1, '迪丽热巴163', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (248, 1, 1, '迪丽热巴164', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (249, 1, 1, '迪丽热巴164', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (250, 1, 1, '古力娜扎165', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (251, 1, 1, '迪丽热巴166', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (252, 1, 1, '迪丽热巴166', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (253, 1, 1, '迪丽热巴167', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (254, 1, 1, '古力娜扎168', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (255, 1, 1, '古力娜扎168', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (256, 1, 1, '迪丽热巴169', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (257, 1, 1, '迪丽热巴170', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (258, 1, 1, '迪丽热巴170', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (259, 1, 1, '古力娜扎171', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (260, 1, 1, '迪丽热巴172', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (261, 1, 1, '迪丽热巴172', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (262, 1, 1, '迪丽热巴173', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (263, 1, 1, '古力娜扎174', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (264, 1, 1, '古力娜扎174', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (265, 1, 1, '迪丽热巴175', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (266, 1, 1, '迪丽热巴176', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (267, 1, 1, '迪丽热巴176', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (268, 1, 1, '古力娜扎177', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (269, 1, 1, '迪丽热巴178', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (270, 1, 1, '迪丽热巴178', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (271, 1, 1, '迪丽热巴179', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (272, 1, 1, '古力娜扎180', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (273, 1, 1, '古力娜扎180', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (274, 1, 1, '迪丽热巴181', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (275, 1, 1, '迪丽热巴182', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (276, 1, 1, '迪丽热巴182', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (277, 1, 1, '古力娜扎183', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (278, 1, 1, '迪丽热巴184', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (279, 1, 1, '迪丽热巴184', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (280, 1, 1, '迪丽热巴185', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (281, 1, 1, '古力娜扎186', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (282, 1, 1, '古力娜扎186', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (283, 1, 1, '迪丽热巴187', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (284, 1, 1, '迪丽热巴188', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (285, 1, 1, '迪丽热巴188', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (286, 1, 1, '古力娜扎189', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (287, 1, 1, '迪丽热巴190', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (289, 1, 1, '迪丽热巴191', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (290, 1, 1, '古力娜扎192', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (291, 1, 1, '古力娜扎192', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (292, 1, 1, '迪丽热巴193', '123456', '2020-10-26 21:03:19', 1);
INSERT INTO `crm_user` VALUES (331, 1, 1, '', '', '2020-11-2 19:37:17', NULL);
INSERT INTO `crm_user` VALUES (332, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (333, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (334, 1, 1, '迪丽热巴1', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (335, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (336, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (337, 1, 1, '古力娜扎3', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (338, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (339, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (340, 1, 1, '迪丽热巴5', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (341, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (342, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (343, 1, 1, '迪丽热巴7', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (344, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (345, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (346, 1, 1, '古力娜扎9', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (347, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (348, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (349, 1, 1, '迪丽热巴11', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (350, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (351, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (352, 1, 1, '迪丽热巴13', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (353, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (354, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (355, 1, 1, '古力娜扎15', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (356, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (357, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (358, 1, 1, '迪丽热巴17', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (359, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (360, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (361, 1, 1, '迪丽热巴19', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (362, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (363, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (364, 1, 1, '古力娜扎21', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (365, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (366, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (367, 1, 1, '迪丽热巴23', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (368, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (369, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (370, 1, 1, '迪丽热巴25', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (371, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (372, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (373, 1, 1, '古力娜扎27', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (374, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (375, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (376, 1, 1, '迪丽热巴29', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (377, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (378, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (379, 1, 1, '迪丽热巴31', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (380, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (381, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (382, 1, 1, '古力娜扎33', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (383, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (384, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (385, 1, 1, '迪丽热巴35', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (386, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (387, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (388, 1, 1, '迪丽热巴37', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (389, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (390, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (391, 1, 1, '古力娜扎39', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (392, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (393, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (394, 1, 1, '迪丽热巴41', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (395, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (396, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (397, 1, 1, '迪丽热巴43', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (398, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (399, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (400, 1, 1, '古力娜扎45', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (401, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (402, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (403, 1, 1, '迪丽热巴47', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (404, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (405, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (406, 1, 1, '迪丽热巴49', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (407, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (408, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (409, 1, 1, '古力娜扎51', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (410, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (411, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (412, 1, 1, '迪丽热巴53', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (413, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (414, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (415, 1, 1, '迪丽热巴55', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (416, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (417, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (418, 1, 1, '古力娜扎57', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (419, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (420, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (421, 1, 1, '迪丽热巴59', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (422, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (423, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (424, 1, 1, '迪丽热巴61', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (425, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (426, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (427, 1, 1, '古力娜扎63', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (428, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (429, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (430, 1, 1, '迪丽热巴65', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (431, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (432, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (433, 1, 1, '迪丽热巴67', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (434, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (435, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (436, 1, 1, '古力娜扎69', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (437, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (438, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (439, 1, 1, '迪丽热巴71', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (440, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (441, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (442, 1, 1, '迪丽热巴73', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (443, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (444, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (445, 1, 1, '古力娜扎75', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (446, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (447, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (448, 1, 1, '迪丽热巴77', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (449, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (450, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (451, 1, 1, '迪丽热巴79', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (452, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (453, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (454, 1, 1, '古力娜扎81', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (455, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (456, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (457, 1, 1, '迪丽热巴83', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (458, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (459, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (460, 1, 1, '迪丽热巴85', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (461, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (462, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (463, 1, 1, '古力娜扎87', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (464, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (465, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (466, 1, 1, '迪丽热巴89', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (467, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (468, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (469, 1, 1, '迪丽热巴91', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (470, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (471, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (472, 1, 1, '古力娜扎93', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (473, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (474, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (475, 1, 1, '迪丽热巴95', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (476, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (477, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (478, 1, 1, '迪丽热巴97', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (479, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (480, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (481, 1, 1, '古力娜扎99', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (482, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (483, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (484, 1, 1, '迪丽热巴101', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (485, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (486, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (487, 1, 1, '迪丽热巴103', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (488, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (489, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (490, 1, 1, '古力娜扎105', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (491, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (492, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (493, 1, 1, '迪丽热巴107', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (494, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (495, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (496, 1, 1, '迪丽热巴109', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (497, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (498, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (499, 1, 1, '古力娜扎111', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (500, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (501, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (502, 1, 1, '迪丽热巴113', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (503, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (504, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (505, 1, 1, '迪丽热巴115', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (506, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (507, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (508, 1, 1, '古力娜扎117', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (509, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (510, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (511, 1, 1, '迪丽热巴119', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (512, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (513, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (514, 1, 1, '迪丽热巴121', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (515, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (516, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (517, 1, 1, '古力娜扎123', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (518, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (519, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (520, 1, 1, '迪丽热巴125', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (521, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (522, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (523, 1, 1, '迪丽热巴127', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (524, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (525, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (526, 1, 1, '古力娜扎129', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (527, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (528, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (529, 1, 1, '迪丽热巴131', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (530, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (531, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (532, 1, 1, '迪丽热巴133', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (533, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (534, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (535, 1, 1, '古力娜扎135', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (536, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (537, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (538, 1, 1, '迪丽热巴137', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (539, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (540, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (541, 1, 1, '迪丽热巴139', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (542, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (543, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (544, 1, 1, '古力娜扎141', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (545, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (546, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (547, 1, 1, '迪丽热巴143', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (548, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (549, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (550, 1, 1, '迪丽热巴145', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (551, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (552, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (553, 1, 1, '古力娜扎147', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (554, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (555, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (556, 1, 1, '迪丽热巴149', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (557, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (558, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (559, 1, 1, '迪丽热巴151', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (560, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (561, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (562, 1, 1, '古力娜扎153', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (563, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (564, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (565, 1, 1, '迪丽热巴155', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (566, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (567, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (568, 1, 1, '迪丽热巴157', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (569, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (570, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (571, 1, 1, '古力娜扎159', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (572, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (573, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (574, 1, 1, '迪丽热巴161', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (575, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (576, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (577, 1, 1, '迪丽热巴163', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (578, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (579, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (580, 1, 1, '古力娜扎165', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (581, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (582, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (583, 1, 1, '迪丽热巴167', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (584, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (585, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (586, 1, 1, '迪丽热巴169', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (587, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (588, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (589, 1, 1, '古力娜扎171', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (590, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (591, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (592, 1, 1, '迪丽热巴173', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (593, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (594, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (595, 1, 1, '迪丽热巴175', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (596, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (597, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (598, 1, 1, '古力娜扎177', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (599, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (600, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (601, 1, 1, '迪丽热巴179', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (602, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (603, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (604, 1, 1, '迪丽热巴181', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (605, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (606, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (607, 1, 1, '古力娜扎183', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (608, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (609, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (610, 1, 1, '迪丽热巴185', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (611, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (612, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (613, 1, 1, '迪丽热巴187', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (614, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (615, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (616, 1, 1, '古力娜扎189', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (617, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (618, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (619, 1, 1, '迪丽热巴191', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (620, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (621, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (622, 1, 1, '迪丽热巴193', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (623, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (624, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (625, 1, 1, '古力娜扎195', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (626, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (627, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (628, 1, 1, '迪丽热巴197', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (629, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (630, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (631, 1, 1, '迪丽热巴199', '123456', '2020-11-05 00:17:37', 1);
INSERT INTO `crm_user` VALUES (632, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_user` VALUES (633, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (634, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (635, 1, 1, '迪丽热巴1', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (636, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (637, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (638, 1, 1, '古力娜扎3', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (639, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (640, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (641, 1, 1, '迪丽热巴5', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (642, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (643, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (644, 1, 1, '迪丽热巴7', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (645, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (646, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (647, 1, 1, '古力娜扎9', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (648, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (649, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (650, 1, 1, '迪丽热巴11', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (651, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (652, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (653, 1, 1, '迪丽热巴13', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (654, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (655, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (656, 1, 1, '古力娜扎15', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (657, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (658, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (659, 1, 1, '迪丽热巴17', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (660, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (661, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (662, 1, 1, '迪丽热巴19', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (663, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (664, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (665, 1, 1, '古力娜扎21', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (666, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (667, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (668, 1, 1, '迪丽热巴23', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (669, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (670, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (671, 1, 1, '迪丽热巴25', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (672, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (673, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (674, 1, 1, '古力娜扎27', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (675, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (676, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (677, 1, 1, '迪丽热巴29', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (678, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (679, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (680, 1, 1, '迪丽热巴31', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (681, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (682, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (683, 1, 1, '古力娜扎33', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (684, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (685, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (686, 1, 1, '迪丽热巴35', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (687, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (688, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (689, 1, 1, '迪丽热巴37', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (690, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (691, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (692, 1, 1, '古力娜扎39', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (693, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (694, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (695, 1, 1, '迪丽热巴41', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (696, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (697, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (698, 1, 1, '迪丽热巴43', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (699, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (700, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (701, 1, 1, '古力娜扎45', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (702, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (703, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (704, 1, 1, '迪丽热巴47', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (705, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (706, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (707, 1, 1, '迪丽热巴49', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (708, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (709, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (710, 1, 1, '古力娜扎51', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (711, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (712, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (713, 1, 1, '迪丽热巴53', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (714, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (715, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (716, 1, 1, '迪丽热巴55', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (717, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (718, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (719, 1, 1, '古力娜扎57', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (720, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (721, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (722, 1, 1, '迪丽热巴59', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (723, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (724, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (725, 1, 1, '迪丽热巴61', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (726, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (727, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (728, 1, 1, '古力娜扎63', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (729, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (730, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (731, 1, 1, '迪丽热巴65', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (732, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (733, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (734, 1, 1, '迪丽热巴67', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (735, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (736, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (737, 1, 1, '古力娜扎69', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (738, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (739, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (740, 1, 1, '迪丽热巴71', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (741, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (742, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (743, 1, 1, '迪丽热巴73', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (744, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (745, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (746, 1, 1, '古力娜扎75', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (747, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (748, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (749, 1, 1, '迪丽热巴77', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (750, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (751, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (752, 1, 1, '迪丽热巴79', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (753, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (754, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (755, 1, 1, '古力娜扎81', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (756, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (757, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (758, 1, 1, '迪丽热巴83', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (759, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (760, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (761, 1, 1, '迪丽热巴85', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (762, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (763, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (764, 1, 1, '古力娜扎87', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (765, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (766, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (767, 1, 1, '迪丽热巴89', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (768, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (769, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (770, 1, 1, '迪丽热巴91', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (771, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (772, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (773, 1, 1, '古力娜扎93', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (774, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (775, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (776, 1, 1, '迪丽热巴95', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (777, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (778, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (779, 1, 1, '迪丽热巴97', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (780, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (781, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (782, 1, 1, '古力娜扎99', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (783, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (784, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (785, 1, 1, '迪丽热巴101', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (786, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (787, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (788, 1, 1, '迪丽热巴103', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (789, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (790, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (791, 1, 1, '古力娜扎105', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (792, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (793, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (794, 1, 1, '迪丽热巴107', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (795, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (796, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (797, 1, 1, '迪丽热巴109', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (798, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (799, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (800, 1, 1, '古力娜扎111', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (801, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (802, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (803, 1, 1, '迪丽热巴113', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (804, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (805, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (806, 1, 1, '迪丽热巴115', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (807, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (808, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (809, 1, 1, '古力娜扎117', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (810, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (811, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (812, 1, 1, '迪丽热巴119', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (813, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (814, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (815, 1, 1, '迪丽热巴121', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (816, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (817, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (818, 1, 1, '古力娜扎123', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (819, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (820, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (821, 1, 1, '迪丽热巴125', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (822, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (823, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (824, 1, 1, '迪丽热巴127', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (825, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (826, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (827, 1, 1, '古力娜扎129', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (828, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (829, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (830, 1, 1, '迪丽热巴131', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (831, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (832, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (833, 1, 1, '迪丽热巴133', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (834, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (835, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (836, 1, 1, '古力娜扎135', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (837, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (838, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (839, 1, 1, '迪丽热巴137', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (840, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (841, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (842, 1, 1, '迪丽热巴139', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (843, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (844, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (845, 1, 1, '古力娜扎141', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (846, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (847, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (848, 1, 1, '迪丽热巴143', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (849, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (850, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (851, 1, 1, '迪丽热巴145', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (852, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (853, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (854, 1, 1, '古力娜扎147', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (855, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (856, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (857, 1, 1, '迪丽热巴149', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (858, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (859, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (860, 1, 1, '迪丽热巴151', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (861, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (862, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (863, 1, 1, '古力娜扎153', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (864, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (865, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (866, 1, 1, '迪丽热巴155', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (867, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (868, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (869, 1, 1, '迪丽热巴157', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (870, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (871, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (872, 1, 1, '古力娜扎159', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (873, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (874, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (875, 1, 1, '迪丽热巴161', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (876, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (877, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (878, 1, 1, '迪丽热巴163', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (879, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (880, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (881, 1, 1, '古力娜扎165', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (882, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (883, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (884, 1, 1, '迪丽热巴167', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (885, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (886, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (887, 1, 1, '迪丽热巴169', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (888, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (889, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (890, 1, 1, '古力娜扎171', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (891, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (892, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (893, 1, 1, '迪丽热巴173', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (894, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (895, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (896, 1, 1, '迪丽热巴175', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (897, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (898, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (899, 1, 1, '古力娜扎177', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (900, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (901, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (902, 1, 1, '迪丽热巴179', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (903, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (904, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (905, 1, 1, '迪丽热巴181', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (906, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (907, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (908, 1, 1, '古力娜扎183', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (909, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (910, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (911, 1, 1, '迪丽热巴185', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (912, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (913, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (914, 1, 1, '迪丽热巴187', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (915, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (916, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (917, 1, 1, '古力娜扎189', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (918, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (919, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (920, 1, 1, '迪丽热巴191', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (921, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (922, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (923, 1, 1, '迪丽热巴193', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (924, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (925, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (926, 1, 1, '古力娜扎195', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (927, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (928, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (929, 1, 1, '迪丽热巴197', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (930, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (931, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (932, 1, 1, '迪丽热巴199', '123456', '2020-11-05 00:18:15', 1);
INSERT INTO `crm_user` VALUES (933, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_user` VALUES (934, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (935, 1, 1, '古力娜扎0', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (936, 1, 1, '迪丽热巴1', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (937, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (938, 1, 1, '迪丽热巴2', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (939, 1, 1, '古力娜扎3', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (940, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (941, 1, 1, '迪丽热巴4', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (942, 1, 1, '迪丽热巴5', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (943, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (944, 1, 1, '古力娜扎6', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (945, 1, 1, '迪丽热巴7', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (946, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (947, 1, 1, '迪丽热巴8', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (948, 1, 1, '古力娜扎9', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (949, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (950, 1, 1, '迪丽热巴10', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (951, 1, 1, '迪丽热巴11', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (952, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (953, 1, 1, '古力娜扎12', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (954, 1, 1, '迪丽热巴13', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (955, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (956, 1, 1, '迪丽热巴14', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (957, 1, 1, '古力娜扎15', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (958, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (959, 1, 1, '迪丽热巴16', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (960, 1, 1, '迪丽热巴17', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (961, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (962, 1, 1, '古力娜扎18', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (963, 1, 1, '迪丽热巴19', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (964, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (965, 1, 1, '迪丽热巴20', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (966, 1, 1, '古力娜扎21', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (967, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (968, 1, 1, '迪丽热巴22', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (969, 1, 1, '迪丽热巴23', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (970, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (971, 1, 1, '古力娜扎24', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (972, 1, 1, '迪丽热巴25', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (973, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (974, 1, 1, '迪丽热巴26', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (975, 1, 1, '古力娜扎27', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (976, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (977, 1, 1, '迪丽热巴28', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (978, 1, 1, '迪丽热巴29', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (979, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (980, 1, 1, '古力娜扎30', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (981, 1, 1, '迪丽热巴31', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (982, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (983, 1, 1, '迪丽热巴32', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (984, 1, 1, '古力娜扎33', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (985, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (986, 1, 1, '迪丽热巴34', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (987, 1, 1, '迪丽热巴35', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (988, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (989, 1, 1, '古力娜扎36', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (990, 1, 1, '迪丽热巴37', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (991, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (992, 1, 1, '迪丽热巴38', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (993, 1, 1, '古力娜扎39', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (994, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (995, 1, 1, '迪丽热巴40', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (996, 1, 1, '迪丽热巴41', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (997, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (998, 1, 1, '古力娜扎42', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (999, 1, 1, '迪丽热巴43', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1000, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1001, 1, 1, '迪丽热巴44', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1002, 1, 1, '古力娜扎45', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1003, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1004, 1, 1, '迪丽热巴46', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1005, 1, 1, '迪丽热巴47', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1006, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1007, 1, 1, '古力娜扎48', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1008, 1, 1, '迪丽热巴49', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1009, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1010, 1, 1, '迪丽热巴50', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1011, 1, 1, '古力娜扎51', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1012, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1013, 1, 1, '迪丽热巴52', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1014, 1, 1, '迪丽热巴53', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1015, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1016, 1, 1, '古力娜扎54', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1017, 1, 1, '迪丽热巴55', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1018, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1019, 1, 1, '迪丽热巴56', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1020, 1, 1, '古力娜扎57', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1021, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1022, 1, 1, '迪丽热巴58', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1023, 1, 1, '迪丽热巴59', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1024, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1025, 1, 1, '古力娜扎60', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1026, 1, 1, '迪丽热巴61', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1027, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1028, 1, 1, '迪丽热巴62', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1029, 1, 1, '古力娜扎63', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1030, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1031, 1, 1, '迪丽热巴64', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1032, 1, 1, '迪丽热巴65', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1033, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1034, 1, 1, '古力娜扎66', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1035, 1, 1, '迪丽热巴67', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1036, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1037, 1, 1, '迪丽热巴68', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1038, 1, 1, '古力娜扎69', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1039, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1040, 1, 1, '迪丽热巴70', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1041, 1, 1, '迪丽热巴71', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1042, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1043, 1, 1, '古力娜扎72', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1044, 1, 1, '迪丽热巴73', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1045, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1046, 1, 1, '迪丽热巴74', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1047, 1, 1, '古力娜扎75', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1048, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1049, 1, 1, '迪丽热巴76', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1050, 1, 1, '迪丽热巴77', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1051, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1052, 1, 1, '古力娜扎78', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1053, 1, 1, '迪丽热巴79', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1054, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1055, 1, 1, '迪丽热巴80', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1056, 1, 1, '古力娜扎81', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1057, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1058, 1, 1, '迪丽热巴82', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1059, 1, 1, '迪丽热巴83', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1060, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1061, 1, 1, '古力娜扎84', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1062, 1, 1, '迪丽热巴85', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1063, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1064, 1, 1, '迪丽热巴86', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1065, 1, 1, '古力娜扎87', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1066, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1067, 1, 1, '迪丽热巴88', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1068, 1, 1, '迪丽热巴89', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1069, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1070, 1, 1, '古力娜扎90', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1071, 1, 1, '迪丽热巴91', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1072, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1073, 1, 1, '迪丽热巴92', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1074, 1, 1, '古力娜扎93', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1075, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1076, 1, 1, '迪丽热巴94', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1077, 1, 1, '迪丽热巴95', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1078, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1079, 1, 1, '古力娜扎96', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1080, 1, 1, '迪丽热巴97', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1081, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1082, 1, 1, '迪丽热巴98', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1083, 1, 1, '古力娜扎99', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1084, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1085, 1, 1, '迪丽热巴100', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1086, 1, 1, '迪丽热巴101', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1087, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1088, 1, 1, '古力娜扎102', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1089, 1, 1, '迪丽热巴103', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1090, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1091, 1, 1, '迪丽热巴104', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1092, 1, 1, '古力娜扎105', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1093, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1094, 1, 1, '迪丽热巴106', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1095, 1, 1, '迪丽热巴107', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1096, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1097, 1, 1, '古力娜扎108', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1098, 1, 1, '迪丽热巴109', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1099, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1100, 1, 1, '迪丽热巴110', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1101, 1, 1, '古力娜扎111', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1102, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1103, 1, 1, '迪丽热巴112', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1104, 1, 1, '迪丽热巴113', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1105, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1106, 1, 1, '古力娜扎114', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1107, 1, 1, '迪丽热巴115', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1108, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1109, 1, 1, '迪丽热巴116', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1110, 1, 1, '古力娜扎117', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1111, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1112, 1, 1, '迪丽热巴118', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1113, 1, 1, '迪丽热巴119', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1114, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1115, 1, 1, '古力娜扎120', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1116, 1, 1, '迪丽热巴121', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1117, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1118, 1, 1, '迪丽热巴122', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1119, 1, 1, '古力娜扎123', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1120, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1121, 1, 1, '迪丽热巴124', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1122, 1, 1, '迪丽热巴125', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1123, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1124, 1, 1, '古力娜扎126', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1125, 1, 1, '迪丽热巴127', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1126, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1127, 1, 1, '迪丽热巴128', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1128, 1, 1, '古力娜扎129', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1129, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1130, 1, 1, '迪丽热巴130', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1131, 1, 1, '迪丽热巴131', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1132, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1133, 1, 1, '古力娜扎132', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1134, 1, 1, '迪丽热巴133', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1135, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1136, 1, 1, '迪丽热巴134', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1137, 1, 1, '古力娜扎135', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1138, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1139, 1, 1, '迪丽热巴136', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1140, 1, 1, '迪丽热巴137', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1141, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1142, 1, 1, '古力娜扎138', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1143, 1, 1, '迪丽热巴139', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1144, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1145, 1, 1, '迪丽热巴140', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1146, 1, 1, '古力娜扎141', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1147, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1148, 1, 1, '迪丽热巴142', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1149, 1, 1, '迪丽热巴143', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1150, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1151, 1, 1, '古力娜扎144', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1152, 1, 1, '迪丽热巴145', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1153, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1154, 1, 1, '迪丽热巴146', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1155, 1, 1, '古力娜扎147', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1156, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1157, 1, 1, '迪丽热巴148', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1158, 1, 1, '迪丽热巴149', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1159, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1160, 1, 1, '古力娜扎150', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1161, 1, 1, '迪丽热巴151', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1162, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1163, 1, 1, '迪丽热巴152', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1164, 1, 1, '古力娜扎153', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1165, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1166, 1, 1, '迪丽热巴154', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1167, 1, 1, '迪丽热巴155', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1168, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1169, 1, 1, '古力娜扎156', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1170, 1, 1, '迪丽热巴157', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1171, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1172, 1, 1, '迪丽热巴158', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1173, 1, 1, '古力娜扎159', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1174, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1175, 1, 1, '迪丽热巴160', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1176, 1, 1, '迪丽热巴161', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1177, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1178, 1, 1, '古力娜扎162', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1179, 1, 1, '迪丽热巴163', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1180, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1181, 1, 1, '迪丽热巴164', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1182, 1, 1, '古力娜扎165', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1183, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1184, 1, 1, '迪丽热巴166', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1185, 1, 1, '迪丽热巴167', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1186, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1187, 1, 1, '古力娜扎168', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1188, 1, 1, '迪丽热巴169', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1189, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1190, 1, 1, '迪丽热巴170', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1191, 1, 1, '古力娜扎171', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1192, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1193, 1, 1, '迪丽热巴172', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1194, 1, 1, '迪丽热巴173', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1195, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1196, 1, 1, '古力娜扎174', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1197, 1, 1, '迪丽热巴175', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1198, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1199, 1, 1, '迪丽热巴176', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1200, 1, 1, '古力娜扎177', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1201, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1202, 1, 1, '迪丽热巴178', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1203, 1, 1, '迪丽热巴179', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1204, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1205, 1, 1, '古力娜扎180', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1206, 1, 1, '迪丽热巴181', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1207, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1208, 1, 1, '迪丽热巴182', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1209, 1, 1, '古力娜扎183', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1210, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1211, 1, 1, '迪丽热巴184', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1212, 1, 1, '迪丽热巴185', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1213, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1214, 1, 1, '古力娜扎186', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1215, 1, 1, '迪丽热巴187', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1216, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1217, 1, 1, '迪丽热巴188', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1218, 1, 1, '古力娜扎189', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1219, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1220, 1, 1, '迪丽热巴190', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1221, 1, 1, '迪丽热巴191', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1222, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1223, 1, 1, '古力娜扎192', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1224, 1, 1, '迪丽热巴193', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1225, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1226, 1, 1, '迪丽热巴194', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1227, 1, 1, '古力娜扎195', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1228, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1229, 1, 1, '迪丽热巴196', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1230, 1, 1, '迪丽热巴197', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1231, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1232, 1, 1, '古力娜扎198', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1233, 1, 1, '迪丽热巴199', '123456', '2020-11-05 00:24:44', 1);
INSERT INTO `crm_user` VALUES (1235, 1, NULL, '', '', '2020-11-5 14:27:29', NULL);
INSERT INTO `crm_user` VALUES (1236, 1, 1, '1', '1', '2020-11-20 18:36:21', 1);

-- ----------------------------
-- Table structure for crm_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_permission`;
CREATE TABLE `crm_user_permission`  (
  `permission_id` int NOT NULL COMMENT '权限ID',
  `uid` int NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`permission_id`, `uid`) USING BTREE,
  INDEX `fk_user_permission2`(`uid`) USING BTREE,
  CONSTRAINT `fk_user_permission` FOREIGN KEY (`permission_id`) REFERENCES `crm_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_permission2` FOREIGN KEY (`uid`) REFERENCES `crm_permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-权限 关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_user_permission
-- ----------------------------
INSERT INTO `crm_user_permission` VALUES (1, 1);

-- ----------------------------
-- Table structure for crm_user_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_role`;
CREATE TABLE `crm_user_role`  (
  `role_id` int NOT NULL COMMENT 'role_id',
  `uid` int NOT NULL COMMENT '用户_id',
  PRIMARY KEY (`role_id`, `uid`) USING BTREE,
  INDEX `fk_user_role2`(`uid`) USING BTREE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_role2` FOREIGN KEY (`uid`) REFERENCES `crm_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_user_role
-- ----------------------------
INSERT INTO `crm_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
