/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云5.7
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : 127.0.0.1:3306
 Source Schema         : ry-vue-plus

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 27/07/2025 15:37:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for erp_account
-- ----------------------------
DROP TABLE IF EXISTS `erp_account`;
CREATE TABLE `erp_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账户名称',
  `no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账户编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `sort` int(11) NOT NULL COMMENT '排序',
  `default_status` bit(1) NULL DEFAULT b'1' COMMENT '是否默认',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1863909834519281667 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 结算账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_account
-- ----------------------------
INSERT INTO `erp_account` VALUES (1863905210353647617, '工商银行', '62100000000000', NULL, 0, 1, b'1', 103, '2024-12-03 19:16:46', 1, '2024-12-21 11:33:36', 1, '000000', 0);
INSERT INTO `erp_account` VALUES (1863905307195932674, '农业银行', '62100000000001', NULL, 0, 2, b'0', 103, '2024-12-03 19:17:10', 1, '2024-12-21 11:31:15', 1, '000000', 0);
INSERT INTO `erp_account` VALUES (1863906782177460225, '交通银行', '62100000000002', NULL, 0, 1, b'1', 103, '2024-12-03 19:23:01', 1, '2024-12-21 11:31:11', 1, '000000', 0);
INSERT INTO `erp_account` VALUES (1863909834519281666, '农商银行', '62100000000002', NULL, 0, 1, b'1', 103, '2024-12-03 19:35:09', 1, '2024-12-03 19:35:09', 1, '000000', 2);

-- ----------------------------
-- Table structure for erp_customer
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer`;
CREATE TABLE `erp_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名称',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '传真',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `sort` int(11) NOT NULL COMMENT '排序',
  `tax_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率',
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户账号',
  `bank_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户地址',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1872595084233490435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_customer
