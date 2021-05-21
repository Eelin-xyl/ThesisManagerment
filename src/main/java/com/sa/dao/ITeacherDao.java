package com.sa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sa.entity.Teacher;

/**
 * 
 * @author LaoYu
 *add, delete, update teacher
 *
 */

public interface ITeacherDao {
	int addTeacher(Teacher teacher);
	Teacher selectTeacher(int id);
	List<Teacher> showAllTeacher();
	int deleteTeacher(int id);
	int updateTeacher(Teacher teacher);
	List<Teacher> showTeacherOne1(String teacherNo);
	List<Teacher> showTeacherOne2(String teacherName);
	List<Teacher> showTeacherOne3(@Param("teacherNo") String teacherNo,@Param("teacherName") String teacherName);
	
	Teacher teacherInfoByNo(String teacherNo);
	
	
	
}
