package com.hanhe.college.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.entity.*;
import com.hanhe.college.param.admin.ArticleParam;
import com.hanhe.college.param.admin.GuidelineParam;
import com.hanhe.college.param.admin.VideoParam;
import com.hanhe.college.service.*;

/**
 * 知识库管理
 */
@Controller
@RequestMapping("/admin/knowledge")
public class KnowledgeController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private GuidelineService guidelineService;
	@Autowired
	private ArticleCategoryService articleCategoryService;
	@Autowired
	private UavTypeService uavTypeService;
	@Autowired
	private AdministratorService administratorService;

	@RequestMapping("/baike.page")
	public String baike(Model model, Long articleCategoryId, Integer pageNum, Integer pageSize) {
		List<Article> articles = articleService.wikiList(articleCategoryId, pageNum, pageSize);
		List<ArticleCategory> articleCategories = articleCategoryService.getAvailable();
		PageInfo<Article> page = new PageInfo(articles);
		model.addAttribute("articles", articles);
		model.addAttribute("articleCategoryId", articleCategoryId);
		model.addAttribute("articleCategories", articleCategories);
		model.addAttribute("page", page);
		return "admin/home";
	}

	@RequestMapping("/add_baike.page")
	public String add_baike(Model model, Long id) {
		List<ArticleCategory> articleCategories = articleCategoryService.getAvailable();
		model.addAttribute("articleCategories", articleCategories);
		if (id != null) {
			model.addAttribute("article", articleService.getDetails(id));
		}
		return "admin/add_baike";
	}
	@RequestMapping("/video_manage.page")
	public String video_manage(Model model, Long uavTypeId, Integer pageNum, Integer pageSize) {
		List<Video> videos = videoService.list(uavTypeId, pageNum, Integer.MAX_VALUE);
		PageInfo<Video> page = new PageInfo(videos);
		model.addAttribute("videos", videos);
		model.addAttribute("uavTypeId", uavTypeId);
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("page", page);
		return "admin/video_manage";
	}
	@RequestMapping("/expert/expert_article.page")
	public String expert_article(Model model, Long expertId, Integer pageNum, Integer pageSize) {
		if (RequestHolder.getCurrentUserBean().getType() == Constants.ADMINISTRATOR_TYPE_EXPERT) {
			expertId = RequestHolder.getCurrentUserBean().getId();
		}
		List<Article> expertArticles = articleService.expertArticleList(expertId, pageNum, pageSize);
		List<Administrator> experts = administratorService.expertList(Constants.DEFAULT_PAGE_NUM, Integer.MAX_VALUE);
		PageInfo<Article> page = new PageInfo(expertArticles);
		model.addAttribute("expertArticles", expertArticles);
		model.addAttribute("experts", experts);
		model.addAttribute("expertId", expertId);
		model.addAttribute("page", page);
		return "admin/expert_article";
	}
	@RequestMapping("/study_instruction.page")
	public String study_instruction(Model model, Integer pageNum, Integer pageSize) {
		List<Guideline> guidelines = guidelineService.list(pageNum, pageSize);
		PageInfo<Guideline> page = new PageInfo(guidelines);
		model.addAttribute("guidelines", guidelines);
		model.addAttribute("page", page);
		return "admin/study_instruction";
	}
	@RequestMapping("/add_video_manage.page")
	public String add_video_manage(Model model, Long id) {
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		if (id != null) {
			Video video = videoService.getDetails(id);
			model.addAttribute("video", video);
		}
		return "admin/add_video_manage";
	}

	@RequestMapping("/expert/add_expert_article.page")
	public String add_expert_article(Model model, Long id) {
	   if (id != null) {
	      model.addAttribute("article", articleService.getDetails(id));
	   }
	   List<Administrator> experts = administratorService.expertList(Constants.DEFAULT_PAGE_NUM, Integer.MAX_VALUE);
	   model.addAttribute("experts", experts);
	   return "admin/add_expert_article";
	}

	@RequestMapping("/add_study_instruction.page")
	public String add_study_instruction(Model model, Long id) {
		if (id != null) {
			Guideline guideline = guidelineService.getDetails(id);
			model.addAttribute("guideline", guideline);
		}
		return "admin/add_study_instruction";
	}

	// **************************** 知识库管理-异步接口 START ****************************
	/**
	 * 保存干货
	 */
	@ResponseBody
	@RequestMapping("/saveWiki.json")
	public ApiMsg saveWiki(ArticleParam param) throws Exception {
		if (param.getId() == null) {
			long articleId = articleService.addWiki(param);
			return ApiMsg.success(articleId);
		} else {
			int result = articleService.updateWiki(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 干货文章置顶状态修改
	 * @param seq 置顶状态，0：取消置顶，-1：置顶2，-2：置顶1
	 */
	@ResponseBody
	@RequestMapping("/stick.json")
	public ApiMsg stick(long id, int seq) {
		int result = articleService.stick(id, seq);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("置顶失败");
	}

	/**
	 * 删除干货
	 */
	@ResponseBody
	@RequestMapping("/deleteWiki.json")
	public ApiMsg deleteWiki(long id) {
		int result = articleService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 保存视频
	 */
	@ResponseBody
	@RequestMapping("/saveVideo.json")
	public ApiMsg saveVideo(VideoParam param, @RequestParam("video_file") MultipartFile file) throws Exception {
		if (param.getId() == null) {
			long id = videoService.insert(param, file);
			return ApiMsg.success(id);
		} else {
			int result = videoService.update(param, file);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除视频
	 */
	@ResponseBody
	@RequestMapping("/deleteVideo.json")
	public ApiMsg deleteVideo(long id) {
		int result = videoService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 上移/下移视频
	 */
	@ResponseBody
	@RequestMapping("/upDownVideo.json")
	public ApiMsg upDownVideo(long upId, long downId) {
		int result = videoService.upDownMove(upId, downId);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("上移/下移失败");
	}

	/**
	 * 保存专家文章
	 */
	@ResponseBody
	@RequestMapping("/expert/saveExpertArticle.json")
	public ApiMsg saveExpertArticle(ArticleParam param) throws Exception {
		if (param.getId() == null) {
			long articleId = articleService.addExpertArticle(param);
			return ApiMsg.success(articleId);
		} else {
			int result = articleService.updateExpertArticle(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除专家文章
	 */
	@ResponseBody
	@RequestMapping("/deleteExpertArticle.json")
	public ApiMsg deleteExpertArticle(long id) {
		int result = articleService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 保存学习指引
	 */
	@ResponseBody
	@RequestMapping("/saveGuideline.json")
	public ApiMsg saveGuideline(GuidelineParam param) {
		
		if (param.getId() == null) {
			long id = guidelineService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = guidelineService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除学习指引
	 */
	@ResponseBody
	@RequestMapping("/deleteGuideline.json")
	public ApiMsg deleteGuideline(long id) {
		int result = guidelineService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	// **************************** 知识库管理-异步接口 END ****************************
}
