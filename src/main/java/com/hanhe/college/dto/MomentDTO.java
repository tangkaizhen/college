package com.hanhe.college.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/22.
 */
@Getter
@Setter
public class MomentDTO {
	/**
	 * 动态类型
	 */
	private Integer type;

	private Long id;

	/**
	 * 专家文章
	 */
	private String title;
	private String coverImg;
	private Integer readSize;
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm")
	private Date createTime;

	/**
	 * 专家问答
	 */
	private String comment;
	private String replyContent;
	private String userHeadImg;
	private String expertHeadImg;
	private String expertName;
}
