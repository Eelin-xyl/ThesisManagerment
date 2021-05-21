package com.sa.dao;

import java.util.List;

import com.sa.entity.Major;

/**
 * @date 2021-05-10
 * @author Eelin
 * 查询全部的专业；
 * id ==> name
 * name ==> id
 * 根据name获得id
 * 
 */

public interface IMajorDao {
	
	List<Major> getAllMajor();
	
	String getNameByID(int id);
	
	int getIdByName(String name);
	
	
}
