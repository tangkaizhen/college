package com.hanhe.college.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.Vote;

public interface VoteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Vote record);

    int insertSelective(Vote record);

    Vote selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Vote record);

    int updateByPrimaryKey(Vote record);

    int count(@Param("userId") long userId, @Param("articleId") Long articleId, @Param("commentId") Long commentId);

    void upvoteArticle(Map<String,Object> map);

    void downvoteArticle(Map<String, Object> map);

    void upvoteComment(Map<String,Object> map);

}