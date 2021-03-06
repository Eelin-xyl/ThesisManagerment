package com.sa.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sa.dao.IStudentDao;
import com.sa.dao.IStudentScoreDao;
import com.sa.dao.IStudentTaskBookOpeningDao;
import com.sa.dao.ITeacherDao;
import com.sa.dao.ITeacherProgressDao;
import com.sa.dao.ITeacherTaskBookOpeningDao;
import com.sa.dao.IThesisInformationDao;
import com.sa.dao.IThesisPaperDao;
import com.sa.dao.IThesisTitleDao;
import com.sa.dao.ITopicDao;
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
import com.sa.service.ITeacherService;

@Service
public class TeacherServiceImpl implements ITeacherService {
	
	@Autowired
	private ITeacherDao teacherDao;
	
	@Autowired
	private IThesisTitleDao thesisTitleDao;
	
	@Autowired
	private ITeacherTaskBookOpeningDao teacherTaskBookOpeningDao;
	
	@Autowired
	private ITopicDao topicDao;
	
	@Autowired
	private IStudentDao studentDao;
	
	@Autowired
	private IStudentTaskBookOpeningDao studentTaskBookOpeningDao;
	
	@Autowired
	private ITeacherProgressDao teacherProgressDao;
	
	@Autowired
	private IThesisInformationDao thesisInformationDao;
	
	@Autowired
	private IStudentScoreDao studentScoreDao;
	
	@Autowired
	private IThesisPaperDao thesisPaperDao;
	
	public int addTeacher(Teacher teacher) {
		int addNum = teacherDao.addTeacher(teacher);
		return addNum;
	}


	public List<Teacher> showAllTeacher() {
		List<Teacher> teachers = teacherDao.showAllTeacher();
		return teachers;
	}


	public int deleteTeacher(int id) {
		int num = teacherDao.deleteTeacher(id);
		return num;
	}


	public Teacher getTeacherByid(int id) {
		Teacher teacher = teacherDao.selectTeacher(id);
		return teacher;
	}


	public int updateTeacher(Teacher teacher) {
		int num = teacherDao.updateTeacher(teacher);
		return num;
	}


	public List<Teacher> showTeacherOne1(String teacherNo) {
		// TODO Auto-generated method stub
		List<Teacher> teachers = teacherDao.showTeacherOne1(teacherNo);
		
		return teachers;
	}


	public List<Teacher> showTeacherOne2(String teacherName) {
		// TODO Auto-generated method stub
		List<Teacher> teachers = teacherDao.showTeacherOne2(teacherName);
		return teachers;
	}


	public List<Teacher> showTeacherOne3(String teacherNo, String teacherName) {
		// TODO Auto-generated method stub
		List<Teacher> teachers = teacherDao.showTeacherOne3(teacherNo, teacherName);
		return teachers;
	}


	public Teacher showInfoByNo(String teacherNo) {
		// TODO Auto-generated method stub
		Teacher teacher = teacherDao.teacherInfoByNo(teacherNo);
		return teacher;
	}


	public int uploadThesisTitle(ThesisTitle thesisTitle) {
		// TODO Auto-generated method stub
		int num = thesisTitleDao.addThesisTitle(thesisTitle);
		return num;
	}


	public List<ThesisTitle> showAllThesisTitle(int teacherId) {
		// TODO Auto-generated method stub
		List<ThesisTitle> thesisList = thesisTitleDao.showAllThesisTitle(teacherId);
		return thesisList;
	}


	public ThesisTitle getThesisById(int id) {
		// TODO Auto-generated method stub
		ThesisTitle thesisTitle = thesisTitleDao.getThesisById(id);
		return thesisTitle;
	}


	public int updateThesisTitle(ThesisTitle thesisTitle) {
		// TODO Auto-generated method stub
		int num = thesisTitleDao.updateThesisTitle(thesisTitle);
		return num;
	}


	public int deleteThesisTitle(int id) {
		// TODO Auto-generated method stub
		int num = thesisTitleDao.deleteThesisTitle(id);
		return num;
	}


	public List<ThesisTitle> showAllThesisTitle() {
		// TODO Auto-generated method stub
		List<ThesisTitle> thesisList = thesisTitleDao.showAllThesisTitleAd();
		return thesisList;
	}


