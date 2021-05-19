/*
Navicat MySQL Data Transfer

Source Server         : LaoYu
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_graduation_management

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-05-19 15:44:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '院系表，id为主键',
  `departmentName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('25', '机电工程学院');
INSERT INTO `department` VALUES ('26', '机械工程学院');
INSERT INTO `department` VALUES ('27', '材料科学与工程学院');
INSERT INTO `department` VALUES ('28', '化学工程与技术学院');
INSERT INTO `department` VALUES ('29', '信息与通讯工程学院');
INSERT INTO `department` VALUES ('30', '仪器与电子学院');
INSERT INTO `department` VALUES ('31', '大数据学院（计算机科学与技术学院）');
INSERT INTO `department` VALUES ('32', '理学院');
INSERT INTO `department` VALUES ('33', '经济与管理学院');
INSERT INTO `department` VALUES ('34', '人文社会科学院');
INSERT INTO `department` VALUES ('35', '体育学院');
INSERT INTO `department` VALUES ('36', '艺术学院');
INSERT INTO `department` VALUES ('37', '软件学院');
INSERT INTO `department` VALUES ('38', '环境与安全学院');
INSERT INTO `department` VALUES ('39', '电气与控制工程学院');
INSERT INTO `department` VALUES ('40', '能源动力工程学院');
INSERT INTO `department` VALUES ('41', '研究生院');
INSERT INTO `department` VALUES ('42', '国际教育学院');
INSERT INTO `department` VALUES ('43', '继续教育学院');
INSERT INTO `department` VALUES ('44', '国防教育学院');
INSERT INTO `department` VALUES ('45', '朔州校区');
INSERT INTO `department` VALUES ('46', '信息商务学院');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业表，id为主键',
  `majorName` varchar(30) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL COMMENT '关联院系',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '现代火炮工程于技术', '25');
INSERT INTO `major` VALUES ('2', '自主武器工程于技术', '25');
INSERT INTO `major` VALUES ('3', '现代导弹工程于技术', '25');
INSERT INTO `major` VALUES ('4', '机械工程专业', '26');
INSERT INTO `major` VALUES ('5', '机械设计制造及其自动化专业', '26');
INSERT INTO `major` VALUES ('6', '过程装配与控制工程专业', '26');
INSERT INTO `major` VALUES ('7', '高分子材料与工程', '27');
INSERT INTO `major` VALUES ('8', '金属材料及特种成型技术', '27');
INSERT INTO `major` VALUES ('9', '化学工程与工艺专业', '28');
INSERT INTO `major` VALUES ('10', '制药工程专业', '28');
INSERT INTO `major` VALUES ('11', '图像处理与信息反演', '29');
INSERT INTO `major` VALUES ('12', '智能信息处理', '29');
INSERT INTO `major` VALUES ('13', '仪器科学与技术学科', '30');
INSERT INTO `major` VALUES ('14', '电子科学与技术学科', '30');
INSERT INTO `major` VALUES ('15', '大数据技术', '31');
INSERT INTO `major` VALUES ('16', '计算机科学与技术', '31');
INSERT INTO `major` VALUES ('17', '物联网', '31');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentNo` varchar(20) DEFAULT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `majorId` int(11) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `majorId` (`majorId`) USING BTREE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('22', 's0001', '王五', '男', '1', 'B001', 's0001', '2021-05-12 19:01:18', '18712345678');
INSERT INTO `student` VALUES ('23', 's0002', '热呃呃', '男', '17', 'B001', 'admin', '2021-05-18 17:05:52', '18712345679');
INSERT INTO `student` VALUES ('24', '2032666', 'Michanel', '女', '6', 'senior', '2032666', '2021-05-14 11:31:38', '6666666');
INSERT INTO `student` VALUES ('25', '7', 'Eeee', '男', '1', '222', 'admin', '2021-05-14 14:33:07', '1234567');
INSERT INTO `student` VALUES ('26', '9', '9', '女', '1', 'junior', 'admin', '2021-05-14 16:34:10', '9999999');
INSERT INTO `student` VALUES ('28', '2032111', 'cat', '女', '3', 'senior', 'admin', '2021-05-16 14:45:25', '1111111');
INSERT INTO `student` VALUES ('29', '2032222', 'dog', '男', '1', 'junior', 'admin', '2021-05-16 15:11:48', '6666666');
INSERT INTO `student` VALUES ('30', '2032333', 'lion', '男', '15', 'senior', 'admin', '2021-05-16 15:14:42', '15195828615');
INSERT INTO `student` VALUES ('31', '2032686', 'Eelin', '男', '15', 'pg', 'admin', '2021-05-18 15:44:27', '1111111');
INSERT INTO `student` VALUES ('32', '555', '321', '男', '16', 'senior', '555', '2021-05-18 16:11:09', '15195828615');

-- ----------------------------
-- Table structure for student_opening_report_task_book
-- ----------------------------
DROP TABLE IF EXISTS `student_opening_report_task_book`;
CREATE TABLE `student_opening_report_task_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生提交开题报告和任务书',
  `studentId` int(11) NOT NULL,
  `studentOpeningResport` varchar(100) DEFAULT NULL,
  `studentTaskBook` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `completion` int(1) DEFAULT NULL COMMENT '1-未通过  2-通过',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `student_opening_report_task_book_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_opening_report_task_book
-- ----------------------------
INSERT INTO `student_opening_report_task_book` VALUES ('11', '22', 'E:\\ThesisManagement\\student\\22\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('12', '24', 'E:\\BSM\\student\\24\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('13', '25', 'E:\\ThesisManagement\\student\\25\\PRD.docx', null, null, null);
INSERT INTO `student_opening_report_task_book` VALUES ('14', '26', 'E:\\ThesisManagement\\student\\26\\XJTLU Module Handbook CPT402-2020-21.docx', null, null, null);
INSERT INTO `student_opening_report_task_book` VALUES ('15', '30', 'E:\\ThesisManagement\\student\\30\\ALA Cover Sheet.doc', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('16', '31', 'E:\\ThesisManagement\\student\\31\\Lab1-RMI.pdf', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('17', '32', 'E:\\ThesisManagement\\student\\32\\Lect5-JDBCJPA.pdf', null, null, '2');

-- ----------------------------
-- Table structure for student_score
-- ----------------------------
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE `student_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生论文成绩表',
  `studentId` int(11) NOT NULL,
  `thesisResult` int(11) DEFAULT NULL,
  `inputMan` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `student_score_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('3', '22', '95', 't0001');
INSERT INTO `student_score` VALUES ('4', '30', '67', 'qqqq');
INSERT INTO `student_score` VALUES ('5', '31', '100', 'Grey');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherNo` varchar(20) DEFAULT NULL,
  `teacherName` varchar(20) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('16', 't0001', 't0001', '31', '男', 'admin', '2020-12-25 23:17:17', '18712345678');
INSERT INTO `teacher` VALUES ('17', 't0002', 't0002', '37', '男', 'admin', '2020-12-25 23:36:22', '13937813937');
INSERT INTO `teacher` VALUES ('18', 't0003', 't0003', '38', '男', 'admin', '2020-12-25 23:36:43', '13937813937');
INSERT INTO `teacher` VALUES ('19', '2032999', 'andrew', '28', '男', 'admin', '2021-05-14 11:17:16', '15195828615');
INSERT INTO `teacher` VALUES ('20', 't11', 'qqqq', '31', '男', 'admin', '2021-05-16 15:15:19', '15195828615');
INSERT INTO `teacher` VALUES ('22', '100', 'Grey', '31', '女', 'admin', '2021-05-18 17:06:11', '15000000003');

-- ----------------------------
-- Table structure for teacher_opening_report_task_book
-- ----------------------------
DROP TABLE IF EXISTS `teacher_opening_report_task_book`;
CREATE TABLE `teacher_opening_report_task_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师发布任务书和开题报告',
  `teacherId` int(11) NOT NULL,
  `openingReport` varchar(100) DEFAULT NULL,
  `taskBook` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `thesisTitleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  KEY `thesisTitleId` (`thesisTitleId`) USING BTREE,
  CONSTRAINT `teacher_opening_report_task_book_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`),
  CONSTRAINT `teacher_opening_report_task_book_ibfk_2` FOREIGN KEY (`thesisTitleId`) REFERENCES `thesis_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_opening_report_task_book
-- ----------------------------
INSERT INTO `teacher_opening_report_task_book` VALUES ('26', '16', null, 'E:\\BSM\\teacher\\16\\22\\renwushu.docx', null, '22');
INSERT INTO `teacher_opening_report_task_book` VALUES ('27', '19', null, 'E:\\BSM\\teacher\\19\\25\\PRD.docx', null, '25');
INSERT INTO `teacher_opening_report_task_book` VALUES ('28', '22', 'E:\\ThesisManagement\\teacher\\22\\28\\CPT402-CW2-Groups.pdf', '', null, '28');
INSERT INTO `teacher_opening_report_task_book` VALUES ('30', '22', null, 'E:\\ThesisManagement\\teacher\\22\\29\\Lect5-JDBCJPA.pdf', null, '29');

-- ----------------------------
-- Table structure for teacher_progress_notification
-- ----------------------------
DROP TABLE IF EXISTS `teacher_progress_notification`;
CREATE TABLE `teacher_progress_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进度通知表，教师填写',
  `context` varchar(1000) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT NULL COMMENT '0--初始化  1---未完成  2---已完成',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `teacher_progress_notification_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `teacher_progress_notification_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_progress_notification
-- ----------------------------
INSERT INTO `teacher_progress_notification` VALUES ('6', 'wqe', 't0001', '2020-12-25 23:49:28', '22', '16', '2');
INSERT INTO `teacher_progress_notification` VALUES ('7', 'shu', 'andrew', '2021-05-14 11:37:36', '24', '19', '2');
INSERT INTO `teacher_progress_notification` VALUES ('8', '', 'qqqq', '2021-05-16 15:17:28', '30', '20', '0');
INSERT INTO `teacher_progress_notification` VALUES ('9', 'asdasd', 'qqqq', '2021-05-16 15:18:26', '30', '20', '2');
INSERT INTO `teacher_progress_notification` VALUES ('10', 'dierjieduan', 'Grey', '2021-05-18 15:59:16', '31', '22', '2');

-- ----------------------------
-- Table structure for thesis_information
-- ----------------------------
DROP TABLE IF EXISTS `thesis_information`;
CREATE TABLE `thesis_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生提交毕业论文表',
  `studentId` int(11) NOT NULL,
  `thesisText` varchar(100) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `thesis_information_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_information
-- ----------------------------
INSERT INTO `thesis_information` VALUES ('14', '22', 'E:\\BSM\\student\\22\\lunwen.doc', '2', null);
INSERT INTO `thesis_information` VALUES ('15', '24', 'E:\\BSM\\student\\24\\PRD.docx', '2', null);
INSERT INTO `thesis_information` VALUES ('16', '30', 'E:\\ThesisManagement\\student\\30\\07_INT404_Image_Morphological.pdf', '2', null);
INSERT INTO `thesis_information` VALUES ('17', '31', 'E:\\ThesisManagement\\student\\31\\XJTLU Module Handbook CPT402-2020-21.docx', '2', null);

-- ----------------------------
-- Table structure for thesis_paper
-- ----------------------------
DROP TABLE IF EXISTS `thesis_paper`;
CREATE TABLE `thesis_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) DEFAULT NULL,
  `paperInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `thesis_paper_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_paper
-- ----------------------------
INSERT INTO `thesis_paper` VALUES ('1', '22', 'E:\\BSM\\thesis\\22\\稿子.docx');
INSERT INTO `thesis_paper` VALUES ('2', '30', 'E:\\ThesisManagement\\thesis\\30\\03_INT404_ Image_Enhancment.pdf');
INSERT INTO `thesis_paper` VALUES ('3', '31', 'E:\\ThesisManagement\\thesis\\31\\PRD.docx');

-- ----------------------------
-- Table structure for thesis_title
-- ----------------------------
DROP TABLE IF EXISTS `thesis_title`;
CREATE TABLE `thesis_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师提交课题',
  `thesisName` varchar(30) DEFAULT NULL,
  `teacherId` int(11) NOT NULL,
  `submitTime` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '课题未审核-1 已审核通过-2 不通过-3',
  `inputMan` varchar(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `thesis_title_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_title
-- ----------------------------
INSERT INTO `thesis_title` VALUES ('22', '基于java的学生管理系统', '16', '2020-12-25 23:18:43', '2', 't0001', '的方式');
INSERT INTO `thesis_title` VALUES ('23', '基于java的学生管理', '17', '2020-12-25 23:37:26', '2', 't0002', '1121213');
INSERT INTO `thesis_title` VALUES ('24', '基于java的学生', '18', '2020-12-25 23:37:54', '2', 't0003', '123312');
INSERT INTO `thesis_title` VALUES ('25', 'A topic based on SSM', '19', '2021-05-14 11:21:25', '2', 'andrew', 'This is decription!');
INSERT INTO `thesis_title` VALUES ('26', 'A topic based on CS', '20', '2021-05-16 15:15:40', '2', 'qqqq', 'description2');
INSERT INTO `thesis_title` VALUES ('28', 'A topic based on AI', '22', '2021-05-18 15:40:03', '2', 'Grey', 'This is a decriotion on AI');
INSERT INTO `thesis_title` VALUES ('29', 'A topic based on SSM56', '22', '2021-05-18 16:12:20', '2', 'Grey', '66566');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选题信息表',
  `thesisId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `selectTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `thesisId` (`thesisId`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`thesisId`) REFERENCES `thesis_title` (`id`),
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '22', '22', '2020-12-25 23:43:42');
INSERT INTO `topic` VALUES ('2', '25', '24', '2021-05-14 11:30:42');
INSERT INTO `topic` VALUES ('3', '23', '25', '2021-05-14 14:34:08');
INSERT INTO `topic` VALUES ('4', '24', '26', '2021-05-14 16:34:32');
INSERT INTO `topic` VALUES ('5', '26', '30', '2021-05-16 15:16:04');
INSERT INTO `topic` VALUES ('6', '28', '31', '2021-05-18 15:45:21');
INSERT INTO `topic` VALUES ('7', '29', '32', '2021-05-18 16:12:59');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `permission` int(2) DEFAULT NULL COMMENT '学生权限-1 教师权限-2 管理员权限-3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'admin', '123', '3');
INSERT INTO `user` VALUES ('31', 't0001', '123', '2');
INSERT INTO `user` VALUES ('32', 's0001', '123', '1');
INSERT INTO `user` VALUES ('33', 't0002', '123', '2');
INSERT INTO `user` VALUES ('34', 't0003', '123', '2');
INSERT INTO `user` VALUES ('35', 's0002', '123', '1');
INSERT INTO `user` VALUES ('36', '2032999', '123', '2');
INSERT INTO `user` VALUES ('38', '7', '123', '1');
INSERT INTO `user` VALUES ('39', '9', '123', '1');
INSERT INTO `user` VALUES ('41', '2032111', '123', '1');
INSERT INTO `user` VALUES ('42', '2032222', '123', '1');
INSERT INTO `user` VALUES ('43', '2032333', '123', '1');
INSERT INTO `user` VALUES ('44', 't11', '123', '2');
INSERT INTO `user` VALUES ('46', '100', '123', '2');
INSERT INTO `user` VALUES ('47', '2032686', '123', '1');
INSERT INTO `user` VALUES ('48', '555', '123', '1');
DROP TRIGGER IF EXISTS `insert_studentNo_to_user`;
DELIMITER ;;
CREATE TRIGGER `insert_studentNo_to_user` AFTER INSERT ON `student` FOR EACH ROW BEGIN
INSERT INTO user VALUES(null,NEW.studentNo,'123',1);
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
INSERT INTO user VALUES(null,NEW.teacherNo,'123',2);
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
