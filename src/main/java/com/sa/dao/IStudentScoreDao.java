package com.sa.dao;

import com.sa.entity.StudentScore;

/**
<<<<<<< Updated upstream
=======
 * @date 2021-05-18
 * @author Eelin
 * 添加学生成绩
 * 根据学生id查找学生成绩信息
 * 修改学生成绩
>>>>>>> Stashed changes
 * 
 * @author LaoYu
 *add, search, update student score
 */

public interface IStudentScoreDao {
	
	int addStudenScore(StudentScore score);
	
	StudentScore showInfoByStudentId(int studentId);
	
	int modifyStudentScore(StudentScore score);
}
