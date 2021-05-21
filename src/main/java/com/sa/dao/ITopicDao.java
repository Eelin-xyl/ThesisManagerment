package com.sa.dao;

import java.util.List;

import com.sa.entity.Topic;

/**
 * 
 * @author LaoYu
 *add,delete,search topic information
 *
 */
public interface ITopicDao {
	
	List<Topic> showAllTopic();
	
	Topic topicByStudentId(int studentId);
	
	int addTopic(Topic topic);
	
	int deleteTopic(int studentId);
	
	Topic getInfoByThesisId(int thesisId);
	
	
}
