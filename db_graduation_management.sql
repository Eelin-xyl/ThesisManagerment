/*
Navicat MySQL Data Transfer

Source Server         : mybase
Source Server Version : 80024
Source Host           : localhost:3306
Source Database       : db_graduation_management

Target Server Type    : MYSQL
Target Server Version : 80024
File Encoding         : 65001

Date: 2021-05-21 01:36:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '院系表，id为主键',
  `departmentName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('35', 'SCHOOL OF ADVANCED TECHNOLOGY');
INSERT INTO `department` VALUES ('36', 'DESIGN SCHOOL');
INSERT INTO `department` VALUES ('37', 'ACADEMY OF FILM AND CREATIVE TECHNOLOGY');
INSERT INTO `department` VALUES ('38', 'SCHOOL OF HUMANITIES AND SOCIAL SCIENCES');
INSERT INTO `department` VALUES ('39', 'INTERNATIONAL BUSINESS SCHOOL SUZHOU');
INSERT INTO `department` VALUES ('40', 'SCHOOL OF SCIENCE');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '专业表，id为主键',
  `majorName` varchar(50) DEFAULT NULL,
  `departmentId` int DEFAULT NULL COMMENT '关联院系',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', 'Communications and Networking', '35');
INSERT INTO `major` VALUES ('2', 'Computing', '35');
INSERT INTO `major` VALUES ('3', 'Electrical and Electronic Engineering', '35');
INSERT INTO `major` VALUES ('4', 'Intelligent Science', '35');
INSERT INTO `major` VALUES ('5', 'Mechatronics and Robotics', '35');
INSERT INTO `major` VALUES ('6', 'Architecture', '36');
INSERT INTO `major` VALUES ('7', 'Civil Engineering', '36');
INSERT INTO `major` VALUES ('8', 'Industrial Design', '36');
INSERT INTO `major` VALUES ('9', 'Urban Planning and Design', '36');
INSERT INTO `major` VALUES ('10', 'Film and TV Arts', '37');
INSERT INTO `major` VALUES ('11', 'Applied Linguistics', '38');
INSERT INTO `major` VALUES ('12', 'China Studies', '38');
INSERT INTO `major` VALUES ('13', 'International Studies', '38');
INSERT INTO `major` VALUES ('14', 'Literature', '38');
INSERT INTO `major` VALUES ('15', 'Media and Communication', '38');
INSERT INTO `major` VALUES ('16', 'Translation and Interpreting', '38');
INSERT INTO `major` VALUES ('17', 'Accounting', '39');
INSERT INTO `major` VALUES ('18', 'Economics', '39');
INSERT INTO `major` VALUES ('19', 'Finance', '39');
INSERT INTO `major` VALUES ('20', 'Intelligent Operations and Marketing', '39');
INSERT INTO `major` VALUES ('21', 'Strategic Management and Organisation', '39');
INSERT INTO `major` VALUES ('22', 'Applied Mathematics', '40');
INSERT INTO `major` VALUES ('23', 'Biological Sciences', '40');
INSERT INTO `major` VALUES ('24', 'Chemistry', '40');
INSERT INTO `major` VALUES ('25', 'Financial Mathematics', '40');
INSERT INTO `major` VALUES ('26', 'Foundational Mathematics', '40');
INSERT INTO `major` VALUES ('27', 'Health and Environmental Sciences', '40');
INSERT INTO `major` VALUES ('28', 'Physics', '40');
INSERT INTO `major` VALUES ('29', 'Pure Mathematics', '40');
INSERT INTO `major` VALUES ('30', 'Statistics and Actuarial Science', '40');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentNo` varchar(20) DEFAULT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `majorId` int NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `majorId` (`majorId`) USING BTREE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('22', 's0001', 'Wang', 'Male', '1', 'B001', 's0001', '2021-05-13 19:01:18', '18712345678');
INSERT INTO `student` VALUES ('24', '2032666', 'Michanel', 'Female', '6', 'senior', '2032666', '2021-05-14 18:31:38', '6666666');
INSERT INTO `student` VALUES ('25', '7', 'Eeee', 'Male', '1', '222', 'admin', '2021-05-14 18:33:07', '1234567');
INSERT INTO `student` VALUES ('26', '9', '9', 'Female', '1', 'junior', 'admin', '2021-05-14 18:34:10', '9999999');
INSERT INTO `student` VALUES ('28', '2032111', 'cat', 'Female', '3', 'senior', 'admin', '2021-05-14 18:45:25', '1111111');
INSERT INTO `student` VALUES ('29', '2032222', 'dog', 'Male', '1', 'junior', 'admin', '2021-05-16 15:11:48', '6666666');
INSERT INTO `student` VALUES ('30', '2032333', 'lion', 'Male', '15', 'senior', 'admin', '2021-05-16 15:14:42', '15195828615');
INSERT INTO `student` VALUES ('31', '2032686', 'Eelin', 'Male', '15', 'pg', 'admin', '2021-05-18 15:44:27', '1111111');
INSERT INTO `student` VALUES ('32', '555', '321', 'Male', '16', 'senior', '555', '2021-05-18 16:11:09', '15195828615');
INSERT INTO `student` VALUES ('36', '2369653', 'Peter', 'Male', '2', 'pg', 'admin', '2021-05-21 01:00:58', '34584462648');
INSERT INTO `student` VALUES ('37', '236186', 'nioeaf uiqew', 'Female', '4', 'junior', 'admin', '2021-05-21 01:01:03', '33334444658');
INSERT INTO `student` VALUES ('38', '139563', 'ncoiea NJK', 'Female', '14', 'pg', 'admin', '2021-05-21 01:01:07', '33334444221');
INSERT INTO `student` VALUES ('39', '456542', 'OFDNW nij', 'Male', '18', 'bbaas', 'admin', '2021-05-21 01:01:12', '66668888325');
INSERT INTO `student` VALUES ('40', '231446', 'Tom', 'Male', '21', 'senior', 'admin', '2021-05-21 01:01:16', '446683293');
INSERT INTO `student` VALUES ('41', '6326926', 'vnesiog bnjk', 'Female', '25', 'senior', 'admin', '2021-05-21 01:01:22', '74419633294');
INSERT INTO `student` VALUES ('42', '2344965', 'cnaufcea  aeku', 'Male', '12', 'junior', 'admin', '2021-05-21 01:01:25', '44634326659');
INSERT INTO `student` VALUES ('43', '2213463', 'afbukae rne a', 'Female', '8', 'pg', 'admin', '2021-05-21 01:01:32', '26262365323');
INSERT INTO `student` VALUES ('44', '13348313', 'bcei feaf ', 'Female', '12', 'eavea', 'admin', '2021-05-21 01:00:53', '35659461843');
INSERT INTO `student` VALUES ('45', '131313', 'canlwk nlakf', 'Male', '15', 'junior', 'admin', '2021-05-21 01:06:43', '46135168286');

-- ----------------------------
-- Table structure for `student_opening_report_task_book`
-- ----------------------------
DROP TABLE IF EXISTS `student_opening_report_task_book`;
CREATE TABLE `student_opening_report_task_book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生提交开题报告和任务书',
  `studentId` int NOT NULL,
  `studentOpeningResport` varchar(100) DEFAULT NULL,
  `studentTaskBook` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `completion` int DEFAULT NULL COMMENT '1-未通过  2-通过',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `student_opening_report_task_book_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_opening_report_task_book
-- ----------------------------
INSERT INTO `student_opening_report_task_book` VALUES ('11', '22', 'E:\\ThesisManagement\\student\\22\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('12', '24', 'E:\\ThesisManagement\\student\\24\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('13', '25', 'E:\\ThesisManagement\\student\\25\\PRD.docx', null, null, null);
INSERT INTO `student_opening_report_task_book` VALUES ('14', '26', 'E:\\ThesisManagement\\student\\26\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, null);
INSERT INTO `student_opening_report_task_book` VALUES ('15', '30', 'E:\\ThesisManagement\\student\\30\\ALA Cover Sheet.doc', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('16', '31', 'E:\\ThesisManagement\\student\\31\\Lab1-RMI.pdf', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('17', '32', 'E:\\ThesisManagement\\student\\32\\Lect5-JDBCJPA.pdf', null, null, '2');

-- ----------------------------
-- Table structure for `student_score`
-- ----------------------------
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE `student_score` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生论文成绩表',
  `studentId` int NOT NULL,
  `thesisResult` int DEFAULT NULL,
  `inputMan` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `student_score_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('3', '22', '95', 't0001');
INSERT INTO `student_score` VALUES ('4', '30', '67', 'qqqq');
INSERT INTO `student_score` VALUES ('5', '31', '100', 'Grey');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacherNo` varchar(20) DEFAULT NULL,
  `teacherName` varchar(20) DEFAULT NULL,
  `departmentId` int NOT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('16', 't0001', 't0001', '38', 'Male', 'admin', '2021-05-14 11:14:17', '11482575678');
INSERT INTO `teacher` VALUES ('17', 't0002', 't0002', '37', 'Male', 'admin', '2021-05-14 11:16:22', '13931141937');
INSERT INTO `teacher` VALUES ('18', 't0003', 't0003', '38', 'Male', 'admin', '2021-05-14 11:16:43', '13935479537');
INSERT INTO `teacher` VALUES ('19', '2032999', 'andrew', '40', 'Male', 'admin', '2021-05-14 11:17:16', '15147858615');
INSERT INTO `teacher` VALUES ('20', 't11', 'qqqq', '35', 'Male', 'admin', '2021-05-16 15:15:19', '15195828615');
INSERT INTO `teacher` VALUES ('22', '100', 'Grey', '36', 'Female', 'admin', '2021-05-18 17:06:11', '15000000003');
INSERT INTO `teacher` VALUES ('25', '151135', 'cnawofcna wd w', '39', 'Male', 'admin', '2021-05-21 01:00:17', '7962362');
INSERT INTO `teacher` VALUES ('26', 'cefa156f', 'vckyewrgfkwa', '36', 'Female', 'admin', '2021-05-21 01:00:43', '864135183');
INSERT INTO `teacher` VALUES ('27', '151542', 'cnaie arf ', '39', 'Female', 'admin', '2021-05-21 01:00:39', '999999');
INSERT INTO `teacher` VALUES ('28', '1234153', 'NFD eac', '38', 'Male', 'admin', '2021-05-21 01:00:35', '54651351');
INSERT INTO `teacher` VALUES ('29', '8468321', 'abFUAk e', '35', 'Female', 'admin', '2021-05-21 01:00:31', '13513831813');
INSERT INTO `teacher` VALUES ('30', '345313', 'ncaucNbuwa', '35', 'Male', 'admin', '2021-05-21 01:00:27', '51386546584');
INSERT INTO `teacher` VALUES ('31', '131352', 'KBDBcnaem', '37', 'Female', 'admin', '2021-05-21 01:00:22', '31535118132');
INSERT INTO `teacher` VALUES ('32', '413548', 'nAFUlcas e', '37', 'Male', 'admin', '2021-05-21 01:02:01', '12316531681');
INSERT INTO `teacher` VALUES ('33', '3154681', 'nceeNvf efe', '36', 'Male', 'admin', '2021-05-21 01:02:36', '31351313168');
INSERT INTO `teacher` VALUES ('34', '131351', 'cnawi nw', '38', 'Male', 'admin', '2021-05-21 01:03:04', '51384354864');
INSERT INTO `teacher` VALUES ('35', '313431', 'kvneku nc', '39', 'Female', 'admin', '2021-05-21 01:03:45', '13183431835');
INSERT INTO `teacher` VALUES ('36', '135131', 'cnaw uhfak ', '35', 'Female', 'admin', '2021-05-21 01:04:54', '31351313135');
INSERT INTO `teacher` VALUES ('37', '131813', 'cawueifb kej', '37', 'Male', 'admin', '2021-05-21 01:06:04', '13168765135');

-- ----------------------------
-- Table structure for `teacher_opening_report_task_book`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_opening_report_task_book`;
CREATE TABLE `teacher_opening_report_task_book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '教师发布任务书和开题报告',
  `teacherId` int NOT NULL,
  `openingReport` varchar(100) DEFAULT NULL,
  `taskBook` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `thesisTitleId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  KEY `thesisTitleId` (`thesisTitleId`) USING BTREE,
  CONSTRAINT `teacher_opening_report_task_book_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`),
  CONSTRAINT `teacher_opening_report_task_book_ibfk_2` FOREIGN KEY (`thesisTitleId`) REFERENCES `thesis_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_opening_report_task_book
-- ----------------------------
INSERT INTO `teacher_opening_report_task_book` VALUES ('26', '16', null, 'E:\\ThesisManagement\\teacher\\16\\22\\renwushu.docx', null, '22');
INSERT INTO `teacher_opening_report_task_book` VALUES ('27', '19', null, 'E:\\ThesisManagement\\teacher\\19\\25\\PRD.docx', null, '25');
INSERT INTO `teacher_opening_report_task_book` VALUES ('28', '22', 'E:\\ThesisManagement\\teacher\\22\\28\\CPT402-CW2-Groups.pdf', '', null, '28');
INSERT INTO `teacher_opening_report_task_book` VALUES ('30', '22', null, 'E:\\ThesisManagement\\teacher\\22\\29\\Lect5-JDBCJPA.pdf', null, '29');

-- ----------------------------
-- Table structure for `teacher_progress_notification`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_progress_notification`;
CREATE TABLE `teacher_progress_notification` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '进度通知表，教师填写',
  `context` varchar(1000) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `studentId` int DEFAULT NULL,
  `teacherId` int DEFAULT NULL,
  `state` int DEFAULT NULL COMMENT '0--初始化  1---未完成  2---已完成',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `teacher_progress_notification_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `teacher_progress_notification_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_progress_notification
-- ----------------------------
INSERT INTO `teacher_progress_notification` VALUES ('6', 'wqe', 't0001', '2021-05-14 11:30:28', '22', '16', '2');
INSERT INTO `teacher_progress_notification` VALUES ('7', 'shu', 'andrew', '2021-05-14 11:37:36', '24', '19', '2');
INSERT INTO `teacher_progress_notification` VALUES ('8', '', 'qqqq', '2021-05-16 15:17:28', '30', '20', '0');
INSERT INTO `teacher_progress_notification` VALUES ('9', 'asdasd', 'qqqq', '2021-05-16 15:18:26', '30', '20', '2');
INSERT INTO `teacher_progress_notification` VALUES ('10', 'dierjieduan', 'Grey', '2021-05-18 15:59:16', '31', '22', '2');

-- ----------------------------
-- Table structure for `thesis_information`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_information`;
CREATE TABLE `thesis_information` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生提交毕业论文表',
  `studentId` int NOT NULL,
  `thesisText` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `thesis_information_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_information
-- ----------------------------
INSERT INTO `thesis_information` VALUES ('14', '22', 'E:\\ThesisManagement\\student\\22\\lunwen.doc', '2', null);
INSERT INTO `thesis_information` VALUES ('15', '24', 'E:\\ThesisManagement\\student\\24\\PRD.docx', '2', null);
INSERT INTO `thesis_information` VALUES ('16', '30', 'E:\\ThesisManagement\\student\\30\\07_INT404_Image_Morphological.pdf', '2', null);
INSERT INTO `thesis_information` VALUES ('17', '31', 'E:\\ThesisManagement\\student\\31\\XJTLU Module Handbook CPT402-2020-21.docx', '2', null);

-- ----------------------------
-- Table structure for `thesis_paper`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_paper`;
CREATE TABLE `thesis_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` int DEFAULT NULL,
  `paperInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `thesis_paper_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_paper
-- ----------------------------
INSERT INTO `thesis_paper` VALUES ('1', '22', 'E:\\ThesisManagement\\thesis\\22\\稿子.docx');
INSERT INTO `thesis_paper` VALUES ('2', '30', 'E:\\ThesisManagement\\thesis\\30\\03_INT404_ Image_Enhancment.pdf');
INSERT INTO `thesis_paper` VALUES ('3', '31', 'E:\\ThesisManagement\\thesis\\31\\PRD.docx');

-- ----------------------------
-- Table structure for `thesis_title`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_title`;
CREATE TABLE `thesis_title` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '教师提交课题',
  `thesisName` varchar(30) DEFAULT NULL,
  `teacherId` int NOT NULL,
  `submitTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '课题未审核-1 已审核通过-2 不通过-3',
  `inputMan` varchar(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `thesis_title_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_title
-- ----------------------------
INSERT INTO `thesis_title` VALUES ('22', 'A topic based on Php', '16', '2021-05-14 11:18:43', '2', 't0001', '1231234');
INSERT INTO `thesis_title` VALUES ('23', 'A topic based on Python', '17', '2021-05-14 11:19:26', '2', 't0002', '1121213');
INSERT INTO `thesis_title` VALUES ('24', 'A topic based on JAVA', '18', '2021-05-14 11:20:54', '2', 't0003', '123312');
INSERT INTO `thesis_title` VALUES ('25', 'A topic based on SSM', '19', '2021-05-14 11:21:25', '2', 'andrew', 'This is decription!');
INSERT INTO `thesis_title` VALUES ('26', 'A topic based on CS', '20', '2021-05-16 15:15:40', '2', 'qqqq', 'description2');
INSERT INTO `thesis_title` VALUES ('28', 'A topic based on AI', '22', '2021-05-18 15:40:03', '2', 'Grey', 'This is a decriotion on AI');
INSERT INTO `thesis_title` VALUES ('29', 'A topic based on SSM56', '22', '2021-05-18 16:12:20', '2', 'Grey', '66566');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '选题信息表',
  `thesisId` int NOT NULL,
  `studentId` int NOT NULL,
  `selectTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `thesisId` (`thesisId`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`thesisId`) REFERENCES `thesis_title` (`id`),
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '22', '22', '2021-05-14 11:28:42');
INSERT INTO `topic` VALUES ('2', '25', '24', '2021-05-14 11:30:42');
INSERT INTO `topic` VALUES ('3', '23', '25', '2021-05-14 14:34:08');
INSERT INTO `topic` VALUES ('4', '24', '26', '2021-05-14 16:34:32');
INSERT INTO `topic` VALUES ('5', '26', '30', '2021-05-16 15:16:04');
INSERT INTO `topic` VALUES ('6', '28', '31', '2021-05-18 15:45:21');
INSERT INTO `topic` VALUES ('7', '29', '32', '2021-05-18 16:12:59');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userNo` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `permission` int DEFAULT NULL COMMENT '学生权限-1 教师权限-2 管理员权限-3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'admin', 'admin', '3');
INSERT INTO `user` VALUES ('31', 't0001', '123456', '2');
INSERT INTO `user` VALUES ('32', 's0001', '123456', '1');
INSERT INTO `user` VALUES ('33', 't0002', '123456', '2');
INSERT INTO `user` VALUES ('34', 't0003', '123456', '2');
INSERT INTO `user` VALUES ('36', '2032999', '123456', '2');
INSERT INTO `user` VALUES ('38', '7', '123456', '1');
INSERT INTO `user` VALUES ('39', '9', '123456', '1');
INSERT INTO `user` VALUES ('41', '2032111', '123456', '1');
INSERT INTO `user` VALUES ('42', '2032222', '123456', '1');
INSERT INTO `user` VALUES ('43', '2032333', '123456', '1');
INSERT INTO `user` VALUES ('44', 't11', '123456', '2');
INSERT INTO `user` VALUES ('46', '100', '123', '2');
INSERT INTO `user` VALUES ('47', '2032686', '123456', '1');
INSERT INTO `user` VALUES ('48', '555', '123456', '1');
INSERT INTO `user` VALUES ('49', '2369653', '123456', '1');
INSERT INTO `user` VALUES ('50', '236186', '123456', '1');
INSERT INTO `user` VALUES ('51', '139563', '123456', '1');
INSERT INTO `user` VALUES ('52', '456542', '123456', '1');
INSERT INTO `user` VALUES ('53', '231446', '123456', '1');
INSERT INTO `user` VALUES ('54', '6326926', '123456', '1');
INSERT INTO `user` VALUES ('55', '2344965', '123456', '1');
INSERT INTO `user` VALUES ('56', '2213463', '123456', '1');
INSERT INTO `user` VALUES ('57', '13348313', '123456', '1');
INSERT INTO `user` VALUES ('58', '151135', '123456', '2');
INSERT INTO `user` VALUES ('59', 'cefa156f', '123456', '2');
INSERT INTO `user` VALUES ('60', '151542', '123456', '2');
INSERT INTO `user` VALUES ('61', '1234153', '123456', '2');
INSERT INTO `user` VALUES ('62', '8468321', '123456', '2');
INSERT INTO `user` VALUES ('63', '345313', '123456', '2');
INSERT INTO `user` VALUES ('64', '131352', '123456', '2');
INSERT INTO `user` VALUES ('65', '413548', '123456', '2');
INSERT INTO `user` VALUES ('66', '3154681', '123456', '2');
INSERT INTO `user` VALUES ('67', '131351', '123456', '2');
INSERT INTO `user` VALUES ('68', '313431', '123456', '2');
INSERT INTO `user` VALUES ('69', '135131', '123456', '2');
INSERT INTO `user` VALUES ('70', '131813', '123456', '2');
INSERT INTO `user` VALUES ('71', '131313', '123456', '1');
DROP TRIGGER IF EXISTS `insert_studentNo_to_user`;
DELIMITER ;;
CREATE TRIGGER `insert_studentNo_to_user` AFTER INSERT ON `student` FOR EACH ROW BEGIN
INSERT INTO user VALUES(null,NEW.studentNo,'123456',1);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_studentNo_to_user`;
DELIMITER ;;
CREATE TRIGGER `delete_studentNo_to_user` AFTER DELETE ON `student` FOR EACH ROW BEGIN
DELETE FROM user WHERE userNo=OLD.studentNo;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_teacherNo_to_user`;
DELIMITER ;;
CREATE TRIGGER `insert_teacherNo_to_user` AFTER INSERT ON `teacher` FOR EACH ROW BEGIN
INSERT INTO user VALUES(null,NEW.teacherNo,'123456',2);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_teacher_to_user`;
DELIMITER ;;
CREATE TRIGGER `delete_teacher_to_user` AFTER DELETE ON `teacher` FOR EACH ROW BEGIN 
 DELETE FROM user WHERE userNo=OLD.teacherNo;
END
;;
DELIMITER ;
