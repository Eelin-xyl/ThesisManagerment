/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : db_graduation_management

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2021-05-22 17:41:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '院系表，id为主键',
  `departmentName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业表，id为主键',
  `majorName` varchar(50) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL COMMENT '关联院系',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentNo` varchar(20) DEFAULT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `majorId` int(11) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `majorId` (`majorId`) USING BTREE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('28', '2032111', 'cat', 'Female', '3', 'senior', 'admin', '2021-05-14 18:45:25', '1111111');
INSERT INTO `student` VALUES ('29', '2032222', 'dog', 'Male', '1', 'junior', 'admin', '2021-05-16 15:11:48', '6666666');
INSERT INTO `student` VALUES ('30', '2032333', 'lion', 'Male', '15', 'senior', 'admin', '2021-05-16 15:14:42', '15195828615');
INSERT INTO `student` VALUES ('31', '2032686', 'Eelin', 'Male', '15', 'pg', 'admin', '2021-05-18 15:44:27', '1111111');
INSERT INTO `student` VALUES ('32', '555', '321', 'Male', '16', 'senior', '555', '2021-05-18 16:11:09', '15195828615');
INSERT INTO `student` VALUES ('36', '2369653', 'Peter', 'Male', '2', 'pg', 'admin', '2021-05-21 01:00:58', '34584462648');
INSERT INTO `student` VALUES ('37', '236186', 'Carson', 'Female', '4', 'junior', 'admin', '2021-05-22 14:39:14', '33334444658');
INSERT INTO `student` VALUES ('38', '139563', 'Edward', 'Female', '14', 'pg', 'admin', '2021-05-22 14:40:30', '33334444221');
INSERT INTO `student` VALUES ('39', '456542', 'Claire', 'Male', '18', 'bbaas', 'admin', '2021-05-22 14:40:46', '66668888325');
INSERT INTO `student` VALUES ('40', '231446', 'Tom', 'Male', '21', 'senior', 'admin', '2021-05-21 01:01:16', '446683293');
INSERT INTO `student` VALUES ('41', '6326926', 'Jesse', 'Female', '25', 'senior', 'admin', '2021-05-22 14:40:59', '74419633294');
INSERT INTO `student` VALUES ('42', '2344965', 'Timothy', 'Male', '12', 'junior', 'admin', '2021-05-22 14:41:15', '44634326659');
INSERT INTO `student` VALUES ('43', '2213463', 'Daisy', 'Female', '8', 'pg', 'admin', '2021-05-22 14:41:24', '26262365323');
INSERT INTO `student` VALUES ('44', '13348313', 'Harrison', 'Female', '12', 'eavea', 'admin', '2021-05-22 14:41:32', '35659461843');
INSERT INTO `student` VALUES ('45', '131313', 'Amber', 'Male', '15', 'junior', 'admin', '2021-05-22 14:41:42', '46135168286');
INSERT INTO `student` VALUES ('46', 's001', 'ABC', 'Male', '2', '1', 'admin', '2021-05-22 15:19:08', '12345678910');

-- ----------------------------
-- Table structure for `student_opening_report_task_book`
-- ----------------------------
DROP TABLE IF EXISTS `student_opening_report_task_book`;
CREATE TABLE `student_opening_report_task_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生提交开题报告和任务书',
  `studentId` int(11) NOT NULL,
  `studentOpeningResport` varchar(100) DEFAULT NULL,
  `studentTaskBook` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `completion` int(11) DEFAULT NULL COMMENT '1-未通过  2-通过',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `student_opening_report_task_book_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_opening_report_task_book
