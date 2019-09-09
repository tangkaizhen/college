package com.hanhe.college.controller.wechat.api;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.dto.ExamPaperDTO;
import com.hanhe.college.dto.ExamResultDTO;
import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.dto.TrainingTypeDTO;
import com.hanhe.college.entity.*;
import com.hanhe.college.param.wechat.*;
import com.hanhe.college.service.*;

import me.chanjar.weixin.common.error.WxErrorException;

/**
 * Created by Angelo on 2018/7/19.
 */
@RestController
@RequestMapping("/wechat/api")
public class WechatApiController {

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    private ExamPaperService examPaperService;
    @Autowired
    private ExamResultService examResultService;
    @Autowired
    private TrainingSiteService trainingSiteService;
    @Autowired
    private EnrolmentService enrolmentService;
    @Autowired
    private SmsLogService smsLogService;
    @Autowired
    private SearchService searchService;
    @Autowired
    private VideoService videoService;

    /**
     * 发送验证码
     */
    @RequestMapping("/sendSMS.json")
    public ApiMsg sendSMS(SMSParam param) {
        int result = smsLogService.sendSMS(param);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("获取验证码失败");
    }

    /**
     * 注册
     */
    @RequestMapping("/register.json")
    public ApiMsg register(RegisterParam registerParam) {
        long id = userService.register(registerParam);
        return ApiMsg.success(id);
    }

    /**
     * 收藏课程
     */
    @RequestMapping("/starCourse.json")
    public ApiMsg starCourse(long userId, long courseId) {
        int result = favoriteService.saveCourseFavorite(userId, courseId);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("收藏失败");
    }

    /**
     * 取消收藏课程
     */
    @RequestMapping("/unStarCourse.json")
    public ApiMsg unStarCourse(long userId, long courseId) {
        int result = favoriteService.cancelCourseFavorite(userId, courseId);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("取消收藏失败");
    }

    /**
     * 视频
     */
    @RequestMapping("/getVideoList.json")
    public ApiMsg getVideoList(Long uavTypeId, Integer pageNum, Integer pageSize) {
        List<Video> videos = videoService.list(uavTypeId, pageNum, pageSize);
        return ApiMsg.success(videos);
    }

    /**
     * 干货
     */
    @RequestMapping("/getWikiList.json")
    public ApiMsg getWikiList(Long articleCategoryId, Integer pageNum, Integer pageSize) {
        List<Article> articles = articleService.wikiList(articleCategoryId, pageNum, pageSize);
        return ApiMsg.success(articles);
    }

    /**
     * 留言
     */
    @RequestMapping("/addComment.json")
    public ApiMsg addComment(CommentParam param) {
        long commentId = commentService.addComment(param);
        return ApiMsg.success(commentId);
    }

    /**
     * 干货/专家文章点赞
     * 若成功，返回当前文章的点赞数
     */
    @RequestMapping("/upvoteArticle.json")
    public ApiMsg upvoteArticle(long userId, long articleId) {
        int result = articleService.upvote(articleId, userId);
        if (result > 0) {
            Article article = articleService.getById(articleId);
            return ApiMsg.success(article.getVoteSize());
        }
        return ApiMsg.fail("点赞失败");
    }

    /**
     * 取消干货/专家文章点赞
     * 若成功，返回最终文章的点赞数
     */
    @RequestMapping("/downvoteArticle.json")
    public ApiMsg downvoteArticle(long userId, long articleId) {
        int result = articleService.downvote(articleId, userId);
        if (result > 0) {
            Article article = articleService.getById(articleId);
            return ApiMsg.success(article.getVoteSize());
        }
        return ApiMsg.fail("取消点赞失败");
    }

    /**
     * 评论点赞
     * 若成功，返回当前评论的点赞数
     */
    @RequestMapping("/upvoteComment.json")
    public ApiMsg upvoteComment(long userId, long commentId) {
        int result = commentService.upvote(commentId, userId);
        if (result > 0) {
            Comment comment = commentService.getById(commentId);
            return ApiMsg.success(comment.getVoteSize());
        }
        return ApiMsg.fail("点赞失败");
    }

