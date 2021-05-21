package com.sa.dao;

import java.util.List;

import com.sa.entity.TeacherTaskBookOpening;


/**
 * 
 * @author LaoYu
 *add, delete, update, search assignment
 */

public interface ITeacherTaskBookOpeningDao {
	
	TeacherTaskBookOpening showInfo(int thesisTitleId);

	int addTaskBook(TeacherTaskBookOpening teacherTaskBookOpening);
	
	int addOpening(TeacherTaskBookOpening teacherTaskBookOpening);
	
	int uploadTaskBook(TeacherTaskBookOpening teacherTaskBookOpening);
	
//	int uploadOpening(TeacherTaskBookOpening teacherTaskBookOpening);
	
	List<TeacherTaskBookOpening> showTeacherTaskBookOpeningById(int teacherId);
	
	int resetTaskBook(int thesisTitleId);
	
	int resetOpening(int thesisTitleId);
	
	TeacherTaskBookOpening showInfoByThesisId(int thesisTitleId);
	
	int deleteInfo(int thesisTitleId);
	
	TeacherTaskBookOpening getTheisIdByTask(String taskBook);
	
	TeacherTaskBookOpening getTheisIdByOpening(String openingReport);
	
}
