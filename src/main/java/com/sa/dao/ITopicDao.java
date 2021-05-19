package com.sa.dao;

import java.util.List;

import com.sa.entity.Topic;

/**
 * @date 2020-12-12
 * @author rcx
 * 获得所有的已选课题信息
 * 根据学生id获得选题信息
 * 添加选题信息
 * 根据学生id 删除选题信息
 * 
 */

public interface ITopicDao {
	
	List<Topic> showAllTopic();
	
	Topic topicByStudentId(int studentId);
	
	int addTopic(Topic topic);
	
	int deleteTopic(int studentId);
	
	Topic getInfoByThesisId(int thesisId);
	
	
}
