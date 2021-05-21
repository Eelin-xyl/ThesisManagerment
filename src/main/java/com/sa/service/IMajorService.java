package com.sa.service;

import java.util.List;

import com.sa.entity.Major;

/**
 * 
 * @author Eelin
 * 
 * 获得专业列表
 * 根据id获得专业name
 * 根据name获得专业id
 * 
 *
 */
public interface IMajorService {
	List<Major> allMajor();
	
	String getNameById(int id);
	
	int getIdByName(String name);
}
