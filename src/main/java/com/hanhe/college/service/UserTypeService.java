package com.hanhe.college.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.entity.UserType;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ConfigParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/7/31.
 */
@Service
public class UserTypeService {

    @Autowired
    private UserTypeMapper userTypeMapper;
    @Autowired
    private TrainingTypeMapper trainingTypeMapper;
    @Autowired
    private CourseCategoryMapper courseCategoryMapper;
    @Autowired
    private ExamMapper examMapper;
    @Autowired
    private ExamQuestionMapper examQuestionMapper;

    public List<UserType> getAvailable() {
        return userTypeMapper.getAvailable();
    }

    /**
     *  添加身份
     */
    public long insert(ConfigParam param) {
        BeanValidator.check(param);
        if (checkExist(param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的身份");
        }
        if (getCount() > 1) {
            throw new ParamException("暂只支持添加两个身份");
        }
        UserType userType = UserType.builder().name(param.getName()).state(Constants.DEFAULT_STATE_NORMAL).build();;
        userType.setOperator(RequestHolder.getCurrentUserBean().getName());
        userType.setOperateTime(DateUtil.getNow());
        userType.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        userTypeMapper.insertSelective(userType);
        return userType.getId();
    }

    /**
     *  更新身份
     */
    public int update(ConfigParam param) {
        BeanValidator.check(param);
        UserType before = userTypeMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的身份不存在");
        if(checkExist( param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的身份");
        }
        UserType after = UserType.builder().id(param.getId()).name(param.getName()).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return userTypeMapper.updateByPrimaryKeySelective(after);
    }

    /**
     *  删除身份
     */
    public int delete(long id) {
        UserType before = userTypeMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的身份不存在");
        if (isTrainingTypeExist(id)) {
            throw new ParamException("培训类型中该身份尚在使用，无法删除");
        } else if (isCourseCategoryExist(id)) {
            throw new ParamException("课程类别中该身份尚在使用，无法删除");
        } else if (isExamExist(id)) {
            throw new ParamException("试卷管理中该身份尚在使用，无法删除");
        } else if (isExamQuestionExist(id)) {
            throw new ParamException("试题管理中该身份尚在使用，无法删除");
        }
        UserType after = UserType.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return userTypeMapper.updateByPrimaryKeySelective(after);
    }
    
    public UserType getById(long id) {
		return userTypeMapper.selectByPrimaryKey(id);
	}

    private int getCount() {
        return userTypeMapper.getCount();
    }

    private boolean checkExist(Long id, String name) {
        return userTypeMapper.countByName(id, name) > 0;
    }

    private boolean isTrainingTypeExist(long userTypeId) {
        return trainingTypeMapper.isExist(userTypeId, null) > 0;
    }

    private boolean isCourseCategoryExist(long userTypeId) {
        return courseCategoryMapper.isExist(userTypeId, null) > 0;
    }

    private boolean isExamExist(long userTypeId) {
        return examMapper.isExist(userTypeId, null, null) > 0;
    }

    private boolean isExamQuestionExist(long userTypeId) {
        return examQuestionMapper.isExist(userTypeId, null, null) > 0;
    }
}
