package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.entity.Article;

public interface ArticleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);

    List<Article> getTopList();

    List<Article> wikiList(@Param("categoryId") Long articleCategoryId);

    List<Article> expertArticleList(@Param("expertId") Long expertId);

    List<MomentDTO> moments(@Param("expertId") long expertId);

    int countBySeq(@Param("seq") int seq);

    int increaseReadSize(@Param("id") long id);

    int isExist(@Param("categoryId") Long articleCategoryId);

    List<Article> selectByKeyword(@Param("keyword") String keyword);
}