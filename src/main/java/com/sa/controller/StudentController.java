package com.sa.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
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
import com.sa.entity.TeacherProgress;
import com.sa.entity.TeacherTaskBookOpening;
import com.sa.entity.ThesisInformation;
import com.sa.entity.ThesisTitle;
import com.sa.entity.Topic;
import com.sa.entity.User;
import com.sa.service.IMajorService;
import com.sa.service.IStudentService;
import com.sa.service.ITeacherService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/student")
public class StudentController {

	@Autowired
	private IStudentService studentService;
	
	@Autowired
	private IMajorService majorService;
	
	@Autowired
	private ITeacherService teacherService;
	
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String studentMainForm() {
		return "student/main.jsp";
	}
	
	@RequestMapping(value="/modifyInfo",method=RequestMethod.GET)
	public String studentMofidyInfoForm() {
		return "student/studentModifyInfo.jsp";
	}
	
	@RequestMapping(value="/modifyPassword",method=RequestMethod.GET)
	public String studentMofidyPasswordForm() {
		return "student/studentModifyPassword.jsp";
	}
	
	@RequestMapping(value="/thesis",method=RequestMethod.GET)
	public String studentThesis(HttpServletResponse response,HttpServletRequest request,Model model) {
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		String userNo = currentUser.getUserNo();
		
		Student student = studentService.getStudentByNO(userNo);
		int studentId = student.getId();
		Topic topic = studentService.chosenThesisTitle(studentId);
		if(topic == null || "".equals(topic)) {
			return "student/studentThesis.jsp";
		}else {
			model.addAttribute("topicMessage", "You can only choose a topic once.");
			return "student/main.jsp";
		}
	}
	
	@RequestMapping(value="/thesisResult",method=RequestMethod.GET)
	public String studentThesisResult(HttpServletResponse response,HttpServletRequest request,Model model) {
		User currnetUser = (User)request.getSession().getAttribute("currentUser");
		String studentNo = currnetUser.getUserNo();
		Student student = studentService.getStudentByNO(studentNo);
		int studentId = student.getId();
		Topic topic = studentService.chosenThesisTitle(studentId);
		if(topic == null || "".equals(topic)) {
			model.addAttribute("topicMessage", "Please select a topic first.");			
			return "student/main.jsp";
		}else {
			int thesisId = topic.getThesisId();
			
			ThesisTitle theisTitle = teacherService.getThesisById(thesisId);
			String topicName = theisTitle.getThesisName();
			
			model.addAttribute("topicName", topicName);			
			return "student/studentThesisResult.jsp";
		}
		
	}
	
	@RequestMapping(value="/viewTaskOpening")
	public String studentViewTaskOpening(HttpServletRequest request,Model model) {
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		Topic topic = studentService.chosenThesisTitle(studentId);
		if(topic == null || "".equals(topic)) {
			model.addAttribute("message", "Please select a topic first.");
			return "student/studentAssignment.jsp";
		}else {
			int thesisId = topic.getThesisId();
			TeacherTaskBookOpening ttbo = studentService.getFilePathByThesisId(thesisId);
			if(ttbo==null || "".equals(ttbo)) {
				return "student/studentAssignment.jsp";
			}else {
				String taskBookPath = ttbo.getTaskBook();
				
				//get opening report path
//				String openingPath = ttbo.getOpeningReport();			
				Map<String, String> fileList = new HashMap<String, String>();

				if(taskBookPath == null || "".equals(taskBookPath)) {
					
				}else {
					String[] str1 = taskBookPath.split("\\\\");
					String taskBookName = str1[str1.length-1].toString();
					fileList.put(taskBookName, taskBookPath);
				}
				
//				if(openingPath == null || "".equals(openingPath)) {
//					
//				}else {
//					String[] str2 = openingPath.split("\\\\");
//					String openingName = str2[str2.length-1].toString();
//					fileList.put(openingName, openingPath);
//				}
				model.addAttribute("fileList", fileList);
				
				return "student/studentAssignment.jsp";
			}
			
		}
		
		
	}
	
	@RequestMapping(value="/sectionTask")
	public String studentSectionTask(HttpServletRequest request,Model model) {
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		
		List<TeacherProgress> progresses = studentService.getTeacherProgressByStudentId(studentId);
		
		model.addAttribute("progressList", progresses);
		return "student/studentSectionTask.jsp";
	}
	
	@RequestMapping(value="/uploadFile",method=RequestMethod.GET)
	public String studentUploadFile() {
		return "student/studentUploadFile.jsp";
	}
	
