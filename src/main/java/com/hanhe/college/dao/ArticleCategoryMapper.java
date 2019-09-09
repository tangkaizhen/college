package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.ArticleCategory;

public interface ArticleCategoryMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ArticleCategory record);

	int insertSelective(ArticleCategory record);

	ArticleCategory selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ArticleCategory record);

	int updateByPrimaryKey(ArticleCategory record);

	List<ArticleCategory> getAll();

	List<ArticleCategory> getAvailable();

	int countByName(@Param("id") Long id, @Param("name") String name);
}