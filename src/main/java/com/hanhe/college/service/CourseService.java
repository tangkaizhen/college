package com.hanhe.college.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.CourseCategoryMapper;
import com.hanhe.college.dao.CourseMapper;
import com.hanhe.college.dao.FavoriteMapper;
import com.hanhe.college.dto.CourseDTO;
import com.hanhe.college.entity.Course;
import com.hanhe.college.entity.CourseCategory;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.CourseParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/8/9.
 */
@Service
public class CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CourseCategoryMapper courseCategoryMapper;
    @Autowired
	private FavoriteMapper favoriteMapper;

    /**
     *  课程列表
     */
    public List<CourseDTO> list(Long userTypeId, Long uavTypeId, Long courseCategoryId, Integer pageNum, Integer pageSize) {
        if (pageNum == null) {
            pageNum = Constants.DEFAULT_PAGE_NUM;
        }
        if (pageSize == null) {
            pageSize = Constants.DEFAULT_PAGE_SIZE;
        }
        PageHelper.startPage(pageNum, pageSize);
        return courseMapper.list(userTypeId, uavTypeId, courseCategoryId);
    }

	/**
	 * 添加课程
	 */
	public long insert(CourseParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getCourseCategoryId(), param.getTitle())) {
			throw new ParamException("已存在相同名称的课程标题");
		}
		CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(param.getCourseCategoryId());
		Preconditions.checkNotNull(courseCategory, "指定的课程类别不存在");

		Date now = DateUtil.getNow();
		Course course = Course.builder().courseCategoryId(param.getCourseCategoryId())
				.courseCategory(courseCategory.getName()).title(param.getTitle()).content(param.getContent())
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
		course.setAdminId(RequestHolder.getCurrentUserBean().getId());
		course.setOperator(RequestHolder.getCurrentUserBean().getName());
		course.setOperateTime(now);
		course.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		courseMapper.insertSelective(course);
		return course.getId();
	}

	/**
	 * 更新课程
	 */
	public int update(CourseParam param) {
		BeanValidator.check(param);
		Course before = courseMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的课程不存在");
		if (checkExist(param.getId(), param.getCourseCategoryId(), param.getTitle())) {
			throw new ParamException("已存在相同名称的课程标题");
		}
		CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(param.getCourseCategoryId());
		Preconditions.checkNotNull(courseCategory, "指定的课程类别不存在");

		Course after = Course.builder().id(param.getId()).courseCategoryId(param.getCourseCategoryId())
				.courseCategory(courseCategory.getName()).title(param.getTitle()).content(param.getContent()).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return courseMapper.updateByPrimaryKeySelective(after);
	}

    /**
     *  删除课程
     */
    public int delete(long id) {
        Course before = courseMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待更新的课程不存在");
        Course after = Course.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return courseMapper.updateByPrimaryKeySelective(after);
    }

	/**
	 *  课程详情
	 */
	public CourseDTO getDetails(long id) {
    	Course course = courseMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(course, "待查看的课程不存在");
		CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(course.getCourseCategoryId());
		return CourseDTO.adapt(course, courseCategory);
	}

	/**
	 *  浏览量+1
	 */
	public int increaseStudySize(long id) {
		return courseMapper.increaseStudySize(id);
	}

	public boolean isStar(Long id) {
		long userId = RequestHolder.getCurrentUserBean().getId();
		return favoriteMapper.count(userId, id, null) > 0;
	}

    private boolean checkExist(Long id, Long courseCategoryId, String name) {
        return courseMapper.countByName(id, courseCategoryId, name) > 0;
    }



}
