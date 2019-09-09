package com.hanhe.college.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.albaba.tools.image.GraphicsUtil;
import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Maps;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.ArticleDTO;
import com.hanhe.college.dto.CommentDTO;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Article;
import com.hanhe.college.entity.ArticleCategory;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ArticleParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.FileUtil;
import com.hanhe.college.util.UploadUtil;

/**
 * Created by Angelo on 2018/8/6.
 */
@Service
public class ArticleService {

	@Autowired
	private ArticleMapper articleMapper;
	@Autowired
	private AdministratorMapper administratorMapper;
	@Autowired
	private VoteMapper voteMapper;
	@Autowired
	private ArticleCategoryMapper articleCategoryMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private FavoriteMapper favoriteMapper;

	/**
	 * 汉和干货列表
	 */
	public List<Article> wikiList(Long articleCategoryId, Integer pageNum, Integer pageSize) {
		if (articleCategoryId == null) {
			articleCategoryId = 0L;
		}
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return articleMapper.wikiList(articleCategoryId);

	}

	/**
	 *  添加干货
	 */
	public long addWiki(ArticleParam param) throws Exception {
		param.setExpertId(0L);
		BeanValidator.check(param);
		ArticleCategory articleCategory = articleCategoryMapper.selectByPrimaryKey(param.getCategoryId());
		Preconditions.checkNotNull(articleCategory, "指定的干货类别不存在");

		Date now = DateUtil.getNow();
		Article article = Article.builder().categoryId(param.getCategoryId()).articleCategory(articleCategory.getName())
				.author(param.getAuthor()).title(param.getTitle()).content(param.getContent())
				.type(Constants.ARTICLE_TYPE_WIKI).state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();

		if (UploadUtil.isUploadBase64Image(param.getCoverImg())) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			String base64ImageData = param.getCoverImg().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_ARTICLE);
			article.setCoverImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(article.getCoverImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_ARTICLE, article.getCoverImg());
				if (paths != null && paths.length > 0) {
					article.setCoverImgSrc(article.getCoverImg());
					article.setCoverImg(paths[0]);
				}
			}
		} else {
			throw new ParamException("图片上传格式有误");
		}
		article.setOperator(RequestHolder.getCurrentUserBean().getName());
		article.setOperateTime(now);
		article.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		articleMapper.insertSelective(article);

		return article.getId();
	}

	/**
	 *  更新干货
	 */
	public int updateWiki(ArticleParam param) throws Exception {
		param.setExpertId(0L);
		BeanValidator.check(param);

		Long id = param.getId();
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待更新的汉和干货不存在");
		ArticleCategory articleCategory = articleCategoryMapper.selectByPrimaryKey(param.getCategoryId());
		Preconditions.checkNotNull(articleCategory, "指定的干货类别不存在");

		Article after = Article.builder().id(id).categoryId(param.getCategoryId())
				.articleCategory(articleCategory.getName()).title(param.getTitle()).content(param.getContent())
				.coverImg(param.getCoverImg()).build();

		// 新上传文章封面
		boolean isNewCoverImg = false;
		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		if (UploadUtil.isUploadBase64Image(param.getCoverImg())) {
			String base64ImageData = param.getCoverImg().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_ARTICLE);
			after.setCoverImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getCoverImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_ARTICLE, after.getCoverImg());
				if (paths != null && paths.length > 0) {
					after.setCoverImgSrc(after.getCoverImg());
					after.setCoverImg(paths[0]);
				}
			}
			isNewCoverImg = true;
		}
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = articleMapper.updateByPrimaryKeySelective(after);

		if (result > 0) {
			if (isNewCoverImg) {
				FileUtil.delete(projectPath, before.getCoverImgSrc());
				FileUtil.delete(projectPath, before.getCoverImg());
			}
		}
		return result;
	}

	/**
	 *  查看干货/专家文章详情
	 */
	public Article getDetails(long id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(article, "待查看的汉和干货不存在");
		return article;
	}

	/**
	 *  文章点赞
	 */
	public int upvote(long id, long userId) {
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待点赞的汉和干货不存在");
		if (voteMapper.count(userId, id, null) > 0) {
			throw new ParamException("无需重复点赞");
		} else {
			Map<String, Object> map = Maps.newHashMap();
			map.put("userId", userId);
			map.put("articleId", id);
			map.put("createTime", DateUtil.getNow());
			map.put("result", null);
			voteMapper.upvoteArticle(map);
			return MapUtils.getInteger(map, "result", -2);
		}
	}

	/**
	 *  文章取消点赞
	 */
	public int downvote(long id, long userId) {
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待取消点赞的汉和干货不存在");
		if (voteMapper.count(userId, id, null) > 0) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("userId", userId);
			map.put("articleId", id);
			map.put("result", null);
			voteMapper.downvoteArticle(map);
			return MapUtils.getInteger(map, "result", -2);
		} else {
			throw new ParamException("无需重复取消点赞");
		}
	}

    /**
     *  专家文章列表
     */
	public List<Article> expertArticleList(Long expertId, Integer pageNum, Integer pageSize) {
        if (expertId == null) {
            expertId = 0L;
        }
        if (pageNum == null) {
            pageNum = Constants.DEFAULT_PAGE_NUM;
        }
        if (pageSize == null) {
            pageSize = Constants.DEFAULT_PAGE_SIZE;
        }
        PageHelper.startPage(pageNum, pageSize);
        return articleMapper.expertArticleList(expertId);
    }

	/**
	 *  添加专家文章
	 */
	@Transactional
	public long addExpertArticle(ArticleParam param) throws Exception {
		param.setCategoryId(0L);
		BeanValidator.check(param);

		long expertId = param.getExpertId();
		Administrator expert = administratorMapper.selectByPrimaryKey(expertId);
		Preconditions.checkNotNull(expert, "指定的专家不存在");

		Date now = DateUtil.getNow();
		Article article = Article.builder().expertId(expertId).author(param.getAuthor()).title(param.getTitle())
				.content(param.getContent()).type(Constants.ARTICLE_TYPE_EXPERT).state(Constants.DEFAULT_STATE_NORMAL)
                .createTime(now).build();

        // 文章封面
        if (UploadUtil.isUploadBase64Image(param.getCoverImg())) {
            String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
            String base64ImageData = param.getCoverImg().split(",")[1];
            String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_ARTICLE);
			article.setCoverImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(article.getCoverImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_ARTICLE, article.getCoverImg());
				if (paths != null && paths.length > 0) {
					article.setCoverImgSrc(article.getCoverImg());
					article.setCoverImg(paths[0]);
				}
			}
        } else {
            throw new ParamException("图片上传格式有误");
        }
		article.setOperator(RequestHolder.getCurrentUserBean().getName());
		article.setOperateTime(now);
		article.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = articleMapper.insertSelective(article);
		// 更新专家的最近互动时间
		if (result > 0) {
			Administrator administrator = Administrator.builder().id(expertId).interactTime(now).interactTitle(param.getTitle()).build();
			administratorMapper.updateByPrimaryKeySelective(administrator);
		}
		return article.getId();
	}

	/**
	 *  更新专家文章
	 */
	public int updateExpertArticle(ArticleParam param) throws Exception {
		param.setCategoryId(0L);
		BeanValidator.check(param);

		Long id = param.getId();
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待更新的专家文章不存在");

		long expertId = param.getExpertId();
		Administrator expert = administratorMapper.selectByPrimaryKey(expertId);
		Preconditions.checkNotNull(expert, "指定的专家不存在");

		Date now = DateUtil.getNow();
		Article after = Article.builder().id(id).author(param.getAuthor()).expertId(param.getExpertId())
				.title(param.getTitle()).content(param.getContent()).coverImg(param.getCoverImg()).build();

		// 新上传文章封面
		boolean isNewCoverImg = false;
		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		if (UploadUtil.isUploadBase64Image(param.getCoverImg())) {

			String base64ImageData = param.getCoverImg().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_ARTICLE);
			after.setCoverImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getCoverImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_ARTICLE, after.getCoverImg());
				if (paths != null && paths.length > 0) {
					after.setCoverImgSrc(after.getCoverImg());
					after.setCoverImg(paths[0]);
				}
			}
			isNewCoverImg = true;
		}

		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(now);
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = articleMapper.updateByPrimaryKeySelective(after);
		// 更新专家的最近互动时间
		if (result > 0) {
			Administrator administrator = Administrator.builder().id(expertId).interactTime(now).interactTitle(param.getTitle()).build();
			administratorMapper.updateByPrimaryKeySelective(administrator);

			if (isNewCoverImg) {
				FileUtil.delete(projectPath, before.getCoverImgSrc());
				FileUtil.delete(projectPath, before.getCoverImg());
			}
		}
		return result;
	}

	/**
	 *  删除文章
	 */
	public int delete(long id) {
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的文章不存在");
		Article after = Article.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result =  articleMapper.updateByPrimaryKeySelective(after);
		return result;
	}

	/**
	 * 置顶状态修改
	 * @param seq 置顶状态，0：取消置顶，-1：置顶2，-2：置顶1
	 */
	public int stick(long id, int seq) {
		Article before = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待置顶的文章不存在");
		if (seq < 0) {
			if (checkExist(seq)) {
				throw new ParamException("已存在"+getStickName(seq)+"的干货文章");
			}
		}
		Article after = Article.builder().id(id).seq(seq).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = articleMapper.updateByPrimaryKeySelective(after);
		// 确保置顶最多两项
		List<Article> topList = articleMapper.getTopList();
		int topSize = topList.size();
		if (topSize > 2) {
			for (int i = 2; i < topSize; i++) {
				Article article = Article.builder().id(topList.get(i).getId()).seq(0).build();
				articleMapper.updateByPrimaryKeySelective(article);
			}
		}
		return result;
	}

	/**
	 *  查看文章详情（微信）
	 */
	public ArticleDTO getDetailsByWechat(long id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(article, "待查看的文章不存在");
		long userId = RequestHolder.getCurrentUserBean().getId();
		List<CommentDTO> commentList = commentMapper.getByArticleId(id, userId);
		return ArticleDTO.adapt(article, commentList);
	}

	public Article getById(long id) {
		return articleMapper.selectByPrimaryKey(id);
	}

	/**
	 *  浏览量+1
	 */
	public int increaseReadSize(long id) {
		int result = articleMapper.increaseReadSize(id);
		return result;
	}

	public boolean isStar(long id) {
		long userId = RequestHolder.getCurrentUserBean().getId();
		return favoriteMapper.count(userId, null, id) > 0;
	}

	public boolean isVote(long id) {
		long userId = RequestHolder.getCurrentUserBean().getId();
		return voteMapper.count(userId, id, null) > 0;
	}

	private boolean checkExist(int seq) {
		return articleMapper.countBySeq(seq) > 0;
	}

	private String getStickName(int seq) {
		switch (seq) {
			case -2:
				return "置顶1";
			case -1:
				return "置顶2";
			default:
				return "";
		}
	}
}
