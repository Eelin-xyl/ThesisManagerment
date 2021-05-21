package com.sa.dao;

import org.apache.ibatis.annotations.Param;

import com.sa.entity.StudentTaskBookOpening;

/**
 * @date 2021-05-15
 * @author Eelin
 *get student information based on student ID
 *insert student Id
 *update the opening report path
 *reset opening report path
 *search information based on assignment
 *modify student status
 */

public interface IStudentTaskBookOpeningDao {
	
	StudentTaskBookOpening showInfoByStudentId(int studentId);
	
	int addInfoByStudentId(int studentId);
	
//	int uploadTaskBook(@Param("studentId") int studentId,@Param("studentTaskBook") String studentTaskBook);
	
	int uploadOpening(@Param("studentId") int studentId,@Param("studentOpeningResport") String studentOpeningResport);
	
//	int resetTaskBook(int studentId);
	
	int resetOpening(int studentId);
	
	StudentTaskBookOpening getInfoByTaskBookPath(String studentTaskBook);
	
	StudentTaskBookOpening getInfoByOpeningPath(String studentOpeningResport);
	
	int passOpening(int studentId);
	
	int failOpening(int studentId);
}
