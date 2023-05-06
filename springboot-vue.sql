/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : springboot-vue

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 04/12/2023 21:25:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                       `pid` int(11) NULL DEFAULT NULL,
                       `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '上海市', NULL, 'shanghai');
INSERT INTO `area` VALUES (2, '上海市', 1, 'shanghai');
INSERT INTO `area` VALUES (3, '黄浦区', 2, 'huangpu');
INSERT INTO `area` VALUES (4, '杨浦区', 2, 'yangpu');
INSERT INTO `area` VALUES (5, '静安区', 2, 'jingan');
INSERT INTO `area` VALUES (6, '宝山区', 2, 'baoshan');
INSERT INTO `area` VALUES (7, '普陀区', 2, 'putuo');
INSERT INTO `area` VALUES (8, '苏州市', 1, 'suzhou');
INSERT INTO `area` VALUES (9, '徐汇区', 3, 'xuhui');
INSERT INTO `area` VALUES (10, '苏州', 2, 'suzhou');
-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                       `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                       `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
                       `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
                       `create_time` datetime NULL DEFAULT NULL COMMENT '出版日期',
                       `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面地址',
                       `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '我的2023，难死我了！', 60.00, 'xxx', '2010-07-01 00:00:00', 'https://pic1.zhimg.com/v2-d58ce10bf4e01f5086c604a9cfed29f3_r.jpg?source=1940ef5c', 13);
INSERT INTO `book` VALUES (2, '我的2024，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://scpic.chinaz.net/files/pic/pic9/202009/apic27858.jpg', 13);
INSERT INTO `book` VALUES (3, '我的2025，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.nelCIKYD30NJW6W68-ZHxAHaJA?pid=ImgDet&rs=1', 13);
INSERT INTO `book` VALUES (4, '我的2026，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://scpic.chinaz.net/files/pic/pic9/202009/apic27858.jpg', 13);
INSERT INTO `book` VALUES (5, '我的2027，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.nelCIKYD30NJW6W68-ZHxAHaJA?pid=ImgDet&rs=1', 13);
INSERT INTO `book` VALUES (6, '我的2028，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://scpic.chinaz.net/files/pic/pic9/202009/apic27858.jpg', 13);
INSERT INTO `book` VALUES (7, '我的2029，难死我了！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://scpic.chinaz.net/files/pic/pic9/202009/apic27858.jpg', 13);
INSERT INTO `book` VALUES (8, '我的2030，要起飞啦！', 200.00, 'xxx1', '2021-05-08 00:00:00', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.nelCIKYD30NJW6W68-ZHxAHaJA?pid=ImgDet&rs=1', 13);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
                           `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                           `pid` int(11) NULL DEFAULT NULL COMMENT '父节点id',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '文学', null);
INSERT INTO `category` VALUES (2, '童书', 1);
INSERT INTO `category` VALUES (3, '社会科学', 1);
INSERT INTO `category` VALUES (4, '经济学', 3);
INSERT INTO `category` VALUES (5, '科普百科', 3);
INSERT INTO `category` VALUES (6, '法律', 3);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
                          `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                          `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
                          `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论人',
                          `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论时间',
                          `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
                          `foreign_id` bigint(20) NULL DEFAULT 0 COMMENT '关联id',
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (20, '好难啊', 'admin', '2023-04-22 10:48:55', NULL, 0);
INSERT INTO `message` VALUES (21, '哦豁', 'admin', '2023-04-22 10:49:48', NULL, 0);
INSERT INTO `message` VALUES (22, '这个项目搞得我差点趋势', 'admin', '2023-04-22 10:51:07', 21, 0);
INSERT INTO `message` VALUES (23, '哈哈哈', 'zhang', '2023-04-24 17:13:45', 22, 0);
INSERT INTO `message` VALUES (24, '我们都爱吃大西瓜', 'zhang', '2023-04-24 17:13:58', NULL, 0);
INSERT INTO `message` VALUES (25, '1232', 'admin', '2023-04-21 16:46:39', NULL, 0);
INSERT INTO `message` VALUES (26, '2345', 'admin', '2023-04-15 16:47:00', 25, 0);
INSERT INTO `message` VALUES (27, '11111', 'admin', '2023-04-15 16:52:09', 26, 0);
INSERT INTO `message` VALUES (28, '3333', 'admin', '2023-04-14 16:55:28', 27, 0);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                       `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
                       `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
                       `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
                       `time` datetime NULL DEFAULT NULL COMMENT '发布时间',
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------

INSERT INTO `news` VALUES (6, '难死了！', '<p><iframe src=\"//player.bilibili.com/player.html?aid=803885504&amp;bvid=BV14y4y1M7Nc&amp;cid=361690131&amp;page=1\" scrolling=\"no\" border=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\" width=\"600\" height=\"400\"> </iframe></p>', '管理员', '2021-09-05 22:28:25');
INSERT INTO `news` VALUES (7, '放点舞蹈⁄(⁄ ⁄ ⁄ω⁄ ⁄ ⁄)⁄……', '<p><iframe src=\"//player.bilibili.com/player.html?aid=717601909&amp;bvid=BV1sQ4y1174g&amp;cid=396410411&amp;page=1\" scrolling=\"no\" border=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\" width=\"600\" height=\"400\"> </iframe></p>', '管理员', '2021-09-05 22:31:40');


-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
                             `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                             `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                             `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源路径',
                             `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                             `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'Home', '/home', '首页', 'el-icon-house');
