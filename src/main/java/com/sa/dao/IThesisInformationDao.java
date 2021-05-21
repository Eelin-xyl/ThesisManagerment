package com.sa.dao;

import com.sa.entity.ThesisInformation;

/**
 * @date 2021-05-17
 * @author Eelin
 *add, search, delete student_thesis_information
 *search thesis_student_upload based on path and student id
 */

public interface IThesisInformationDao {
	
	int addThesisInformation(ThesisInformation thesisInformation);
	
	int passThesisInformation(int studentId);
	
	int failThesisInformation(int studentId);
	
	int deleteThesisInformation(int studentId);
	
	ThesisInformation getInfoByStudentId(int studentId);
	
	ThesisInformation getInfoByFilePath(String thesisText);
}
