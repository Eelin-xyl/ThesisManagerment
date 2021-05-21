package com.sa.dao;

import java.util.List;

import com.sa.entity.Major;

/**
 * 
 * @author LaoYu
 *search all major
 */
public interface IMajorDao {
	
	List<Major> getAllMajor();
	
	String getNameByID(int id);
	
	int getIdByName(String name);
	
	
}