INSERT INTO `permission` VALUES (2, 'Book', '/book', '书籍管理', 'el-icon-files');
INSERT INTO `permission` VALUES (3, 'Category', '/category', '分类管理', 'el-icon-menu');
INSERT INTO `permission` VALUES (4, 'Order', '/order', '我的订单', 'el-icon-s-order');
INSERT INTO `permission` VALUES (5, 'News', '/news', '新闻管理', 'el-icon-news');
INSERT INTO `permission` VALUES (6, 'Map', '/map', '百度地图', 'el-icon-map-location');
INSERT INTO `permission` VALUES (7, 'Im', '/im', '意见收集室', 'el-icon-chat-round');
INSERT INTO `permission` VALUES (8, 'Message', '/message', '在线留言', 'el-icon-message');
INSERT INTO `permission` VALUES (9, 'User', '/user', '用户管理', 'el-icon-user');
INSERT INTO `permission` VALUES (10, 'Permission', '/permisssion', '权限菜单', 'el-icon-menu');
INSERT INTO `permission` VALUES (11, 'Role', '/role', '角色管理', 'el-icon-s-custom');
INSERT INTO `permission` VALUES (12, 'Donate', '/donate', '请评委大大手下留情', 'el-icon-coffee');
INSERT INTO `permission` VALUES (13, 'Person', '/person', '个人信息', '');
INSERT INTO `permission` VALUES (14, 'Password', '/password', '修改密码', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                       `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                       `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员');
INSERT INTO `role` VALUES (2, 'user', '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
                                  `role_id` int(11) NOT NULL COMMENT '角色id',
                                  `permission_id` int(11) NOT NULL COMMENT '资源id',
                                  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (1, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (1, 9);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (1, 11);
INSERT INTO `role_permission` VALUES (1, 12);
INSERT INTO `role_permission` VALUES (1, 13);
INSERT INTO `role_permission` VALUES (1, 14);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (2, 4);
INSERT INTO `role_permission` VALUES (2, 5);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (2, 8);
INSERT INTO `role_permission` VALUES (2, 12);
INSERT INTO `role_permission` VALUES (2, 13);
INSERT INTO `role_permission` VALUES (2, 14);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                          `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                          `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
                          `pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付款',
                          `discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
                          `transport_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '运费',
                          `order_no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
                          `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
                          `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户账户',
                          `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                          `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
                          `state` int(1) NOT NULL DEFAULT 0 COMMENT '状态',
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, '我的2023，难死我了！', 60.00, 60.00, 0.00, 0.00, '1451548938265882624', 1, 'admin', '2023-04-22 22:00:12', '2023-04-22 22:02:11', 1);
INSERT INTO `t_order` VALUES (2, '我的2024，难死我了！', 200.00, 60.00, 0.00, 0.00, '1451548938265885425', 1, 'admin', '2023-04-22 22:00:12', '2023-04-22 22:02:11', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
                       `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
                       `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
                       `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
                       `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
                       `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
                       `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
                       `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
                       `account` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '账户余额',
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$.cxJ637DYA1PRSzfPmBO0efS1W2eTQefS51b83Nr5xgRNAW0ffgjO', '管理员', 20, '男', '火星', 'https://pic1.zhimg.com/v2-d58ce10bf4e01f5086c604a9cfed29f3_r.jpg?source=1940ef5c', 100000.00);
INSERT INTO `user` VALUES (2, 'zhang', '$2a$10$h6gfZRMvGFjjQH6HrQf.Q.fvu3jjMc0cv/sGpSanobht5iwCFbucS', '张三', 20, '男', '木星', 'https://pic1.zhimg.com/v2-d58ce10bf4e01f5086c604a9cfed29f3_r.jpg?source=1940ef5c', 200.00);
INSERT INTO `user` VALUES (3, 'wang', '$2a$10$h6gfZRMvGFjjQH6HrQf.Q.fvu3jjMc0cv/sGpSanobht5iwCFbucS', '王梦晨', 24, '女', '地球', NULL, 300.00);
INSERT INTO `user` VALUES (4, 'li', '$2a$10$h6gfZRMvGFjjQH6HrQf.Q.fvu3jjMc0cv/sGpSanobht5iwCFbucS', '李雪', 22, '女', '银河系', NULL, 500.00);
INSERT INTO `user` VALUES (5, 'qian', '$2a$10$h6gfZRMvGFjjQH6HrQf.Q.fvu3jjMc0cv/sGpSanobht5iwCFbucS', '钱江', 22, '男', '地球', NULL, 700.00);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
                            `user_id` int(11) NOT NULL COMMENT '用户id',
                            `role_id` int(11) NOT NULL COMMENT '角色id',
                            PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (13, 2);
INSERT INTO `user_role` VALUES (14, 2);
INSERT INTO `user_role` VALUES (15, 2);
INSERT INTO `user_role` VALUES (16, 2);

SET FOREIGN_KEY_CHECKS = 1;
