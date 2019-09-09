package com.hanhe.college.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Maps;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.AdministratorMapper;
import com.hanhe.college.dao.CommentMapper;
import com.hanhe.college.dao.VoteMapper;
import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Comment;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ReplyParam;
import com.hanhe.college.param.wechat.CommentParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.UploadUtil;

import me.chanjar.weixin.common.error.WxErrorException;

/**
 * Created by Angelo on 2018/8/3.
 */
@Service
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private AdministratorMapper administratorMapper;
	@Autowired
	private VoteMapper voteMapper;
	@Autowired
	private WeixinService weixinService;

	/**
	 * 留言
	 */
	public long addComment(CommentParam param) {
		param.setExpertId(0L);
		BeanValidator.check(param);
		Comment comment = Comment.builder().userId(param.getUserId())
				.userName(RequestHolder.getCurrentUserBean().getName()).articleId(param.getArticleId())
				.comment(param.getComment()).state(Constants.DEFAULT_STATE_NORMAL).createTime(DateUtil.getNow())
				.build();
		commentMapper.insertSelective(comment);
		return comment.getId();
	}

	/**
	 * 提问
	 */
	public long addAsking(CommentParam param) throws WxErrorException, IOException {
		param.setArticleId(0L);
		BeanValidator.check(param);

		long expertId = param.getExpertId();
		Administrator expert = administratorMapper.selectByPrimaryKey(expertId);
		Preconditions.checkNotNull(expert, "指定的专家不存在");

		Comment comment = Comment.builder().userId(param.getUserId())
				.userName(RequestHolder.getCurrentUserBean().getName()).expertId(expertId)
				.replyName(expert.getNickname()).comment(param.getComment()).state(Constants.DEFAULT_STATE_NORMAL)
				.createTime(DateUtil.getNow()).build();
		if (!StringUtils.isEmpty(param.getImage())) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			String url = UploadUtil.getWechatImagePath(projectPath, weixinService.getAccessToken(), param.getImage(),
					Constants.IMAGE_TYPE_COMMENT);
			comment.setImage(url);
		}
		commentMapper.insertSelective(comment);
		return comment.getId();
	}

	/**
	 * 评论点赞
	 */
	public int upvote(long id, long userId) {
		Comment before = commentMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待点赞的评论不存在");
		if (voteMapper.count(userId, null, id) > 0) {
			throw new ParamException("无需重复点赞");
		} else {
			Map<String, Object> map = Maps.newHashMap();
			map.put("userId", userId);
			map.put("commentId", id);
			map.put("createTime", DateUtil.getNow());
			map.put("result", null);
			voteMapper.upvoteComment(map);
			return MapUtils.getInteger(map, "result", -2);
		}
	}

	/**
	 * 我的问答
	 */
	public List<MomentDTO> myQAList() {
		long userId = RequestHolder.getCurrentUserBean().getId();
		return commentMapper.myQAList(userId);
	}

	/**
	 * 专家问答
	 */
	public List<Comment> qaList(Integer state, Boolean replyFlag, Long expertId, Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return commentMapper.qaList(state, replyFlag, expertId);
	}

	/**
	 * 留言管理
	 */
	public List<Comment> commentList(Integer state, Boolean replyFlag, Long adminId, Integer pageNum,
			Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return commentMapper.commentList(state, replyFlag, adminId);
	}

	/**
	 * 修改审核状态
	 */
	public int changeState(ReplyParam param) {
		// 纯为过校验
		param.setReplyContent("PASS");
		BeanValidator.check(param);
		long id = param.getId();
		Comment before = commentMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before);
		Comment after = Comment.builder().id(id).state(param.getState()).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return commentMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 添加回复
	 */
	public int addReply(ReplyParam param) {
		param.setState(Constants.DEFAULT_STATE_SUCCESS);
		BeanValidator.check(param);
		long id = param.getId();
		Comment before = commentMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before);
		if (before.getReplyFlag() != null && before.getReplyFlag()) {
			throw new ParamException("请勿重复提交回复");
		}
		Date now = DateUtil.getNow();
		Comment after = Comment.builder().id(id).replyContent(param.getReplyContent()).replyFlag(true).replyTime(now)
				.state(Constants.DEFAULT_STATE_SUCCESS).build();
		if (before.getExpertId() == null) {
			after.setReplyName(RequestHolder.getCurrentUserBean().getName());
		}
		after.setReplyAdminId(RequestHolder.getCurrentUserBean().getId());
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(now);
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = commentMapper.updateByPrimaryKeySelective(after);
		if (result > 0 && before.getExpertId() != null) {
			Administrator administrator = Administrator.builder().id(before.getExpertId()).interactTime(now).build();
			administratorMapper.updateByPrimaryKeySelective(administrator);
		}
		return result;
	}

	/**
	 * 删除留言
	 */
	public int delete(long id) {
		Comment before = commentMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的留言不存在");
		Comment after = Comment.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return commentMapper.updateByPrimaryKeySelective(after);
	}

	public Comment getById(long id) {
		return commentMapper.selectByPrimaryKey(id);
	}
}