	@RequestMapping(value="/resourcesDownload")
	public String studentDownload(HttpServletRequest request,Model model) {
		
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		
		Map<String, String> fileList = studentService.getTaskBookOpeningToMap(studentId);
		if(fileList.isEmpty()) {
			return "student/studentDownload.jsp";
		}else {
			ThesisInformation thesisInformation4Db = studentService.getInfoByStudentId(studentId);
			if(thesisInformation4Db ==null) {
				
			}else {
				String filePath = thesisInformation4Db.getThesisText();
				String[] str = filePath.split("\\\\");
				String fileName = str[str.length-1].toString();
				fileList.put(fileName, filePath);
			}
			
			model.addAttribute("fileList", fileList);
			return "student/studentDownload.jsp";
		}
	}
	
	
	@RequestMapping(value="/score")
	public String studentScore(HttpServletRequest request,Model model) {
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		StudentScore dbScore = teacherService.showInfoByStudentId(studentId);
		if(dbScore == null || "".equals(dbScore)) {
			model.addAttribute("message", "You have no score yet.");
			return "student/main.jsp";
			
		}else {
			String studentName = teacherService.getStudentInfoByStudentId(studentId).getStudentName();
			int thesisId = teacherService.getTopicInfoByStudentId(studentId).getThesisId();
			String thesisName = teacherService.getThesisById(thesisId).getThesisName();
			int score = teacherService.showInfoByStudentId(studentId).getThesisResult();
			Student student = new Student();
			student.setStudentName(studentName);
			student.setThesisName(thesisName);
			student.setThesisScore(score);
			
			model.addAttribute("studentList", student);
			
			return "student/studentScore.jsp";
		}
		
	}
	
	@RequestMapping(value="/modifyInfoToDb",method=RequestMethod.POST)
	public String studentModifyInfoToDb(Model model,HttpServletRequest request,int id,String studentNo, String studentName,String sex,String majorOld,String major,String grade, String phone) throws Exception {
		
		// Update student information
		int majorId = 0;
		majorOld = new String(majorOld.getBytes("iso-8859-1"),"utf-8");
		majorId = majorService.getIdByName(majorOld);
		studentNo = new String(studentNo.getBytes("iso-8859-1"),"utf-8");
		studentName = new String(studentName.getBytes("iso-8859-1"),"utf-8");
		grade = new String(grade.getBytes("iso-8859-1"),"utf-8");
		sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
		User user = (User)request.getSession().getAttribute("currentUser");
		String inputMan = user.getUserNo();
		phone = new String(phone.getBytes("iso-8859-1"),"utf-8");
		major = new String(major.getBytes("iso-8859-1"),"utf-8");
		Date currentTime = new Date();
		
		
		Student student = new Student();
		student.setId(id);
		student.setStudentNo(studentNo);
		student.setStudentName(studentName);
		
		if (major == null || "".equals(major)) {
			student.setMajorId(majorId);
		}else {
			student.setMajorId(Integer.parseInt(major));
		}
		student.setGrade(grade);
		student.setSex(sex);
		student.setInputMan(inputMan);
		student.setLastModifyTime(currentTime);
		student.setPhone(phone);

		studentService.updateStudent(student);
		
		// get department based on major
		int majId = student.getMajorId();
		String majorNameNew = majorService.getNameById(majId);
		student.setMajorName(majorNameNew);
		
		HttpSession session = request.getSession();
		session.setAttribute("student", student);
		model.addAttribute("message", "Modify successfully.");
		return "student/main.jsp";
	}
	
	@RequestMapping(value="/getAllAvailableTopic")
	public void studentGetAllAvailableTopicForm(HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		List<ThesisTitle> thesisList = studentService.availableTopic();
		JSONArray json =  JSONArray.fromObject(thesisList);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter write = response.getWriter();
		write.write(json.toString());
		write.close();
	}
	
