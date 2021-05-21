package com.sa.dao;

import java.util.List;

import com.sa.entity.ThesisPaper;

/**
 * @date 2021-05-18
 * @author Eelin
 * add thesis
 * select thesis
 *
 */

public interface IThesisPaperDao {
	
	int addThesisPaper(ThesisPaper paper);
	
	List<ThesisPaper> getAllInfo();
	
	
}
