package com.sa.dao;

import java.util.List;

import com.sa.entity.Department;

/**
 * 
 * @author LaoYu
 *search all department
 */
public interface IDepartmentDao {
	
	List<Department> allDepartment();
	String getNameById(int id);
	int getIdByName(String name);
}
