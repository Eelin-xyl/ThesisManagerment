package com.sa.dao;

import java.util.List;

import com.sa.entity.ThesisPaper;

/**
 * @date 2020-12-18
 * @author rcx
 * 添加最终论文
 * 查询所有论文
 *
 */

public interface IThesisPaperDao {
	
	int addThesisPaper(ThesisPaper paper);
	
	List<ThesisPaper> getAllInfo();
	
	
}