	public int agreeThesisTitle(int id) {
		// TODO Auto-generated method stub
		int num = thesisTitleDao.agreeThesis(id);
		return num;
	}


	public int disagreeThesisTitle(int id) {
		// TODO Auto-generated method stub
		int num = thesisTitleDao.disagreeThesis(id);
		return num;
	}

	
	public List<ThesisTitle> showAllThesisTitleBeChecked(int teacherId) {
		// TODO Auto-generated method stub
		List<ThesisTitle> allThesisList = thesisTitleDao.showAllThesisTitle(teacherId);
		for(int i=0;i<allThesisList.size();i++) {
			if(allThesisList.get(i).getStatus() != 2 ) {
				allThesisList.remove(i);
			}
		}
		return allThesisList;
	}
	

	public int uploadTaskBook(TeacherTaskBookOpening teacherTaskBookOpening) {
		// TODO Auto-generated method stub
		
		TeacherTaskBookOpening dbTTBO = teacherTaskBookOpeningDao.showInfo(teacherTaskBookOpening.getThesisTitleId());
		if(dbTTBO == null || "".equals(dbTTBO)) {
			int num = teacherTaskBookOpeningDao.addTaskBook(teacherTaskBookOpening);
			return num;
		}else {
			int num = teacherTaskBookOpeningDao.uploadTaskBook(teacherTaskBookOpening);
			return num;
		}
		
	}




	public Map<String, String> uploadTaskBookOpeningResult(int teacherId) {
		// TODO Auto-generated method stub
		
		List<TeacherTaskBookOpening> uploadFileList = teacherTaskBookOpeningDao.showTeacherTaskBookOpeningById(teacherId);
		Map<String, String> fileMap = new HashMap<String, String>();
		for(int i=0;i<uploadFileList.size();i++) {
			String filePath = uploadFileList.get(i).getTaskBook();
			if(filePath == null || "".equals(filePath)) {
				
			}else {
				String[] str = uploadFileList.get(i).getTaskBook().split("\\\\");
				String fileName = str[str.length-1].toString();
				fileMap.put(fileName, filePath);
			}
			
			String filePath1 = uploadFileList.get(i).getOpeningReport();
			if(filePath1 == null || "".equals(filePath1)) {
				
			}else {
				String[] str1 = uploadFileList.get(i).getOpeningReport().split("\\\\");
				String fileName1 = str1[str1.length-1].toString();
				fileMap.put(fileName1, filePath1);
			}
		}
		return fileMap;
	}


	public String getThesisTitleByFilePath(String filePath) {
		// TODO Auto-generated method stub
		String[] str = filePath.split("\\\\");
		String thesisTitleId = str[str.length-2].toString();
		return thesisTitleId;
	}


	public TeacherTaskBookOpening getTaskOpeningByThesisId(int thesisTitleId) {
		// TODO Auto-generated method stub
		TeacherTaskBookOpening tt = teacherTaskBookOpeningDao.showInfoByThesisId(thesisTitleId);
		return tt;
	}


	public int deleteTaskBookOpening(int thesisTitleId) {
		// TODO Auto-generated method stub
		int num = teacherTaskBookOpeningDao.deleteInfo(thesisTitleId);
		System.out.println(num);
		return num;
	}

	public TeacherTaskBookOpening getThesisIdByTask(String taskBook) {
		// TODO Auto-generated method stub
		TeacherTaskBookOpening tt =teacherTaskBookOpeningDao.getTheisIdByTask(taskBook);
		
		return tt;
	}


	public TeacherTaskBookOpening getThesisIdByOpening(String opening) {
		// TODO Auto-generated method stub
		TeacherTaskBookOpening tt = teacherTaskBookOpeningDao.getTheisIdByOpening(opening);
		return tt;
	}


	public int resetTask(int thesisTitleId) {
		// TODO Auto-generated method stub
		int num = teacherTaskBookOpeningDao.resetTaskBook(thesisTitleId);
		
		return num;
	}


	public int resetOpening(int thesisTitleId) {
		// TODO Auto-generated method stub
		int num = teacherTaskBookOpeningDao.resetOpening(thesisTitleId);
		return num;
	}


