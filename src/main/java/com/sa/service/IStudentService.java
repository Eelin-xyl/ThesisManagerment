package com.sa.service;

import java.util.List;
import java.util.Map;

import com.sa.entity.Student;
import com.sa.entity.StudentTaskBookOpening;
import com.sa.entity.TeacherProgress;
import com.sa.entity.TeacherTaskBookOpening;
import com.sa.entity.ThesisInformation;
import com.sa.entity.ThesisTitle;
import com.sa.entity.Topic;


/**
 * 
 * @author LaoYu
 * 
 *add, delete, update, search student
 *show all students
 *get student information based on student id
 *get available thesis topic list
 *get chosen topic and related student information
 *student choose topic
 *get assignment based on topic and student id
 *upload opening report
 *download assignment based on Map(name, path)
 *delete assignment, thesis, opening report
 *get assignment information 
 *get topic information based topic id
 *search, delete thesis information based on student
 */

public interface IStudentService {
	
	int addStudent(Student student);
	
	List<Student> showAllStudent();
	
	Student getStudentNameById(int id);
	
	int updateStudent(Student student);
	
	int deleteStudent(int id);
	
	List<Student> showStudentOne1(String studentNo);
	
	List<Student> showStudentOne2(String studentName);
	
	List<Student> showStudentOne3(String studentNo,String studentName);
	
	Student getStudentByNO(String studentNo);
	
	List<ThesisTitle> availableTopic();
	
	Topic chosenThesisTitle(int studentId); 
	
	int addTopicToDb(Topic topic);
	
//	int deleteTopic(int studentId);
	
	TeacherTaskBookOpening getFilePathByThesisId(int thesisId);
	
	StudentTaskBookOpening getSTBOInfoById(int studentId);
	
//	int uploadTaskBook(int studentId,String filePath);
	
	int uploadOpening(int studentId,String filePath);
	
	Map<String, String> getTaskBookOpeningToMap(int studentId);
	
//	int resetTaskBook(int studentId);
	
	int resetOpening(int studentId); 
	
//	StudentTaskBookOpening getInfoByTaskBookPath(String taskBookPath);
	
	StudentTaskBookOpening getInfoByOpeningPath(String openingPath);
	
	
	ThesisTitle getThesisInfoByid(int thesisId);
	
	List<TeacherProgress> getTeacherProgressByStudentId(int studentId);
		
	int uploadThesisInformation(int studentId,String filePath);
	
	ThesisInformation getInfoByStudentId(int studentId);
	
	ThesisInformation getInfoByFilePath(String filePath);
	
	int deleteThesisInformation(int studentId);
	
	
	ThesisInformation getThesisInforInfoByStudentId(int studentId);
	
	
	String getThesisDesc(int thesisId);
	
}

