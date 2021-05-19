package com.sa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sa.dao.IDepartmentDao;
import com.sa.entity.Department;
import com.sa.service.IDepartmentService;


@Service
public class DepartmentServiceImpl implements IDepartmentService{
	
	@Autowired
	private IDepartmentDao departmentDao;
	
	
	public List<Department> allDepartment() {
		// TODO Auto-generated method stub
		List<Department> departments = departmentDao.allDepartment();
		return departments;
	}


	public String getNameById(int id) {
		// TODO Auto-generated method stub
		
		String name = departmentDao.getNameById(id);
		return name;
	}


	public int getIdByName(String departmentName) {
		// TODO Auto-generated method stub
		int id = departmentDao.getIdByName(departmentName);
		return id;
	}

}
