package com.sa.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sa.entity.Student;
import com.sa.entity.Teacher;
import com.sa.entity.User;
import com.sa.service.IDepartmentService;
import com.sa.service.IMajorService;
import com.sa.service.IStudentService;
import com.sa.service.ITeacherService;
import com.sa.service.IUserService;

/**
 * @date 2020-12-6
 * @author rcx
 * adminLogin() 管理员登陆
 * teacherLogin() 教师登陆
 * studentLogin() 学生登陆
 * quitSystem() 退出系统
 * modifyPassword() 修改密码，由于管理员，教师，学生的修改密码相同，所以只用一个controller作为修改。
 *
 * @date 2020-12-11
 * @author rcx
 * 修改了teacherLogin() 方法，新增了查询教师信息的功能。并且写入session中。
 *
 */

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ITeacherService teacherService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private IStudentService studentService;
	
	@Autowired
	private IMajorService majorService;
	
	@RequestMapping(value="/login/login")
	public String studentLogin(String userNo,String password,Model model,HttpServletRequest request) {
		
		User currentUser = userService.login(userNo, password);
		if("".equals(currentUser)||currentUser==null) {
			 return "redirect:/wronglogin";
		}
		if(currentUser.getPermission()==1) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(3600);
			// user 表中的关于学生的信息
			session.setAttribute("currentUser", currentUser);
			
			// student 表中的信息
			Student student = studentService.getStudentByNO(userNo);
			int majorId = student.getMajorId();
			String majorName = majorService.getNameById(majorId);
			student.setMajorName(majorName);
			
			session.setAttribute("student", student);
			// model.addAttribute("userNo", userNo);
			return "student/main.jsp";
		}
		
		if(currentUser.getPermission()==2) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(3600);
			// 在user表的信息
			session.setAttribute("currentUser", currentUser);
			
			// 完整的teacher信息
			Teacher teacher = teacherService.showInfoByNo(userNo);
			int depId = teacher.getDepartmentId();
			String depName = departmentService.getNameById(depId);
			teacher.setDepartmentName(depName);
			
			session.setAttribute("teacher", teacher);
			//model.addAttribute("userNo", userNo);
			return "teacher/main.jsp";
		}
		
		if(currentUser.getPermission()==3) {
			// request.getSession().setAttribute("userNo", userNo);
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(3600);
			
			session.setAttribute("currentUser", currentUser);
			//model.addAttribute("userNo", userNo);
			return "admin/main.jsp";
		}
		
		else {
			model.addAttribute("message", "");
			return "error.jsp";
		}
	}
	
	@RequestMapping(value="/wronglogin")
	public String wronglogin(Model model,HttpServletRequest request, String currentUserNo) { 
		model.addAttribute("message", "Wrong User Name or Password");
		return "../../index.jsp";
	}
	
	@RequestMapping(value="/quit")
	public String quitSystem(Model model,HttpServletRequest request, String currentUserNo) { 
		request.getSession().invalidate();
		return "../../index.jsp";
	}
	
	@RequestMapping(value="/modifyPassword",method=RequestMethod.POST)
	public String modifyPassword(Model model,String newPassword1,String currentUserNo) {
		
		/*System.out.println("新的密码："+newPassword1);
		System.out.println("账户："+currentUserNo);*/
		int num = userService.modifyPassword(currentUserNo, newPassword1);
		System.out.println("修改了"+num+"条数据");
		model.addAttribute("num", num);
		return "modifySuccess.jsp";
	}
	
}