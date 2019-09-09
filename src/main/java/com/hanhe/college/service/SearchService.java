package com.hanhe.college.service;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.ArticleMapper;
import com.hanhe.college.dao.TraineeMapper;
import com.hanhe.college.dao.VideoMapper;
import com.hanhe.college.entity.Article;
import com.hanhe.college.entity.Trainee;
import com.hanhe.college.entity.Video;

/**
 * Created by Angelo on 2018/9/4.
 */
@Service
public class SearchService {
    @Autowired
    private TraineeMapper traineeMapper;
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private ArticleMapper articleMapper;

    public Map<String,Object> search(String query, Integer pageNum, Integer pageSize) {
        Map<String, Object> map = Maps.newHashMap();
        if (isIdCardNo(query)) {
            List<Trainee> trainees =  traineeMapper.getByCerticateNo(query);
            map.put("trainees", trainees);
        } else {
            if (pageNum == null) {
                pageNum = Constants.DEFAULT_PAGE_NUM;
            }
            if (pageSize == null) {
                pageSize = Constants.DEFAULT_PAGE_SIZE;
            }
            if (pageNum == Constants.DEFAULT_PAGE_NUM) {
                //  第一页显示视频匹配项
                List<Video> videos = videoMapper.selectByKeyword(query);
                videos.stream().forEach(video -> {
                    video.setName(video.getName().replace(query, "<em>"+query+"</em>"));
                });
                map.put("videos", videos);
            }
            PageHelper.startPage(pageNum, pageSize);
            List<Article> articles = articleMapper.selectByKeyword(query);
            articles.stream().forEach(article -> {
                article.setTitle(article.getTitle().replace(query, "<em>"+query+"</em>"));
            });
            map.put("articles", articles);
        }
        return map;
    }

    private boolean isIdCardNo(String input) {
        String regex = "^[1-9]\\d{5}(18|19|20)?(\\d{2})((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([\\d|x|X]{1})$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(input);
        return m.matches();
    }
}
