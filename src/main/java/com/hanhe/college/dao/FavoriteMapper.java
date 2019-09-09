package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.Article;
import com.hanhe.college.entity.Course;
import com.hanhe.college.entity.Favorite;

public interface FavoriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Favorite record);

    int insertSelective(Favorite record);

    Favorite selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Favorite record);

    int updateByPrimaryKey(Favorite record);

    int count(@Param("userId") long userId, @Param("courseId") Long courseId, @Param("articleId") Long articleId);

    int cancelArticleFavorite(@Param("userId") long userId, @Param("articleId") long articleId);

    int cancelCourseFavorite(@Param("userId") long userId, @Param("courseId") long courseId);

    List<Course> myFavoriteCourses(@Param("userId") long userId);

    List<Article> myFavoriteArticles(@Param("userId") long userId);
}