	public List<Student> getAllStudentInfo(int teacherId) {
		// TODO Auto-generated method stub
		// thesisList2Db pass and denied info
		List<ThesisTitle> thesisList2Db = thesisTitleDao.showAllThesisTitle(teacherId);
		
		// thesisIdList only pass
		List<Integer> thesisIdList = new ArrayList<Integer>();
		for(int i=0;i<thesisList2Db.size();i++) {
			if(thesisList2Db.get(i).getStatus()==2) {
				int thesisId = thesisList2Db.get(i).getId();
				thesisIdList.add(thesisId);
			}
		}
		
		// topicList
		List<Integer> topicList = new ArrayList<Integer>();
		for(int i=0;i<thesisIdList.size();i++) {
			Topic topic = topicDao.getInfoByThesisId(thesisIdList.get(i));
			if(topic==null || "".equals(topic)) {
				
			}else {
				int studentId = topic.getStudentId();
				topicList.add(studentId);
			}
		}
		
		List<Student> studentList = new ArrayList<Student>();
		for(int i=0;i<topicList.size();i++) {
			Student student = studentDao.selectStudent(topicList.get(i));
			studentList.add(student);
		}
		
		return studentList;
	}


	public Topic getTopicInfoByStudentId(int studentId) {
		// TODO Auto-generated method stub
		Topic topic = topicDao.topicByStudentId(studentId);
		return topic;
	}


	public ThesisTitle getThesisInfoByThesisId(int thesisId) {
		// TODO Auto-generated method stub
		ThesisTitle thesisTitle = thesisTitleDao.getThesisById(thesisId);
		
		return thesisTitle;
	}


	public StudentTaskBookOpening getStudentOpeningByStudentId(int studentId) {
		// TODO Auto-generated method stub
		
		StudentTaskBookOpening STBO = studentTaskBookOpeningDao.showInfoByStudentId(studentId);
		return STBO;
	}


	public int passOpening(String studentNo) {
		// TODO Auto-generated method stub
		Student student = studentDao.getInfoByNo(studentNo);
		int studentId = student.getId();
		int num = studentTaskBookOpeningDao.passOpening(studentId);
		return num;
	}


	public int failOpening(String studentNo) {
		// TODO Auto-generated method stub
		Student student = studentDao.getInfoByNo(studentNo);
		int studentId = student.getId();
		int num = studentTaskBookOpeningDao.failOpening(studentId);
		return num;
	}


	public int addTeacherProgress(TeacherProgress teacherProgress) {
		// TODO Auto-generated method stub
		int num = teacherProgressDao.addTeacherProgress(teacherProgress);
		return num;
	}


	public List<TeacherProgress> getTeacherProgressByTeacherId(int teacherId) {
		// TODO Auto-generated method stub
		List<TeacherProgress> t = teacherProgressDao.getInfoByTeacherId(teacherId);
		
		return t;
	}


	public Student getStudentInfoByStudentId(int studentId) {
		// TODO Auto-generated method stub
		Student s = studentDao.selectStudent(studentId);
		
		return s;
	}

	public ThesisInformation getInfoByStudentId(int studentId) {
		// TODO Auto-generated method stub
		ThesisInformation thesisInfo = thesisInformationDao.getInfoByStudentId(studentId);
		
		return thesisInfo;
	}


	public int passThesisInformation(int studentId) {
		// TODO Auto-generated method stub
		int num = thesisInformationDao.passThesisInformation(studentId);
		return num;
	}


	public int failThesisInformation(int studentId) {
		// TODO Auto-generated method stub
		int num = thesisInformationDao.failThesisInformation(studentId);
		return num;
	}


	public int addStudentScore(StudentScore score) {
		// TODO Auto-generated method stub
		int num = studentScoreDao.addStudenScore(score);
		
		return num;
	}


	public int modifyStudentScore(StudentScore score) {
		// TODO Auto-generated method stub
		int num = studentScoreDao.modifyStudentScore(score);
		return num;
	}


	public StudentScore showInfoByStudentId(int studentId) {
		// TODO Auto-generated method stub
		StudentScore s  = studentScoreDao.showInfoByStudentId(studentId);
		
		return s;
	}


	public int uploadThesis4Pass(ThesisPaper paper) {
		// TODO Auto-generated method stub
		int num = thesisPaperDao.addThesisPaper(paper);
		
		return num;
	}


	public List<ThesisPaper> getAllPaper() {
		// TODO Auto-generated method stub
		
		List<ThesisPaper> paperList = thesisPaperDao.getAllInfo();
		return paperList;
	}

}
