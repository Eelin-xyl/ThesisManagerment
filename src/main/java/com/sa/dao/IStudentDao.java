package com.sa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sa.entity.Student;

/**
 * 
 * @author LaoYu
 *select student based on id
 *add, delete, update student
 *show student information based on student id
 *show student information based on student name
 *show all student
 */
public interface IStudentDao {
	Student selectStudent(int id);
	int addStudent(Student student);
	List<Student> showAllStudent();
	int deleteStudent(int id);
	int updateStudent(Student student);
	
	List<Student> showStudentOne1(String studentNo);
	List<Student> showStudentOne2(String studentName);
	List<Student> showStudentOne3(@Param("studentNo") String studentNo,@Param("studentName") String studentName);
	
	Student getInfoByNo(String studentNo);
	
	
}
