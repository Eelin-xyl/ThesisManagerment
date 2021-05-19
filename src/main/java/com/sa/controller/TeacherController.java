package com.sa.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sa.entity.Student;
import com.sa.entity.StudentScore;
import com.sa.entity.StudentTaskBookOpening;
import com.sa.entity.Teacher;
import com.sa.entity.TeacherProgress;
import com.sa.entity.TeacherTaskBookOpening;
import com.sa.entity.ThesisInformation;
import com.sa.entity.ThesisPaper;
import com.sa.entity.ThesisTitle;
import com.sa.entity.Topic;
import com.sa.entity.User;
import com.sa.service.IDepartmentService;
import com.sa.service.ITeacherService;

import net.sf.json.JSONArray;


@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
	
	
	@Autowired
	private ITeacherService teacherService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	
	/*@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addTeacherForm(Model model) {
		return "teacher/addTeacher.jsp";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addTeacher(HttpServletRequest request,String teacherNo, String teacherName,String sex,String inputMan,String phone,String department,Model model) throws Exception {
		teacherNo = new String(teacherNo.getBytes("iso-8859-1"),"utf-8");
		teacherName = new String(teacherName.getBytes("iso-8859-1"),"utf-8");
		sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
		inputMan = new String(inputMan.getBytes("iso-8859-1"),"utf-8");
		phone = new String(phone.getBytes("iso-8859-1"),"utf-8");
		department = new String(department.getBytes("iso-8859-1"),"utf-8");
		
		Date currentTime = new Date();
		
		Teacher teacher = new Teacher();
		teacher.setTeacherNo(teacherNo);
		teacher.setTeacherName(teacherName);
		teacher.setDepartmentId(Integer.parseInt(department));
		teacher.setSex(sex);
		teacher.setInputMan(inputMan);
		teacher.setLastModifyTime(currentTime);
		teacher.setPhone(phone);
		
		int addNum = teacherService.addTeacher(teacher);
		System.out.println("添加数目："+addNum);
		
		return "teacher/addSuccess.jsp";
	}*/
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String teacherMainForm() {
		return "teacher/main.jsp";
	}
	
	@RequestMapping(value="/modifyInfo",method=RequestMethod.GET)
	public String teacherModifyInfoForm() {
		return "teacher/teacherModifyInfo.jsp";
	}
	
	@RequestMapping(value="/modifyPassword",method=RequestMethod.GET)
	public String teacherModifyPasswordForm() {
		return "teacher/teacherModifyPassword.jsp";
	}
	
	@RequestMapping(value="/uploadThesisTitle",method=RequestMethod.GET)
	public String teacherUploadThesisTitleForm() {
		return "teacher/teacherUploadThesisTitle.jsp";
	}
	
	@RequestMapping(value="/modifyThesisTitle",method=RequestMethod.GET)
	public String teacherModifyThesisTitleForm() {
		return "teacher/teacherModifyThesisTitle.jsp";
	}
	
	@RequestMapping(value="/thesisResult",method=RequestMethod.GET)
	public String teacherThesisResultForm(Model model,HttpServletRequest request) {
		teacherShowAllThesisTitle(model, request);
		
		return "teacher/teacherThesisResult.jsp";
	}
	
	@RequestMapping(value="/uploadTaskBook",method=RequestMethod.GET)
	public String teacherUploadTaskBookForm() {
		return "teacher/teacherUploadTakeBook.jsp";
	}

