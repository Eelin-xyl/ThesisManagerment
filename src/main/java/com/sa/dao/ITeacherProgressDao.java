package com.sa.dao;

import java.util.List;

import com.sa.entity.TeacherProgress;

/**
 * 
 * @author LaoYu
 *add progress notification 
 */

public interface ITeacherProgressDao {
	
	int addTeacherProgress(TeacherProgress teacherProgress);
	
//	int passTeacherProgress(int id);
//	
//	int failTeacherProgress(int id);
	
	List<TeacherProgress> getInfoByStudentId(int studentId);
	
	List<TeacherProgress> getInfoByTeacherId(int teacherId);
	
}
