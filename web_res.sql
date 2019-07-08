/*
Navicat MySQL Data Transfer

Source Server         : myServer
Source Server Version : 50723
Source Host           : 39.108.164.118:3306
Source Database       : web_res

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-07-08 10:30:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  `category_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`category_name`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'IT', 'IT');
INSERT INTO `category` VALUES ('2', 'Java', 'Java');
INSERT INTO `category` VALUES ('3', 'C++', 'C++');
INSERT INTO `category` VALUES ('4', 'PHP', 'PHP');
INSERT INTO `category` VALUES ('5', 'Python', 'Python');
INSERT INTO `category` VALUES ('6', 'Oracle', 'Oracle');
INSERT INTO `category` VALUES ('7', 'Hadoop', 'Hadoop');
INSERT INTO `category` VALUES ('8', 'ASP.NET', 'ASP.NET');
INSERT INTO `category` VALUES ('9', '文学类', '文学类');
INSERT INTO `category` VALUES ('10', '历史类', '历史类');
INSERT INTO `category` VALUES ('11', '哲学类', '哲学类');
INSERT INTO `category` VALUES ('12', '其他', '其他');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_uid` varchar(20) NOT NULL,
  `collect_rid` int(10) NOT NULL,
  PRIMARY KEY (`collect_uid`,`collect_rid`),
  KEY `collect_ibfk_2` (`collect_rid`) USING BTREE,
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`collect_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`collect_rid`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('wyu3116004259', '7');
INSERT INTO `collect` VALUES ('wyu3116004259', '9');
INSERT INTO `collect` VALUES ('wyu3116004259', '10');
INSERT INTO `collect` VALUES ('wyu00001', '18');
INSERT INTO `collect` VALUES ('wyu00001', '19');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_pid` int(10) NOT NULL,
  `comment_uid` varchar(20) NOT NULL,
  `comment_text` varchar(2048) NOT NULL,
  `comment_time` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_uid` (`comment_uid`) USING BTREE,
  KEY `comment_pid` (`comment_pid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', 'wyu3116004259', '我要参加！', '2019-04-13');
INSERT INTO `comment` VALUES ('3', '1', 'wyu3116004258', '我我我，精通java！！！', '2019-04-14');
INSERT INTO `comment` VALUES ('5', '6', 'wyu3116004254', '用了easyui，已经很好看了！', '2019-04-15');
INSERT INTO `comment` VALUES ('7', '6', 'wyu3116004255', '棒棒的！', '2019-04-17');
INSERT INTO `comment` VALUES ('25', '3', 'wyu3116004256', '挺好的！！！', '2019-04-29');
INSERT INTO `comment` VALUES ('26', '11', 'wyu3116004257', '老师，太难了！', '2019-05-09');
INSERT INTO `comment` VALUES ('27', '13', 'wyu00001', '111', '2019-05-24');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `follow_uid` varchar(20) NOT NULL,
  `followed_uid` varchar(20) NOT NULL,
  PRIMARY KEY (`follow_uid`,`followed_uid`),
  KEY `followed_uid` (`followed_uid`) USING BTREE,
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follow_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followed_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('wyu3116004259', 'wyu00001');
INSERT INTO `follow` VALUES ('wyu00001', 'wyu00002');
INSERT INTO `follow` VALUES ('wyu3116004259', 'wyu3116004257');
INSERT INTO `follow` VALUES ('wyu00001', 'wyu3116004259');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `post_uid` varchar(20) NOT NULL,
  `post_title` varchar(500) NOT NULL,
  `post_text` varchar(2048) NOT NULL,
  `post_image` varchar(500) DEFAULT NULL,
  `post_time` date NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_uid` (`post_uid`) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`post_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'wyu00001', '团队招人', '老师带的项目，需要人手，有兴趣的同学联系我。', 'upload/images/image.jpg', '2019-04-01');
INSERT INTO `post` VALUES ('2', 'wyu3116004259', '160803篮球交友', '软工160803篮球队成员，欢迎小姐姐来撩！', 'upload/images/psb1.jpg', '2019-04-02');
INSERT INTO `post` VALUES ('3', 'wyu00001', 'java问题', '请同学学习以下代码，尝试使用IDEA。', 'upload/images/post3.png', '2019-04-03');
INSERT INTO `post` VALUES ('6', 'wyu3116004257', 'web资源库设计', 'web资源库管理系统的后台管理UI页面如何设计才好看？', 'upload/images/post6.png', '2019-04-06');
INSERT INTO `post` VALUES ('9', 'wyu00001', '无重复字符的最长子串', '给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。\r\n\r\n示例 1:\r\n\r\n输入: \"abcabcbb\"\r\n输出: 3 \r\n解释: 因为无重复字符的最长子串是 \"abc\"，所以其长度为 3。\r\n示例 2:\r\n\r\n输入: \"bbbbb\"\r\n输出: 1\r\n解释: 因为无重复字符的最长子串是 \"b\"，所以其长度为 1。\r\n示例 3:\r\n\r\n输入: \"pwwkew\"\r\n输出: 3\r\n解释: 因为无重复字符的最长子串是 \"wke\"，所以其长度为 3。\r\n     请注意，你的答案必须是 子串 的长度，\"pwke\" 是一个子序列，不是子串。', '/upload/images/1557408174220.png, /upload/images/1557408174221.png', '2019-05-09');
INSERT INTO `post` VALUES ('10', 'wyu00002', '算法：最长回文子串', '给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。\r\n\r\n示例 1：\r\n\r\n输入: \"babad\"\r\n输出: \"bab\"\r\n注意: \"aba\" 也是一个有效答案。\r\n示例 2：\r\n\r\n输入: \"cbbd\"\r\n输出: \"bb\"', '/upload/images/1557408413210.png, /upload/images/1557408413211.png', '2019-05-09');
INSERT INTO `post` VALUES ('11', 'wyu00003', '正则表达式匹配', '给定一个字符串 (s) 和一个字符模式 (p)。实现支持 \'.\' 和 \'*\' 的正则表达式匹配。\r\n\r\n\'.\' 匹配任意单个字符。\r\n\'*\' 匹配零个或多个前面的元素。\r\n匹配应该覆盖整个字符串 (s) ，而不是部分字符串。\r\n\r\n说明:\r\n\r\ns 可能为空，且只包含从 a-z 的小写字母。\r\np 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。', '/upload/images/1557408591998.png, /upload/images/1557408591999.png, /upload/images/1557408592000.png', '2019-05-09');
INSERT INTO `post` VALUES ('12', 'wyu3116004258', ' 解数独', '编写一个程序，通过已填充的空格来解决数独问题。\r\n\r\n一个数独的解法需遵循如下规则：\r\n\r\n数字 1-9 在每一行只能出现一次。\r\n数字 1-9 在每一列只能出现一次。\r\n数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。\r\n空白格用 \'.\' 表示。', '/upload/images/1557408693303.png, /upload/images/1557408693304.png', '2019-05-09');
INSERT INTO `post` VALUES ('13', 'wyu00002', '最接近的三数之和', '给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。\r\n\r\n例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.\r\n\r\n与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).', '/upload/images/1557410190465.png, /upload/images/1557410190436.png', '2019-05-09');

-- ----------------------------
-- Table structure for `register`
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `register_id` varchar(20) NOT NULL,
  `register_password` varchar(20) NOT NULL,
  `register_name` varchar(20) DEFAULT NULL,
  `register_class` varchar(20) DEFAULT NULL,
  `register_level` varchar(20) NOT NULL DEFAULT 'student',
  `register_check` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('student2', '123456', 'student2', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student3', '123456', 'student3', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student4', '123456', 'student4', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student5', '123456', 'student5', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student6', '123456', 'student6', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student7', '123456', 'student7', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student8', '123456', 'student8', '160803', '学生', '0');
INSERT INTO `register` VALUES ('student9', '123456', 'student9', '160803', '学生', '0');
INSERT INTO `register` VALUES ('teacher2', '123456', 'teacher2', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher3', '123456', 'teacher3', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher4', '123456', 'teacher4', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher5', '123456', 'teacher5', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher6', '123456', 'teacher6', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher7', '123456', 'teacher7', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher8', '123456', 'teacher8', '', '教师', '0');
INSERT INTO `register` VALUES ('teacher9', '123456', 'teacher9', '', '教师', '0');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(10) NOT NULL AUTO_INCREMENT,
  `resource_cid` int(10) NOT NULL,
  `resource_uid` varchar(20) NOT NULL,
  `resource_name` varchar(500) NOT NULL,
  `resource_image` varchar(500) DEFAULT NULL,
  `resource_url` varchar(250) NOT NULL,
  `resource_desc` varchar(2048) DEFAULT NULL,
  `resource_level` varchar(10) NOT NULL DEFAULT '初级',
  `resource_time` date NOT NULL,
  `resource_good` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`),
  KEY `resource_cid` (`resource_cid`) USING BTREE,
  KEY `resource_uid` (`resource_uid`) USING BTREE,
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`resource_cid`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`resource_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '2', 'wyu00001', 'Spring4 SpringMVC4 Mabatis3 讲义', 'upload/images/QQͼƬ20170830115707.jpg', 'upload/resources/web_education.sql', 'MyBatis 是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC，使开发者只需关注 SQL 语句本身，而不用再花费精力去处理诸如注册驱动、创建 Connection、配置 Statement 等繁杂过程。', '中级', '2019-04-01', '0');
INSERT INTO `resource` VALUES ('2', '1', 'wyu3116004259', '教学管理系统源码', 'upload/images/Scan0006.jpg', 'upload/resources/student.doc', '随着时代发展、社会进步以及教育理念的提升，参加并接受高等教育的人数也在逐年攀升。全国各地，各所高校的招生人数相较过去，都有了大幅的增长。与此同时，社会经济的发展也使得每所高校当中，来自其他省份地区的学生增多。五湖四海的学子汇聚到一所高校共同学习已经不再是罕见之事，各高校紧随社会浪潮而对本校开设课程进行增删、调整师资力量等情况也是稀松平常。\r由于这一系列变化的发生，导致了许多从前不曾有的新问题。例如由于大幅增长的学生人数，导致在学生选课、学生成绩查询等方面难以及时统筹安排到位，难免会出现一些意外情况，致使学生难以及时享受到应有的权利。又例如在统计计算相关项目时，由于学生数量众多、学生来自的地域众多，使统计计算工作的工作量变得无比庞大。\r在众多因素和情况之下，我们的课题的意义就凸显出来了。\r作为一个教学管理系统，能够通过计算机来代替人与人之间或是其他原始的传递消息方式，以更高效、更优良、更合理的方式去统筹安排学生或是教师的相应工作和任务，同时还能够将各种分类、统计等工作交由计算机而非人工处理，既降低出错的几率，同时还能够提高各项工作的效率，这就是我们这一课题的设计意义。\r在我们课题的设计意义的引导下，我们的设计目的也显得尤为明确。我们的课题的设计目的，不仅是为了解放人工繁琐的计算统计查找等操作，同时也是为了提高相应工作的工作效率，以此达到方便师生，服务师生的目的，从而使整个教学管理变得更加专业、方便、快捷且易操作。', '初级', '2019-04-02', '0');
INSERT INTO `resource` VALUES ('4', '3', 'wyu3116004256', '图书管理系统ER图', 'upload/images/student.png', 'upload/resources/student.zip', '通过对图书馆管理系统中数据及数据处理过程的分析，抽象出    用户（user），书库（bookroom），图书类别（bookcatagory），图书（book），借阅等级（borrowlevel），借阅证（borrowcard），借阅（borrow），罚款单（ticket）等8个实体，E-R图如下图所示。', '初级', '2019-04-03', '0');
INSERT INTO `resource` VALUES ('5', '6', 'wyu3116004253', '学生信息管理系统', 'upload/images/wms.png', 'upload/resources/wms.sql', '本程序主要由五个模块构成，分别是：查找学生信息、添加学生信息、删除学生信息、修改学生信息和显示所有学生信息。\r \r1. 查找学生信息：利用学号通过mysql语句在数据库里查找学生信息，如果找到，则返回true，并把该学生的信息读到内存。如果没找到，则返回false。  \r2. 添加学生信息：通过查找模块查询想要添加的学号是否已存在，如果不存在，则继续填写该生其他信息，并利用mysql语句插入数据库中。\r3. 删除学生信息：通过查找模块查询想要删除的学号是否存在在数据库，如果存在，则执行mysql删除语句，把该生信息从数据库中删除掉。\r4. 修改学生信息：通过查找模块查询想要修改的学生是否存在在数据库，如果存在，则把该生信息显示出来，进行修改，并通过mysql语句更新数据库。\r5. 显示所有学生信息：通过mysql语句，遍历数据库，把所有学生信息显示在列表框里。', '初级', '2019-04-04', '0');
INSERT INTO `resource` VALUES ('6', '7', 'wyu3116004258', '阿里巴巴Java开发手册（详尽版）', 'upload/images/hadoop.png', 'upload/resources/hadoop.doc', '《阿里巴巴 Java 开发手册》是阿里巴巴集团技术团队的集体智慧结晶和经验总结，经历了多次大规模一线实战的检验及不断完善，系统化地整理成册，回馈给广大开发者。现代软件行业的高速发展对开发者的综合素质要求越来越高，因为不仅是编程知识点，其它维度的知识点也会影响到软件的最终交付质量。比如：数据库的表结构和索引设计缺陷可能带来软件上的架构缺陷或性能风险；工程结构混乱导致后续维护艰难；没有鉴权的漏洞代码易被黑客攻击等等。所以本手册以 Java 开发者为中心视角，划分为编程规约、异常日志、单元测试、安全规约、MySQL 数据库、工程结构、设计规约七个维度，再根据内容特征，细分成若干二级子目录。根据约束力强弱及故障敏感性，规约依次分为强制、推荐、参考三大类。对于规约条目的延伸信息中，“说明”对规约做了适当扩展和解释；“正例”提倡什么样的编码和实现方式；“反例”说明需要提防的雷区，以及真实的错误案例。', '初级', '2019-04-05', '0');
INSERT INTO `resource` VALUES ('7', '1', 'wyu3116004257', 'Spring4 SpringMVC4 Mabatis3 讲义', 'upload/images/System.png', 'upload/resources/System.zip', 'Spring 是于 2003 年兴起的一个轻量级的 Java 开发框架，它是为了解决企业应用开发的 复杂性而创建的。Spring 的核心是控制反转（IoC）和面向切面编程（AOP）。简单来说，Spring 是一个分层的 Java SE/EE full-stack(一站式)轻量级开源框架。\r\nSpringMVC也叫 Spring web mvc，属于表现层的框架。SpringMVC 是 Spring 框架的一部 分，是在 Spring3.0 后发布的。 \r\nMyBatis 是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC，使开发者只需关注 SQL 语句本身，而不用再花费精力去处理诸如注册驱动、创建 Connection、配置 Statement 等繁杂过程。', '初级', '2019-04-06', '0');
INSERT INTO `resource` VALUES ('8', '8', 'wyu00001', '教学管理系统源码', 'upload/images/web.png', 'upload/resources/Web.zip', '随着时代发展、社会进步以及教育理念的提升，参加并接受高等教育的人数也在逐年攀升。全国各地，各所高校的招生人数相较过去，都有了大幅的增长。与此同时，社会经济的发展也使得每所高校当中，来自其他省份地区的学生增多。五湖四海的学子汇聚到一所高校共同学习已经不再是罕见之事，各高校紧随社会浪潮而对本校开设课程进行增删、调整师资力量等情况也是稀松平常。\r由于这一系列变化的发生，导致了许多从前不曾有的新问题。例如由于大幅增长的学生人数，导致在学生选课、学生成绩查询等方面难以及时统筹安排到位，难免会出现一些意外情况，致使学生难以及时享受到应有的权利。又例如在统计计算相关项目时，由于学生数量众多、学生来自的地域众多，使统计计算工作的工作量变得无比庞大。\r在众多因素和情况之下，我们的课题的意义就凸显出来了。\r作为一个教学管理系统，能够通过计算机来代替人与人之间或是其他原始的传递消息方式，以更高效、更优良、更合理的方式去统筹安排学生或是教师的相应工作和任务，同时还能够将各种分类、统计等工作交由计算机而非人工处理，既降低出错的几率，同时还能够提高各项工作的效率，这就是我们这一课题的设计意义。\r在我们课题的设计意义的引导下，我们的设计目的也显得尤为明确。我们的课题的设计目的，不仅是为了解放人工繁琐的计算统计查找等操作，同时也是为了提高相应工作的工作效率，以此达到方便师生，服务师生的目的，从而使整个教学管理变得更加专业、方便、快捷且易操作。', '中级', '2019-04-08', '1');
INSERT INTO `resource` VALUES ('9', '1', 'wyu3116004257', '图书管理系统ER图', 'upload/images/libraryER.png', 'upload/resources/libraryER.vsd', '通过对图书馆管理系统中数据及数据处理过程的分析，抽象出    用户（user），书库（bookroom），图书类别（bookcatagory），图书（book），借阅等级（borrowlevel），借阅证（borrowcard），借阅（borrow），罚款单（ticket）等8个实体，E-R图如下图所示。', '初级', '2019-04-10', '1');
INSERT INTO `resource` VALUES ('10', '2', 'wyu3116004259', '学生信息管理系统', 'upload/images/student_information.png', 'upload/resources/student_information.zip', '本程序主要由五个模块构成，分别是：查找学生信息、添加学生信息、删除学生信息、修改学生信息和显示所有学生信息。\r \r1. 查找学生信息：利用学号通过mysql语句在数据库里查找学生信息，如果找到，则返回true，并把该学生的信息读到内存。如果没找到，则返回false。  \r2. 添加学生信息：通过查找模块查询想要添加的学号是否已存在，如果不存在，则继续填写该生其他信息，并利用mysql语句插入数据库中。\r3. 删除学生信息：通过查找模块查询想要删除的学号是否存在在数据库，如果存在，则执行mysql删除语句，把该生信息从数据库中删除掉。\r4. 修改学生信息：通过查找模块查询想要修改的学生是否存在在数据库，如果存在，则把该生信息显示出来，进行修改，并通过mysql语句更新数据库。\r5. 显示所有学生信息：通过mysql语句，遍历数据库，把所有学生信息显示在列表框里。', '中级', '2019-04-16', '1');
INSERT INTO `resource` VALUES ('18', '2', 'wyu00001', '阿里巴巴Java开发手册（详尽版）', '/upload/images/1557405762373.png, /upload/images/1557405762374.png', '/upload/resources/1557405762362.zip', '《阿里巴巴 Java 开发手册》是阿里巴巴集团技术团队的集体智慧结晶和经验总结，经历了多次大规模一线实战的检验及不断完善，系统化地整理成册，回馈给广大开发者。现代软件行业的高速发展对开发者的综合素质要求越来越高，因为不仅是编程知识点，其它维度的知识点也会影响到软件的最终交付质量。比如：数据库的表结构和索引设计缺陷可能带来软件上的架构缺陷或性能风险；工程结构混乱导致后续维护艰难；没有鉴权的漏洞代码易被黑客攻击等等。所以本手册以 Java 开发者为中心视角，划分为编程规约、异常日志、单元测试、安全规约、MySQL 数据库、工程结构、设计规约七个维度，再根据内容特征，细分成若干二级子目录。根据约束力强弱及故障敏感性，规约依次分为强制、推荐、参考三大类。对于规约条目的延伸信息中，“说明”对规约做了适当扩展和解释；“正例”提倡什么样的编码和实现方式；“反例”说明需要提防的雷区，以及真实的错误案例。 ', '中级', '2019-05-09', '1');
INSERT INTO `resource` VALUES ('19', '1', 'wyu00002', 'Spring4 SpringMVC4 Mabatis3 讲义', '/upload/images/1557406229963.png, /upload/images/1557406229966.png, /upload/images/1557406230004.png', '/upload/resources/1557406229765.7z', 'Spring 是于 2003 年兴起的一个轻量级的 Java 开发框架，它是为了解决企业应用开发的 复杂性而创建的。Spring 的核心是控制反转（IoC）和面向切面编程（AOP）。简单来说，Spring 是一个分层的 Java SE/EE full-stack(一站式)轻量级开源框架。\r\nSpringMVC也叫 Spring web mvc，属于表现层的框架。SpringMVC 是 Spring 框架的一部 分，是在 Spring3.0 后发布的。 \r\nMyBatis 是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC，使开发者只需关注 SQL 语句本身，而不用再花费精力去处理诸如注册驱动、创建 Connection、配置 Statement 等繁杂过程。', '高级', '2019-05-09', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `student_name` varchar(20) DEFAULT NULL,
  `student_sex` varchar(10) DEFAULT NULL,
  `student_birth` date DEFAULT NULL,
  `student_class` varchar(20) NOT NULL DEFAULT '',
  `student_desc` varchar(150) DEFAULT '',
  PRIMARY KEY (`student_id`),
  KEY `student_id` (`student_id`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('wyu3116004251', 'student9', '男', '1995-05-28', '160803', '我是student9！我是student9！我是student9！我是student9！');
INSERT INTO `student` VALUES ('wyu3116004252', 'student8', '女', '1997-12-03', '160803', '我是student8！我是student8！我是student8！我是student8！');
INSERT INTO `student` VALUES ('wyu3116004253', 'student7', '男', '1995-07-18', '160803', '我是student7！我是student7！我是student7！我是student7！');
INSERT INTO `student` VALUES ('wyu3116004254', 'student6', '女', '1996-07-11', '160803', '我是student6！我是student6！我是student6！我是student6！');
INSERT INTO `student` VALUES ('wyu3116004255', 'student5', '男', '1997-06-12', '160803', '我是student5！我是student5！我是student5！我是student5！');
INSERT INTO `student` VALUES ('wyu3116004256', 'student4', '女', '1998-01-09', '160803', '我是student4！我是student4！我是student4！我是student4！');
INSERT INTO `student` VALUES ('wyu3116004257', 'student3', '男', '1997-08-19', '160803', '我是student3！我是student3！我是student3！我是student3！');
INSERT INTO `student` VALUES ('wyu3116004258', 'student2', '男', '1996-12-24', '160803', '我是student2！我是student2！我是student2！我是student2！');
INSERT INTO `student` VALUES ('wyu3116004259', 'student1', '男', '1997-05-02', '160803', '我是student1！我是student1！我是student1！我是student1！');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` varchar(20) NOT NULL,
  `teacher_name` varchar(20) DEFAULT NULL,
  `teacher_sex` varchar(10) DEFAULT NULL,
  `teacher_birth` date DEFAULT NULL,
  `teacher_desc` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `teacher_id` (`teacher_id`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('wyu00001', 'teacher', '男', '2019-01-05', 'Write the code.       Change the world.');
INSERT INTO `teacher` VALUES ('wyu00002', 'teacher2', '男', '2019-01-01', '我是teacher2！我是teacher2！我是teacher2！我是teacher2！我是teacher2！我是teacher2！');
INSERT INTO `teacher` VALUES ('wyu00003', 'teacher3', '女', '2019-01-01', '我是teacher3！我是teacher3！我是teacher3！我是teacher3！我是teacher3！我是teacher3！我是teacher3！');
INSERT INTO `teacher` VALUES ('wyu00004', 'teacher4', null, null, null);
INSERT INTO `teacher` VALUES ('wyu00005', 'teacher5', null, null, null);
INSERT INTO `teacher` VALUES ('wyu00006', 'teacher6', null, null, null);
INSERT INTO `teacher` VALUES ('wyu00007', 'teacher7', null, null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_level` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', '管理员');
INSERT INTO `user` VALUES ('ethan', '123456', '超级管理员');
INSERT INTO `user` VALUES ('wyu00001', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00002', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00003', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00004', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00005', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00006', '123456', '教师');
INSERT INTO `user` VALUES ('wyu00007', '123456', '教师');
INSERT INTO `user` VALUES ('wyu3116004251', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004252', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004253', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004254', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004255', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004256', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004257', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004258', '123456', '学生');
INSERT INTO `user` VALUES ('wyu3116004259', '123456', '学生');