//	@RequestMapping(value="/uploadOpening",method=RequestMethod.GET)
//	public String teacherUploadOpeningForm() {
//		return "teacher/teacherUploadOpeningReport.jsp";
//	}

	@RequestMapping(value="/checkOppening")
	public String teacherCheckOppeningForm(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<Student> students = teacherService.getAllStudentInfo(teacherId);
		for(int i=0;i<students.size();i++) {
			int studentId = students.get(i).getId();
			StudentTaskBookOpening STBO = teacherService.getStudentOpeningByStudentId(studentId);
			if(STBO == null || "".equals(STBO)) {
				
			}else {
				String openingPath = STBO.getStudentOpeningResport();
				students.get(i).setStudentOpeningPath(openingPath);
				String[] str = openingPath.split("\\\\");
				String fileName = str[str.length-1].toString();
				students.get(i).setStudentOpeningName(fileName);
				int completion = STBO.getCompletion();
				if(completion==0) {
					students.get(i).setCompletionName("未审核");
				}else if(completion==1) {
					students.get(i).setCompletionName("未通过");
				}else {
					students.get(i).setCompletionName("审核通过");;
				}
			}
		}
		
		model.addAttribute("studentList", students);
		
		return "teacher/teacherCheckOpeningReport.jsp";
	}

	@RequestMapping(value="/publishProgress",method=RequestMethod.GET)
	public String teacherPublishProgressForm() {
		return "teacher/teacherPublishProgressNotification.jsp";
	}
	
	@RequestMapping(value="/checkProgress")
	public String teacherCheckProgressForm(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		
		List<TeacherProgress> teacherProgressList = teacherService.getTeacherProgressByTeacherId(teacherId);
		
		for(int i=0;i<teacherProgressList.size();i++) {
			int studentId = teacherProgressList.get(i).getStudentId();
			String studentName = teacherService.getStudentInfoByStudentId(studentId).getStudentName();
			int thesisId = teacherService.getTopicInfoByStudentId(studentId).getThesisId();
			String thesisTitleName = teacherService.getThesisInfoByThesisId(thesisId).getThesisName();
			
			teacherProgressList.get(i).setStudentName(studentName);
			teacherProgressList.get(i).setThesisTitleName(thesisTitleName);
			
			int status= teacherProgressList.get(i).getState();
			if(status == 0) {
				teacherProgressList.get(i).setStateName("还未查看");
			}else if(status == 1) {
				teacherProgressList.get(i).setStateName("不通过");
			}else {
				teacherProgressList.get(i).setStateName("通过");
			}
				
			
		}
		
		model.addAttribute("allStudentProgressList", teacherProgressList);
		
		return "teacher/teacherCheckProgressNotification.jsp";
	}
	
	@RequestMapping(value="/studentManage")
	public String teacherStudentManageForm(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		
		List<Student> students = teacherService.getAllStudentInfo(teacherId);
		for(int i=0;i<students.size();i++) {
			int studentId = students.get(i).getId();
			Topic topic = teacherService.getTopicInfoByStudentId(studentId);
			int thesisId = topic.getThesisId();
			ThesisTitle thesisTitle = teacherService.getThesisInfoByThesisId(thesisId);
			String thesisName = thesisTitle.getThesisName();
			students.get(i).setThesisName(thesisName);
		}
		model.addAttribute("studentList", students);
		
		return "teacher/teacherStudentManage.jsp";
	}
	

	@RequestMapping(value="/checkThesis")
	public String teacherCheckThesisForm(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<Student> students = teacherService.getAllStudentInfo(teacherId);
		Map<String, String> fileMap = new HashMap<String, String>();
		for(int i=0;i<students.size();i++) {
			int studentId = students.get(i).getId();
			if(studentId==0) {
				
			}else {
				int thesisId = teacherService.getTopicInfoByStudentId(studentId).getThesisId();
				String thesisName = teacherService.getThesisInfoByThesisId(thesisId).getThesisName();
				
				students.get(i).setThesisName(thesisName);
				
				ThesisInformation thesisInfo = teacherService.getInfoByStudentId(studentId);
				if(thesisInfo==null || "".equals(thesisInfo)) {
					
				}else {
					int status = thesisInfo.getStatus();
					if(status==0){
						students.get(i).setCompletionName("未查看");
					}else if(status == 1) {
						students.get(i).setCompletionName("未通过");
					}else {
						students.get(i).setCompletionName("通过");
					}
					String filePath = thesisInfo.getThesisText();
					String[] str = filePath.split("\\\\");
					String fileName = str[str.length-1].toString();
					students.get(i).setFileName(fileName);
					students.get(i).setFilePath(filePath);
				}
			}
		}
		model.addAttribute("fileList", students);
		// model.addAttribute("fileList", fileMap);
		return "teacher/teacherCheckThesis.jsp";
	}

	@RequestMapping(value="/scoreAdd",method=RequestMethod.GET)
	public String teacherScoreAddForm() {
		return "teacher/teacherScore.jsp";
	}

	@RequestMapping(value="/scoreModify",method=RequestMethod.GET)
	public String teacherScoreForm(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<Student> allStudents = teacherService.getAllStudentInfo(teacherId);
		
		List<Student> student4pass = new ArrayList<Student>();
		for(int i=0;i<allStudents.size();i++) {
			int studentId = allStudents.get(i).getId();
			ThesisInformation thesisInfor = teacherService.getInfoByStudentId(studentId);
			if(thesisInfor == null || "".equals(thesisInfor)) {
				
			}else {
				student4pass.add(allStudents.get(i));
			}
		}
		for(int i=0;i<student4pass.size();i++) {
			int studentId = student4pass.get(i).getId();
			StudentScore studentScore = teacherService.showInfoByStudentId(studentId);
			if(studentScore == null || "".equals(studentScore)) {
				model.addAttribute("message", "尚未添加过学生成绩");
				return "teacher/teacherScore.jsp";
			}else {
				int thesisScore  = teacherService.showInfoByStudentId(studentId).getThesisResult();
				student4pass.get(i).setThesisScore(thesisScore);
				model.addAttribute("studentList", student4pass);
				return "teacher/teacherModifyScore.jsp";
			}
			
		}
		
		return "teacher/teacherModifyScore.jsp";
	}
	
	@RequestMapping(value="/modifyInfoToDb",method=RequestMethod.POST)
	public String teacherModifyInfoToDb(Model model,HttpServletRequest request,int id,String teacherNo, String departmentOld, String teacherName,String sex,String phone,String department) throws Exception {
		
		// 以下代码是教师修改教师信息的代码
		int departmentId = 0;
		departmentOld = new String(departmentOld.getBytes("iso-8859-1"),"utf-8");
		departmentId =  departmentService.getIdByName(departmentOld);
		
		teacherNo = new String(teacherNo.getBytes("iso-8859-1"),"utf-8");
		teacherName = new String(teacherName.getBytes("iso-8859-1"),"utf-8");
		sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
		User user = (User)request.getSession().getAttribute("currentUser");
		String inputMan = user.getUserNo();
		phone = new String(phone.getBytes("iso-8859-1"),"utf-8");
		department = new String(department.getBytes("iso-8859-1"),"utf-8");
		Date currentTime = new Date();
		
		Teacher teacher = new Teacher();
		teacher.setId(id);
		teacher.setTeacherNo(teacherNo);
		teacher.setTeacherName(teacherName);
		if (department == null || "".equals(department)) {
			teacher.setDepartmentId(departmentId);
		}else {
			teacher.setDepartmentId(Integer.parseInt(department));
		}
		teacher.setSex(sex);
		teacher.setInputMan(inputMan);
		teacher.setLastModifyTime(currentTime);
		teacher.setPhone(phone);
		
		int num = teacherService.updateTeacher(teacher);
		System.out.println("修改数目："+num);
		
		// 根据 院系id 获得院系name
		int depId = teacher.getDepartmentId();
		String depName = departmentService.getNameById(depId);
		teacher.setDepartmentName(depName);
		
		HttpSession session = request.getSession();
		session.setAttribute("teacher", teacher);
		
		return "teacher/main.jsp";
	}
	
	@RequestMapping(value="/uploadThesisTitle",method=RequestMethod.POST)
	public String teacherUploadThesisTitle(Model model,HttpServletRequest request,String thesisTitle,String thesisDesc) throws Exception {
		thesisTitle = new String(thesisTitle.getBytes("iso-8859-1"),"utf-8");
		thesisDesc = new String(thesisDesc.getBytes("iso-8859-1"),"utf-8");
		
		if(thesisTitle == null || "".equals(thesisTitle)) {
			model.addAttribute("message", "上传课题题目不能为空");
			return "teacher/main.jsp";
		}else if(thesisDesc == null || "".equals(thesisDesc)) {
			model.addAttribute("message", "上传课题描述不能为空");
			return "teacher/main.jsp";
		}else {
			Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
			int teacherId = currentTeacher.getId();
			String teacherName = currentTeacher.getTeacherName();
			Date time = new Date();
			
			ThesisTitle thesis = new ThesisTitle();
			thesis.setThesisName(thesisTitle);
			thesis.setTeacherId(teacherId);
			thesis.setSubmitTime(time);
			thesis.setInputMan(teacherName);
			thesis.setDescription(thesisDesc);
			
			int num = teacherService.uploadThesisTitle(thesis);
			System.out.println("添加的课题数："+num);
			
			model.addAttribute("message", "上传成功");
			return "teacher/teacherUploadThesisTitle.jsp";
		}
		
	}
	
	@RequestMapping(value="/showAllThesisTitle",method=RequestMethod.POST)
	public String teacherShowAllThesisTitle(Model model,HttpServletRequest request) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<ThesisTitle> thesisList = teacherService.showAllThesisTitle(teacherId);
		
		for(int i=0;i<thesisList.size();i++) {
			int status = thesisList.get(i).getStatus();
			if(status == 1) {
				thesisList.get(i).setStatusName("未审核");
			}else if(status == 2) {
				thesisList.get(i).setStatusName("审核通过");
			}else {
				thesisList.get(i).setStatusName("未通过");
			}
		}
		
		model.addAttribute("thesisTitleList", thesisList);
		System.out.println("查询到该教师的课题有："+thesisList);
		
		return "teacher/teacherThesisResult.jsp";
	}
	
	@RequestMapping(value="/modifyThesisTitleFrom")
	public String teacherModifyThesisTitleFrom(Model model,HttpServletRequest request,int id) {
		ThesisTitle thesisTitle = teacherService.getThesisById(id);
		if(thesisTitle.getStatus()== 2) {
			model.addAttribute("thesisMessage", "该课题已经审核通过，不可更改");
			teacherThesisResultForm(model, request);
			return "teacher/teacherThesisResult.jsp";
		}else {
			System.out.println("thesisTitle是："+thesisTitle);
			model.addAttribute("id", thesisTitle.getId());
			model.addAttribute("thesisTitleName", thesisTitle.getThesisName());
			model.addAttribute("thesisTitleDesc", thesisTitle.getDescription());
			return "teacher/teacherModifyThesisTitle.jsp";
		}
	}
	
	@RequestMapping(value="/modifyThesisTitleToDb")
	public String teacherModifyThesisTitleToDb(Model model,HttpServletRequest request,int id,String thesisTitle,String thesisDesc) throws Exception {
		
		thesisTitle = new String(thesisTitle.getBytes("iso-8859-1"),"utf-8");
		thesisDesc = new String(thesisDesc.getBytes("iso-8859-1"),"utf-8");
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		String teacherName = currentTeacher.getTeacherName();
		Date time = new Date();
		
		ThesisTitle thesis = new ThesisTitle();
		thesis.setId(id);
		thesis.setThesisName(thesisTitle);
		thesis.setTeacherId(teacherId);
		thesis.setSubmitTime(time);
		thesis.setStatus(1);
		thesis.setInputMan(teacherName);
		thesis.setDescription(thesisDesc);
		
		int num = teacherService.updateThesisTitle(thesis);
		System.out.println("修改了："+num+"条数据。");
		
		teacherThesisResultForm(model, request);
		
		return "teacher/teacherThesisResult.jsp";
	}
	
	@RequestMapping(value="/deleteThesisTitle")
	public String teacherDeleteThesisTitle(Model model,HttpServletRequest request,int id) {
		ThesisTitle thesisTitle = teacherService.getThesisById(id);
		
		if(thesisTitle.getStatus()== 2) {
			model.addAttribute("thesisMessage", "该课题已经审核通过，不可删除");
			teacherThesisResultForm(model, request);
			return "teacher/teacherThesisResult.jsp";
		}else {
			int num = teacherService.deleteThesisTitle(id);
			System.out.println("删除了"+num+"条数据");
			teacherThesisResultForm(model, request);
			return "teacher/teacherThesisResult.jsp";
		}
	}
	
	@RequestMapping(value="/getAllAvailableTopic")
	public void teacherGetAllAvailableTopicForm(HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		/*List<ThesisTitle> thesisList = studentService.availableTopic();
		JSONArray json =  JSONArray.fromObject(thesisList);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter write = response.getWriter();
		write.write(json.toString());
		write.close();*/
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		
		List<ThesisTitle> thesisList = teacherService.showAllThesisTitleBeChecked(teacherId);
		JSONArray json =  JSONArray.fromObject(thesisList);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter write = response.getWriter();
		write.write(json.toString());
		write.close();
	}
	
	@RequestMapping(value="/uploadTaskBook")
	public String teacherUploadTaskBook(HttpServletRequest request,@RequestParam(value="topic4Teacher",required=false) int topic4Teacher,@RequestParam("file1") MultipartFile file1, Model model) throws Exception, IOException {
		
		// System.out.println("上传课题id:"+topic4Teacher);
		if(topic4Teacher == 0) {
			model.addAttribute("message", "上传任务书出错");
			return "teacher/main.jsp";
		}else {
			Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
			int teacherId = currentTeacher.getId();
			String teacherIdString = String.valueOf(teacherId);
			String thesisTitleString = String.valueOf(topic4Teacher);
			// System.out.println("当前用户："+teacherNo);
			if(!file1.isEmpty()) {
				
				File fileRoot = new File("E:\\ThesisManagement\\teacher");
				File fileDb1 = new File(fileRoot, teacherIdString);
				File fileDb = new File(fileDb1,thesisTitleString);
				String fileName = file1.getOriginalFilename();
				
				File filePath = new File(fileDb, fileName);
				
				// filePath 是必须的 , 文件保存的路径，若是注释掉会出现，空文件异常
				if(!filePath.getParentFile().exists()) {
					filePath.getParentFile().mkdirs();
				}
				
				file1.transferTo(new File(fileDb+File.separator+fileName));
				
				TeacherTaskBookOpening teacherTaskBookOpening = new TeacherTaskBookOpening();
				teacherTaskBookOpening.setTeacherId(teacherId);
				teacherTaskBookOpening.setTaskBook(filePath.toString());
				teacherTaskBookOpening.setThesisTitleId(topic4Teacher);
				int num = teacherService.uploadTaskBook(teacherTaskBookOpening);
				System.out.println("添加了"+num+"条信息，是课题id为 "+topic4Teacher+"的任务书");
				model.addAttribute("message", "成功上传任务书");
				return "teacher/main.jsp";
			}else {
				model.addAttribute("message", "上传任务书出错");
				return "teacher/main.jsp";
			}
			
			
		}
		
		
		
	}
	
	
