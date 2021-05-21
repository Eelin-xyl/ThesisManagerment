package com.sa.service;

import java.util.List;
import java.util.Map;

import com.sa.entity.Student;
import com.sa.entity.StudentScore;
import com.sa.entity.StudentTaskBookOpening;
import com.sa.entity.Teacher;
import com.sa.entity.TeacherProgress;
import com.sa.entity.TeacherTaskBookOpening;
import com.sa.entity.ThesisInformation;
import com.sa.entity.ThesisPaper;
import com.sa.entity.ThesisTitle;
import com.sa.entity.Topic;

/**
 * @author Eelin
 *add, delete, update teacher 
 *show all teacher
 *get teacher information based on teacher id
 *upload topic
 *delete topic
 *show all topic
 *update topic status
 *teacher get topics which are failed or passed separately
 *get teacher_opening_report information, and save in the map
 *delete opening report
 *get topic information
 *review student_opening_report
 *show progress notification
 *judge thesis result
 *add, update student score
 *student upload thesis
 */

public interface ITeacherService {
	int addTeacher(Teacher teacher);
	
	List<Teacher> showAllTeacher();
	
	int deleteTeacher(int id);
	
	Teacher getTeacherByid(int id);
	
	int updateTeacher(Teacher teacher);
	
	List<Teacher> showTeacherOne1(String teacherNo);
	
	List<Teacher> showTeacherOne2(String teacherName);
	
	List<Teacher> showTeacherOne3(String teacherNo,String teacherName);
	
	Teacher showInfoByNo(String teacherNo);
	
	int uploadThesisTitle(ThesisTitle thesisTitle);
	
	List<ThesisTitle> showAllThesisTitle(int teacherId);
	
	ThesisTitle getThesisById(int id);
	
	int updateThesisTitle(ThesisTitle thesisTitle);
	
	int deleteThesisTitle(int id);
	
	List<ThesisTitle> showAllThesisTitle();
	
	int agreeThesisTitle(int id);
	
	int disagreeThesisTitle(int id);
	
	
	List<ThesisTitle> showAllThesisTitleBeChecked(int teacherId);
	
	int uploadTaskBook(TeacherTaskBookOpening teacherTaskBookOpening);
	
//	int uploadOpening(TeacherTaskBookOpening teacherTaskBookOpening);
	
	Map<String, String> uploadTaskBookOpeningResult(int teacherId);
	
	String getThesisTitleByFilePath(String filePath);
	
	TeacherTaskBookOpening getTaskOpeningByThesisId(int thesisTitleId); 
	
	int deleteTaskBookOpening(int thesisTitleId);
	
	
	TeacherTaskBookOpening getThesisIdByTask(String taskBook);
	
	TeacherTaskBookOpening getThesisIdByOpening(String opening);
	
	int resetTask(int thesisTitleId );
	
	int resetOpening(int thesisTitleId);
	
	List<Student> getAllStudentInfo(int teacherId);
	
	Topic getTopicInfoByStudentId(int studentId);
	
	ThesisTitle getThesisInfoByThesisId(int thesisId);
	
	StudentTaskBookOpening getStudentOpeningByStudentId(int studentId);
	
	int passOpening(String studentNo);
	
	int failOpening(String studentNo);
	
	
	int addTeacherProgress(TeacherProgress teacherProgress);
	
	List<TeacherProgress> getTeacherProgressByTeacherId(int teacherId);
	
	Student getStudentInfoByStudentId(int studentId);
	
//	int passProgress(int id);
//	
//	int failProgress(int id);

	
	ThesisInformation getInfoByStudentId(int studentId);
	
	int passThesisInformation(int studentId);
	
	int failThesisInformation(int studentId);
	
	int addStudentScore(StudentScore score);
	
	int modifyStudentScore(StudentScore score);
	
	StudentScore showInfoByStudentId(int studentId);
	
	int uploadThesis4Pass(ThesisPaper paper);
	
	List<ThesisPaper> getAllPaper();

}
