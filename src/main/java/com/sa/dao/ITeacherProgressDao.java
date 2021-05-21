package com.sa.dao;

import java.util.List;

import com.sa.entity.TeacherProgress;

/**
 * @date 2021-05-17
 * @author Eelin
 * add progress notification 
 */

public interface ITeacherProgressDao {
	
	int addTeacherProgress(TeacherProgress teacherProgress);
	
//	int passTeacherProgress(int id);
//	
//	int failTeacherProgress(int id);
	
	List<TeacherProgress> getInfoByStudentId(int studentId);
	
	List<TeacherProgress> getInfoByTeacherId(int teacherId);
	
}
