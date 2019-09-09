package com.hanhe.college.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Comment;
import com.hanhe.college.param.admin.ReplyParam;
import com.hanhe.college.service.AdministratorService;
import com.hanhe.college.service.CommentService;

/**
 * 问答管理（留言管理）
 */
@Controller
@RequestMapping("/admin/qa")
public class QAController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private AdministratorService administratorService;

	@RequestMapping("/expert/expert_ask.page")
	public String expert_ask(Model model, Integer state, Boolean replyFlag, Long expertId, Integer pageNum,
			Integer pageSize) {
		// 审核状态为固定值：0: 全部；1：审核中；2：通过；3：拒绝
		// 回复状态为固定值：0：未回复；1：已回复
		if (RequestHolder.getCurrentUserBean().getType() == Constants.ADMINISTRATOR_TYPE_EXPERT) {
			state = Constants.DEFAULT_STATE_SUCCESS;
			expertId = RequestHolder.getCurrentUserBean().getId();
		}
		List<Comment> qas = commentService.qaList(state, replyFlag, expertId, pageNum, pageSize);
		List<Administrator> experts = administratorService.expertList(Constants.DEFAULT_PAGE_NUM, Integer.MAX_VALUE);
		PageInfo<Comment> page = new PageInfo(qas);
		model.addAttribute("qas", qas);
		model.addAttribute("experts", experts);
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute("replyFlag", replyFlag);
		model.addAttribute("expertId", expertId);
		return "admin/expert_ask";
	}

	@RequestMapping("/leave_manage.page")
	public String leave_manage(Model model, Integer state, Boolean replyFlag, Long adminId, Integer pageNum,
			Integer pageSize) {
		// 审核状态为固定值：0: 全部；1：审核中；2：通过；3：拒绝
		// 回复状态为固定值：0：未回复；1：已回复
		List<Comment> comments = commentService.commentList(state, replyFlag, adminId, pageNum, pageSize);
		List<Administrator> admins = administratorService.adminList(Constants.DEFAULT_PAGE_NUM, Integer.MAX_VALUE);
		PageInfo<Comment> page = new PageInfo(comments);
		model.addAttribute("comments", comments);
		model.addAttribute("admins", admins);
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute("replyFlag", replyFlag);
		model.addAttribute("adminId", adminId);
		return "admin/leave_manage";
	}

	// **************************** 问答管理-异步接口 START ****************************
	/**
	 * 专家回复
	 */
	@ResponseBody
	@RequestMapping("/expert/addReply.json")
	public ApiMsg addExpertReply(ReplyParam param) {
		int result = commentService.addReply(param);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("回复失败");
	}

	/**
	 * 移除专家提问
	 */
	@ResponseBody
	@RequestMapping("/expert/delete.json")
	public ApiMsg deleteAsking(long id) {
		int result = commentService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("移除失败");
	}

	/**
	 * 添加留言回复
	 */
	@ResponseBody
	@RequestMapping("/addReply.json")
	public ApiMsg addReply(ReplyParam param) {
		int result = commentService.addReply(param);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("回复失败");
	}

	/**
	 * 移除留言
	 */
	@ResponseBody
	@RequestMapping("/delete.json")
	public ApiMsg delete(long id) {
		int result = commentService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("移除失败");
	}

	/**
	 * 修改审核状态
	 */
	@ResponseBody
	@RequestMapping("/changeState.json")
	public ApiMsg changeState(ReplyParam param) {
		int result = commentService.changeState(param);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("审核状态修改失败");
	}
	// **************************** 问答管理-异步接口 END ****************************
}
