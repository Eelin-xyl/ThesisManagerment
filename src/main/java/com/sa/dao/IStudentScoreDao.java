package com.sa.dao;

import com.sa.entity.StudentScore;

/**
 * @date 2021-05-18
 * @author Eelin
 *add, search, update student score
 */

public interface IStudentScoreDao {
	
	int addStudenScore(StudentScore score);
	
	StudentScore showInfoByStudentId(int studentId);
	
	int modifyStudentScore(StudentScore score);
}
