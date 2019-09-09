package com.hanhe.college.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.google.common.collect.Maps;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.FavoriteMapper;
import com.hanhe.college.entity.Article;
import com.hanhe.college.entity.Course;
import com.hanhe.college.entity.Favorite;
import com.hanhe.college.exception.ParamException;

/**
 * Created by Angelo on 2018/8/20.
 */
@Service
public class FavoriteService {
    @Autowired
    private FavoriteMapper favoriteMapper;

    /**
     *  收藏课程
     */
    public int saveCourseFavorite(long userId, long courseId) {
        if (checkExist(userId, courseId ,null)) {
            throw new ParamException("无需重复收藏");
        } else {
            Favorite favorite = Favorite.builder().userId(userId).courseId(courseId).createTime(DateUtil.getNow()).build();
            return favoriteMapper.insertSelective(favorite);
        }
    }

    /**
     *  取消收藏课程
     */
    public int cancelCourseFavorite(long userId, long courseId) {
        if (checkExist(userId, courseId ,null)) {
            return favoriteMapper.cancelCourseFavorite(userId, courseId);
        } else {
            throw new ParamException("无需重复取消收藏");
        }
    }

    /**
     *  收藏干货
     */
    public int saveArticleFavorite(long userId, long articleId) {
        if (checkExist(userId, null ,articleId)) {
            throw new ParamException("无需重复收藏");
        } else {
            Favorite favorite = Favorite.builder().userId(userId).articleId(articleId).createTime(DateUtil.getNow()).build();
            return favoriteMapper.insertSelective(favorite);
        }
    }

    /**
     *  取消收藏干货
     */
    public int cancelArticleFavorite(long userId, long articleId) {
        if (checkExist(userId, null ,articleId)) {
            return favoriteMapper.cancelArticleFavorite(userId, articleId);
        } else {
            throw new ParamException("无需重复取消收藏");
        }
    }

    /**
     *  我的收藏
     */
    public Map<String,Object> myFavorites(Integer type) {
        Map<String, Object> datas = Maps.newHashMap();
        long userId = RequestHolder.getCurrentUserBean().getId();
        if (type == null) {
            List<Course> courseList = favoriteMapper.myFavoriteCourses(userId);
            List<Article> articleList = favoriteMapper.myFavoriteArticles(userId);
            datas.put("courseList", courseList);
            datas.put("articleList", articleList);
        } else if (type == Constants.FAVORITE_TYPE_COURSE) {
            List<Course> courseList = favoriteMapper.myFavoriteCourses(userId);
            datas.put("courseList", courseList);
        } else if (type == Constants.FAVORITE_TYPE_WIKI) {
            List<Article> articleList = favoriteMapper.myFavoriteArticles(userId);
            datas.put("articleList", articleList);
        }
        return datas;
    }

    private boolean checkExist(long userId, Long courseId, Long articleId) {
        return favoriteMapper.count(userId, courseId, articleId) > 0;
    }
}
