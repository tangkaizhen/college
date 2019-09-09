package com.hanhe.college.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.CourseCategoryDTO;
import com.hanhe.college.entity.*;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.CourseCatrgoryParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/7/31.
 */
@Service
public class CourseCategoryService {

	@Autowired
	private CourseCategoryMapper courseCategoryMapper;
	@Autowired
    private CourseMapper courseMapper;
	@Autowired
    private UserTypeMapper userTypeMapper;
    @Autowired
    private UavTypeMapper uavTypeMapper;
    @Autowired
	private ExamMapper examMapper;
    @Autowired
	private ExamQuestionMapper examQuestionMapper;
    @Autowired
	private ExamResultMapper examResultMapper;
    
    public List<CourseCategory> getCourseCategories(long userTypeId, long uavTypeId) {
    	return courseCategoryMapper.getCourseCategories(userTypeId, uavTypeId);
    }

    /**
     *  课程大类列表（微信）
     */
	public List<CourseCategoryDTO> getCourseCategoryList(long userTypeId, long uavTypeId) {
		Long userId = RequestHolder.getCurrentUserBean().getId();
		List<CourseCategoryDTO> courseCategoryDTOList = courseCategoryMapper.getCourseCategoryList(userTypeId,
				uavTypeId);
		List<ExamResult> results = examResultMapper.getResults(userTypeId, uavTypeId, userId);
		Map<Long, ExamResult> resultMap = results.stream()
				.collect(Collectors.toMap(ExamResult::getCourseCategoryId, examResult -> examResult));

		boolean permitted = true;
		UserType userType = userTypeMapper.getByFlag(Constants.USER_TYPE_FLAG_JUNIOR);
		// 考试内容为教员课程时，验证该机型的学员综测是否已通过考试
		if (userTypeId != userType.getId().longValue()) {
			permitted = checkPass(userType.getId(), uavTypeId, Constants.EXAM_TYPE_SYNTHETIC_TEST, userId);
		}

		for (CourseCategoryDTO courseCategoryDTO : courseCategoryDTOList) {
			long categoryId = courseCategoryDTO.getId();
			if (resultMap.get(categoryId) != null) {
				courseCategoryDTO.setPassExam(true);
			}
			courseCategoryDTO.setPermitted(permitted);
		}
		return courseCategoryDTOList;
	}

    /**
     *  课程小类列表（微信）
     */
	public CourseCategoryDTO getCourseCategoryDetails(long id) {
        CourseCategoryDTO courseCategoryDTO = courseCategoryMapper.getDetails(id);
        List<Course> courseList = courseMapper.getByCategoryId(id);
        courseCategoryDTO.setCourseList(courseList);
        return courseCategoryDTO;
    }
	
	/**
	 *  课程类别列表
	 */
	public List<CourseCategory> getAvailable() {
		return courseCategoryMapper.getAvailable();
	}


	/**
	 *  添加课程类别
	 */
	public long insert(CourseCatrgoryParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getUserTypeId(), param.getUavTypeId(), param.getName())) {
			throw new ParamException("已存在相同名称的课程类别");
		}
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");
		
		CourseCategory courseCategory = CourseCategory.builder().userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).userType(userType.getName()).uavType(uavType.getName())
				.name(param.getName()).state(Constants.DEFAULT_STATE_NORMAL).build();
		courseCategory.setOperator(RequestHolder.getCurrentUserBean().getName());
		courseCategory.setOperateTime(DateUtil.getNow());
		courseCategory.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		courseCategoryMapper.insertSelective(courseCategory);
		return courseCategory.getId();
	}

	/**
	 * 更新课程类别
	 */
	public int update(CourseCatrgoryParam param) {
		BeanValidator.check(param);
		CourseCategory before = courseCategoryMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的课程类别不存在");
		if (checkExist(param.getId(), param.getUserTypeId(), param.getUavTypeId(), param.getName())) {
			throw new ParamException("已存在相同名称的课程类别");
		}
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");

		CourseCategory after = CourseCategory.builder().id(param.getId()).userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).userType(userType.getName()).uavType(uavType.getName())
				.name(param.getName()).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return courseCategoryMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 *  删除课程类别
	 */
	public int delete(long id) {
		CourseCategory before = courseCategoryMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的课程类别不存在");
		if (isCourseExist(id)) {
			throw new ParamException("当前课程中该课程类别尚在使用，无法删除");
		} else if (isExamExist(id)) {
			throw new ParamException("试卷管理中该课程类别尚在使用，无法删除");
		} else if (isExamQuestionExist(id)) {
			throw new ParamException("试题管理中该课程类别尚在使用，无法删除");
		}
		CourseCategory after = CourseCategory.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return courseCategoryMapper.updateByPrimaryKeySelective(after);
	}
	
	public CourseCategory getById(Long id) {
		return courseCategoryMapper.selectByPrimaryKey(id);
	}

	private boolean checkExist(Long id, Long userTypeId, Long uavTypeId, String name) {
		return courseCategoryMapper.countByName(id, userTypeId, uavTypeId, name) > 0;
	}

	private boolean isCourseExist(long courseCategoryId) {
		return courseMapper.isExist(courseCategoryId) > 0;
	}

	private boolean isExamExist(long courseCategoryId) {
		return examMapper.isExist(null, null, courseCategoryId) > 0;
	}

	private boolean isExamQuestionExist(long courseCategoryId) {
		return examQuestionMapper.isExist(null, null, courseCategoryId) > 0;
	}

    private boolean checkPass(Long userTypeId, Long uavTypeId, Integer type, Long userId) {
        return examResultMapper.count(userTypeId, uavTypeId, type, userId) > 0;
    }
}