	@RequestMapping(value="/selectTopic")
	public String studentSelectTopic(HttpServletResponse response,HttpServletRequest request,Model model,int id,int topic) throws Exception {
		
		Topic top = new Topic();
		top.setStudentId(id);
		top.setThesisId(topic);
		Date time = new Date();
		top.setSelectTime(time);
		
		studentService.addTopicToDb(top);

		Student student = studentService.getStudentNameById(id);
		String studentNo = student.getStudentNo();
		
		ThesisTitle thesis = studentService.getThesisInfoByid(topic);
		String thesisName = thesis.getThesisName();
		
		studentThesisResult(response, request, model);
		return "student/studentThesisResult.jsp";
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
	
	@RequestMapping(value="/uploadOpening")
	public String studentUploadOpening(HttpServletRequest request, Model model,@RequestParam("file") MultipartFile file) throws Exception {
		
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		
		String studentIdToString = String.valueOf(studentId);
		
		Topic topic = studentService.chosenThesisTitle(studentId);
		if(topic == null || "".equals(topic)) {
			model.addAttribute("message", "can not upload file.");
			return "student/main.jsp";
		}else {
			if(!file.isEmpty()) {
				
				File fileRoot = new File("E:\\ThesisManagement\\student");
				File fileDb = new File(fileRoot, studentIdToString);
				String fileName = file.getOriginalFilename();
				
				File filePath = new File(fileDb, fileName);
				
				if(!filePath.getParentFile().exists()) {
					filePath.getParentFile().mkdirs();
				}
				
				file.transferTo(new File(fileDb+File.separator+fileName));
				
				studentService.uploadOpening(studentId, filePath.toString());

				model.addAttribute("message", "Upload successfully");
				return "student/main.jsp";
			}else {
				model.addAttribute("message", "Fail to upload.");
				return "student/main.jsp";
			}
		}
	}
	
	@RequestMapping(value="/fileDelete")
	public String fileDelete(HttpServletRequest request,HttpServletResponse response, @RequestParam("filePath") String filePath,@RequestParam("fileName") String fileName, Model model) throws Exception {
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		
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
				message = "Delete successfully";
			}else {
				message = "Fail to delete";
			}
			
		}else {
			message = "This file does not exist";
		}
		
		ThesisInformation thesis = studentService.getInfoByFilePath(filePath);
		if(thesis== null || "".equals(thesis)) {
			
		}else {
			studentService.deleteThesisInformation(studentId);
			System.out.println("Delete thesis successfully");
		}
		StudentTaskBookOpening STBO2 = studentService.getInfoByOpeningPath(filePath);
		if(STBO2==null || "".equals(STBO2) ) {
			
		}else {
			studentService.resetOpening(studentId);
			System.out.println("Delete Opening Report successfully");
		}
		
		model.addAttribute("message", "Delete successfully.");
	
		return "student/main.jsp";
	}
	
	@RequestMapping(value="/openingResult")
	public String studentOpeningResult(HttpServletRequest request,Model model) {
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		StudentTaskBookOpening STBO = studentService.getSTBOInfoById(studentId);
		if(STBO == null || "".equals(STBO)) {
			model.addAttribute("message", "The proposal has not yet been submitted.");
			return "student/studentOpeningResult.jsp";
		}else {
			int completion = STBO.getCompletion();
			if(completion == 0) {
				model.addAttribute("message", "Your proposal has not been reviewed.");
			}else if(completion == 1) {
				model.addAttribute("message", "Your proposal failed, please submit after modification.");
			}else {
				model.addAttribute("message", "Your proposal has passed.");
			}
		}
		return "student/studentOpeningResult.jsp";
	}
	
	
	@RequestMapping(value="/uploadThesisInformation")
	public String studentUploadThesisInformation(HttpServletRequest request, Model model,@RequestParam("file") MultipartFile file) throws Exception {
		
		Student currentUser = (Student)request.getSession().getAttribute("student");
		int studentId = currentUser.getId();
		
		String studentIdToString = String.valueOf(studentId);
		
		Topic topic = studentService.chosenThesisTitle(studentId);
		if(topic == null || "".equals(topic)) {
			model.addAttribute("message", "You can not upload thesis.");
			return "student/main.jsp";
		}else {
			
			StudentTaskBookOpening stbo  = studentService.getSTBOInfoById(studentId);
			if(stbo == null || "".equals(stbo)) {
				model.addAttribute("message", "Your proposal has not been reviewed or uploaded.");
				return "student/main.jsp";
			}else {
				int completion = stbo.getCompletion();
				if(completion == 2) {
					if(!file.isEmpty()) {
						
						File fileRoot = new File("E:\\ThesisManagement\\student");
						File fileDb = new File(fileRoot, studentIdToString);
						String fileName = file.getOriginalFilename();
						
						File filePath = new File(fileDb, fileName);
						
						if(!filePath.getParentFile().exists()) {
							filePath.getParentFile().mkdirs();
						}
						
						file.transferTo(new File(fileDb+File.separator+fileName));

						studentService.uploadThesisInformation(studentId, filePath.toString());

						model.addAttribute("message", "Upload thesis successfully.");
						return "student/main.jsp";
					}else {
						model.addAttribute("message", "Fail to upload thesis.");
						return "student/main.jsp";
					}
					
				}else {
					
					model.addAttribute("message", "Your proposal has not been reviewed or uploaded.");
					return "student/main.jsp";
					}
				}
			}
		}
	}
