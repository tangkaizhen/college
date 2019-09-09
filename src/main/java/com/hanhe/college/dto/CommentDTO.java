package com.hanhe.college.dto;

import com.hanhe.college.entity.Comment;
import com.hanhe.college.entity.User;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/29.
 */
@Getter
@Setter
public class CommentDTO extends Comment {

    private boolean agree;

    private User user;

}