-- ----------------------------
INSERT INTO `erp_customer` VALUES (1781192955205906433, '1', '1', '1', '1', '1', '1', '1', 0, 1, '1', 1.000000, '1', '1', '1', 103, '2024-04-19 13:27:48', 1, '2024-04-19 16:08:34', 1, '000000', 2);
INSERT INTO `erp_customer` VALUES (1781208458976612353, '2', '2', '2', '2', '2', '2', '2', 0, 2, '2', 2.000000, '2', '2', '2', 103, '2024-04-19 14:29:25', 1, '2024-04-19 14:29:25', 1, '000000', 2);
INSERT INTO `erp_customer` VALUES (1781234336490098689, '商贸有限公司', '小王', '1331xxx', '1331xxxx', 'xxxx@qq.com', '69690001', '1331xxx', 1, 1, '1331xxx', 3.000000, '1331xxx', '1331xxx', '1331xxx', 103, '2024-04-19 16:12:14', 1, '2024-04-19 16:28:42', 1, '000000', 0);
INSERT INTO `erp_customer` VALUES (1783003172612632578, '1', '1', '1', '1', '1', '1', '1', 0, 2, '1', 1.000000, '1', '1', '1', 103, '2024-04-24 13:20:58', 1, '2024-04-24 13:20:58', 1, '000000', 2);
INSERT INTO `erp_customer` VALUES (1783038142311854082, '1', '1', '1', '1', '1', '1', '', 0, 1, '1', 1.000000, '1', '1', '1', 103, '2024-04-24 15:39:55', 1, '2024-04-24 15:39:55', 1, '000000', 2);
INSERT INTO `erp_customer` VALUES (1872595084233490434, '贸易有限公司', '小王', '13311984000', NULL, NULL, NULL, '', 0, 1, '1', 2.000000, '1', '1', '1', 103, '2024-12-27 18:47:14', 1, '2024-12-27 18:47:14', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_finance_payment
-- ----------------------------
DROP TABLE IF EXISTS `erp_finance_payment`;
CREATE TABLE `erp_finance_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款单号',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `payment_time` datetime NOT NULL COMMENT '付款时间',
  `finance_user_id` bigint(20) NULL DEFAULT NULL COMMENT '财务人员编号',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编号',
  `account_id` bigint(20) NOT NULL COMMENT '付款账户编号',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `payment_price` decimal(24, 6) NOT NULL COMMENT '实付金额，单位：分',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 付款单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_finance_payment
-- ----------------------------

-- ----------------------------
-- Table structure for erp_finance_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_finance_payment_item`;
CREATE TABLE `erp_finance_payment_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `payment_id` bigint(20) NOT NULL COMMENT '付款单编号',
  `biz_type` tinyint(4) NOT NULL COMMENT '业务类型',
  `biz_id` bigint(20) NOT NULL COMMENT '业务编号',
  `biz_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务单号',
  `total_price` decimal(24, 6) NOT NULL COMMENT '应付欠款，单位：分',
  `paid_price` decimal(24, 6) NOT NULL COMMENT '已付欠款，单位：分',
  `payment_price` decimal(24, 6) NOT NULL COMMENT '本次付款，单位：分',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 付款项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_finance_payment_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_finance_receipt
-- ----------------------------
DROP TABLE IF EXISTS `erp_finance_receipt`;
CREATE TABLE `erp_finance_receipt`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款单号',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `receipt_time` datetime NOT NULL COMMENT '收款时间',
  `finance_user_id` bigint(20) NULL DEFAULT NULL COMMENT '财务人员编号',
  `customer_id` bigint(20) NOT NULL COMMENT '客户编号',
  `account_id` bigint(20) NOT NULL COMMENT '收款账户编号',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `receipt_price` decimal(24, 6) NOT NULL COMMENT '实收金额，单位：分',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 收款单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_finance_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for erp_finance_receipt_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_finance_receipt_item`;
CREATE TABLE `erp_finance_receipt_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `receipt_id` bigint(20) NOT NULL COMMENT '收款单编号',
  `biz_type` tinyint(4) NOT NULL COMMENT '业务类型',
  `biz_id` bigint(20) NOT NULL COMMENT '业务编号',
  `biz_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务单号',
  `total_price` decimal(24, 6) NOT NULL COMMENT '应收金额，单位：分',
  `receipted_price` decimal(24, 6) NOT NULL COMMENT '已收金额，单位：分',
  `receipt_price` decimal(24, 6) NOT NULL COMMENT '本次收款，单位：分',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 收款项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_finance_receipt_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_product
-- ----------------------------
DROP TABLE IF EXISTS `erp_product`;
CREATE TABLE `erp_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `bar_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品条码',
  `category_id` bigint(20) NOT NULL COMMENT '产品分类编号',
  `unit_id` bigint(20) NOT NULL COMMENT '单位编号',
  `status` tinyint(4) NOT NULL COMMENT '产品状态',
  `standard` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品规格',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品备注',
  `expiry_day` int(11) NULL DEFAULT NULL COMMENT '保质期天数',
  `weight` decimal(24, 6) NULL DEFAULT NULL COMMENT '基础重量（kg）',
  `purchase_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '采购价格，单位：元',
  `sale_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '销售价格，单位：元',
  `min_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '最低价格，单位：元',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786751416403030019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_product
-- ----------------------------
INSERT INTO `erp_product` VALUES (1786750166479433730, '西瓜', '00001', 1786016750632972290, 1786749930440781825, 0, '大西瓜', '1', 180, 1.000000, 1.000000, 1.000000, 1.000000, 103, '2024-05-04 21:30:11', 1, '2024-12-01 22:06:22', 1, '000000', 0);
INSERT INTO `erp_product` VALUES (1786751416403030018, '苹果', '0002', 1786016811488129026, 1786749930440781825, 0, '大苹果', '4', 180, 4.000000, 4.000000, 4.000000, 4.000000, 103, '2024-05-04 21:35:09', 1, '2024-11-24 13:35:05', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_product_category
-- ----------------------------
DROP TABLE IF EXISTS `erp_product_category`;
CREATE TABLE `erp_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类编码',
  `sort` int(11) NULL DEFAULT 0 COMMENT '分类排序',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786016811488129027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 产品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_product_category
-- ----------------------------
INSERT INTO `erp_product_category` VALUES (1786014988517781505, 0, '水果', '001', 1, 0, 103, '2024-05-02 20:48:50', 1, '2024-11-23 21:38:20', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786015034999058433, 0, '饮料', '002', 2, 0, 103, '2024-05-02 20:49:02', 1, '2024-05-02 20:49:02', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786015083095142402, 0, '甜点', '003', 3, 0, 103, '2024-05-02 20:49:13', 1, '2024-05-02 20:49:20', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786015279661199362, 0, '蔬菜', '004', 4, 0, 103, '2024-05-02 20:50:00', 1, '2024-05-02 20:56:18', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786015402122293249, 0, '坚果', '005', 5, 0, 103, '2024-05-02 20:50:29', 1, '2024-05-02 20:56:25', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786015469159854082, 1786015279661199362, '菠菜', '004-001', 0, 0, 103, '2024-05-02 20:50:45', 1, '2024-05-02 20:50:45', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786016750632972290, 1786014988517781505, '西瓜', '001-001', 1, 0, 103, '2024-05-02 20:55:51', 1, '2024-11-23 21:38:44', 1, '000000', 0);
INSERT INTO `erp_product_category` VALUES (1786016811488129026, 1786014988517781505, '苹果', '001-002', 0, 0, 103, '2024-05-02 20:56:05', 1, '2024-05-02 20:56:05', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_product_unit
-- ----------------------------
DROP TABLE IF EXISTS `erp_product_unit`;
CREATE TABLE `erp_product_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单位编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位名字',
  `status` tinyint(4) NOT NULL COMMENT '单位状态',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1860315977927921667 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 产品单位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_product_unit
-- ----------------------------
INSERT INTO `erp_product_unit` VALUES (1785310919612469249, '1', 0, 103, '2024-04-30 22:11:07', 1, '2024-04-30 22:11:07', 1, '000000', 2);
INSERT INTO `erp_product_unit` VALUES (1785311581536571394, '个', 0, 103, '2024-04-30 22:13:45', 1, '2024-12-01 22:06:02', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1785311613388115969, '盒', 0, 103, '2024-04-30 22:13:53', 1, '2024-04-30 22:13:53', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1785311646405677058, '瓶', 0, 103, '2024-04-30 22:14:01', 1, '2024-05-04 21:29:23', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1785311679196745729, '颗', 0, 103, '2024-04-30 22:14:08', 1, '2024-05-04 21:29:28', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1786749930440781825, '箱', 0, 103, '2024-05-04 21:29:14', 1, '2024-05-04 21:29:14', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1860314257084682242, '串', 0, 103, '2024-11-23 21:27:37', 1, '2024-11-23 21:27:37', 1, '000000', 0);
INSERT INTO `erp_product_unit` VALUES (1860315977927921666, '根', 1, 103, '2024-11-23 21:34:27', 1, '2024-11-23 21:35:22', 1, '000000', 2);

-- ----------------------------
-- Table structure for erp_purchase_in
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_in`;
CREATE TABLE `erp_purchase_in`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '采购入库编号',
  `status` tinyint(4) NOT NULL COMMENT '采购状态',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编号',
  `account_id` bigint(20) NOT NULL COMMENT '结算账户编号',
  `in_time` datetime NOT NULL COMMENT '入库时间',
  `order_id` bigint(20) NOT NULL COMMENT '采购订单编号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购订单号',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `payment_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '已付款金额，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `other_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '其它金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购入库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_in
-- ----------------------------
INSERT INTO `erp_purchase_in` VALUES (1, 'CGRK20241204000012', 0, 1785149784049393666, 1863905307195932674, '2024-12-28 10:52:10', 1864204343601823745, 'CGDD20241204000010', 1.000000, 1.000000, 0.000000, 1.000000, 1.000000, 1.000000, 1.000000, 0.000000, NULL, NULL, 1, '2024-12-28 10:52:30', 1, '2024-12-28 10:52:37', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_purchase_in_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_in_items`;
CREATE TABLE `erp_purchase_in_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `in_no` bigint(20) NOT NULL COMMENT '采购入库编号',
  `order_item_id` bigint(20) NOT NULL COMMENT '采购订单项编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购入库项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_in_items
-- ----------------------------

-- ----------------------------
-- Table structure for erp_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_order`;
CREATE TABLE `erp_purchase_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '采购单编号',
  `status` tinyint(4) NOT NULL COMMENT '采购状态',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编号',
  `account_id` bigint(20) NOT NULL COMMENT '结算账户编号',
  `order_time` datetime NOT NULL COMMENT '采购时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `deposit_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '定金金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `in_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '采购入库数量',
  `return_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '采购退货数量',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1899120512934629378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_order
-- ----------------------------
INSERT INTO `erp_purchase_order` VALUES (1864204343601823745, 'CGDD20241204000010', 20, 1785149784049393666, 1863905307195932674, '2024-12-04 00:00:00', 2.000000, 5.000000, 5.000000, 0.100000, 2.000000, 0.100000, 1.000000, '', '测试', 0.000000, 0.000000, 103, '2024-12-04 15:05:25', 1, '2024-12-20 15:53:27', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1864207187285409794, 'CGDD20241204000011', 20, 1785149784049393666, 1863905210353647617, '2024-12-04 00:00:00', 9.000000, 18.020000, 18.000000, 0.390000, 2.000000, 0.370000, 2.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-04 15:16:43', 1, '2024-12-04 15:16:43', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1864220697688047617, 'CGDD20241204000012', 20, 1785152245472444418, 1863905210353647617, '2024-12-04 00:00:00', 20.000000, 50.440000, 50.000000, 2.000000, 3.000000, 1.560000, 10.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-04 16:10:25', 1, '2024-12-04 16:10:25', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1866862390732193794, 'CGDD20241211000001', 20, 1785149784049393666, 1863905307195932674, '2024-12-11 00:00:00', 3.000000, 5.920000, 6.000000, 0.170000, 4.000000, 0.250000, 4.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-11 23:07:33', 1, '2024-12-11 23:07:33', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1867077882851913730, 'CGDD20241212000001', 20, 1785149784049393666, 1863905210353647617, '2024-12-12 00:00:00', 10.000000, 9.870000, 10.000000, 0.500000, 6.000000, 0.630000, 1.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-12 13:23:51', 1, '2024-12-12 13:23:51', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1868926161168420866, 'CGDD20241217000001', 20, 1785149784049393666, 1863905307195932674, '2024-12-17 00:00:00', 1.000000, 1.000000, 1.000000, 0.020000, 2.000000, 0.020000, 2.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-17 15:48:14', 1, '2024-12-17 15:48:14', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1869968530034675714, 'CGDD20241220000001', 20, 1785149784049393666, 1863905307195932674, '2024-12-20 00:00:00', 1.000000, 5.000000, 1.000000, 0.020000, 2.000000, 0.100000, 1.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-20 12:50:15', 1, '2024-12-20 12:50:55', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1869970706605821954, 'CGDD20241220000002', 10, 1785152245472444418, 1863905307195932674, '2024-12-20 00:00:00', 2.000000, 6.000000, 5.000000, 0.100000, 2.000000, 0.120000, 1.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-20 12:58:53', 1, '2024-12-20 12:59:20', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1870017755837657089, 'CGDD20241220000003', 10, 1785149784049393666, 1863905307195932674, '2024-12-20 00:00:00', 2.000000, 5.000000, 5.000000, 0.100000, 2.000000, 0.100000, 1.000000, '', NULL, 0.000000, 0.000000, 103, '2024-12-20 16:05:51', 1, '2024-12-20 18:02:12', 1, '000000', 0);
INSERT INTO `erp_purchase_order` VALUES (1870028132814217217, 'CGDD20241220000004', 10, 1785149784049393666, 1863905307195932674, '2024-12-21 00:00:00', 2.000000, 5.000000, 5.000000, 0.100000, 2.000000, 0.100000, 1.000000, '', '测试', 0.000000, 0.000000, 103, '2024-12-20 16:47:05', 1, '2024-12-20 16:51:19', 1, '000000', 2);
INSERT INTO `erp_purchase_order` VALUES (1899120512934629377, 'CGDD20250310000001', 20, 1785149784049393666, 1863905210353647617, '2025-03-10 00:00:00', 2.000000, 5.000000, 5.000000, 0.100000, 2.000000, 0.100000, 5.000000, '', NULL, 0.000000, 0.000000, 103, '2025-03-10 23:29:49', 1, '2025-03-10 23:29:49', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_purchase_order_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_order_items`;
CREATE TABLE `erp_purchase_order_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '采购订单编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `in_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '采购入库数量',
  `return_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '采购退货数量',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1899120513928679426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购订单项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_order_items
-- ----------------------------
INSERT INTO `erp_purchase_order_items` VALUES (1864204344377769985, 'CGDD20241204000010', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-04 15:05:26', 1, '2024-12-20 15:53:27', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864204344839143426, 'CGDD20241204000010', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-04 15:05:26', 1, '2024-12-20 15:53:27', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864207187985858561, 'CGDD20241204000011', 1786750166479433730, 1786749930440781825, 1.000000, 3.000000, 3.000000, 2.000000, 0.060000, NULL, 0.000000, 0.000000, 103, '2024-12-04 15:16:44', 1, '2024-12-04 15:16:44', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864207188447232002, 'CGDD20241204000011', 1786751416403030018, 1786749930440781825, 4.000000, 3.000000, 12.000000, 2.000000, 0.240000, NULL, 0.000000, 0.000000, 103, '2024-12-04 15:16:44', 1, '2024-12-04 15:16:44', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864207188447232003, 'CGDD20241204000011', 1786750166479433730, 1786749930440781825, 1.000000, 3.000000, 3.000000, 3.000000, 0.090000, NULL, 0.000000, 0.000000, 103, '2024-12-04 15:16:44', 1, '2024-12-04 15:16:44', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864220698153615361, 'CGDD20241204000012', 1786750166479433730, 1786749930440781825, 1.000000, 10.000000, 10.000000, 4.000000, 0.400000, NULL, 0.000000, 0.000000, 103, '2024-12-04 16:10:25', 1, '2024-12-04 16:10:25', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1864220698484965378, 'CGDD20241204000012', 1786751416403030018, 1786749930440781825, 4.000000, 10.000000, 40.000000, 4.000000, 1.600000, NULL, 0.000000, 0.000000, 103, '2024-12-04 16:10:25', 1, '2024-12-04 16:10:25', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1866862391193567234, 'CGDD20241211000001', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-11 23:07:33', 1, '2024-12-11 23:07:33', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1866862391592026113, 'CGDD20241211000001', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 3.000000, 0.030000, NULL, 0.000000, 0.000000, 103, '2024-12-11 23:07:33', 1, '2024-12-11 23:07:33', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1866862391592026114, 'CGDD20241211000001', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 3.000000, 0.120000, NULL, 0.000000, 0.000000, 103, '2024-12-11 23:07:33', 1, '2024-12-11 23:07:33', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1867077883300704258, 'CGDD20241212000001', 1786750166479433730, 1786749930440781825, 1.000000, 10.000000, 10.000000, 5.000000, 0.500000, NULL, 0.000000, 0.000000, 103, '2024-12-12 13:23:51', 1, '2024-12-12 13:23:51', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1868926161852092417, 'CGDD20241217000001', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-17 15:48:15', 1, '2024-12-17 15:48:15', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1869968530626072578, 'CGDD20241220000001', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 12:50:15', 1, '2024-12-20 12:50:15', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1869970707331436545, 'CGDD20241220000002', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 12:58:54', 1, '2024-12-20 12:58:54', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1869970707788615681, 'CGDD20241220000002', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-20 12:58:54', 1, '2024-12-20 12:58:54', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1870014383684358145, 'CGDD20241204000010', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 15:52:27', 1, '2024-12-20 15:52:27', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1870017756366139393, 'CGDD20241220000003', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:05:51', 1, '2024-12-20 18:02:13', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1870017756764598274, 'CGDD20241220000003', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:05:51', 1, '2024-12-20 18:02:13', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1870020673915600898, 'CGDD20241220000003', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:17:27', 1, '2024-12-20 16:17:41', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870020731612446722, 'CGDD20241220000003', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:17:40', 1, '2024-12-20 16:17:40', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870027543657111554, 'CGDD20241220000003', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:44:44', 1, '2024-12-20 16:45:04', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870027624208719874, 'CGDD20241220000003', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:45:04', 1, '2024-12-20 16:45:16', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870028133795684353, 'CGDD20241220000004', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:47:05', 1, '2024-12-20 16:51:19', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870028134462578690, 'CGDD20241220000004', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:47:05', 1, '2024-12-20 16:51:19', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870028240096124929, 'CGDD20241220000004', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 3.000000, 0.030000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:47:31', 1, '2024-12-20 16:47:31', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1870029169147056129, 'CGDD20241220000004', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 3.000000, 0.030000, NULL, 0.000000, 0.000000, 103, '2024-12-20 16:51:12', 1, '2024-12-20 16:51:12', 1, '000000', 2);
INSERT INTO `erp_purchase_order_items` VALUES (1899120513534414849, 'CGDD20250310000001', 1786750166479433730, 1786749930440781825, 1.000000, 1.000000, 1.000000, 2.000000, 0.020000, NULL, 0.000000, 0.000000, 103, '2025-03-10 23:29:49', 1, '2025-03-10 23:29:49', 1, '000000', 0);
INSERT INTO `erp_purchase_order_items` VALUES (1899120513928679425, 'CGDD20250310000001', 1786751416403030018, 1786749930440781825, 4.000000, 1.000000, 4.000000, 2.000000, 0.080000, NULL, 0.000000, 0.000000, 103, '2025-03-10 23:29:49', 1, '2025-03-10 23:29:49', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_purchase_return
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_return`;
CREATE TABLE `erp_purchase_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购退货编号',
  `status` tinyint(4) NOT NULL COMMENT '退货状态',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编号',
  `account_id` bigint(20) NOT NULL COMMENT '结算账户编号',
  `return_time` datetime NOT NULL COMMENT '退货时间',
  `order_id` bigint(20) NOT NULL COMMENT '采购订单编号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购订单号',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `refund_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '已退款金额，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `other_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '其它金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购退货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_return
-- ----------------------------

-- ----------------------------
-- Table structure for erp_purchase_return_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_return_items`;
CREATE TABLE `erp_purchase_return_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `return_id` bigint(20) NOT NULL COMMENT '采购退货编号',
  `order_item_id` bigint(20) NOT NULL COMMENT '采购订单项编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 采购退货项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_purchase_return_items
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order`;
CREATE TABLE `erp_sale_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售单编号',
  `status` tinyint(4) NOT NULL COMMENT '销售状态',
  `customer_id` bigint(20) NOT NULL COMMENT '客户编号',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '结算账户编号',
  `sale_user_id` bigint(20) NULL DEFAULT NULL COMMENT '销售用户编号',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `deposit_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '定金金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `out_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '销售出库数量',
  `return_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '销售退货数量',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_order
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_order_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order_items`;
CREATE TABLE `erp_sale_order_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) NOT NULL COMMENT '销售订单编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `out_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '销售出库数量',
  `return_count` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '销售退货数量',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售订单项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_order_items
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_out
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_out`;
CREATE TABLE `erp_sale_out`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售出库编号',
  `status` tinyint(4) NOT NULL COMMENT '出库状态',
  `customer_id` bigint(20) NOT NULL COMMENT '客户编号',
  `account_id` bigint(20) NOT NULL COMMENT '结算账户编号',
  `sale_user_id` bigint(20) NULL DEFAULT NULL COMMENT '销售用户编号',
  `out_time` datetime NOT NULL COMMENT '出库时间',
  `order_id` bigint(20) NOT NULL COMMENT '销售订单编号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售订单号',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `receipt_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '已收款金额，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `other_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '其它金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售出库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_out
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_out_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_out_items`;
CREATE TABLE `erp_sale_out_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_id` bigint(20) NOT NULL COMMENT '销售出库编号',
  `order_item_id` bigint(20) NOT NULL COMMENT '销售订单项编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售出库项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_out_items
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_return
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_return`;
CREATE TABLE `erp_sale_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售退货编号',
  `status` tinyint(4) NOT NULL COMMENT '退货状态',
  `customer_id` bigint(20) NOT NULL COMMENT '客户编号',
  `account_id` bigint(20) NOT NULL COMMENT '结算账户编号',
  `sale_user_id` bigint(20) NULL DEFAULT NULL COMMENT '销售用户编号',
  `return_time` datetime NOT NULL COMMENT '退货时间',
  `order_id` bigint(20) NOT NULL COMMENT '销售订单编号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售订单号',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计价格，单位：元',
  `refund_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '已退款金额，单位：元',
  `total_product_price` decimal(24, 6) NOT NULL COMMENT '合计产品价格，单位：元',
  `total_tax_price` decimal(24, 6) NOT NULL COMMENT '合计税额，单位：元',
  `discount_percent` decimal(24, 6) NOT NULL COMMENT '优惠率，百分比',
  `discount_price` decimal(24, 6) NOT NULL COMMENT '优惠金额，单位：元',
  `other_price` decimal(24, 6) NOT NULL DEFAULT 0.000000 COMMENT '其它金额，单位：元',
  `file_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售退货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_return
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_return_items
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_return_items`;
CREATE TABLE `erp_sale_return_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `return_id` bigint(20) NOT NULL COMMENT '销售退货编号',
  `order_item_id` bigint(20) NOT NULL COMMENT '销售订单项编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位单位',
  `product_price` decimal(24, 6) NOT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '总价',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率，百分比',
  `tax_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额，单位：元',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 销售退货项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_return_items
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock`;
CREATE TABLE `erp_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `count` decimal(24, 6) NOT NULL COMMENT '库存数量',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 产品库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_check
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_check`;
CREATE TABLE `erp_stock_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '盘点编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盘点单号',
  `check_time` datetime NOT NULL COMMENT '盘点时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计金额，单位：元',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件 URL',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 库存盘点单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_check
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_check_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_check_item`;
CREATE TABLE `erp_stock_check_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '调拨项编号',
  `check_id` bigint(20) NOT NULL COMMENT '调拨编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位编号',
  `product_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '产品单价',
  `stock_count` decimal(24, 6) NOT NULL COMMENT '账面数量（当前库存）',
  `actual_count` decimal(24, 6) NOT NULL COMMENT '实际数量（实际库存）',
  `count` decimal(24, 6) NOT NULL COMMENT '盈亏数量',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额，单位：元',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 库存盘点项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_check_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_in
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_in`;
CREATE TABLE `erp_stock_in`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '入库编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入库单号',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商编号',
  `in_time` datetime NOT NULL COMMENT '入库时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计金额，单位：元',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件 URL',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 其它入库单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_in
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_in_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_in_item`;
CREATE TABLE `erp_stock_in_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '入库项编号',
  `in_id` bigint(20) NOT NULL COMMENT '入库编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位编号',
  `product_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '产品数量',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额，单位：元',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 其它入库单项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_in_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_move
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_move`;
CREATE TABLE `erp_stock_move`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '调拨编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调拨单号',
  `move_time` datetime NOT NULL COMMENT '调拨时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计金额，单位：元',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件 URL',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 库存调拨单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_move
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_move_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_move_item`;
CREATE TABLE `erp_stock_move_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '盘点项编号',
  `check_id` bigint(20) NOT NULL COMMENT '盘点编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位编号',
  `product_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '盈亏数量',
  `stock_count` decimal(24, 6) NOT NULL COMMENT '账面数量（原始库存）',
  `actual_count` decimal(24, 6) NULL DEFAULT NULL COMMENT '实际数量（实际库存）',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额，单位：元',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 库存盘点项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_move_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_out
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_out`;
CREATE TABLE `erp_stock_out`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '出库编号',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出库单号',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '客户编号',
  `out_time` datetime NOT NULL COMMENT '出库时间',
  `total_count` decimal(24, 6) NOT NULL COMMENT '合计数量',
  `total_price` decimal(24, 6) NOT NULL COMMENT '合计金额，单位：元',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件 URL',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 其它出库单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_out
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_out_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_out_item`;
CREATE TABLE `erp_stock_out_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '出库项编号',
  `out_id` bigint(20) NOT NULL COMMENT '出库编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `product_unit_id` bigint(20) NOT NULL COMMENT '产品单位编号',
  `product_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '产品单价',
  `count` decimal(24, 6) NOT NULL COMMENT '产品数量',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额，单位：元',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 其它出库单项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_out_item
-- ----------------------------

-- ----------------------------
-- Table structure for erp_stock_record
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_record`;
CREATE TABLE `erp_stock_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `product_id` bigint(20) NOT NULL COMMENT '产品编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库编号',
  `count` decimal(24, 6) NOT NULL COMMENT '出入库数量',
  `total_count` decimal(24, 6) NOT NULL COMMENT '总库存量',
  `biz_type` tinyint(4) NOT NULL COMMENT '业务类型',
  `biz_id` bigint(20) NOT NULL COMMENT '业务编号',
  `biz_item_id` bigint(20) NOT NULL COMMENT '业务项编号',
  `biz_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务单号',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 产品库存明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_stock_record
-- ----------------------------

-- ----------------------------
-- Table structure for erp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `erp_supplier`;
CREATE TABLE `erp_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供应商名称',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '传真',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `sort` int(11) NOT NULL COMMENT '排序',
  `tax_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_percent` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率',
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户账号',
  `bank_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户地址',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785152245472444419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 供应商表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_supplier
-- ----------------------------
INSERT INTO `erp_supplier` VALUES (1785145655914733569, '1', '1', '1', '1', '1', '1', '1', 0, 1, '1', 1.000000, '1', '1', '1', 103, '2024-04-30 11:14:25', 1, '2024-04-30 11:14:25', 1, '000000', 2);
INSERT INTO `erp_supplier` VALUES (1785149784049393666, '延旭商务有限公司', '小侯', '13311984809', '68600004', '123456@qq.com', '123456', 'zzz', 0, 2, 'z', 3.000000, 'zzz', 'zzz', 'zzz', 103, '2024-04-30 11:30:50', 1, '2024-12-01 22:18:30', 1, '000000', 0);
INSERT INTO `erp_supplier` VALUES (1785152245472444418, '小可爱有限公司', '小可啊', '13311948582', '13311948582', '13311948582', '13311948582', '13311948582', 0, 1, '13311948582', 2.000000, '13311948582', '13311948582', '13311948582', 103, '2024-04-30 11:40:37', 1, '2024-12-01 22:15:33', 1, '000000', 0);

-- ----------------------------
-- Table structure for erp_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `erp_warehouse`;
CREATE TABLE `erp_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仓库编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `principal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `warehouse_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '仓储费，单位：元',
  `truckage_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '搬运费，单位：元',
  `status` tinyint(4) NOT NULL COMMENT '开启状态',
  `default_status` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1857670911732260867 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ERP 仓库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_warehouse
-- ----------------------------
INSERT INTO `erp_warehouse` VALUES (1783046059622666242, '上海仓', '上海市', 1, '上海', '小侯', 1.000000, 2.000000, 0, 1, 103, '2024-04-24 16:11:23', 1, '2024-12-27 12:23:24', 1, '000000', 0);
INSERT INTO `erp_warehouse` VALUES (1857670911732260866, '北京仓', '北京', 2, '北京', '小侯', 1.000000, 2.000000, 0, 0, 103, '2024-11-16 14:23:54', 1, '2024-12-27 12:23:37', 1, '000000', 0);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1870326480934817794, 'master', 'erp_purchase_in', 'ERP 采购入库表', '', '', 'ErpPurchaseIn', 'crud', 'com.haitang.erp', 'erp', 'purchaseIn', 'ERP 采购入库', 'hhhbx', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1783408024530452481\"}', 103, 1, '2024-04-15 16:17:18', 1, '2024-12-21 12:38:13', NULL);
INSERT INTO `gen_table` VALUES (1870326481794650113, 'master', 'erp_purchase_in_items', 'ERP 销售入库项表', NULL, NULL, 'ErpPurchaseInItems', 'crud', 'com.haitang.erp', 'erp', 'purchaseInItems', 'ERP 销售入库项', 'hhhbx', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1783408024530452481\"}', 103, 1, '2024-04-15 16:17:18', 1, '2024-12-21 12:39:08', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1870326481337470978, 1870326480934817794, 'id', '编号', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579842, 1870326480934817794, 'no', '采购入库编号', 'varchar(255)', 'String', 'no', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579843, 1870326480934817794, 'status', '采购状态', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579844, 1870326480934817794, 'supplier_id', '供应商编号', 'bigint', 'Long', 'supplierId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579845, 1870326480934817794, 'account_id', '结算账户编号', 'bigint', 'Long', 'accountId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579846, 1870326480934817794, 'in_time', '入库时间', 'datetime', 'Date', 'inTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579847, 1870326480934817794, 'order_id', '采购订单编号', 'bigint', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579848, 1870326480934817794, 'order_no', '采购订单号', 'varchar(255)', 'String', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579849, 1870326480934817794, 'total_count', '合计数量', 'decimal(24,6)', 'BigDecimal', 'totalCount', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 9, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579850, 1870326480934817794, 'total_price', '合计价格，单位：元', 'decimal(24,6)', 'BigDecimal', 'totalPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 10, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579851, 1870326480934817794, 'payment_price', '已付款金额，单位：元', 'decimal(24,6)', 'BigDecimal', 'paymentPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 11, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579852, 1870326480934817794, 'total_product_price', '合计产品价格，单位：元', 'decimal(24,6)', 'BigDecimal', 'totalProductPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 12, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579853, 1870326480934817794, 'total_tax_price', '合计税额，单位：元', 'decimal(24,6)', 'BigDecimal', 'totalTaxPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 13, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579854, 1870326480934817794, 'discount_percent', '优惠率，百分比', 'decimal(24,6)', 'BigDecimal', 'discountPercent', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 14, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579855, 1870326480934817794, 'discount_price', '优惠金额，单位：元', 'decimal(24,6)', 'BigDecimal', 'discountPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 15, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579856, 1870326480934817794, 'other_price', '其它金额，单位：元', 'decimal(24,6)', 'BigDecimal', 'otherPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 16, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579857, 1870326480934817794, 'file_url', '附件地址', 'varchar(512)', 'String', 'fileUrl', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'textarea', '', 17, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579858, 1870326480934817794, 'remark', '备注', 'varchar(1024)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579859, 1870326480934817794, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579860, 1870326480934817794, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 20, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579861, 1870326480934817794, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, '1', NULL, 'EQ', 'input', '', 21, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579862, 1870326480934817794, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 22, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579863, 1870326480934817794, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, '1', NULL, 'EQ', 'input', '', 23, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579864, 1870326480934817794, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481404579865, 1870326480934817794, 'del_flag', '删除标志', 'int', 'Long', 'delFlag', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:38:14');
INSERT INTO `gen_table_column` VALUES (1870326481991782402, 1870326481794650113, 'id', '编号', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:08');
INSERT INTO `gen_table_column` VALUES (1870326481991782403, 1870326481794650113, 'in_id', '采购入库编号', 'bigint', 'Long', 'inId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:08');
INSERT INTO `gen_table_column` VALUES (1870326481991782404, 1870326481794650113, 'order_item_id', '采购订单项编号', 'bigint', 'Long', 'orderItemId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:08');
INSERT INTO `gen_table_column` VALUES (1870326481991782405, 1870326481794650113, 'warehouse_id', '仓库编号', 'bigint', 'Long', 'warehouseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782406, 1870326481794650113, 'product_id', '产品编号', 'bigint', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782407, 1870326481794650113, 'product_unit_id', '产品单位单位', 'bigint', 'Long', 'productUnitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782408, 1870326481794650113, 'product_price', '产品单价', 'decimal(24,6)', 'BigDecimal', 'productPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782409, 1870326481794650113, 'count', '数量', 'decimal(24,6)', 'BigDecimal', 'count', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782410, 1870326481794650113, 'total_price', '总价', 'decimal(24,6)', 'BigDecimal', 'totalPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782411, 1870326481794650113, 'tax_percent', '税率，百分比', 'decimal(24,6)', 'BigDecimal', 'taxPercent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782412, 1870326481794650113, 'tax_price', '税额，单位：元', 'decimal(24,6)', 'BigDecimal', 'taxPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782413, 1870326481794650113, 'remark', '备注', 'varchar(1024)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782414, 1870326481794650113, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782415, 1870326481794650113, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782416, 1870326481794650113, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782417, 1870326481794650113, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782418, 1870326481794650113, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:09');
INSERT INTO `gen_table_column` VALUES (1870326481991782419, 1870326481794650113, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:10');
INSERT INTO `gen_table_column` VALUES (1870326481991782420, 1870326481794650113, 'del_flag', '删除标志', 'int', 'Long', 'delFlag', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 103, 1, '2024-12-21 12:32:37', 1, '2024-12-21 12:39:10');

-- ----------------------------
-- Table structure for pj_app_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_app_info`;
CREATE TABLE `pj_app_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `current_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_app_info`(`app_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_app_info
-- ----------------------------
INSERT INTO `pj_app_info` VALUES (1, 'ruoyi-worker', '127.0.0.1:10010', '2023-06-13 16:32:59.263000', '2023-07-04 17:25:49.798000', '123456');

-- ----------------------------
-- Table structure for pj_container_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_container_info`;
CREATE TABLE `pj_container_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NULL DEFAULT NULL,
  `container_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `last_deploy_time` datetime(6) NULL DEFAULT NULL,
  `source_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source_type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_container_info`(`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_container_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_instance_info`;
CREATE TABLE `pj_instance_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint(20) NULL DEFAULT NULL,
  `app_id` bigint(20) NULL DEFAULT NULL,
  `expected_trigger_time` bigint(20) NULL DEFAULT NULL,
  `finished_time` bigint(20) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `instance_id` bigint(20) NULL DEFAULT NULL,
  `instance_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_report_time` bigint(20) NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `running_times` bigint(20) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `task_tracker_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `wf_instance_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_instance_info`(`job_id`, `status`) USING BTREE,
  INDEX `idx02_instance_info`(`app_id`, `status`) USING BTREE,
  INDEX `idx03_instance_info`(`instance_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_job_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_job_info`;
CREATE TABLE `pj_job_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alarm_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_id` bigint(20) NULL DEFAULT NULL,
  `concurrency` int(11) NULL DEFAULT NULL,
  `designated_workers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dispatch_strategy` int(11) NULL DEFAULT NULL,
  `execute_type` int(11) NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `instance_retry_num` int(11) NULL DEFAULT NULL,
  `instance_time_limit` bigint(20) NULL DEFAULT NULL,
  `job_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `log_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `max_instance_num` int(11) NULL DEFAULT NULL,
  `max_worker_count` int(11) NULL DEFAULT NULL,
  `min_cpu_cores` double NOT NULL,
  `min_disk_space` double NOT NULL,
  `min_memory_space` double NOT NULL,
  `next_trigger_time` bigint(20) NULL DEFAULT NULL,
  `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `processor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `processor_type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_retry_num` int(11) NULL DEFAULT NULL,
  `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_expression_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_job_info`(`app_id`, `status`, `time_expression_type`, `next_trigger_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_job_info
-- ----------------------------
INSERT INTO `pj_job_info` VALUES (1, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 2, 1, NULL, '2023-06-02 15:01:27.717000', '2023-07-04 17:22:12.374000', 1, 0, '', '单机处理器执行测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.StandaloneProcessorDemo', 1, 2, NULL, 1, '30000', 3);
INSERT INTO `pj_job_info` VALUES (2, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 2, NULL, '2023-06-02 15:04:45.342000', '2023-07-04 17:22:12.816000', 0, 0, NULL, '广播处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.BroadcastProcessorDemo', 1, 2, NULL, 1, '30000', 3);
INSERT INTO `pj_job_info` VALUES (3, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 4, NULL, '2023-06-02 15:13:23.519000', '2023-06-02 16:03:22.421000', 0, 0, NULL, 'Map处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.MapProcessorDemo', 1, 2, NULL, 1, '1000', 3);
INSERT INTO `pj_job_info` VALUES (4, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 3, NULL, '2023-06-02 15:45:25.896000', '2023-06-02 16:03:23.125000', 0, 0, NULL, 'MapReduce处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.MapReduceProcessorDemo', 1, 2, NULL, 1, '1000', 3);

-- ----------------------------
-- Table structure for pj_oms_lock
-- ----------------------------
DROP TABLE IF EXISTS `pj_oms_lock`;
CREATE TABLE `pj_oms_lock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `lock_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `max_lock_time` bigint(20) NULL DEFAULT NULL,
  `ownerip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_oms_lock`(`lock_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_oms_lock
-- ----------------------------

-- ----------------------------
-- Table structure for pj_server_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_server_info`;
CREATE TABLE `pj_server_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_server_info`(`ip`) USING BTREE,
  INDEX `idx01_server_info`(`gmt_modified`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_server_info
-- ----------------------------
INSERT INTO `pj_server_info` VALUES (2, '2024-04-15 11:16:28.310000', '2024-04-17 16:39:29.422000', '192.168.145.2');

-- ----------------------------
-- Table structure for pj_user_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_user_info`;
CREATE TABLE `pj_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_hook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uidx01_user_info`(`username`) USING BTREE,
  INDEX `uidx02_user_info`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_info`;
CREATE TABLE `pj_workflow_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `max_wf_instance_num` int(11) NULL DEFAULT NULL,
  `next_trigger_time` bigint(20) NULL DEFAULT NULL,
  `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pedag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` int(11) NULL DEFAULT NULL,
  `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_expression_type` int(11) NULL DEFAULT NULL,
  `wf_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wf_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_workflow_info`(`app_id`, `status`, `time_expression_type`, `next_trigger_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_instance_info`;
CREATE TABLE `pj_workflow_instance_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint(20) NULL DEFAULT NULL,
  `app_id` bigint(20) NULL DEFAULT NULL,
  `dag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `expected_trigger_time` bigint(20) NULL DEFAULT NULL,
  `finished_time` bigint(20) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `parent_wf_instance_id` bigint(20) NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` int(11) NULL DEFAULT NULL,
  `wf_context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `wf_init_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `wf_instance_id` bigint(20) NULL DEFAULT NULL,
  `workflow_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_wf_instance`(`wf_instance_id`) USING BTREE,
  INDEX `idx01_wf_instance`(`workflow_id`, `status`, `app_id`, `expected_trigger_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_node_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_node_info`;
CREATE TABLE `pj_workflow_node_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL,
  `enable` bit(1) NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `node_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `skip_when_failed` bit(1) NOT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `workflow_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_workflow_node_info`(`workflow_id`, `gmt_create`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_node_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_client`;
CREATE TABLE `sys_client`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int(11) NULL DEFAULT 1800 COMMENT 'token活跃超时时间',
  `timeout` int(11) NULL DEFAULT 604800 COMMENT 'token固定超时',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_client
-- ----------------------------
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, '0', '0', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01');
INSERT INTO `sys_client` VALUES (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 1800, 604800, '0', '0', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(20) NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '000000', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '000000', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '000000', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (5, '000000', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, '000000', 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, 'true:开启, false:关闭');
INSERT INTO `sys_config` VALUES (1785507668025200641, '397530', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (1785507668025200642, '397530', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (1785507668025200643, '397530', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (1785507668025200644, '397530', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (1785507668025200645, '397530', 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` bigint(20) NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, '000000', 0, '0', 'XXX科技', 0, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, '000000', 100, '0,100', '深圳总公司', 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (102, '000000', 100, '0,100', '长沙分公司', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, '000000', 101, '0,100,101', '研发部门', 1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, '000000', 101, '0,100,101', '市场部门', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, '000000', 101, '0,100,101', '测试部门', 3, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, '000000', 101, '0,100,101', '财务部门', 4, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, '000000', 101, '0,100,101', '运维部门', 5, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, '000000', 102, '0,100,102', '市场部门', 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, '000000', 102, '0,100,102', '财务部门', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1785507666913710081, '397530', 0, '0', '嘉实', 0, 1785507667375083521, NULL, NULL, '0', '0', 103, 1, '2024-05-01 11:12:56', 1, '2024-05-01 11:12:56');
INSERT INTO `sys_dept` VALUES (1785923412533735426, '000000', 103, '0,100,101,103', '研发小组', 1, NULL, NULL, NULL, '0', '0', 103, 1, '2024-05-02 14:44:57', 1, '2024-05-02 14:44:57');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, '000000', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '密码认证');
INSERT INTO `sys_dict_data` VALUES (31, '000000', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '短信认证');
INSERT INTO `sys_dict_data` VALUES (32, '000000', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '邮件认证');
INSERT INTO `sys_dict_data` VALUES (33, '000000', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '小程序认证');
INSERT INTO `sys_dict_data` VALUES (34, '000000', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (35, '000000', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, 'PC');
INSERT INTO `sys_dict_data` VALUES (36, '000000', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '安卓');
INSERT INTO `sys_dict_data` VALUES (37, '000000', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, 'iOS');
INSERT INTO `sys_dict_data` VALUES (38, '000000', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '小程序');
INSERT INTO `sys_dict_data` VALUES (1785507667895177217, '397530', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (1785507667895177218, '397530', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (1785507667895177219, '397530', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (1785507667895177220, '397530', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (1785507667895177221, '397530', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (1785507667895177222, '397530', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177223, '397530', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177224, '397530', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (1785507667895177225, '397530', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (1785507667895177226, '397530', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '通知');
INSERT INTO `sys_dict_data` VALUES (1785507667895177227, '397530', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '公告');
INSERT INTO `sys_dict_data` VALUES (1785507667895177228, '397530', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177229, '397530', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177230, '397530', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177231, '397530', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177232, '397530', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177233, '397530', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177234, '397530', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177235, '397530', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177236, '397530', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177237, '397530', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177238, '397530', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177239, '397530', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177240, '397530', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (1785507667895177241, '397530', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '其他操作');
INSERT INTO `sys_dict_data` VALUES (1785507667895177242, '397530', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '密码认证');
INSERT INTO `sys_dict_data` VALUES (1785507667895177243, '397530', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '短信认证');
INSERT INTO `sys_dict_data` VALUES (1785507667895177244, '397530', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '邮件认证');
INSERT INTO `sys_dict_data` VALUES (1785507667895177245, '397530', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '小程序认证');
INSERT INTO `sys_dict_data` VALUES (1785507667895177246, '397530', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (1785507667895177247, '397530', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', 'PC');
INSERT INTO `sys_dict_data` VALUES (1785507667895177248, '397530', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '安卓');
INSERT INTO `sys_dict_data` VALUES (1785507667895177249, '397530', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', 'iOS');
INSERT INTO `sys_dict_data` VALUES (1785507667895177250, '397530', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '小程序');
INSERT INTO `sys_dict_data` VALUES (1791304941736943617, '000000', 1, '已审核', '20', 'erp_audit_status', '', 'success', 'N', 103, 1, '2024-05-17 11:09:14', 1, '2024-05-17 11:09:14', '');
INSERT INTO `sys_dict_data` VALUES (1791305053238321154, '000000', 0, '未审核', '10', 'erp_audit_status', '', 'danger', 'N', 103, 1, '2024-05-17 11:09:40', 1, '2024-05-17 11:09:54', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `tenant_id`(`tenant_id`, `dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '000000', '用户性别', 'sys_user_sex', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '000000', '菜单状态', 'sys_show_hide', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '000000', '系统开关', 'sys_normal_disable', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '000000', '系统是否', 'sys_yes_no', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '000000', '通知类型', 'sys_notice_type', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '000000', '通知状态', 'sys_notice_status', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '000000', '操作类型', 'sys_oper_type', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '000000', '系统状态', 'sys_common_status', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '000000', '授权类型', 'sys_grant_type', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (12, '000000', '设备类型', 'sys_device_type', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (1785507667765153794, '397530', '用户性别', 'sys_user_sex', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153795, '397530', '菜单状态', 'sys_show_hide', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153796, '397530', '系统开关', 'sys_normal_disable', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153797, '397530', '系统是否', 'sys_yes_no', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153798, '397530', '通知类型', 'sys_notice_type', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153799, '397530', '通知状态', 'sys_notice_status', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153800, '397530', '操作类型', 'sys_oper_type', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153801, '397530', '系统状态', 'sys_common_status', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1785507667765153802, '397530', '授权类型', 'sys_grant_type', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (1785507667765153803, '397530', '设备类型', 'sys_device_type', 103, 1, '2024-04-15 11:15:00', 1, '2024-04-15 11:15:00', '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (1791304508142379009, '000000', 'ERP 审批状态', 'erp_audit_status', 103, 1, '2024-05-17 11:07:30', 1, '2024-05-17 11:07:30', '');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1786202325319213057, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-05-03 09:13:15');
INSERT INTO `sys_logininfor` VALUES (1786202346953433090, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-03 09:13:20');
INSERT INTO `sys_logininfor` VALUES (1786584783952855042, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 10:33:00');
INSERT INTO `sys_logininfor` VALUES (1786598429093314562, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 11:27:14');
INSERT INTO `sys_logininfor` VALUES (1786705698019655681, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 18:33:28');
INSERT INTO `sys_logininfor` VALUES (1786733099567026178, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 20:22:21');
INSERT INTO `sys_logininfor` VALUES (1786733196224761858, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-04 20:22:45');
INSERT INTO `sys_logininfor` VALUES (1786733219670921217, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 20:22:50');
INSERT INTO `sys_logininfor` VALUES (1786773502030794753, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-04 23:02:54');
INSERT INTO `sys_logininfor` VALUES (1787104713001406466, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-05 20:59:01');
INSERT INTO `sys_logininfor` VALUES (1790025417460080642, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-13 22:24:51');
INSERT INTO `sys_logininfor` VALUES (1790065916166275074, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 01:05:47');
INSERT INTO `sys_logininfor` VALUES (1790074684627222529, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 01:40:37');
INSERT INTO `sys_logininfor` VALUES (1790196998786252801, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-14 09:46:39');
INSERT INTO `sys_logininfor` VALUES (1790197021192224770, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 09:46:45');
INSERT INTO `sys_logininfor` VALUES (1790216628187693058, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 11:04:39');
INSERT INTO `sys_logininfor` VALUES (1790281524132708353, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 15:22:32');
INSERT INTO `sys_logininfor` VALUES (1791008580902608897, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-16 15:31:36');
INSERT INTO `sys_logininfor` VALUES (1791107462768648193, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-16 22:04:31');
INSERT INTO `sys_logininfor` VALUES (1791125269959004161, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-16 23:15:17');
INSERT INTO `sys_logininfor` VALUES (1791289187528413185, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-17 10:06:38');
INSERT INTO `sys_logininfor` VALUES (1791380038015377410, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-17 16:07:38');
INSERT INTO `sys_logininfor` VALUES (1791436526016651266, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-17 19:52:06');
INSERT INTO `sys_logininfor` VALUES (1791452132199751681, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-17 20:54:07');
INSERT INTO `sys_logininfor` VALUES (1806644042228899842, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-28 19:01:20');
INSERT INTO `sys_logininfor` VALUES (1806644069181497345, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-06-28 19:01:27');
INSERT INTO `sys_logininfor` VALUES (1806644506437689345, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-06-28 19:03:11');
INSERT INTO `sys_logininfor` VALUES (1812854070749278210, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-15 22:17:46');
INSERT INTO `sys_logininfor` VALUES (1813932641152475138, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-18 21:43:38');
INSERT INTO `sys_logininfor` VALUES (1813949347186941954, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-18 22:50:01');
INSERT INTO `sys_logininfor` VALUES (1814886718954913793, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-07-21 12:54:47');
INSERT INTO `sys_logininfor` VALUES (1829176595313659906, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-08-29 23:17:39');
INSERT INTO `sys_logininfor` VALUES (1829176616062881794, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-08-29 23:17:44');
INSERT INTO `sys_logininfor` VALUES (1857662091761065986, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-16 13:48:51');
INSERT INTO `sys_logininfor` VALUES (1857699175121068034, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-16 16:16:12');
INSERT INTO `sys_logininfor` VALUES (1859973549496766466, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-22 22:53:45');
INSERT INTO `sys_logininfor` VALUES (1860313832562397186, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-23 21:25:55');
INSERT INTO `sys_logininfor` VALUES (1860532141127929857, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-24 11:53:24');
INSERT INTO `sys_logininfor` VALUES (1860541984630947842, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-24 12:32:31');
INSERT INTO `sys_logininfor` VALUES (1860557386211733505, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-24 13:33:43');
INSERT INTO `sys_logininfor` VALUES (1860637542578216962, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-11-24 18:52:14');
INSERT INTO `sys_logininfor` VALUES (1863222560748036098, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-01 22:04:10');
INSERT INTO `sys_logininfor` VALUES (1863472711060250625, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-12-02 14:38:11');
INSERT INTO `sys_logininfor` VALUES (1863472737647943681, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-02 14:38:17');
INSERT INTO `sys_logininfor` VALUES (1863549880713175042, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-02 19:44:49');
INSERT INTO `sys_logininfor` VALUES (1863574859936755713, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-02 21:24:05');
INSERT INTO `sys_logininfor` VALUES (1863737671539564545, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 08:11:02');
INSERT INTO `sys_logininfor` VALUES (1863737691265376257, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 08:11:07');
INSERT INTO `sys_logininfor` VALUES (1863747890973843457, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 08:51:39');
INSERT INTO `sys_logininfor` VALUES (1863777239752089602, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 10:48:16');
INSERT INTO `sys_logininfor` VALUES (1863800738877046785, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 12:21:39');
INSERT INTO `sys_logininfor` VALUES (1863832265052667905, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 14:26:55');
INSERT INTO `sys_logininfor` VALUES (1863904562279153666, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 19:14:12');
INSERT INTO `sys_logininfor` VALUES (1863919187007664129, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 20:12:19');
INSERT INTO `sys_logininfor` VALUES (1863973966299877378, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-03 23:49:59');
INSERT INTO `sys_logininfor` VALUES (1864116652713472002, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-12-04 09:16:58');
INSERT INTO `sys_logininfor` VALUES (1864116669461327874, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 09:17:02');
INSERT INTO `sys_logininfor` VALUES (1864122036559835138, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 09:38:22');
INSERT INTO `sys_logininfor` VALUES (1864139404526776321, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-12-04 10:47:23');
INSERT INTO `sys_logininfor` VALUES (1864148505319206914, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 11:23:33');
INSERT INTO `sys_logininfor` VALUES (1864167098190729218, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 12:37:25');
INSERT INTO `sys_logininfor` VALUES (1864196764842643457, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 14:35:18');
INSERT INTO `sys_logininfor` VALUES (1864220541567664130, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 16:09:47');
INSERT INTO `sys_logininfor` VALUES (1864266139230556162, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 19:10:59');
INSERT INTO `sys_logininfor` VALUES (1864285626474450945, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-04 20:28:25');
INSERT INTO `sys_logininfor` VALUES (1864631876839321601, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-05 19:24:17');
INSERT INTO `sys_logininfor` VALUES (1864907219168944129, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-06 13:38:24');
INSERT INTO `sys_logininfor` VALUES (1866862150373408769, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-11 23:06:36');
INSERT INTO `sys_logininfor` VALUES (1867059601361383426, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-12-12 12:11:12');
INSERT INTO `sys_logininfor` VALUES (1867059657497948162, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-12-12 12:11:25');
INSERT INTO `sys_logininfor` VALUES (1867059706898460673, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-12 12:11:37');
INSERT INTO `sys_logininfor` VALUES (1868541433978327041, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-16 14:19:28');
INSERT INTO `sys_logininfor` VALUES (1868559412698845186, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-12-16 15:30:55');
INSERT INTO `sys_logininfor` VALUES (1868559434697969666, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-16 15:31:00');
INSERT INTO `sys_logininfor` VALUES (1868567132009172993, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-16 16:01:35');
INSERT INTO `sys_logininfor` VALUES (1868889515244949506, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 13:22:37');
INSERT INTO `sys_logininfor` VALUES (1868922849656344578, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 15:35:05');
INSERT INTO `sys_logininfor` VALUES (1868981010438344706, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 19:26:12');
INSERT INTO `sys_logininfor` VALUES (1869005999321436162, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 21:05:29');
INSERT INTO `sys_logininfor` VALUES (1869013029687959554, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 21:33:26');
INSERT INTO `sys_logininfor` VALUES (1869013048511995906, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-12-17 21:33:30');
INSERT INTO `sys_logininfor` VALUES (1869025476767404033, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-17 22:22:53');
INSERT INTO `sys_logininfor` VALUES (1869176460810440706, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-18 08:22:51');
INSERT INTO `sys_logininfor` VALUES (1869750401568382978, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-19 22:23:29');
INSERT INTO `sys_logininfor` VALUES (1869954849276243969, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-20 11:55:53');
INSERT INTO `sys_logininfor` VALUES (1869965101845479426, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-20 12:36:37');
INSERT INTO `sys_logininfor` VALUES (1870014243527495681, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-20 15:51:53');
INSERT INTO `sys_logininfor` VALUES (1870044334923980801, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-20 17:51:28');
INSERT INTO `sys_logininfor` VALUES (1870111480785944577, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-20 22:18:17');
INSERT INTO `sys_logininfor` VALUES (1870307946888441858, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-21 11:18:58');
INSERT INTO `sys_logininfor` VALUES (1870308596577742850, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-12-21 11:21:33');
INSERT INTO `sys_logininfor` VALUES (1870308943069196289, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-21 11:22:55');
INSERT INTO `sys_logininfor` VALUES (1870324025018920962, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-21 12:22:51');
INSERT INTO `sys_logininfor` VALUES (1870329158251335682, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-12-21 12:43:15');
INSERT INTO `sys_logininfor` VALUES (1870329173636042753, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-21 12:43:19');
INSERT INTO `sys_logininfor` VALUES (1870361262435631105, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-12-21 14:50:49');
INSERT INTO `sys_logininfor` VALUES (1870361320883257346, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-21 14:51:03');
INSERT INTO `sys_logininfor` VALUES (1872494662583881730, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-27 12:08:11');
INSERT INTO `sys_logininfor` VALUES (1872498411159171073, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-27 12:23:05');
INSERT INTO `sys_logininfor` VALUES (1872592210304724994, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-27 18:35:49');
INSERT INTO `sys_logininfor` VALUES (1872835842890797057, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-28 10:43:55');
INSERT INTO `sys_logininfor` VALUES (1872853507831304193, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-28 11:54:07');
INSERT INTO `sys_logininfor` VALUES (1872882057728823297, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-28 13:47:34');
INSERT INTO `sys_logininfor` VALUES (1872949641740316674, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-12-28 18:16:07');
INSERT INTO `sys_logininfor` VALUES (1877001941727346690, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-01-08 22:38:31');
INSERT INTO `sys_logininfor` VALUES (1877214127733133313, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-01-09 12:41:40');
INSERT INTO `sys_logininfor` VALUES (1899117596194656258, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-03-10 23:18:13');
INSERT INTO `sys_logininfor` VALUES (1899283403658776578, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-03-11 10:17:05');
INSERT INTO `sys_logininfor` VALUES (1899303567833976834, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-03-11 11:37:13');
INSERT INTO `sys_logininfor` VALUES (1899668891968229377, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-03-12 11:48:53');
INSERT INTO `sys_logininfor` VALUES (1899743549329559553, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-03-12 16:45:32');
INSERT INTO `sys_logininfor` VALUES (1949372813406134273, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-07-27 15:34:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 5, 'https://gitee.com/dromara/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 103, 1, '2024-04-15 11:14:59', NULL, NULL, 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (6, '租户管理', 0, 2, 'tenant', NULL, '', 1, 0, 'M', '0', '0', '', 'chart', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '租户管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 103, 1, '2024-04-15 11:14:59', NULL, NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'powerjob', 'monitor/powerjob/index', '', 1, 0, 'C', '0', '0', 'monitor:powerjob:list', 'job', 103, 1, '2024-04-15 11:14:59', NULL, NULL, 'PowerJob控制台菜单');
INSERT INTO `sys_menu` VALUES (121, '租户管理', 6, 1, 'tenant', 'system/tenant/index', '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'list', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '租户管理菜单');
INSERT INTO `sys_menu` VALUES (122, '租户套餐管理', 6, 2, 'tenantPackage', 'system/tenantPackage/index', '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list', 'form', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '租户套餐管理菜单');
INSERT INTO `sys_menu` VALUES (123, '客户端管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '0', '0', 'system:client:list', 'international', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '客户端管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '客户端管理查询', 123, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '客户端管理新增', 123, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '客户端管理修改', 123, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '客户端管理删除', 123, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '客户端管理导出', 123, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', NULL, 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', NULL, 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 103, 1, '2024-04-15 11:15:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1606, '租户查询', 121, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1607, '租户新增', 121, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1608, '租户修改', 121, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1609, '租户删除', 121, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1610, '租户导出', 121, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1611, '租户套餐查询', 122, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1612, '租户套餐新增', 122, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1613, '租户套餐修改', 122, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1614, '租户套餐删除', 122, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1615, '租户套餐导出', 122, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1620, '配置列表', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1621, '配置添加', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1622, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1623, '配置删除', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1780073069121400834, '销售管理', 0, 6, 'sale', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 103, 1, '2024-04-16 11:17:46', 1, '2024-04-16 16:08:15', '');
INSERT INTO `sys_menu` VALUES (1780074254654009345, '客户信息', 1780073069121400834, 1, 'customer', 'erp/sale/customer/index', NULL, 1, 0, 'C', '0', '0', 'erp:customer:list', 'peoples', 103, 1, '2024-04-16 15:45:20', 1, '2024-04-16 16:06:39', '客户信息菜单');
INSERT INTO `sys_menu` VALUES (1780074254654009346, '客户信息查询', 1780074254654009345, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:customer:query', '#', 103, 1, '2024-04-16 15:45:20', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1780074254654009347, '客户信息新增', 1780074254654009345, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:customer:add', '#', 103, 1, '2024-04-16 15:45:20', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1780074254654009348, '客户信息修改', 1780074254654009345, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:customer:edit', '#', 103, 1, '2024-04-16 15:45:20', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1780074254654009349, '客户信息删除', 1780074254654009345, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:customer:remove', '#', 103, 1, '2024-04-16 15:45:20', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1780074254654009350, '客户信息导出', 1780074254654009345, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:customer:export', '#', 103, 1, '2024-04-16 15:45:20', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1781677873323646977, '库存管理', 0, 7, 'stock', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'list', 103, 1, '2024-04-20 21:34:42', 1, '2024-04-20 21:35:01', '');
INSERT INTO `sys_menu` VALUES (1781679122458681346, '仓库信息', 1781677873323646977, 1, 'warehouse', 'erp/stock/warehouse/index', NULL, 1, 0, 'C', '0', '0', 'erp:warehouse:list', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:43:49', '仓库信息菜单');
INSERT INTO `sys_menu` VALUES (1781679122458681347, '仓库信息查询', 1781679122458681346, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:warehouse:query', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:44:05', '');
INSERT INTO `sys_menu` VALUES (1781679122458681348, '仓库信息新增', 1781679122458681346, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:warehouse:add', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:44:16', '');
INSERT INTO `sys_menu` VALUES (1781679122458681349, '仓库信息修改', 1781679122458681346, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:warehouse:edit', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:44:25', '');
INSERT INTO `sys_menu` VALUES (1781679122458681350, '仓库信息删除', 1781679122458681346, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:warehouse:remove', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:44:33', '');
INSERT INTO `sys_menu` VALUES (1781679122458681351, '仓库信息导出', 1781679122458681346, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:warehouse:export', '#', 103, 1, '2024-04-20 21:41:16', 1, '2024-04-20 21:44:41', '');
INSERT INTO `sys_menu` VALUES (1783408024530452481, '采购管理', 0, 8, 'purchase', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'table', 103, 1, '2024-04-25 16:09:42', 1, '2024-04-25 16:09:59', '');
INSERT INTO `sys_menu` VALUES (1785140147518492673, '供应商信息', 1783408024530452481, 2, 'supplier', 'erp/purchase/supplier/index', NULL, 1, 0, 'C', '0', '0', 'erp:supplier:list', 'peoples', 103, 1, '2024-04-30 10:57:52', 1, '2024-05-13 23:00:16', '供应商信息菜单');
INSERT INTO `sys_menu` VALUES (1785140147518492674, '供应商信息查询', 1785140147518492673, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:supplier:query', '#', 103, 1, '2024-04-30 10:57:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1785140147518492675, '供应商信息新增', 1785140147518492673, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:supplier:add', '#', 103, 1, '2024-04-30 10:57:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1785140147518492676, '供应商信息修改', 1785140147518492673, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:supplier:edit', '#', 103, 1, '2024-04-30 10:57:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1785140147518492677, '供应商信息删除', 1785140147518492673, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:supplier:remove', '#', 103, 1, '2024-04-30 10:57:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1785140147518492678, '供应商信息导出', 1785140147518492673, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:supplier:export', '#', 103, 1, '2024-04-30 10:57:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1785165780017496066, '产品管理', 0, 9, 'product', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'build', 103, 1, '2024-04-30 12:34:23', 1, '2024-04-30 12:34:45', '');
INSERT INTO `sys_menu` VALUES (1785167453263773698, '产品分类', 1785165780017496066, 2, 'product-category', 'erp/product/category/index', NULL, 1, 0, 'C', '0', '0', 'erp:category:list', 'build', 103, 1, '2024-04-30 17:21:03', 1, '2024-05-02 21:10:32', '产品分类菜单');
INSERT INTO `sys_menu` VALUES (1785167453263773699, '产品分类查询', 1785167453263773698, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:category:query', '#', 103, 1, '2024-04-30 17:21:03', 1, '2024-04-30 17:26:25', '');
INSERT INTO `sys_menu` VALUES (1785167453263773700, '产品分类新增', 1785167453263773698, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:category:add', '#', 103, 1, '2024-04-30 17:21:03', 1, '2024-04-30 17:26:32', '');
INSERT INTO `sys_menu` VALUES (1785167453263773701, '产品分类修改', 1785167453263773698, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:category:edit', '#', 103, 1, '2024-04-30 17:21:03', 1, '2024-04-30 17:26:39', '');
INSERT INTO `sys_menu` VALUES (1785167453263773702, '产品分类删除', 1785167453263773698, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:category:remove', '#', 103, 1, '2024-04-30 17:21:03', 1, '2024-04-30 17:26:46', '');
INSERT INTO `sys_menu` VALUES (1785167453263773703, '产品分类导出', 1785167453263773698, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:category:export', '#', 103, 1, '2024-04-30 17:21:03', 1, '2024-04-30 17:26:53', '');
INSERT INTO `sys_menu` VALUES (1785168145340710914, '产品单位', 1785165780017496066, 3, 'unit', 'erp/product/unit/index', NULL, 1, 1, 'C', '0', '0', 'erp:unit:list', 'input', 103, 1, '2024-04-30 12:46:22', 1, '2024-05-02 21:10:38', '产品单位菜单');
INSERT INTO `sys_menu` VALUES (1785168145340710915, '产品单位查询', 1785168145340710914, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:unit:query', '#', 103, 1, '2024-04-30 12:46:22', 1, '2024-04-30 17:27:03', '');
INSERT INTO `sys_menu` VALUES (1785168145340710916, '产品单位新增', 1785168145340710914, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:unit:add', '#', 103, 1, '2024-04-30 12:46:22', 1, '2024-04-30 17:27:11', '');
INSERT INTO `sys_menu` VALUES (1785168145340710917, '产品单位修改', 1785168145340710914, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:unit:edit', '#', 103, 1, '2024-04-30 12:46:22', 1, '2024-04-30 17:27:18', '');
INSERT INTO `sys_menu` VALUES (1785168145340710918, '产品单位删除', 1785168145340710914, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:unit:remove', '#', 103, 1, '2024-04-30 12:46:22', 1, '2024-04-30 17:27:26', '');
INSERT INTO `sys_menu` VALUES (1785168145340710919, '产品单位导出', 1785168145340710914, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:unit:export', '#', 103, 1, '2024-04-30 12:46:22', 1, '2024-04-30 17:27:32', '');
INSERT INTO `sys_menu` VALUES (1786019097971011585, '产品信息', 1785165780017496066, 1, 'product', 'erp/product/product/index', NULL, 1, 0, 'C', '0', '0', 'erp:product:list', 'clipboard', 103, 1, '2024-05-02 21:10:04', 1, '2024-05-02 21:11:16', '产品信息菜单');
INSERT INTO `sys_menu` VALUES (1786019097971011586, '产品信息查询', 1786019097971011585, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:product:query', '#', 103, 1, '2024-05-02 21:10:04', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1786019097971011587, '产品信息新增', 1786019097971011585, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:product:add', '#', 103, 1, '2024-05-02 21:10:04', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1786019097971011588, '产品信息修改', 1786019097971011585, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:product:edit', '#', 103, 1, '2024-05-02 21:10:04', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1786019097971011589, '产品信息删除', 1786019097971011585, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:product:remove', '#', 103, 1, '2024-05-02 21:10:04', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1786019097971011590, '产品信息导出', 1786019097971011585, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:product:export', '#', 103, 1, '2024-05-02 21:10:04', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1790033641609420802, '采购订单', 1783408024530452481, 1, 'order', 'erp/purchase/order/index', NULL, 1, 0, 'C', '0', '0', 'erp:purchaseorder:list', 'redis-list', 103, 1, '2024-05-13 22:59:28', 1, '2024-05-13 23:01:19', '采购订单菜单');
INSERT INTO `sys_menu` VALUES (1790033641609420803, '采购订单查询', 1790033641609420802, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseorder:query', '#', 103, 1, '2024-05-13 22:59:28', 1, '2024-05-13 23:01:29', '');
INSERT INTO `sys_menu` VALUES (1790033641609420804, '采购订单新增', 1790033641609420802, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseorder:add', '#', 103, 1, '2024-05-13 22:59:28', 1, '2024-05-13 23:01:35', '');
INSERT INTO `sys_menu` VALUES (1790033641609420805, '采购订单修改', 1790033641609420802, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseorder:edit', '#', 103, 1, '2024-05-13 22:59:28', 1, '2024-05-13 23:01:42', '');
INSERT INTO `sys_menu` VALUES (1790033641609420806, '采购订单删除', 1790033641609420802, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseorder:remove', '#', 103, 1, '2024-05-13 22:59:28', 1, '2024-05-13 23:01:48', '');
INSERT INTO `sys_menu` VALUES (1790033641609420807, '采购订单导出', 1790033641609420802, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseOrder:export', '#', 103, 1, '2024-05-13 22:59:28', 1, '2024-12-21 11:25:42', '');
INSERT INTO `sys_menu` VALUES (1863579538238259201, '财务管理', 0, 10, 'finance', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'excel', 103, 1, '2024-12-02 21:42:40', 1, '2024-12-02 21:42:40', '');
INSERT INTO `sys_menu` VALUES (1863580385965817858, '结算账户', 1863579538238259201, 1, 'account', 'erp/finance/account/index', NULL, 1, 0, 'C', '0', '0', 'erp:account:list', 'documentation', 103, 1, '2024-12-02 21:46:02', 1, '2024-12-03 11:11:22', '');
INSERT INTO `sys_menu` VALUES (1863750480096731138, '付款单', 1863579538238259201, 1, 'payment', 'erp/finance/payment/index', NULL, 1, 0, 'C', '0', '0', 'erp:payment:list', 'documentation', 103, 1, '2024-12-03 09:01:56', 1, '2024-12-03 09:01:56', '');
INSERT INTO `sys_menu` VALUES (1863751722801897473, '收款单', 1863579538238259201, 1, 'receipt', 'erp/finance/receipt/index', NULL, 1, 0, 'C', '0', '0', 'erp:receipt:list', 'icon', 103, 1, '2024-12-03 09:06:52', 1, '2024-12-03 09:06:52', '');
INSERT INTO `sys_menu` VALUES (1863752078181081090, '结算账户查询', 1863580385965817858, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:account:query', '', 103, 1, '2024-12-03 09:08:17', 1, '2024-12-03 09:08:17', '');
INSERT INTO `sys_menu` VALUES (1863752285643939841, '结算账户创建', 1863580385965817858, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:account:create', '', 103, 1, '2024-12-03 09:09:06', 1, '2024-12-03 09:12:27', '');
INSERT INTO `sys_menu` VALUES (1863752500945952769, '结算账户更新', 1863580385965817858, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:account:update', '', 103, 1, '2024-12-03 09:09:58', 1, '2024-12-03 09:09:58', '');
INSERT INTO `sys_menu` VALUES (1863752561125826561, '结算账户删除', 1863580385965817858, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:account:delete', '', 103, 1, '2024-12-03 09:10:12', 1, '2024-12-03 09:10:12', '');
INSERT INTO `sys_menu` VALUES (1863752783876923393, '结算账户导出', 1863580385965817858, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:account:export', '', 103, 1, '2024-12-03 09:11:05', 1, '2024-12-03 09:11:05', '');
INSERT INTO `sys_menu` VALUES (1863753340582699010, '付款单查询', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:query', '', 103, 1, '2024-12-03 09:13:18', 1, '2024-12-03 09:13:18', '');
INSERT INTO `sys_menu` VALUES (1863753487593054209, '付款单创建', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:create', '', 103, 1, '2024-12-03 09:13:53', 1, '2024-12-03 09:13:53', '');
INSERT INTO `sys_menu` VALUES (1863753775259394050, '付款单更新', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:update', '', 103, 1, '2024-12-03 09:15:02', 1, '2024-12-03 09:15:02', '');
INSERT INTO `sys_menu` VALUES (1863753953395679234, '付款单删除', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:delete', '', 103, 1, '2024-12-03 09:15:44', 1, '2024-12-03 09:15:44', '');
INSERT INTO `sys_menu` VALUES (1863754058676903937, '付款单导出', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:export', '', 103, 1, '2024-12-03 09:16:09', 1, '2024-12-03 09:16:09', '');
INSERT INTO `sys_menu` VALUES (1863754181947498497, '付款单审批', 1863750480096731138, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:payment:update-status', '', 103, 1, '2024-12-03 09:16:39', 1, '2024-12-03 09:16:39', '');
INSERT INTO `sys_menu` VALUES (1863754588862095361, '收款单查询', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:query', '', 103, 1, '2024-12-03 09:18:16', 1, '2024-12-03 09:18:16', '');
INSERT INTO `sys_menu` VALUES (1863754729895567362, '收款单创建', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:create', '', 103, 1, '2024-12-03 09:18:49', 1, '2024-12-03 09:18:49', '');
INSERT INTO `sys_menu` VALUES (1863754952923488258, '收款单更新', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:update', '', 103, 1, '2024-12-03 09:19:42', 1, '2024-12-03 09:19:42', '');
INSERT INTO `sys_menu` VALUES (1863755037799424002, '收款单删除', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:delete', '', 103, 1, '2024-12-03 09:20:03', 1, '2024-12-03 09:20:03', '');
INSERT INTO `sys_menu` VALUES (1863755172449165313, '收款单导出', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:export', '', 103, 1, '2024-12-03 09:20:35', 1, '2024-12-03 09:20:35', '');
INSERT INTO `sys_menu` VALUES (1863755268251262978, '收款单审批', 1863751722801897473, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:receipt:update-status', '', 103, 1, '2024-12-03 09:20:58', 1, '2024-12-03 09:20:58', '');
INSERT INTO `sys_menu` VALUES (1870309453742485506, '采购订单审核', 1790033641609420802, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'erp:purchaseorder:check', '', 103, 1, '2024-12-21 11:24:57', 1, '2024-12-21 11:24:57', '');
INSERT INTO `sys_menu` VALUES (1870326498202767362, '采购入库', 1783408024530452481, 1, 'purchaseIn', 'erp/purchase/in/index', NULL, 1, 0, 'C', '0', '0', 'erp:purchaseIn:list', 'list', 103, 1, '2024-12-21 12:41:38', 1, '2024-12-21 13:25:45', 'ERP 采购入库菜单');
INSERT INTO `sys_menu` VALUES (1870326498202767363, 'ERP 采购入库查询', 1870326498202767362, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseIn:query', '#', 103, 1, '2024-12-21 12:41:38', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1870326498202767364, 'ERP 采购入库新增', 1870326498202767362, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseIn:add', '#', 103, 1, '2024-12-21 12:41:38', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1870326498202767365, 'ERP 采购入库修改', 1870326498202767362, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseIn:edit', '#', 103, 1, '2024-12-21 12:41:38', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1870326498202767366, 'ERP 采购入库删除', 1870326498202767362, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseIn:remove', '#', 103, 1, '2024-12-21 12:41:38', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1870326498202767367, 'ERP 采购入库导出', 1870326498202767362, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'erp:purchaseIn:export', '#', 103, 1, '2024-12-21 12:41:38', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '000000', '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '000000', '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 103, 1, '2024-04-15 11:15:00', NULL, NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1870309454400991233, '000000', '菜单管理', 1, 'com.haitang.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1790033641609420802\",\"menuName\":\"采购订单审核\",\"orderNum\":1,\"path\":\"\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"erp:purchaseorder:check\",\"icon\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:24:57', 257);
INSERT INTO `sys_oper_log` VALUES (1870309641055907842, '000000', '菜单管理', 2, 'com.haitang.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-05-13 22:59:28\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1790033641609420807\",\"parentId\":\"1790033641609420802\",\"menuName\":\"采购订单导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"erp:purchaseOrder:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:25:42', 564);
INSERT INTO `sys_oper_log` VALUES (1870310097542983682, '000000', '采购订单', 0, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.updatePurchaseOrderStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/purchaseOrder/update-status', '0:0:0:0:0:0:0:1', '内网IP', '{\"id\":\"1870017755837657089\",\"status\":\"10\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:27:31', 445);
INSERT INTO `sys_oper_log` VALUES (1870310141985828865, '000000', '采购订单', 0, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.updatePurchaseOrderStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/purchaseOrder/update-status', '0:0:0:0:0:0:0:1', '内网IP', '{\"id\":\"1870017755837657089\",\"status\":\"20\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:27:41', 383);
INSERT INTO `sys_oper_log` VALUES (1870310507913687041, '000000', '仓库默认状态修改', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:29:08', 168);
INSERT INTO `sys_oper_log` VALUES (1870310521343848449, '000000', '仓库默认状态修改', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1857670911732260866\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:29:12', 196);
INSERT INTO `sys_oper_log` VALUES (1870310748020813826, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-04-24 16:11:23\",\"updateBy\":1,\"updateTime\":\"2024-04-25 14:05:20\",\"id\":\"1783046059622666242\",\"name\":\"上海仓\",\"address\":\"上海市\",\"sort\":1,\"remark\":\"上海\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"1\",\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:30:06', 469);
INSERT INTO `sys_oper_log` VALUES (1870310871186550786, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863905210353647617\",\"name\":null,\"no\":\"62100000000000\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:30:35', 736);
INSERT INTO `sys_oper_log` VALUES (1870310885619150850, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863906782177460225\",\"name\":null,\"no\":\"62100000000002\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:30:38', 749);
INSERT INTO `sys_oper_log` VALUES (1870310920327016449, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863905307195932674\",\"name\":null,\"no\":\"62100000000001\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '', 1, 'Expected one result (or null) to be returned by selectOne(), but found multiple records', '2024-12-21 11:30:47', 268);
INSERT INTO `sys_oper_log` VALUES (1870310945861939202, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863906782177460225\",\"name\":null,\"no\":\"62100000000002\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:30:53', 333);
INSERT INTO `sys_oper_log` VALUES (1870310996969533442, '000000', 'ERP 结算账户', 3, 'com.haitang.erp.controller.finance.ErpAccountController.remove()', 'DELETE', 1, 'admin', '研发部门', '/erp/account/1863909834519281666', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:31:05', 241);
INSERT INTO `sys_oper_log` VALUES (1870311008600338434, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863906782177460225\",\"name\":null,\"no\":\"62100000000002\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:31:08', 437);
INSERT INTO `sys_oper_log` VALUES (1870311023896965121, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863905307195932674\",\"name\":null,\"no\":\"62100000000001\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:31:11', 837);
INSERT INTO `sys_oper_log` VALUES (1870311038937739265, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863905210353647617\",\"name\":null,\"no\":\"62100000000000\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:31:15', 761);
INSERT INTO `sys_oper_log` VALUES (1870311518149554178, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-04-24 16:11:23\",\"updateBy\":1,\"updateTime\":\"2024-12-21 11:30:05\",\"id\":\"1783046059622666242\",\"name\":\"上海仓\",\"address\":\"上海市\",\"sort\":1,\"remark\":\"上海\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"0\",\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:33:09', 215);
INSERT INTO `sys_oper_log` VALUES (1870311634004619266, '000000', 'ERP 修改结算账户默认状态', 2, 'com.haitang.erp.controller.finance.ErpAccountController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/account/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1863905307195932674\",\"name\":null,\"no\":\"62100000000001\",\"remark\":null,\"status\":null,\"sort\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:33:37', 860);
INSERT INTO `sys_oper_log` VALUES (1870312957034901505, '000000', '仓库默认状态修改', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1857670911732260866\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:38:52', 184);
INSERT INTO `sys_oper_log` VALUES (1870315858503462913, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '', 1, 'Expected one result (or null) to be returned by selectOne(), but found multiple records', '2024-12-21 11:50:24', 330);
INSERT INTO `sys_oper_log` VALUES (1870315996340875265, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '', 1, 'Expected one result (or null) to be returned by selectOne(), but found multiple records', '2024-12-21 11:50:57', 265);
INSERT INTO `sys_oper_log` VALUES (1870316316588568577, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '', 1, 'Expected one result (or null) to be returned by selectOne(), but found multiple records', '2024-12-21 11:52:13', 47733);
INSERT INTO `sys_oper_log` VALUES (1870316609128689665, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:53:23', 666);
INSERT INTO `sys_oper_log` VALUES (1870317503882784770, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 11:56:56', 779);
INSERT INTO `sys_oper_log` VALUES (1870321940101705730, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1857670911732260866\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:14:34', 1007);
INSERT INTO `sys_oper_log` VALUES (1870322172923326466, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-04-24 16:11:23\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:14:33\",\"id\":\"1783046059622666242\",\"name\":\"上海仓\",\"address\":\"上海市\",\"sort\":1,\"remark\":\"上海\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"1\",\"defaultStatus\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:15:30', 447);
INSERT INTO `sys_oper_log` VALUES (1870322209048866817, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-11-16 14:23:54\",\"updateBy\":1,\"updateTime\":\"2024-11-16 14:23:54\",\"id\":\"1857670911732260866\",\"name\":\"北京仓\",\"address\":\"北京\",\"sort\":2,\"remark\":\"\",\"principal\":\"小侯\",\"warehousePrice\":null,\"truckagePrice\":null,\"status\":\"1\",\"defaultStatus\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:15:38', 183);
INSERT INTO `sys_oper_log` VALUES (1870322233682014210, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-04-24 16:11:23\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:15:29\",\"id\":\"1783046059622666242\",\"name\":\"上海仓\",\"address\":\"上海市\",\"sort\":1,\"remark\":\"上海\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"0\",\"defaultStatus\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:15:44', 199);
INSERT INTO `sys_oper_log` VALUES (1870324983123693570, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:26:40', 784);
INSERT INTO `sys_oper_log` VALUES (1870325004468506626, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1857670911732260866\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:26:45', 728);
INSERT INTO `sys_oper_log` VALUES (1870325066460319746, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-11-16 14:23:54\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:26:39\",\"id\":\"1857670911732260866\",\"name\":\"北京仓\",\"address\":\"北京\",\"sort\":2,\"remark\":\"\",\"principal\":\"小侯\",\"warehousePrice\":\"1\",\"truckagePrice\":\"2\",\"status\":\"1\",\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:26:59', 212);
INSERT INTO `sys_oper_log` VALUES (1870325125444816897, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-11-16 14:23:54\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:26:59\",\"id\":\"1857670911732260866\",\"name\":\"北京仓\",\"address\":\"北京\",\"sort\":2,\"remark\":\"\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"0\",\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:27:14', 230);
INSERT INTO `sys_oper_log` VALUES (1870326277569794049, '000000', '代码生成', 3, 'com.haitang.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1863756571404738561', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:31:48', 260);
INSERT INTO `sys_oper_log` VALUES (1870326482549624834, '000000', '代码生成', 6, 'com.haitang.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '0:0:0:0:0:0:0:1', '内网IP', '\"erp_purchase_in,erp_purchase_in_items\" \"master\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:32:37', 415);
INSERT INTO `sys_oper_log` VALUES (1870326499859517442, '000000', '代码生成', 8, 'com.haitang.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"1870326480934817794,1870326481794650113\"}', '', 0, '', '2024-12-21 12:32:41', 446);
INSERT INTO `sys_oper_log` VALUES (1870327897175117826, '000000', '代码生成', 2, 'com.haitang.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-12-21 12:38:13\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1783408024530452481\"},\"tableId\":\"1870326480934817794\",\"dataName\":\"master\",\"tableName\":\"erp_purchase_in\",\"tableComment\":\"ERP 采购入库表\",\"subTableName\":\"\",\"subTableFkName\":\"\",\"className\":\"ErpPurchaseIn\",\"tplCategory\":\"crud\",\"packageName\":\"com.haitang.erp\",\"moduleName\":\"erp\",\"businessName\":\"purchaseIn\",\"functionName\":\"ERP 采购入库\",\"functionAuthor\":\"hhhbx\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:38:13\",\"columnId\":\"1870326481337470978\",\"tableId\":\"1870326480934817794\",\"columnName\":\"id\",\"columnComment\":\"编号\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:38:13\",\"columnId\":\"1870326481404579842\",\"tableId\":\"1870326480934817794\",\"columnName\":\"no\",\"columnComment\":\"采购入库编号\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"no\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"No\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:38:13\",\"columnId\":\"1870326481404579843\",\"tableId\":\"1870326480934817794\",\"columnName\":\"status\",\"columnCommen', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:38:14', 893);
INSERT INTO `sys_oper_log` VALUES (1870328130701381633, '000000', '代码生成', 2, 'com.haitang.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-12-21 12:39:08\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1783408024530452481\"},\"tableId\":\"1870326481794650113\",\"dataName\":\"master\",\"tableName\":\"erp_purchase_in_items\",\"tableComment\":\"ERP 销售入库项表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"ErpPurchaseInItems\",\"tplCategory\":\"crud\",\"packageName\":\"com.haitang.erp\",\"moduleName\":\"erp\",\"businessName\":\"purchaseInItems\",\"functionName\":\"ERP 销售入库项\",\"functionAuthor\":\"hhhbx\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:39:08\",\"columnId\":\"1870326481991782402\",\"tableId\":\"1870326481794650113\",\"columnName\":\"id\",\"columnComment\":\"编号\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:39:08\",\"columnId\":\"1870326481991782403\",\"tableId\":\"1870326481794650113\",\"columnName\":\"in_id\",\"columnComment\":\"采购入库编号\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"inId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"InId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-12-21 12:32:37\",\"updateBy\":1,\"updateTime\":\"2024-12-21 12:39:08\",\"columnId\":\"1870326481991782404\",\"tableId\":\"1870326481794650113\",\"columnName\":\"or', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:39:10', 1735);
INSERT INTO `sys_oper_log` VALUES (1870328156345356289, '000000', '代码生成', 8, 'com.haitang.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"1870326481794650113\"}', '', 0, '', '2024-12-21 12:39:16', 149);
INSERT INTO `sys_oper_log` VALUES (1870330010705874946, '000000', '菜单管理', 3, 'com.haitang.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1870326499595276289', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在子菜单,不允许删除\",\"data\":null}', 0, '', '2024-12-21 12:46:38', 116);
INSERT INTO `sys_oper_log` VALUES (1870330166264221698, '000000', '菜单管理', 2, 'com.haitang.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-12-21 12:41:38\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1870326498202767362\",\"parentId\":\"1783408024530452481\",\"menuName\":\"采购入库\",\"orderNum\":1,\"path\":\"purchaseIn\",\"component\":\"system/purchaseIn/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:purchaseIn:list\",\"icon\":\"#\",\"remark\":\"ERP 采购入库菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 12:47:15', 191);
INSERT INTO `sys_oper_log` VALUES (1870339601837621250, '000000', '菜单管理', 2, 'com.haitang.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-12-21 12:41:38\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1870326498202767362\",\"parentId\":\"1783408024530452481\",\"menuName\":\"采购入库\",\"orderNum\":1,\"path\":\"purchaseIn\",\"component\":\"erp/purchase/in/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"erp:purchaseIn:list\",\"icon\":\"#\",\"remark\":\"ERP 采购入库菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 13:24:45', 323);
INSERT INTO `sys_oper_log` VALUES (1870339852388564993, '000000', '菜单管理', 2, 'com.haitang.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-12-21 12:41:38\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1870326498202767362\",\"parentId\":\"1783408024530452481\",\"menuName\":\"采购入库\",\"orderNum\":1,\"path\":\"purchaseIn\",\"component\":\"erp/purchase/in/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"erp:purchaseIn:list\",\"icon\":\"list\",\"remark\":\"ERP 采购入库菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-21 13:25:45', 276);
INSERT INTO `sys_oper_log` VALUES (1872498474816122882, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1783046059622666242\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 12:23:20', 601);
INSERT INTO `sys_oper_log` VALUES (1872498493296226305, '000000', 'ERP 修改仓库默认状态', 2, 'com.haitang.erp.controller.ErpWarehouseController.changeDefaultStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse/changeDefaultStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1857670911732260866\",\"name\":null,\"address\":null,\"sort\":null,\"remark\":null,\"principal\":null,\"warehousePrice\":null,\"truckagePrice\":null,\"status\":null,\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 12:23:25', 614);
INSERT INTO `sys_oper_log` VALUES (1872498543137140737, '000000', '仓库信息', 2, 'com.haitang.erp.controller.ErpWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/erp/warehouse', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":1,\"createTime\":\"2024-11-16 14:23:54\",\"updateBy\":1,\"updateTime\":\"2024-12-27 12:23:20\",\"id\":\"1857670911732260866\",\"name\":\"北京仓\",\"address\":\"北京\",\"sort\":2,\"remark\":\"北京\",\"principal\":\"小侯\",\"warehousePrice\":\"1.000000\",\"truckagePrice\":\"2.000000\",\"status\":\"0\",\"defaultStatus\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 12:23:37', 174);
INSERT INTO `sys_oper_log` VALUES (1872595084967493634, '000000', '客户信息', 1, 'com.haitang.erp.controller.ErpCustomerController.add()', 'POST', 1, 'admin', '研发部门', '/erp/customer', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1872595084233490434\",\"name\":\"贸易有限公司\",\"contact\":\"小王\",\"mobile\":\"13311984000\",\"telephone\":null,\"email\":null,\"fax\":null,\"remark\":\"\",\"status\":\"0\",\"sort\":1,\"taxNo\":\"1\",\"taxPercent\":\"2\",\"bankName\":\"1\",\"bankAccount\":\"1\",\"bankAddress\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 18:47:14', 185);
INSERT INTO `sys_oper_log` VALUES (1872595112159166465, '000000', '客户状态修改', 2, 'com.haitang.erp.controller.ErpCustomerController.changeCustomerStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/customer/changeCustomerStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1872595084233490434\",\"name\":null,\"contact\":null,\"mobile\":null,\"telephone\":null,\"email\":null,\"fax\":null,\"remark\":null,\"status\":\"1\",\"sort\":null,\"taxNo\":null,\"taxPercent\":null,\"bankName\":null,\"bankAccount\":null,\"bankAddress\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 18:47:21', 175);
INSERT INTO `sys_oper_log` VALUES (1872595128642781185, '000000', '客户状态修改', 2, 'com.haitang.erp.controller.ErpCustomerController.changeCustomerStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/customer/changeCustomerStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1781234336490098689\",\"name\":null,\"contact\":null,\"mobile\":null,\"telephone\":null,\"email\":null,\"fax\":null,\"remark\":null,\"status\":\"1\",\"sort\":null,\"taxNo\":null,\"taxPercent\":null,\"bankName\":null,\"bankAccount\":null,\"bankAddress\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 18:47:24', 175);
INSERT INTO `sys_oper_log` VALUES (1872595139053043714, '000000', '客户状态修改', 2, 'com.haitang.erp.controller.ErpCustomerController.changeCustomerStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/customer/changeCustomerStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1872595084233490434\",\"name\":null,\"contact\":null,\"mobile\":null,\"telephone\":null,\"email\":null,\"fax\":null,\"remark\":null,\"status\":\"0\",\"sort\":null,\"taxNo\":null,\"taxPercent\":null,\"bankName\":null,\"bankAccount\":null,\"bankAddress\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-27 18:47:27', 159);
INSERT INTO `sys_oper_log` VALUES (1872906942064693249, '000000', '采购订单', 0, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.updatePurchaseOrderStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/purchaseOrder/update-status', '0:0:0:0:0:0:0:1', '内网IP', '{\"id\":\"1870017755837657089\",\"status\":\"10\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-28 15:26:27', 321);
INSERT INTO `sys_oper_log` VALUES (1872906955322888193, '000000', '采购订单', 0, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.updatePurchaseOrderStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/purchaseOrder/update-status', '0:0:0:0:0:0:0:1', '内网IP', '{\"id\":\"1869970706605821954\",\"status\":\"10\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-12-28 15:26:30', 332);
INSERT INTO `sys_oper_log` VALUES (1899120213645873153, '000000', '采购订单', 3, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/erp/purchaseOrder/1864204343601823745', '0:0:0:0:0:0:0:1', '内网IP', '{}', '', 1, '采购订单(CGDD20241204000010)已审核，无法删除', '2025-03-10 23:28:38', 171);
INSERT INTO `sys_oper_log` VALUES (1899120246407581698, '000000', '采购订单', 3, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/erp/purchaseOrder/1870028132814217217', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-03-10 23:28:45', 461);
INSERT INTO `sys_oper_log` VALUES (1899120514121617410, '000000', '采购订单', 1, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.add()', 'POST', 1, 'admin', '研发部门', '/erp/purchaseOrder', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"no\":null,\"status\":null,\"supplierId\":\"1785149784049393666\",\"productId\":null,\"accountId\":\"1863905210353647617\",\"orderTime\":\"2025-03-10 00:00:00\",\"totalCount\":null,\"totalPrice\":\"5\",\"totalProductPrice\":null,\"totalTaxPrice\":null,\"discountPercent\":\"2\",\"discountPrice\":\"0.1\",\"depositPrice\":\"5\",\"fileUrl\":\"\",\"remark\":null,\"inCount\":null,\"returnCount\":null,\"inStatus\":null,\"returnStatus\":null,\"inEnable\":null,\"returnEnable\":null,\"items\":[{\"id\":null,\"orderNo\":null,\"productId\":\"1786750166479433730\",\"productUnitId\":null,\"productPrice\":\"1.000000\",\"count\":\"1\",\"taxPercent\":\"2\",\"remark\":null},{\"id\":null,\"orderNo\":null,\"productId\":\"1786751416403030018\",\"productUnitId\":null,\"productPrice\":\"4.000000\",\"count\":\"1\",\"taxPercent\":\"2\",\"remark\":null}]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-03-10 23:29:49', 843);
INSERT INTO `sys_oper_log` VALUES (1899120607616847873, '000000', '采购订单', 0, 'com.haitang.erp.controller.purchase.ErpPurchaseOrderController.updatePurchaseOrderStatus()', 'PUT', 1, 'admin', '研发部门', '/erp/purchaseOrder/update-status', '0:0:0:0:0:0:0:1', '内网IP', '{\"id\":\"1899120512934629377\",\"status\":\"20\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-03-10 23:30:11', 323);
INSERT INTO `sys_oper_log` VALUES (1899679939869847554, '000000', 'ERP 采购入库', 1, 'com.haitang.erp.controller.purchase.ErpPurchaseInController.add()', 'POST', 1, 'admin', '研发部门', '/system/purchaseIn', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"no\":null,\"status\":null,\"supplierId\":\"1785149784049393666\",\"accountId\":\"1863905210353647617\",\"inTime\":\"2025-03-12 00:00:00\",\"orderId\":\"1899120512934629377\",\"orderNo\":\"CGDD20250310000001\",\"totalCount\":null,\"totalPrice\":\"5\",\"paymentPrice\":null,\"totalProductPrice\":null,\"totalTaxPrice\":null,\"discountPercent\":\"2\",\"discountPrice\":\"0.1\",\"otherPrice\":\"0\",\"fileUrl\":null,\"items\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"inId\":null,\"orderItemId\":\"1899120513534414849\",\"warehouseId\":\"1783046059622666242\",\"productId\":\"1786750166479433730\",\"productUnitId\":\"1786749930440781825\",\"productPrice\":\"1\",\"count\":\"1\",\"totalPrice\":\"1.02\",\"taxPercent\":\"2\",\"taxPrice\":\"0.02\",\"remark\":null},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"inId\":null,\"orderItemId\":\"1899120513928679425\",\"warehouseId\":\"1783046059622666242\",\"productId\":\"1786751416403030018\",\"productUnitId\":\"1786749930440781825\",\"productPrice\":\"4\",\"count\":\"1\",\"totalPrice\":\"4.08\",\"taxPercent\":\"2\",\"taxPrice\":\"0.08\",\"remark\":null}],\"remark\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'no\' doesn\'t have a default value\r\n### The error may exist in com/haitang/erp/mapper/purchase/ErpPurchaseInMapper.java (best guess)\r\n### The error may involve com.haitang.erp.mapper.purchase.ErpPurchaseInMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO erp_purchase_in (id, supplier_id, account_id, in_time, order_id, order_no, total_price, discount_percent, discount_price, other_price, create_dept, create_by, create_time, update_by, update_time, tenant_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \'000000\')\r\n### Cause: java.sql.SQLException: Field \'no\' doesn\'t have a default value\n; Field \'no\' doesn\'t have a default value', '2025-03-12 12:32:47', 176);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(20) NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint(20) NOT NULL COMMENT '主建',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, '000000', 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01', NULL);
INSERT INTO `sys_oss_config` VALUES (2, '000000', 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01', NULL);
INSERT INTO `sys_oss_config` VALUES (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01', NULL);
INSERT INTO `sys_oss_config` VALUES (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01', NULL);
INSERT INTO `sys_oss_config` VALUES (5, '000000', 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 103, 1, '2024-04-15 11:15:01', 1, '2024-04-15 11:15:01', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '000000', 'ceo', '董事长', 1, '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (2, '000000', 'se', '项目经理', 2, '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (3, '000000', 'hr', '人力资源', 3, '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (4, '000000', 'user', '普通员工', 4, '1', 103, 1, '2024-04-15 11:14:59', 1, '2024-04-19 15:53:24', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000000', '超级管理员', 'superadmin', 1, '1', 1, 1, '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '000000', '普通角色', 'common', 2, '2', 1, 1, '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '000000', '本部门及以下', 'test1', 3, '4', 1, 1, '0', '0', 103, 1, '2024-04-15 11:15:11', 1, NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '000000', '仅本人', 'test2', 4, '5', 1, 1, '0', '0', 103, 1, '2024-04-15 11:15:11', 1, NULL, NULL);
INSERT INTO `sys_role` VALUES (1785507666716577793, '397530', '管理员', 'admin', 1, '1', 1, 1, '0', '0', 103, 1, '2024-05-01 11:12:56', 1, '2024-05-01 11:12:56', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (1785507666716577793, 1785507666913710081);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 1500);
INSERT INTO `sys_role_menu` VALUES (4, 1501);
INSERT INTO `sys_role_menu` VALUES (4, 1502);
INSERT INTO `sys_role_menu` VALUES (4, 1503);
INSERT INTO `sys_role_menu` VALUES (4, 1504);
INSERT INTO `sys_role_menu` VALUES (4, 1505);
INSERT INTO `sys_role_menu` VALUES (4, 1506);
INSERT INTO `sys_role_menu` VALUES (4, 1507);
INSERT INTO `sys_role_menu` VALUES (4, 1508);
INSERT INTO `sys_role_menu` VALUES (4, 1509);
INSERT INTO `sys_role_menu` VALUES (4, 1510);
INSERT INTO `sys_role_menu` VALUES (4, 1511);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 5);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1500);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1501);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1502);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1503);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1504);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1505);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1506);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1507);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1508);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1509);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1510);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1511);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780073069121400834);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009345);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009346);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009347);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009348);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009349);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1780074254654009350);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781677873323646977);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681346);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681347);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681348);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681349);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681350);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1781679122458681351);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1783408024530452481);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492673);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492674);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492675);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492676);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492677);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785140147518492678);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785165780017496066);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773698);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773699);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773700);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773701);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773702);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785167453263773703);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710914);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710915);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710916);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710917);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710918);
INSERT INTO `sys_role_menu` VALUES (1785507666716577793, 1785168145340710919);

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS `sys_social`;
CREATE TABLE `sys_social`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int(11) NULL DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社会化关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `package_id` bigint(20) NULL DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `account_count` int(11) NULL DEFAULT -1 COMMENT '用户数量（-1不限制）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '000000', '管理组', '15888888888', 'XXX有限公司', NULL, NULL, '多租户通用后台管理管理系统', NULL, NULL, NULL, NULL, -1, '0', '0', 103, 1, '2024-04-15 11:14:59', NULL, NULL);
INSERT INTO `sys_tenant` VALUES (1785507666586554369, '397530', '小王', '13311984809', '嘉实', '', '', '', '', '', 1785507230198583298, '2024-05-02 00:00:00', 2, '1', '0', 103, 1, '2024-05-01 11:12:56', 1, '2024-12-03 13:32:47');

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint(20) NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户套餐表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------
INSERT INTO `sys_tenant_package` VALUES (1785507230198583298, '黄金', '5, 1500, 1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1780073069121400834, 1780074254654009345, 1780074254654009346, 1780074254654009347, 1780074254654009348, 1780074254654009349, 1780074254654009350, 1781677873323646977, 1781679122458681346, 1781679122458681347, 1781679122458681348, 1781679122458681349, 1781679122458681350, 1781679122458681351, 1783408024530452481, 1785140147518492673, 1785140147518492674, 1785140147518492675, 1785140147518492676, 1785140147518492677, 1785140147518492678, 1785165780017496066, 1785167453263773698, 1785167453263773699, 1785167453263773700, 1785167453263773701, 1785167453263773702, 1785167453263773703, 1785168145340710914, 1785168145340710915, 1785168145340710916, 1785168145340710917, 1785168145340710918, 1785168145340710919', '黄金套餐', 1, '0', '0', 103, 1, '2024-05-01 11:11:11', 1, '2024-05-01 11:11:35');
INSERT INTO `sys_tenant_package` VALUES (1785507279846559745, '白银', '2, 109, 1046, 1047, 1048, 113, 117, 120, 3, 114, 115, 1055, 1056, 1058, 1057, 1059, 1060, 4', '白银套餐', 1, '0', '0', 103, 1, '2024-05-01 11:11:23', 1, '2024-05-01 11:11:44');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint(20) NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '0:0:0:0:0:0:0:1', '2025-07-27 15:34:31', 103, 1, '2024-04-15 11:14:59', 1, '2025-07-27 15:34:31', '管理员');
INSERT INTO `sys_user` VALUES (2, '000000', 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-15 11:14:59', 103, 1, '2024-04-15 11:14:59', NULL, NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2024-04-15 11:15:11', 103, 1, '2024-04-15 11:15:11', 3, '2024-04-15 11:15:11', NULL);
INSERT INTO `sys_user` VALUES (4, '000000', 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2024-04-15 11:15:11', 103, 1, '2024-04-15 11:15:11', 4, '2024-04-15 11:15:11', NULL);
INSERT INTO `sys_user` VALUES (1785507667375083521, '397530', 1785507666913710081, '王哥', '王哥', 'sys_user', '', '', '0', NULL, '$2a$10$WAGwCOAKI6jFzWWho2Ih4uf30DVxPRmZyuFMkHvA/Dc8JUk5yi7W.', '0', '0', '', NULL, 103, 1, '2024-05-01 11:12:56', 1, '2024-05-01 11:12:56', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);
INSERT INTO `sys_user_role` VALUES (1785507667375083521, 1785507666716577793);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, '000000', 102, 4, 1, '测试数据权限', '测试', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, '000000', 102, 3, 2, '子节点1', '111', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, '000000', 102, 3, 3, '子节点2', '222', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, '000000', 108, 4, 4, '测试数据', 'demo', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, '000000', 108, 3, 13, '子节点11', '1111', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, '000000', 108, 3, 12, '子节点22', '2222', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, '000000', 108, 3, 11, '子节点33', '3333', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, '000000', 108, 3, 10, '子节点44', '4444', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, '000000', 108, 3, 9, '子节点55', '5555', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, '000000', 108, 3, 8, '子节点66', '6666', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, '000000', 108, 3, 7, '子节点77', '7777', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, '000000', 108, 3, 6, '子节点88', '8888', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, '000000', 108, 3, 5, '子节点99', '9999', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint(20) NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, '000000', 0, 102, 4, '测试数据权限', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, '000000', 1, 102, 3, '子节点1', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, '000000', 2, 102, 3, '子节点2', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, '000000', 0, 108, 4, '测试树1', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, '000000', 4, 108, 3, '子节点11', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, '000000', 4, 108, 3, '子节点22', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, '000000', 4, 108, 3, '子节点33', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, '000000', 5, 108, 3, '子节点44', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, '000000', 6, 108, 3, '子节点55', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, '000000', 7, 108, 3, '子节点66', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, '000000', 7, 108, 3, '子节点77', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, '000000', 10, 108, 3, '子节点88', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, '000000', 10, 108, 3, '子节点99', 0, 103, '2024-04-15 11:15:11', 1, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
