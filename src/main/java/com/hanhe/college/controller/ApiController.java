package com.hanhe.college.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.entity.*;
import com.hanhe.college.service.*;

/**
 * Created by Angelo on 2018/7/31.
 */
@RestController
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private UserTypeService userTypeService;
    @Autowired
    private UavTypeService uavTypeService;
    @Autowired
    private TrainingTypeService trainingTypeService;
    @Autowired
    private ArticleCategoryService articleCategoryService;
    @Autowired
    private CourseCategoryService courseCategoryService;

    @RequestMapping("/getUserTypes.json")
    public ApiMsg getUserTypes() {
        List<UserType> userTypes = userTypeService.getAvailable();
//        Map<String, Object> map = Maps.newHashMap();
        return ApiMsg.success(userTypes);
    }

    @RequestMapping("/getUavTypes.json")
    public ApiMsg getUavTypes() {
        List<UavType> uavTypes = uavTypeService.getAvailable();
        return ApiMsg.success(uavTypes);
    }

    @RequestMapping("/getTrainingTypes.json")
    public ApiMsg getTrainingTypes() {
        List<TrainingType> trainingTypes = trainingTypeService.getAvailable();
        return ApiMsg.success(trainingTypes);
    }

    @RequestMapping("/getArticleCategories.json")
    public ApiMsg getArticleCategories() {
        List<ArticleCategory> articleCategories = articleCategoryService.getAvailable();
        return ApiMsg.success(articleCategories);
    }

    @RequestMapping("/getCourseCategories.json")
    public ApiMsg getCourseCategories(long userTypeId, long uavTypeId) {
        List<CourseCategory> courseCategories = courseCategoryService.getCourseCategories(userTypeId, uavTypeId);
        return ApiMsg.success(courseCategories);
    }
}
