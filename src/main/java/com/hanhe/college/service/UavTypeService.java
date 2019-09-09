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
import com.hanhe.college.entity.UavType;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ConfigParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/7/31.
 */
@Service
public class UavTypeService {
    @Autowired
    private UavTypeMapper uavTypeMapper;
    @Autowired
    private TrainingTypeMapper trainingTypeMapper;
    @Autowired
    private CourseCategoryMapper courseCategoryMapper;
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private ExamMapper examMapper;
    @Autowired
    private ExamQuestionMapper examQuestionMapper;

    public List<UavType> getAvailable() {
        return uavTypeMapper.getAvailable();
    }

    /**
     *  添加机型
     */
    public long insert(ConfigParam param) {
        BeanValidator.check(param);
        if (checkExist(param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的机型");
        }
        if (getCount() > 1) {
            throw new ParamException("暂只支持添加两个身份");
        }
        UavType uavType = UavType.builder().name(param.getName()).state(Constants.DEFAULT_STATE_NORMAL).build();;
        uavType.setOperator(RequestHolder.getCurrentUserBean().getName());
        uavType.setOperateTime(DateUtil.getNow());
        uavType.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        uavTypeMapper.insertSelective(uavType);
        return uavType.getId();
    }

    /**
     *  更新机型
     */
    public int update(ConfigParam param) {
        BeanValidator.check(param);
        UavType before = uavTypeMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的机型不存在");
        if(checkExist( param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的机型");
        }
        UavType after = UavType.builder().id(param.getId()).name(param.getName()).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return uavTypeMapper.updateByPrimaryKeySelective(after);
    }

    /**
     *  删除机型
     */
    public int delete(long id) {
        UavType before = uavTypeMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的机型不存在");
        if (isTrainingTypeExist(id)) {
            throw new ParamException("培训类型中该机型尚在使用，无法删除");
        } else if (isCourseCategoryExist(id)) {
            throw new ParamException("课程类别中该机型尚在使用，无法删除");
        } else if (isVideoExist(id)) {
            throw new ParamException("视频分类中该机型尚在使用，无法删除");
        } else if (isExamExist(id)) {
            throw new ParamException("试卷管理中该机型尚在使用，无法删除");
        } else if (isExamQuestionExist(id)) {
            throw new ParamException("试题管理中该机型尚在使用，无法删除");
        }
        UavType after = UavType.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return uavTypeMapper.updateByPrimaryKeySelective(after);
    }

    private int getCount() {
        return uavTypeMapper.getCount();
    }


    private boolean checkExist(Long id, String name) {
        return uavTypeMapper.countByName(id, name) > 0;
    }

    private boolean isTrainingTypeExist(long uavTypeId) {
        return trainingTypeMapper.isExist(null, uavTypeId) > 0;
    }

    private boolean isCourseCategoryExist(long uavTypeId) {
        return courseCategoryMapper.isExist(null, uavTypeId) > 0;
    }

    private boolean isVideoExist(long uavTypeId) {
        return videoMapper.isExist(uavTypeId) > 0;
    }

    private boolean isExamExist(long uavTypeId) {
        return examMapper.isExist(null, uavTypeId, null) > 0;
    }

    private boolean isExamQuestionExist(long uavTypeId) {
        return examQuestionMapper.isExist(null, uavTypeId, null) > 0;
    }
}
