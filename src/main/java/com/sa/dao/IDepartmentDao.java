package com.sa.dao;

import java.util.List;

import com.sa.entity.Department;

/**
 * @date 2021-05-10
 * @author Eelin
 * 查询全部的院系
 * id ==> name
 * name ==> id
 * 
 */
public interface IDepartmentDao {
	
	List<Department> allDepartment();
	String getNameById(int id);
	int getIdByName(String name);
}
