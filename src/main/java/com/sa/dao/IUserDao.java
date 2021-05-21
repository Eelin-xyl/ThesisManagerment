package com.sa.dao;

import org.apache.ibatis.annotations.Param;

import com.sa.entity.User;


/**
 * 
 * @author LaoYu
 *search information based on id
 *modifypassword based on userno and password from html
 */
public interface IUserDao {
	
	User queryById(int id);
	
	User login(User user);
	
	User getPassword(String userNo);
	
	int modifyPassword(@Param("userNo") String userNo, @Param("password") String password);
}
