package com.sa.dao;

import com.sa.entity.StudentScore;

/**
 * @date 2020-12-18
 * @author rcx
 * 添加学生成绩
 * 根据学生id查找学生成绩信息
 * 修改学生成绩
 * 
 *
 */

public interface IStudentScoreDao {
	
	int addStudenScore(StudentScore score);
	
	StudentScore showInfoByStudentId(int studentId);
	
	int modifyStudentScore(StudentScore score);
}
