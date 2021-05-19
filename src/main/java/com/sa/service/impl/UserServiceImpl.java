package com.sa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sa.dao.IUserDao;
import com.sa.entity.User;
import com.sa.service.IUserService;
@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private IUserDao userDao;
	
	
	
	public User login(String userNo, String password) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserNo(userNo);
		user.setPassword(password);
		User currentUser = userDao.login(user);
		return currentUser;
	}



	public User getPassword(String userNo) {
		User currentUser = userDao.getPassword(userNo);
		
		return currentUser;
	}






	public int modifyPassword(String userNo, String password) {
		// TODO Auto-generated method stub
		int num = userDao.modifyPassword(userNo, password);
		return num;
	}






}
