package com.hanhe.college.controller.wechat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dto.*;
import com.hanhe.college.entity.*;
import com.hanhe.college.service.*;

import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.util.crypto.SHA1;

@Slf4j
@Controller
@RequestMapping("/wechat")
public class WechatPageController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserTypeService userTypeService;
	@Autowired
	private UavTypeService uavTypeService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CourseCategoryService courseCategoryService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private ArticleCategoryService articleCategoryService;
	@Autowired
	private AdministratorService administratorService;
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private TrainingCourseService trainingCourseService;
	@Autowired
	private TrainingSiteService trainingSiteService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private GuidelineService guidelineService;
	@Autowired 
	private EnrolmentService enrolmentService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private TrainingTypeService trainingTypeService;
	@Autowired
	private WeixinService wxService;

	/**
	 * 登陆（测试用）
	 */
	@GetMapping("/login")
	public String login(HttpSession session, Long userId) {
		if (userId == null) {
			userId = 1L;
		}
		User user = userService.getById(userId);
		if (user != null) {
			session.setAttribute(Constants.SESSION_USER, new UserBean(user));
		}
		return "redirect:/wechat/home";
	}

	/**
	 * 注册（完善信息）
	 */
	@GetMapping("/register")
	public String register(Model model, HttpServletRequest request, HttpServletResponse response, String code, String ret) throws IOException, WxErrorException {
		HttpSession session = request.getSession();
		String openid = (String) session.getAttribute(Constants.SESSION_OPENID);
		if (StringUtils.isEmpty(openid)) {
			if (StringUtils.isEmpty(code)) {
				String redirect_uri = wxService.oauth2buildAuthorizationUrl(getURL(request), WxConsts.OAuth2Scope.SNSAPI_BASE, "1");
				response.sendRedirect(redirect_uri);
				return null;
			} else {
				WxMpOAuth2AccessToken oAuth2AccessToken = wxService.oauth2getAccessToken(code);
				openid = oAuth2AccessToken.getOpenId();
				session.setAttribute(Constants.SESSION_OPENID, openid);
			}
		}
		User user = userService.getByOpenId(openid);
		if (user != null) {
			String retURL = "/wechat/home";
			log.info("ret =>" + ret);
			if (StringUtils.isNotBlank(ret)) {
				retURL = URLDecoder.decode(ret, "UTF-8");
			}
			request.getSession().setAttribute(Constants.SESSION_USER, new UserBean(user));
			return "redirect:" + retURL;
		} else {
			return "wechat/complete_info";
		}

	}
	/**
	 * 主页
	 */
	@GetMapping("/home")
	public String home(Model model) {
		List<Video> videos = videoService.list(null, Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_TOP_PAGE_SIZE);
		List<Article> articles = articleService.wikiList(null, Constants.DEFAULT_PAGE_NUM,
				Constants.DEFAULT_TOP_PAGE_SIZE);
		List<UserType> userTypes = userTypeService.getAvailable();
		// 根据flag判断操作员/教员
		for (UserType userType : userTypes) {
			if (userType.getFlag() != null && userType.getFlag() == Constants.USER_TYPE_FLAG_JUNIOR) {
				model.addAttribute("userType1", userType);
			} else if (userType.getFlag() != null && userType.getFlag() == Constants.USER_TYPE_FLAG_SENIOR) {
				model.addAttribute("userType2", userType);
			}
		}
		model.addAttribute("videos", videos);
		model.addAttribute("articles", articles);
		model.addAttribute("experts", administratorService.getHomeList());
		return "wechat/home";
	}
	/**
	 * 搜索
	 */
	@GetMapping("/search")
	public String search(Model model, String query, Integer pageNum, Integer pageSize) {
		model.addAttribute("query",query);
		Map<String, Object> map = searchService.search(query, pageNum, pageSize);
		if (map.get("trainees") != null) {
			model.addAttribute("trainees", map.get("trainees"));
			return "wechat/certification_search";
		}
		if (map.get("videos") != null) {
			model.addAttribute("videos", map.get("videos"));
		}
		if (map.get("articles") != null) {
			model.addAttribute("articles", map.get("articles"));
		}
		return "wechat/key_word_search";
	}

	/**
	 * 课程大类
	 */
	@GetMapping("/courses")
	public String courses(Model model, Long userTypeId) {
		UserType userType = userTypeService.getById(userTypeId);
		List<UavType> uavTypes = uavTypeService.getAvailable();
		Map<Long, List<CourseCategoryDTO>> map = Maps.newHashMap();
		for (UavType uavType : uavTypes) {
			Long uavTypeId = uavType.getId();
			List<CourseCategoryDTO> courseCategories = courseCategoryService.getCourseCategoryList(userTypeId, uavTypeId);
			map.put(uavTypeId, courseCategories);
		}
		model.addAttribute("userType", userType.getName());
		model.addAttribute("uavTypes", uavTypes);
		model.addAttribute("map", map);
		return "wechat/operate_class";
	}

	/**
	 * 课程小类
	 */
	@GetMapping("/courseCategory")
	public String courseCategory(Model model, Long id) {
		CourseCategoryDTO courseCategory = courseCategoryService.getCourseCategoryDetails(id);
		model.addAttribute("courseCategory", courseCategory);
		return "wechat/operation_basics";
	}
	
	/**
	 * 课程详情
	 */
	@GetMapping("/courseDetails")
	public String courseDetails(Model model, Long id) {
		Course course = courseService.getDetails(id);
		boolean isStar = courseService.isStar(id);
		courseService.increaseStudySize(id);
		model.addAttribute("course", course);
		model.addAttribute("isStar", isStar);
		return "wechat/operation_details";
	}
	/**
	 * 视频列表
	 */
	@GetMapping("/videos")
	public String videos(Model model) {
		List<Video> videos = videoService.list(null, Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("videos", videos);
		return "wechat/video_list";
	}

	/**
	 * 视频详情
	 */
	@GetMapping("/vedioDetails")
	public String videoDetails(Model model, Long id) {
		Video video = videoService.getDetails(id);
		videoService.increaseReadSize(id);
		model.addAttribute("video", video);
		return "wechat/video_details";
	}

	/**
	 * 干货
	 */
	@GetMapping("/wikis")
	public String wikis(Model model, Long articleCategoryId) {
		List<ArticleCategory> articleCategories = articleCategoryService.getAvailable();
		List<Article> articles = articleService.wikiList(articleCategoryId, Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("articleCategories", articleCategories);
		model.addAttribute("articles", articles);
		model.addAttribute("articleCategoryId", articleCategoryId);
		return "wechat/encyclopedia_home";
	}

	/**
	 * 干货/专家文章详情
	 */
	@GetMapping("/wikiDetails")
	public String wikiDetails(Model model, Long id,String fromName) {
		ArticleDTO article = articleService.getDetailsByWechat(id);
		boolean isStar = articleService.isStar(id);
		boolean isVote = articleService.isVote(id);
		articleService.increaseReadSize(id);

		model.addAttribute("article", article);
		model.addAttribute("isStar", isStar);
		model.addAttribute("isVote", isVote);
		model.addAttribute("fromName", fromName);
		return "wechat/encyclopedia_details";
	}

	/**
	 * 留言
	 */
	@GetMapping("/leaveMessage")
	public String leaveMessage(Model model, Long id) {
		model.addAttribute("id", id);
		return "wechat/leave_message";
	}

	/**
	 * 提问
	 */
	@GetMapping("/askQuestion")
	public String askQuestion(Model model, HttpServletRequest request, long id) throws WxErrorException {
		initJSAPI(model, request);
		model.addAttribute("id", id);
		return "wechat/ask_question";
	}

	/**
	 * 大咖
	 */
	@GetMapping("/families")
	public String families(Model model) {
		List<Administrator> experts = administratorService.schools(Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("experts", experts);
		return "wechat/families_list";
	}

	/**
	 * 专家详情
	 */
	@GetMapping("/expert")
	public String expert(Model model, long id) {
		Administrator expert = administratorService.getDetails(id);
		List<MomentDTO> moments = administratorService.moments(id, Constants.MOMENTS_TYPE_ALL, Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("expert", expert);
		model.addAttribute("moments", moments);
		return "wechat/families_detail";
	}

	/**
	 * 考试主页
	 */
	@GetMapping("/examCategories")
	public String examCategories(Model model) {
		List<UserType> userTypes = userTypeService.getAvailable();
		List<UavType> uavTypes = uavTypeService.getAvailable();
		List<ExamCategory> examCategories = Lists.newArrayList();
		for(UavType uavType : uavTypes) {
			for (UserType userType : userTypes) {
				examCategories.add(ExamCategory.adapt(userType, uavType));
			}
		}
		model.addAttribute("examCategories", examCategories);
		return "wechat/test_list";
	}

	/**
	 * 课程考试列表
	 */
	@GetMapping("/exams")
	public String examCourses(Model model, long userTypeId, long uavTypeId) {
		List<ExamDTO> exams = examService.getExamList(userTypeId, uavTypeId);
		model.addAttribute("exams", exams);
		return "wechat/test_next_choose";
	}

	/**
	 * 开始做题（随机获取试卷一份）
	 */
	@GetMapping("/test")
	public String test(Model model, long id, Integer repeat) {
		model.addAttribute("examId", id);
		model.addAttribute("repeat", repeat);
		return "wechat/test";
	}

	/**
	 * 考试结果
	 */
	@RequestMapping("/testResult")
	public String testResult(Model model, String records, Long examPaperId, Long costTime, Integer repeat) {
		model.addAttribute("records", records);
		model.addAttribute("examPaperId", examPaperId);
		model.addAttribute("costTime", costTime);
		model.addAttribute("repeat", repeat);
		return "wechat/test_result";
	}
	/**
	 * 报名培训
	 */
	@GetMapping("/train")
	public String train(Model model) {
		List<TrainingCourse> trainingCourses = trainingCourseService.list(Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		List<TrainingSite> trainingSites = trainingSiteService.list(null, null, Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("trainingCourses", trainingCourses);
		model.addAttribute("trainingSites", trainingSites);
		model.addAttribute("trainingTypes", trainingTypeService.getAvailable());
		return "wechat/apply";
	}
	/**
	 * 培训网点详情
	 */
	@GetMapping("/trainingSite")
	public String trainingSite(Model model, long id) {
		TrainingSite trainingSite = trainingSiteService.getDetails(id);
		model.addAttribute("trainingSite", trainingSite);
		// 当前培训网点是否可报名， true: 可报名
		long userId = RequestHolder.getCurrentUserBean().getId();
		model.addAttribute("isAvailable", enrolmentService.isEnrollAvailable(userId, id));
		return "wechat/train_introduce";
	}

	/**
	 * 报名成功
	 */
	@GetMapping("/applySuccess")
	public String applySuccess(Model model, long id) {
		TrainingSite trainingSite = trainingSiteService.getDetails(id);
		model.addAttribute("trainingSite", trainingSite);
		return "wechat/apply_success";
	}

	/**
	 * 我的
	 */
	@GetMapping("/mine")
	public String mine(Model model) {
		long userId = RequestHolder.getCurrentUserBean().getId();
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		return "wechat/my";
	}
	

	/**
	 * 我的详情
	 */
	@GetMapping("/details")
	public String details(Model model, HttpServletRequest request) throws WxErrorException {
		initJSAPI(model, request);
		long userId = RequestHolder.getCurrentUserBean().getId();
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		return "wechat/my_details";
	}
	
	@GetMapping("/{userId}/invite")
	public String invitation_card(Model model, @PathVariable("userId") Long userId) {
		if (userId != null) {
			User user = userService.getById(userId);
			model.addAttribute("user", user);
		}
		
		return "wechat/invitation_card";
	}

	/**
	 * 我的收藏
	 */
	@GetMapping("/collect")
	public String collect(Model model) {
		Map<String,Object> favorites = favoriteService.myFavorites(null);
		model.addAttribute("favorites", favorites);
		return "wechat/my_collect";
	}

	/**
	 * 我的问答
	 */
	@GetMapping("/questions")
	public String questions(Model model) {
		List<MomentDTO> moments = commentService.myQAList();
		model.addAttribute("moments", moments);
		return "wechat/my_question";
	}

	/**
	 * 学习指引
	 */
	@GetMapping("/guidelines")
	public String guidelines(Model model) {
		List<Guideline> guidelines = guidelineService.list(Constants.DEFAULT_PAGE_NUM, Constants.DEFAULT_PAGE_SIZE);
		model.addAttribute("guidelines", guidelines);
		return "wechat/study_instruction";
	}

	/**
	 * 学习指引详情
	 */
	@GetMapping("/guideline")
	public String guideline(Model model, long id) {
		Guideline guideline = guidelineService.getDetails(id);
		model.addAttribute("guideline", guideline);
		return "wechat/study_instruction_details";
	}

	/**
	 * 报名记录
	 */
	@GetMapping("/enrolments")
	public String enrolments(Model model) {
		long userId = RequestHolder.getCurrentUserBean().getId();
		List<EnrolmentDTO> enrolments = enrolmentService.getEnrolments(userId);
		model.addAttribute("enrolments", enrolments);
		return "wechat/apply_record";
	}

	/**
	 * 微信JS-API初始化
	 */
	public void initJSAPI(Model model, HttpServletRequest request) throws WxErrorException {
		long time = System.currentTimeMillis() / 1000;
		String randomStr = UUID.randomUUID().toString();
		String accerssToken = wxService.getAccessToken();
		String jsApiTicket = wxService.getJsapiTicket();

		String signature = SHA1.genWithAmple("jsapi_ticket=" + wxService.getJsapiTicket(),
				"noncestr=" + randomStr, "timestamp=" + time, "url=" + getURL(request));

		model.addAttribute("appId", wxService.getWxMpConfigStorage().getAppId());
		model.addAttribute("time", time);
		model.addAttribute("nonceStr", randomStr);
		model.addAttribute("signature", signature);
	}

	String getURL(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		if (request.getQueryString() != null) {//判断请求参数是否为空
			url += "?" + request.getQueryString();   // 参数
		}
		return url;
	}
}
