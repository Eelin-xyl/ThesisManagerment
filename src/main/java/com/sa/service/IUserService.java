package com.sa.service;

import com.sa.entity.User;

/**
 * 
<<<<<<< Updated upstream
 * @author LaoYu
=======
 * @author Eelin
 * 
 * 验证登陆
 * 根据no获得用户信息
 * 修改密码
 * 
>>>>>>> Stashed changes
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
