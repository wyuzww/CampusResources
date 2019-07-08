/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : web_education

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-14 13:47:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `course_name` varchar(20) DEFAULT NULL,
  `course_type` varchar(4) DEFAULT NULL,
  `course_exam` varchar(4) DEFAULT NULL,
  `course_credit` float DEFAULT NULL,
  `course_explain` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('002C1061', ' 大学英语', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('002C1062', ' 大学英语', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('002C1063', ' 大学英语', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('002C1064', ' 大学英语', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('004A3280', ' 自动控制原理', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('005A1080', ' 数字电路与逻辑设计', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('005A1260', ' 数字信号处理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('005A1430', ' 信号与系统', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('005A1510', ' 电路分析基础Ⅰ', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('005C3090', ' 电子系统EDA', '任选', '考试', '2', null);
INSERT INTO `course` VALUES ('005C3100', ' 数字图象处理', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('006A1050', ' 计算机组成原理课程设计', '必修', '考查', '2', '1-2周');
INSERT INTO `course` VALUES ('006A1060', ' 数据结构', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('006A1280', ' 认识实习', '必修', '考查', '1', '假期');
INSERT INTO `course` VALUES ('006A1290', ' 生产实习', '必修', '考查', '2', '假期');
INSERT INTO `course` VALUES ('006A1310', ' 数据库课程设计', '必修', '考查', '1', '分散');
INSERT INTO `course` VALUES ('006A1320', ' 毕业设计', '必修', '考查', '16', null);
INSERT INTO `course` VALUES ('006A1330', ' 数据库原理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('006A1400', ' 计算机组成原理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('006A1410', ' 操作系统', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('006A1440', ' C++语言程序设计', '必修', '考试', '4', null);
INSERT INTO `course` VALUES ('006A2020', ' 计算方法', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('006A2140', ' 软件工程', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('006A2190', ' 编译原理', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('006A2240', ' 计算机导论', '限选', '考试', '2', '18学生上机');
INSERT INTO `course` VALUES ('006A2250', ' 离散数学', '限选', '考试', '4', null);
INSERT INTO `course` VALUES ('006A2260', ' 汇编语言程序设计', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('006A2290', '数据库语言及应用', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('006A2390', 'WEB程序设计', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('006A2410', ' 接口与通信', '限选', '考试', '3', null);
INSERT INTO `course` VALUES ('006A2420', ' 计算机网络原理', '限选', '考试', '3', null);
INSERT INTO `course` VALUES ('006A2440', ' 应用系统分析与设计', '限选', '考查', '3', null);
INSERT INTO `course` VALUES ('006A2500', ' 面向对象高级程序设计', '限选', '考查', '4', null);
INSERT INTO `course` VALUES ('006A3180', ' 计算机图形学', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('006A3190', ' 人工智能概论', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('006A3220', ' 计算机系统结构', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('006A3250', ' 专业英语', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('006A3260', ' 多媒体技术原理', '任选', '考查', '3', null);
INSERT INTO `course` VALUES ('006A3270', ' 计算机控制技术', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('006A3420', ' 网络协议分析与编程', '任选', '考试', '3', null);
INSERT INTO `course` VALUES ('008C1010', ' 工程制图', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('010C1050', ' 线性代数', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('010C1070', ' 复变函数', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('010C1180', ' 概率论与数理统计', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('010C1281', ' 高等数学', '必修', '考试', '5', '一');
INSERT INTO `course` VALUES ('010C1282', ' 高等数学', '必修', '考试', '5', '一');
INSERT INTO `course` VALUES ('010C1301', ' 大学物理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('010C1302', ' 大学物理', '必修', '考试', '3', null);
INSERT INTO `course` VALUES ('010C3050', ' 数学建模', '任选', '考查', '2', null);
INSERT INTO `course` VALUES ('012C1011', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('012C1012', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('012C1013', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('012C1014', ' 体育', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('012C1020', ' 体育达标', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('013C1420', ' 马克思主义基本原理', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('013C1430', ' 中国近现代史纲要', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('013C1440', ' 思想道德修养与法律基础', '必修', '考查', '3', null);
INSERT INTO `course` VALUES ('013C1460', ' 形势与政策', '必修', '考查', '2', '92课外');
INSERT INTO `course` VALUES ('013C1461', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('013C1462', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('013C1463', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('013C1464', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('013C1465', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('013C1466', ' 形势与政策', '必修', '考查', '0', null);
INSERT INTO `course` VALUES ('015C1070', ' 军事训练', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('015C1080', ' 军事理论', '必修', '考查', '1', '22课外');
INSERT INTO `course` VALUES ('017C1030', ' 大学生健康教育', '必修', '考查', '1', null);
INSERT INTO `course` VALUES ('018C1030', ' 电子实习', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('018C1511', ' 物理实验', '必修', '考查', '1.5', null);
INSERT INTO `course` VALUES ('018C1512', ' 物理实验', '必修', '考查', '1.5', null);
INSERT INTO `course` VALUES ('018C1810', ' 金工实习', '必修', '考查', '2', null);
INSERT INTO `course` VALUES ('019C2101', ' 大学生职业规划与就业指导', '限选', '考查', '0.5', null);
INSERT INTO `course` VALUES ('019C2102', ' 大学生职业规划与就业指导', '限选', '考查', '0.5', null);

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` varchar(2) NOT NULL,
  `dept_name` varchar(16) DEFAULT NULL,
  `dept_explain` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('01', '中文', null);
INSERT INTO `dept` VALUES ('02', '外国语', null);
INSERT INTO `dept` VALUES ('03', '经管', null);
INSERT INTO `dept` VALUES ('04', '交通', null);
INSERT INTO `dept` VALUES ('05', '电子', null);
INSERT INTO `dept` VALUES ('06', '计算机', null);
INSERT INTO `dept` VALUES ('07', '土建', null);
INSERT INTO `dept` VALUES ('08', '机械', null);
INSERT INTO `dept` VALUES ('09', '化工', null);
INSERT INTO `dept` VALUES ('10', '数理', null);
INSERT INTO `dept` VALUES ('11', '政法', null);
INSERT INTO `dept` VALUES ('13', '纺织', null);
INSERT INTO `dept` VALUES ('21', '艺术', null);

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_stuId` varchar(10) NOT NULL,
  `grade_courseId` varchar(8) NOT NULL,
  `grade_grade` float DEFAULT NULL,
  `grade_time` varchar(50) DEFAULT NULL,
  `grade_explain` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`grade_stuId`,`grade_courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('AP0803104', '002C1064', '69', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803104', '006A1290', '84', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803105', '004A3280', '53', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803105', '006A1310', '84', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803106', '005A1430', '70', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803106', '006A1410', '61', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803107', '006A1060', '62', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803107', '006A2140', '70', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803108', '006A1280', '75', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803108', '006A2420', '93', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803109', '006A2260', '69', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803109', '006A2440', '64', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803110', '006A3260', '69', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803110', '010C1180', '75', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803201', '006A3420', '87', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803201', '012C1014', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803202', '013C1463', '68', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803202', '013C1465', '86', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803203', '018C1030', '75', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803203', '019C2102', '83', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803204', '006A1050', '88', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803204', '019C2101', '69', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803205', '005A1080', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803205', '006A2190', '81', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803305', '010C1282', '89', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803305', '013C1465', '93', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803307', '010C1301', '91', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803307', '019C2102', '99', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803308', '006A1050', '60', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803308', '012C1012', '83', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803309', '006A2190', '25', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803309', '013C1430', '65', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803310', '006A2410', '82', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803310', '013C1461', '64', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803503', '015C1070', '70', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803506', '008C1010', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803508', '006A1310', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803508', '012C1011', '90', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803509', '006A1410', '72', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803509', '013C1440', '81', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803510', '006A2140', '15', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803510', '015C1080', '65', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803511', '006A2420', '80', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803511', '017C1030', '67', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803512', '002C1062', '61', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803512', '006A2440', '85', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803513', '006A1440', '74', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803513', '006A3260', '79', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803514', '006A3420', '76', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803514', '010C1050', '65', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803606', '005C3100', '87', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803606', '006A2410', '78', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803607', '006A1330', '53', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803607', '006A3180', '72', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803608', '006A1400', '70', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803608', '006A3190', '88', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803609', '006A2020', '65', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803609', '006A3220', '76', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803701', '006A2500', '94', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803701', '012C1020', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803702', '006A3250', '75', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803702', '013C1460', '68', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803703', '010C3050', '88', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803704', '002C1061', '88', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803704', '013C1464', '91', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803705', '005A1260', '82', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803705', '006A2240', '92', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803706', '005C3090', '65', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803707', '006A1290', '85', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803707', '010C1281', '88', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803808', '006A3250', '77', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803808', '012C1013', '60', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803809', '010C3050', '83', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803809', '013C1420', '82', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803810', '013C1462', '79', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803810', '013C1464', '83', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803811', '005A1260', '63', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803811', '018C1512', '71', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803813', '005C3090', '92', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0803813', '018C1810', '75', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806301', '006A3180', '87', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806301', '018C1511', '62', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806302', '002C1063', '60', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806302', '006A3190', '71', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806304', '005A1510', '71', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806304', '006A3220', '82', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806305', '006A2250', '60', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806305', '006A3270', '63', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806306', '010C1070', '64', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806306', '013C1466', '60', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806307', '006A2500', '70', '2009-2010-2', null);
INSERT INTO `grade` VALUES ('AP0806307', '010C1302', '85', '2009-2010-2', null);

-- ----------------------------
-- Table structure for `stu`
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `stu_id` varchar(10) NOT NULL,
  `stu_name` varchar(10) DEFAULT NULL,
  `stu_sex` varchar(1) DEFAULT NULL,
  `stu_birth` date DEFAULT NULL,
  `stu_address` varchar(10) DEFAULT NULL,
  `stu_deptId` varchar(2) DEFAULT NULL,
  `stu_type` varchar(8) DEFAULT NULL,
  `stu_stay` tinyint(4) DEFAULT NULL,
  `stu_phone` varchar(7) DEFAULT NULL,
  `stu_photo` longblob,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('AP0803104', '刘树森', '男', '1989-02-06', '广东', '03', '团员', '1', '44522', null);
INSERT INTO `stu` VALUES ('AP0803105', '侯锦兵', '男', '1989-02-07', '广东', '03', '预备党员', '1', '44522', null);
INSERT INTO `stu` VALUES ('AP0803106', '胡伟', '男', '1989-02-08', '广东', '03', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('AP0803107', '张元元', '女', '1989-02-09', '湖北', '03', '预备党员', '1', '86912', '');
INSERT INTO `stu` VALUES ('AP0803108', '余海', '男', '1989-02-10', '江西', '03', '预备党员', '1', '44526', null);
INSERT INTO `stu` VALUES ('AP0803109', '余信明', '男', '1988-01-13', '广东', '03', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803110', '张明新', '男', '1988-01-14', '广东', '03', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('AP0803201', '梁丽', '女', '1988-01-15', '广东', '03', '团员', '1', '86911', null);
INSERT INTO `stu` VALUES ('AP0803202', '梁添', '男', '1988-01-16', '广东', '03', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('AP0803203', '麦林青', '男', '1988-01-17', '广东', '03', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('AP0803204', '莫达尚', '男', '1988-01-18', '广东', '03', '团员', '1', '44524', null);
INSERT INTO `stu` VALUES ('AP0803205', '欧扬严', '男', '1988-01-19', '广东', '03', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('AP0803303', '余维明', '男', '1989-02-23', '广东', '03', '团员', '1', '74909', null);
INSERT INTO `stu` VALUES ('AP0803304', '谭敏儿', '女', '1989-02-24', '广东', '03', '党员', '1', '87078', null);
INSERT INTO `stu` VALUES ('AP0803305', '伍玉珏', '女', '1988-03-04', '湖南', '03', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803307', '区芝颖', '女', '1989-09-16', '江西', '03', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803308', '王伟', '男', '1989-10-08', '福建', '03', '预备党员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803309', '孙小梅', '女', '1988-06-03', '广东', '03', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803310', '李伟新', '男', '1989-04-15', '安徽', '03', '群众', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803342', '余剑立', '男', '1989-02-22', '广东', '03', '团员', '1', '74909', null);
INSERT INTO `stu` VALUES ('AP0803503', '余浩然', '男', '1988-01-24', '广东', '03', '预备党员', '1', '44526', null);
INSERT INTO `stu` VALUES ('AP0803506', '俞威魏', '男', '1988-01-25', '广东', '03', '团员', '1', '44526', null);
INSERT INTO `stu` VALUES ('AP0803508', '袁斌', '男', '1988-01-26', '广东', '03', '群众', '1', '44526', null);
INSERT INTO `stu` VALUES ('AP0803509', '张平', '男', '1988-01-27', '重庆', '03', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('AP0803510', '张伟', '男', '1989-02-16', '广东', '03', '群众', '1', '44527', null);
INSERT INTO `stu` VALUES ('AP0803511', '赵洲明', '男', '1989-02-17', '广东', '03', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('AP0803512', '庄伟', '男', '1989-02-18', '广东', '03', '团员', '1', '44527', null);
INSERT INTO `stu` VALUES ('AP0803513', '洪彬斌', '男', '1989-02-02', '广东', '03', '团员', '1', '44521', null);
INSERT INTO `stu` VALUES ('AP0803514', '王泽清', '男', '1989-02-03', '广东', '03', '团员', '1', '44521', null);
INSERT INTO `stu` VALUES ('AP0803606', '王鑫', '男', '1988-01-20', '广东', '03', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('AP0803607', '刘一民', '男', '1988-01-21', '广东', '03', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('AP0803608', '姚健林', '男', '1988-01-22', '广东', '03', '团员', '1', '44525', null);
INSERT INTO `stu` VALUES ('AP0803609', '姚燕', '女', '1988-01-23', '湖北', '03', '团员', '1', '86906', null);
INSERT INTO `stu` VALUES ('AP0803701', '蔡锐钦', '男', '1986-01-12', '广东', '03', '团员', '0', '44531', '');
INSERT INTO `stu` VALUES ('AP0803702', '蔡智明', '男', '1986-01-13', '广东', '03', '团员', '1', '44520', '');
INSERT INTO `stu` VALUES ('AP0803703', '洪观正', '男', '1986-01-14', '广东', '03', '团员', '0', '44520', '');
INSERT INTO `stu` VALUES ('AP0803704', '王亮', '男', '1986-01-15', '湖南', '03', '预备党员', '1', '44520', '');
INSERT INTO `stu` VALUES ('AP0803705', '万泉河', '男', '1989-01-16', '福建', '03', '群众', '0', '44520', '');
INSERT INTO `stu` VALUES ('AP0803706', '李小武', '男', '1989-01-17', '广东', '03', '团员', '1', '44521', '');
INSERT INTO `stu` VALUES ('AP0803707', '张明新', '男', '1989-02-01', '广东', '03', '预备党员', '1', '44521', null);
INSERT INTO `stu` VALUES ('AP0803808', '罗振铭', '男', '1989-02-04', '广东', '03', '团员', '1', '44522', null);
INSERT INTO `stu` VALUES ('AP0803809', '邹嵩', '男', '1989-02-19', '广东', '03', '团员', '1', '44512', null);
INSERT INTO `stu` VALUES ('AP0803810', '李景华', '男', '1989-02-20', '广东', '03', '团员', '1', '44512', null);
INSERT INTO `stu` VALUES ('AP0803811', '蒋敏燕', '女', '1988-11-21', '湖南', '03', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0803812', '廖淑华', '女', '1989-02-21', '广东', '03', '团员', '1', '87079', null);
INSERT INTO `stu` VALUES ('AP0803813', '王青青', '男', '1989-02-05', '福建', '03', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('AP0806301', '余杰伟', '男', '1988-01-12', '广东', '06', '团员', '1', '44523', null);
INSERT INTO `stu` VALUES ('AP0806302', '区小鹏', '男', '1989-02-25', '广东', '06', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0806303', '肖明明', '男', '1989-02-26', '广东', '06', '团员', '1', '74908', null);
INSERT INTO `stu` VALUES ('AP0806304', '季铭军', '男', '1989-02-27', '广东', '06', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0806305', '靳荣声', '男', '1989-02-28', '广东', '06', '团员', '0', null, null);
INSERT INTO `stu` VALUES ('AP0806306', '刘文明', '男', '1989-03-01', '广东', '06', '群众', '1', '71908', null);
INSERT INTO `stu` VALUES ('AP0806307', '谢梦娴', '女', '1987-08-17', '广东', '06', '团员', '0', null, null);

-- ----------------------------
-- Table structure for `teach`
-- ----------------------------
DROP TABLE IF EXISTS `teach`;
CREATE TABLE `teach` (
  `teach_teacherId` varchar(9) NOT NULL,
  `teach_courseId` varchar(8) NOT NULL,
  `teach_time` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`teach_teacherId`,`teach_courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach
-- ----------------------------
INSERT INTO `teach` VALUES ('005000024', '005A1080', '2009-2010-2');
INSERT INTO `teach` VALUES ('005000027', '005A1080', '2009-2010-2');
INSERT INTO `teach` VALUES ('005000028', '005C3100', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000012', '006A2190', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000013', '006A2190', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000014', '006A2290', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000015', '006A2290', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000016', '006A2390', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000017', '006A2390', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000018', '006A3180', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000019', '006A3180', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000020', '006A3190', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000021', '006A3190', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000022', '006A3220', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000023', '006A3220', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000029', '006A1330', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000030', '006A1330', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000031', '006A1400', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000032', '006A1400', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000033', '006A2020', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000034', '006A2020', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000035', '006A2500', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000036', '006A2500', '2009-2010-2');
INSERT INTO `teach` VALUES ('006000037', '006A3250', '2009-2010-2');
INSERT INTO `teach` VALUES ('010000026', '010C3050', '2009-2010-2');
INSERT INTO `teach` VALUES ('013000010', '013C1466', '2009-2010-2');
INSERT INTO `teach` VALUES ('013000025', '013C1464', '2009-2010-2');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` varchar(9) NOT NULL,
  `teacher_name` varchar(10) DEFAULT NULL,
  `teacher_sex` varchar(2) DEFAULT NULL,
  `teacher_pro` varchar(8) DEFAULT NULL,
  `teacher_deptId` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('005000010', '冯小英', '女', '讲师', '05');
INSERT INTO `teacher` VALUES ('005000011', '李华倩', '女', '讲师', '05');
INSERT INTO `teacher` VALUES ('005000012', '张晚秋', '女', '讲师', '05');
INSERT INTO `teacher` VALUES ('005000024', '周敏怡', '女', '讲师', '05');
INSERT INTO `teacher` VALUES ('005000027', '张宏亮', '男', '副教授', '05');
INSERT INTO `teacher` VALUES ('005000028', '钱立峰', '男', '副教授', '05');
INSERT INTO `teacher` VALUES ('006000012', '周忠民', '男', '讲师', '06');
INSERT INTO `teacher` VALUES ('006000013', '秦一平', '女', '教授', '06');
INSERT INTO `teacher` VALUES ('006000014', '徐光明', '男', '教授', '06');
INSERT INTO `teacher` VALUES ('006000015', '赵明生', '男', '教授', '06');
INSERT INTO `teacher` VALUES ('006000016', '曹陆文', '男', '讲师', '06');
INSERT INTO `teacher` VALUES ('006000017', '曹英健', '男', '讲师', '06');
INSERT INTO `teacher` VALUES ('006000018', '马吉新', '女', '讲师', '06');
INSERT INTO `teacher` VALUES ('006000019', '陈秋丽', '女', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000020', '黄晓鹏', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000021', '刘扬', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000022', '黄新华', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000023', '郑志明', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000024', '林文辉', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000025', '刘伟建', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000029', '张维新', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000030', '马明辉', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000031', '郭凤岙', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000032', '何益容', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000033', '张湘建', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000034', '刘玉铭', '女', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000035', '胡志强', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000036', '罗晖怡', '男', '副教授', '06');
INSERT INTO `teacher` VALUES ('006000037', '赵士洲', '男', '讲师', '06');
INSERT INTO `teacher` VALUES ('010000026', '蔡阳', '男', '副教授', '10');
INSERT INTO `teacher` VALUES ('010000037', '区先民', '男', '教授', '10');
INSERT INTO `teacher` VALUES ('013000010', '江东晓', '男', '讲师', '13');
INSERT INTO `teacher` VALUES ('013000025', '李晓健', '男', '副教授', '13');
INSERT INTO `teacher` VALUES ('013000038', '黄锋', '男', '教授', '13');
INSERT INTO `teacher` VALUES ('013000039', '李永亮', '男', '教授', '13');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) DEFAULT NULL,
  `user_password` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'teacher', 'teacher');
INSERT INTO `user` VALUES ('3', 'student', 'student');
INSERT INTO `user` VALUES ('4', '1', '1');
INSERT INTO `user` VALUES ('5', '2', '2');