-- ----------------------------
INSERT INTO `student_opening_report_task_book` VALUES ('15', '30', 'E:\\ThesisManagement\\student\\30\\ALA Cover Sheet.doc', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('16', '31', 'E:\\ThesisManagement\\student\\31\\Lab1-RMI.pdf', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('17', '32', 'E:\\ThesisManagement\\student\\32\\Lect5-JDBCJPA.pdf', null, null, '2');
INSERT INTO `student_opening_report_task_book` VALUES ('18', '46', 'E:\\ThesisManagement\\student\\46\\Lect5-JDBCJPA.pdf', null, null, '2');

-- ----------------------------
-- Table structure for `student_score`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('6', '46', '70', 'xxx');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherNo` varchar(20) DEFAULT NULL,
  `teacherName` varchar(20) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('25', '151135', 'Adama', '39', 'Male', 'admin', '2021-05-21 01:00:17', '7962362');
INSERT INTO `teacher` VALUES ('26', 'cefa156f', 'Riley', '36', 'Female', 'admin', '2021-05-21 01:00:43', '864135183');
INSERT INTO `teacher` VALUES ('27', '151542', 'Jamie', '39', 'Female', 'admin', '2021-05-21 01:00:39', '999999');
INSERT INTO `teacher` VALUES ('28', '1234153', 'Kendall', '38', 'Male', 'admin', '2021-05-21 01:00:35', '54651351');
INSERT INTO `teacher` VALUES ('29', '8468321', 'Quinn', '35', 'Female', 'admin', '2021-05-21 01:00:31', '13513831813');
INSERT INTO `teacher` VALUES ('30', '345313', 'Emerson', '35', 'Male', 'admin', '2021-05-21 01:00:27', '51386546584');
INSERT INTO `teacher` VALUES ('31', '131352', 'Ollie', '37', 'Female', 'admin', '2021-05-21 01:00:22', '31535118132');
INSERT INTO `teacher` VALUES ('32', '413548', 'Ellison', '37', 'Male', 'admin', '2021-05-21 01:02:01', '12316531681');
INSERT INTO `teacher` VALUES ('33', '3154681', 'Arie', '36', 'Male', 'admin', '2021-05-21 01:02:36', '31351313168');
INSERT INTO `teacher` VALUES ('34', '131351', 'Adi', '38', 'Male', 'admin', '2021-05-21 01:03:04', '51384354864');
INSERT INTO `teacher` VALUES ('35', '313431', 'Adama', '39', 'Female', 'admin', '2021-05-21 01:03:45', '13183431835');
INSERT INTO `teacher` VALUES ('36', '135131', 'Mckinney', '35', 'Female', 'admin', '2021-05-21 01:04:54', '31351313135');
INSERT INTO `teacher` VALUES ('37', '131813', 'Swan', '37', 'Male', 'admin', '2021-05-21 01:06:04', '13168765135');
INSERT INTO `teacher` VALUES ('38', 't001', 'xxx', '35', 'Male', 'admin', '2021-05-22 15:18:13', '12345678910');

-- ----------------------------
-- Table structure for `teacher_opening_report_task_book`
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_opening_report_task_book
-- ----------------------------
INSERT INTO `teacher_opening_report_task_book` VALUES ('28', '22', 'E:\\ThesisManagement\\teacher\\22\\28\\CPT402-CW2-Groups.pdf', '', null, '28');
INSERT INTO `teacher_opening_report_task_book` VALUES ('30', '22', null, 'E:\\ThesisManagement\\teacher\\22\\29\\Lect5-JDBCJPA.pdf', null, '29');
INSERT INTO `teacher_opening_report_task_book` VALUES ('32', '38', null, 'E:\\ThesisManagement\\teacher\\38\\30\\Lect3-RMI.pdf', null, '30');

-- ----------------------------
-- Table structure for `teacher_progress_notification`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_progress_notification`;
CREATE TABLE `teacher_progress_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进度通知表，教师填写',
  `context` varchar(1000) DEFAULT NULL,
  `inputMan` varchar(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0--初始化  1---未完成  2---已完成',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `teacher_progress_notification_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `teacher_progress_notification_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher_progress_notification
-- ----------------------------
INSERT INTO `teacher_progress_notification` VALUES ('11', 'go', 'xxx', '2021-05-22 16:48:45', '46', '38', '0');

-- ----------------------------
-- Table structure for `thesis_information`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_information`;
CREATE TABLE `thesis_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生提交毕业论文表',
  `studentId` int(11) NOT NULL,
  `thesisText` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE,
  CONSTRAINT `thesis_information_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_information
-- ----------------------------
INSERT INTO `thesis_information` VALUES ('16', '30', 'E:\\ThesisManagement\\student\\30\\07_INT404_Image_Morphological.pdf', '2', null);
INSERT INTO `thesis_information` VALUES ('17', '31', 'E:\\ThesisManagement\\student\\31\\XJTLU Module Handbook CPT402-2020-21.docx', '2', null);
INSERT INTO `thesis_information` VALUES ('19', '46', 'E:\\ThesisManagement\\student\\46\\Lect6-JTA.pdf', '2', null);

-- ----------------------------
-- Table structure for `thesis_title`
-- ----------------------------
DROP TABLE IF EXISTS `thesis_title`;
CREATE TABLE `thesis_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师提交课题',
  `thesisName` varchar(30) DEFAULT NULL,
  `teacherId` int(11) NOT NULL,
  `submitTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '课题未审核-1 已审核通过-2 不通过-3',
  `inputMan` varchar(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teacherId` (`teacherId`) USING BTREE,
  CONSTRAINT `thesis_title_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thesis_title
-- ----------------------------
INSERT INTO `thesis_title` VALUES ('30', 'TopicE', '38', '2021-05-22 15:19:42', '2', 'xxx', 'eeee');

-- ----------------------------
-- Table structure for `topic`
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('5', '26', '30', '2021-05-16 15:16:04');
INSERT INTO `topic` VALUES ('6', '28', '31', '2021-05-18 15:45:21');
INSERT INTO `topic` VALUES ('7', '29', '32', '2021-05-18 16:12:59');
INSERT INTO `topic` VALUES ('8', '30', '46', '2021-05-22 15:22:05');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL COMMENT '学生权限-1 教师权限-2 管理员权限-3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'admin', 'admin', '3');
INSERT INTO `user` VALUES ('41', '2032111', '123456', '1');
INSERT INTO `user` VALUES ('42', '2032222', '123456', '1');
INSERT INTO `user` VALUES ('43', '2032333', '123456', '1');
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
INSERT INTO `user` VALUES ('72', 't001', '123456', '2');
INSERT INTO `user` VALUES ('73', 's001', '123456', '1');
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
