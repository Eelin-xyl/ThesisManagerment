package com.sa.dao;

import org.apache.ibatis.annotations.Param;

import com.sa.entity.User;

/**
 * @date 2020-12-10
 * @author rcx
 * 查询用户信息 根据id
 * 查询登陆信息 根据页面给定的 userNo和password
 * 获得用户密码
 * 修改密码
 * 
 *
 */

public interface IUserDao {
	
	User queryById(int id);
	
	User login(User user);
	
	User getPassword(String userNo);
	
	int modifyPassword(@Param("userNo") String userNo, @Param("password") String password);
}