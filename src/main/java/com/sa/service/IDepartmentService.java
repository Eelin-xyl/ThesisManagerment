package com.sa.service;

import java.util.List;

import com.sa.entity.Department;

/**
 * 
 * @author Eelin
 * 
 * show department list
 * get department name by ID
 * get department ID by name
 * 
 *
 */

public interface IDepartmentService {
	List<Department> allDepartment();
	
	String getNameById(int id);
	
	int getIdByName(String departmentName);
}
