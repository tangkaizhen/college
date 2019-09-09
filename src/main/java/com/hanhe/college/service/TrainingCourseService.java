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
import com.hanhe.college.dao.TrainingCourseMapper;
import com.hanhe.college.entity.TrainingCourse;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.TrainingCourseParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/8/9.
 */
@Service
public class TrainingCourseService {
	@Autowired
	private TrainingCourseMapper trainingCourseMapper;

    /**
     *  培训课程列表
     */
	public List<TrainingCourse> list(Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return trainingCourseMapper.getAll();
	}

    /**
     *  添加培训课程
     */
	public long insert(TrainingCourseParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getName())) {
			throw new ParamException("已存在相同名称的培训课程");
		}
		Date now = DateUtil.getNow();
		TrainingCourse trainingCourse = TrainingCourse.builder().name(param.getName())
				.trainingContent(param.getTrainingContent()).trainingFee(param.getTrainingFee())
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
		trainingCourse.setAdminId(RequestHolder.getCurrentUserBean().getId());
		trainingCourse.setOperator(RequestHolder.getCurrentUserBean().getName());
		trainingCourse.setOperateTime(now);
		trainingCourse.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		trainingCourseMapper.insertSelective(trainingCourse);
		return trainingCourse.getId();
	}

    /**
     *  更新培训课程
     */
	public int update(TrainingCourseParam param) {
		BeanValidator.check(param);
		TrainingCourse before = trainingCourseMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的培训课程不存在");
		if (checkExist(param.getId(), param.getName())) {
			throw new ParamException("已存在相同名称的培训课程");
		}
		TrainingCourse after = TrainingCourse.builder().id(param.getId()).name(param.getName())
				.trainingContent(param.getTrainingContent()).trainingFee(param.getTrainingFee()).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return trainingCourseMapper.updateByPrimaryKeySelective(after);
	}

    /**
     *  删除培训课程
     */
	public int delete(long id) {
        TrainingCourse before = trainingCourseMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的课程不存在");
        TrainingCourse after = TrainingCourse.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return trainingCourseMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 *  查看培训课程详情
	 */
	public TrainingCourse getDetails(Long id) {
		TrainingCourse trainingCourse = trainingCourseMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(trainingCourse, "待查看的课程不存在");
		return trainingCourse;
	}

	private boolean checkExist(Long id, String name) {
		return trainingCourseMapper.countByName(id, name) > 0;
	}
}