    /**
     * 收藏干货
     */
    @RequestMapping("/starArticle.json")
    public ApiMsg starArticle(long userId, long articleId) {
        int result = favoriteService.saveArticleFavorite(userId, articleId);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("收藏失败");
    }

    /**
     * 取消收藏干货
     */
    @RequestMapping("/unStarArticle.json")
    public ApiMsg unStarArticle(long userId, long articleId) {
        int result = favoriteService.cancelArticleFavorite(userId, articleId);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("取消收藏失败");
    }

    /**
     * 大咖
     */
    @RequestMapping("/schools.json")
    public ApiMsg schools(Integer pageNum, Integer pageSize) {
        List<Administrator> experts = administratorService.schools(pageNum, pageSize);
        return ApiMsg.success(experts);
    }

    /**
     * 专家动态
     */
    @RequestMapping("/moments.json")
    public ApiMsg moments(long expertId, Integer type, Integer pageNum, Integer pageSize) {
        List<MomentDTO> moments = administratorService.moments(expertId, type, pageNum, pageSize);
        return ApiMsg.success(moments);
    }

    /**
     * 提问
     */
    @RequestMapping("/addAsking.json")
    public ApiMsg addAsking(CommentParam param) throws WxErrorException, IOException {
        long commentId = commentService.addAsking(param);
        return ApiMsg.success(commentId);
    }

    /**
     * 考试验证
     */
    @RequestMapping("/checkExam.json")
    public ApiMsg checkExam(long examId) {
        examPaperService.checkExam(examId);
        return ApiMsg.success();
    }
    
    /**
     * 开始考试
     */
    @RequestMapping("/startTest.json")
    public ApiMsg startTest(long examId) {
    	ExamPaperDTO dto = examPaperService.getDetails(examId);
    	return ApiMsg.success(dto);
    }

    /**
     * 交卷
     */
    @RequestMapping("/handInExamPaper.json")
    public ApiMsg handInExamPaper(ExamParam param) {
        ExamResultDTO examResult = examResultService.answer(param);
        if (examResult != null) {
            return ApiMsg.success(examResult);
        }
        return ApiMsg.fail("交卷异常");
    }

    /**
     * 培训网点筛选
     */
    @RequestMapping("/getTrainingSites.json")
    public ApiMsg getTrainingSites(String province, String trainingType, Integer pageNum, Integer pageSize) {
        List<TrainingSite> trainingSites = trainingSiteService.list(province, trainingType, pageNum, pageSize);
        return ApiMsg.success(trainingSites);
    }

    /**
     * 可报名培训类型
     */
    @RequestMapping("/getAvailableTrainingTypes.json")
    public ApiMsg getAvailableTrainingTypes(long userId, long trainingSiteId) {
        List<TrainingTypeDTO> trainingTypes = trainingSiteService.getAvailableTrainingTypes(trainingSiteId, userId);
        return ApiMsg.success(trainingTypes);
    }

    /**
     * 报名
     */
    @RequestMapping("/enroll.json")
    public ApiMsg enroll(EnrolmentParam param) {
        int result = enrolmentService.enroll(param);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("报名失败");
    }

    /**
     * 修改个人资料
     */
    @RequestMapping("/saveDetails.json")
    public ApiMsg saveDetails(UserParam userParam) throws Exception {
        int result = userService.saveDetails(userParam);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("修改失败");
    }

    /**
     * 关键字搜索（汉和干货/大咖文章）
     */
    @RequestMapping("/search.json")
    public ApiMsg search(String query, Integer pageNum, Integer pageSize) {
        Map<String,Object> map = searchService.search(query, pageNum, pageSize);
        List<Article> articles = (List<Article>) map.get("articles");
        return ApiMsg.success(articles);
    }
}
