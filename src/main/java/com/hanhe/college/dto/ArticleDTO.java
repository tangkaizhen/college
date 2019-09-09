package com.hanhe.college.dto;

import java.util.List;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.Article;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArticleDTO extends Article {

	private List<CommentDTO> commentList;

	public static ArticleDTO adapt(Article article, List<CommentDTO> commentList) {
		ArticleDTO dto = new ArticleDTO();
		BeanUtils.copyProperties(article, dto);
		dto.setCommentList(commentList);
		return dto;
	}

}
