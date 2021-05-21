package com.sa.dao;

import java.util.List;

import com.sa.entity.ThesisTitle;

/**
 * 
 * @author LaoYu
 *add, delete, update, search topic
 *update topic status
 *admin search all topic
 */
public interface IThesisTitleDao {
	int addThesisTitle(ThesisTitle thesisTitle);
	
	List<ThesisTitle> showAllThesisTitle(int id);
	
	ThesisTitle getThesisById(int id);
	
	int updateThesisTitle(ThesisTitle thesisTitle);
	
	int deleteThesisTitle(int id);
	
	List<ThesisTitle> showAllThesisTitleAd();
	
	int agreeThesis(int id);
	
	int disagreeThesis(int id);
	
}
