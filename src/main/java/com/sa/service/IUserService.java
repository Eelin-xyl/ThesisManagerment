package com.sa.service;

import com.sa.entity.User;

/**
 * 
 * @author LaoYu
 *
 *login
 *modify password
 *get information based on user ID
 */
public interface IUserService {
	public User login(String userNo,String password);
	
	public User getPassword(String userNo);
	
	public int modifyPassword(String userNo ,String password);
}
