package com.sa.service;

import java.util.List;

import com.sa.entity.Major;

/**
 * 
 * @author Eelin
 * 
 * get major list
 * get major name by id
 * get major id by name
 * 
 *
 */
public interface IMajorService {
	List<Major> allMajor();
	
	String getNameById(int id);
	
	int getIdByName(String name);
}
