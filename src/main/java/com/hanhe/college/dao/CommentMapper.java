package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.CommentDTO;
import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.entity.Comment;

public interface CommentMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Comment record);

	int insertSelective(Comment record);

	Comment selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Comment record);

	int updateByPrimaryKey(Comment record);

	List<Comment> qaList(@Param("state") Integer state, @Param("replyFlag") Boolean replyFlag,
			@Param("expertId") Long expertId);

	List<Comment> commentList(@Param("state") Integer state, @Param("replyFlag") Boolean replyFlag,
			@Param("adminId") Long adminId);

	List<MomentDTO> myQAList(@Param("userId") long userId);

	List<MomentDTO> moments(@Param("expertId") long expertId);

	List<CommentDTO> getByArticleId(@Param("articleId") long articleId, @Param("userId") long userId);
}