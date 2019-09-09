package com.hanhe.college.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.ArticleCategoryMapper;
import com.hanhe.college.dao.ArticleMapper;
import com.hanhe.college.entity.ArticleCategory;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ConfigParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/7/31.
 */
@Service
public class ArticleCategoryService {

    @Autowired
    private ArticleCategoryMapper articleCategoryMapper;
    @Autowired
    private ArticleMapper articleMapper;

    /**
     *  干货类别列表
     */
    public List<ArticleCategory> getAvailable() {
        return articleCategoryMapper.getAvailable();
    }

    /**
     *  添加干货类别
     */
    public long insert(ConfigParam param) {
        BeanValidator.check(param);
        if (checkExist(param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的干货类别");
        }
        ArticleCategory articleCategory = ArticleCategory.builder().name(param.getName()).state(Constants.DEFAULT_STATE_NORMAL).build();;
        articleCategory.setOperator(RequestHolder.getCurrentUserBean().getName());
        articleCategory.setOperateTime(DateUtil.getNow());
        articleCategory.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        articleCategoryMapper.insertSelective(articleCategory);
        return articleCategory.getId();
    }
    /**
     *  更新干货类别
     */
    public int update(ConfigParam param) {
        BeanValidator.check(param);
        ArticleCategory before = articleCategoryMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的干货类别不存在");
        if(checkExist( param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的干货类别");
        }
        ArticleCategory after = ArticleCategory.builder().id(param.getId()).name(param.getName()).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return articleCategoryMapper.updateByPrimaryKeySelective(after);
    }
    /**
     *  删除干货类别
     */
    public int delete(long id) {
        ArticleCategory before = articleCategoryMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的干货类别不存在");
        if (isArticleExist(id)) {
            throw new ParamException("汉和干货中该干货类别尚在使用，无法删除");
        }
        ArticleCategory after = ArticleCategory.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return articleCategoryMapper.updateByPrimaryKeySelective(after);
    }

    private boolean checkExist(Long id, String name) {
        return articleCategoryMapper.countByName(id, name) > 0;
    }

    private boolean isArticleExist(long categoryId) {
        return articleMapper.isExist(categoryId) > 0;
    }
}
