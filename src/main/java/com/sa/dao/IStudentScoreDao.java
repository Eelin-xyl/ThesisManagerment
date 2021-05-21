package com.sa.dao;

import com.sa.entity.StudentScore;

/**
 * 
 * @author LaoYu
 *add, search, update student score
 */

public interface IStudentScoreDao {
	
	int addStudenScore(StudentScore score);
	
	StudentScore showInfoByStudentId(int studentId);
	
	int modifyStudentScore(StudentScore score);
}
