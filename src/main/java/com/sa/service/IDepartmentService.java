package com.sa.service;

import java.util.List;

import com.sa.entity.Department;

/**
 * 
 * @author rcx
 * 
 * 显示院系列表
 * 根据id获得院系name
 * 根据name获得院系id
 * 
 *
 */

public interface IDepartmentService {
	List<Department> allDepartment();
	
	String getNameById(int id);
	
	int getIdByName(String departmentName);
}