//	@RequestMapping(value="/uploadOpening")
//	public String teacherUploadOpening(HttpServletRequest request,int topic4Teacher,@RequestParam("file1") MultipartFile file1, Model model) throws Exception, IOException {
//		
//		// System.out.println("上传课题id:"+topic4Teacher);
//		
//		if(topic4Teacher == 0) {
//			model.addAttribute("message", "上传开题报告出错");
//			return "teacher/main.jsp";
//		}else {
//			Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
//			int teacherId = currentTeacher.getId();
//			String teacherIdString = String.valueOf(teacherId);
//			String thesisTitleString = String.valueOf(topic4Teacher);
//			// System.out.println("当前用户："+teacherNo);
//			
//			if(!file1.isEmpty()) {
//				
//				File fileRoot = new File("E:\\ThesisManagement\\teacher");
//				File fileDb1 = new File(fileRoot, teacherIdString);
//				File fileDb = new File(fileDb1,thesisTitleString);
//				String fileName = file1.getOriginalFilename();
//				
//				File filePath = new File(fileDb, fileName);
//				
//				// filePath 是必须的 , 文件保存的路径，若是注释掉会出现，空文件异常
//				if(!filePath.getParentFile().exists()) {
//					filePath.getParentFile().mkdirs();
//				}
//				
//				file1.transferTo(new File(fileDb+File.separator+fileName));
//				
//				TeacherTaskBookOpening teacherTaskBookOpening = new TeacherTaskBookOpening();
//				teacherTaskBookOpening.setTeacherId(teacherId);
//				teacherTaskBookOpening.setOpeningReport(filePath.toString());
//				teacherTaskBookOpening.setThesisTitleId(topic4Teacher);
//				//int num = teacherService.uploadTaskBook(teacherTaskBookOpening);
//				int num = teacherService.uploadOpening(teacherTaskBookOpening);
//				System.out.println("添加了"+num+"条信息，是课题id为 "+topic4Teacher+"的开题报告");
//				model.addAttribute("message", "成功上传开题报告");
//				return "teacher/main.jsp";
//			}else {
//				model.addAttribute("message", "上传开题报告出错");
//				return "teacher/main.jsp";
//			}
//			
//			
//		}
//		
		
		
//	}
	
	@RequestMapping(value="/uploadFileResult",method=RequestMethod.GET)
	public String teacherUploadFileResult(HttpServletRequest request,Model model) {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		
		Map<String, String> fileToList = teacherService.uploadTaskBookOpeningResult(teacherId);
		
		model.addAttribute("fileList", fileToList);
		return "teacher/teacherUploadFileResult.jsp";
	}
	
	@RequestMapping(value="/fileDownload")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request, @RequestParam("filePath") String filePath,@RequestParam("fileName") String fileName, Model model) throws Exception {
		fileName = new String(fileName.getBytes("iso-8859-1"),"utf-8");
		filePath = new String(filePath.getBytes("iso-8859-1"),"utf-8");
		File file = new File(filePath);
		HttpHeaders headers = new HttpHeaders();
		String downloadFile = new String(fileName.getBytes("utf-8"), "iso-8859-1");
		headers.setContentDispositionFormData("attachment", downloadFile);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED); 
	}
	
	@RequestMapping(value="/fileDelete")
	public String fileDelete(HttpServletRequest request,HttpServletResponse response, @RequestParam("filePath") String filePath,@RequestParam("fileName") String fileName, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		fileName = new String(fileName.getBytes("iso-8859-1"),"utf-8");
		filePath = new String(filePath.getBytes("iso-8859-1"),"utf-8");
		File deleteFile = new File(filePath);
		String message = "";
		boolean flag = false;
		if(deleteFile.exists()) {
			flag = deleteFile.delete();
			if(flag ) {
				message = "删除成功";
			}else {
				message = "删除失败";
			}
			
		}else {
			message = "文件不存在";
		}
		
		String thesisTitleId = teacherService.getThesisTitleByFilePath(filePath);
		int thesisId = Integer.parseInt(thesisTitleId);
		int dbThesisId=0;
		TeacherTaskBookOpening TTBO1 = teacherService.getThesisIdByTask(filePath);
		TeacherTaskBookOpening TTBO2 = teacherService.getThesisIdByOpening(filePath);
		if(TTBO1 == null || "".equals(TTBO1)) {
			
		}else {
			dbThesisId = TTBO1.getThesisTitleId();
			int num = teacherService.resetTask(dbThesisId);
			System.out.println("成功把task置为null:"+num+"条");
		}
		
		if(TTBO2 ==null || "".equals(TTBO2)) {
			
		}else {
			dbThesisId = TTBO2.getThesisTitleId();
			int num = teacherService.resetOpening(dbThesisId);
			System.out.println("成功把Opening置为null:"+num+"条");
			
		}
		TeacherTaskBookOpening tt = teacherService.getTaskOpeningByThesisId(thesisId);
		
		
		if((tt.getOpeningReport()==null || "".equals(tt.getOpeningReport())) &&(tt.getTaskBook()==null || "".equals(tt.getTaskBook())) ) {
			int num = teacherService.deleteTaskBookOpening(thesisId);
			System.out.println("成功删除了整行数据:"+num+"条");
		}
		
		model.addAttribute("deleteMessage", "成功删除一个文档");
	
		return "teacher/main.jsp";
	}
	@RequestMapping(value="/openingPass")
	public String teacherOpeningPass(HttpServletRequest request, @RequestParam("studentNo") String studentNo,@RequestParam("filePath") String filePath,@RequestParam("fileName") String fileName, Model model) {
		int num = teacherService.passOpening(studentNo);
		System.out.println("成功修改了"+num+"条数据");
		model.addAttribute("message", "通过审核");
		teacherCheckOppeningForm(request, model);
		return "teacher/teacherCheckOpeningReport.jsp";
	}
	
	@RequestMapping(value="/openingFail")
	public String teacherOpeningFail(HttpServletRequest request, @RequestParam("studentNo") String studentNo,@RequestParam("filePath") String filePath,@RequestParam("fileName") String fileName, Model model) {
		int num = teacherService.failOpening(studentNo);
		System.out.println("成功修改了"+num+"条数据");
		model.addAttribute("message", "审核不通过");
		teacherCheckOppeningForm(request, model);
		return "teacher/teacherCheckOpeningReport.jsp";
	}
	
	@RequestMapping(value="/getStudent4Teacher")
	public void teacherGetStudent4Teacher(HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<Student> students = teacherService.getAllStudentInfo(teacherId);
		JSONArray json = JSONArray.fromObject(students);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter write = response.getWriter();
		write.write(json.toString());
		write.close();
	}
	
	@RequestMapping(value="/publishTeacherProgress")
	public String teacherPublishTeacherProgress(HttpServletResponse response, HttpServletRequest request,@RequestParam("studentId") int studentId,@RequestParam("progressContext") String progressContext, Model model) throws IOException {
		progressContext = new String(progressContext.getBytes("iso-8859-1"),"utf-8");
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		String inputMan = currentTeacher.getTeacherName();
		Date time = new Date();
		
		
		TeacherProgress teacherProgress = new TeacherProgress();
		teacherProgress.setContext(progressContext);
		teacherProgress.setInputMan(inputMan);
		teacherProgress.setInputTime(time);
		teacherProgress.setStudentId(studentId);
		teacherProgress.setTeacherId(teacherId);
		
		int num = teacherService.addTeacherProgress(teacherProgress);
		System.out.println("添加任务通知"+num+"条");
		model.addAttribute("message", "成功给学生添加任务通知");
		return "teacher/main.jsp";
	}
	
	@RequestMapping(value="/passProgress")
	public String teacherPassProgress(HttpServletRequest request, @RequestParam("progressId") int progressId,Model model) throws IOException {
		int num = teacherService.passProgress(progressId);
		System.out.println("审核阶段任务通过："+num);
		teacherCheckProgressForm(request, model);
		return "teacher/teacherCheckProgressNotification.jsp";
	}
	
	@RequestMapping(value="/failProgress")
	public String teacherFailProgress(HttpServletRequest request, @RequestParam("progressId") int progressId,Model model) throws IOException {
		int num = teacherService.failProgress(progressId);
		System.out.println("审核阶段任务未通过："+num);
		teacherCheckProgressForm(request, model);
		return "teacher/teacherCheckProgressNotification.jsp";
	}
	
	@RequestMapping(value="/passThesisInfo")
	public String teacherPassThesisInfo(HttpServletRequest request, @RequestParam("studentId") int studentId,Model model) throws IOException {
		int num = teacherService.passThesisInformation(studentId);
		System.out.println("审核论文通过："+num);
		teacherCheckThesisForm(request, model);
		return "teacher/teacherCheckThesis.jsp";
	}
	
	@RequestMapping(value="/failThesisInfo")
	public String teacherFailThesisInfo(HttpServletRequest request, @RequestParam("studentId") int studentId,Model model) throws IOException {
		int num = teacherService.failThesisInformation(studentId);
		System.out.println("审核论文未通过："+num);
		teacherCheckThesisForm(request, model);
		return "teacher/teacherCheckThesis.jsp";
	}
	
	@RequestMapping(value="/showStudent4Pass")
	public void teacherShowStudent4Pass(HttpServletResponse response, HttpServletRequest request,Model model) throws IOException {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		int teacherId = currentTeacher.getId();
		List<Student> allStudents = teacherService.getAllStudentInfo(teacherId);
		
		List<Student> student4pass = new ArrayList<Student>();
		for(int i=0;i<allStudents.size();i++) {
			int studentId = allStudents.get(i).getId();
			ThesisInformation thesisInfor = teacherService.getInfoByStudentId(studentId);
			
			if(thesisInfor == null || "".equals(thesisInfor)||thesisInfor.getStatus()!=2) {
				
			}else {
				student4pass.add(allStudents.get(i));
			}
		}
		
		JSONArray json =  JSONArray.fromObject(student4pass);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter write = response.getWriter();
		write.write(json.toString());
		write.close();
	}
	
	@RequestMapping(value="/addStudentScore")
	public String teacherAddStudentScore(HttpServletRequest request, @RequestParam("studentList") int studentList,@RequestParam("score") int score,Model model) throws IOException {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		String teacherName = currentTeacher.getTeacherName();
		
		StudentScore Ss = teacherService.showInfoByStudentId(studentList);
		if(Ss == null || "".equals(Ss)) {
			StudentScore studentScore = new StudentScore();
			studentScore.setStudentId(studentList);
			studentScore.setThesisResult(score);
			studentScore.setInputMan(teacherName);
			
			
			int num = teacherService.addStudentScore(studentScore);
			System.out.println("添加"+num+"条学生成绩");
			model.addAttribute("message", "添加一条学生成绩");
			
			return "teacher/main.jsp";
		}else {
			model.addAttribute("message", "该学生已经添加过成绩");
			return "teacher/main.jsp";
		}
		
		
	}
	
	@RequestMapping(value="/modifyStudentScore")
	public String teacherModifyStudentScore(@RequestParam("id") int id,Model model) {
		StudentScore s = teacherService.showInfoByStudentId(id);
		model.addAttribute("scoreList", s);
		
		return "teacher/teacherModifyScore4Db.jsp";
	}
	
	
	
	
	@RequestMapping(value="/modifyStudentScoreToDb")
	public String teacherModifyStudentScoreToDb(HttpServletRequest request, @RequestParam("id") int id,@RequestParam("studentScoreNew") int studentScoreNew,Model model) throws IOException {
		Teacher currentTeacher = (Teacher)request.getSession().getAttribute("teacher");
		String teacherName = currentTeacher.getTeacherName();
		
		StudentScore score = new StudentScore();
		score.setThesisResult(studentScoreNew);
		score.setStudentId(id);
		score.setInputMan(teacherName);
		teacherService.modifyStudentScore(score);
		
		model.addAttribute("message", "修改成功");
		
		return "teacher/main.jsp";
	}
	
	
}
