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
import com.hanhe.college.dao.GuidelineMapper;
import com.hanhe.college.entity.Guideline;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.GuidelineParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/8/3.
 */
@Service
public class GuidelineService {

    @Autowired
    private GuidelineMapper guidelineMapper;

    /**
     *  学习指引列表
     */
    public List<Guideline> list(Integer pageNum, Integer pageSize) {
        if (pageNum == null) {
            pageNum = Constants.DEFAULT_PAGE_NUM;
        }
        if (pageSize == null) {
            pageSize = Constants.DEFAULT_PAGE_SIZE;
        }
        PageHelper.startPage(pageNum, pageSize);
        return guidelineMapper.getAll();
    }

    /**
     *  添加指引
     */
    public long insert(GuidelineParam param) {
        BeanValidator.check(param);
        if (checkExist(param.getId(), param.getTitle())) {
            throw new ParamException("已存在相同名称的学习指引");
        }
        Date now = DateUtil.getNow();
        Guideline guideline = Guideline.builder().title(param.getTitle()).content(param.getContent()).createTime(now).build();
        guideline.setOperator(RequestHolder.getCurrentUserBean().getName());
        guideline.setOperateTime(now);
        guideline.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        guidelineMapper.insertSelective(guideline);
        return guideline.getId();
    }

    /**
     *  更新指引
     */
    public int update(GuidelineParam param) {
        BeanValidator.check(param);
        Guideline before = guidelineMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的学习指引不存在");
        if (checkExist(param.getId(), param.getTitle())) {
            throw new ParamException("已存在相同名称的学习指引");
        }
        Guideline after = Guideline.builder().id(param.getId()).title(param.getTitle())
                .content(param.getContent()).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        return guidelineMapper.updateByPrimaryKeySelective(after);
    }

    /**
     *  删除指引
     */
    public int delete(long id) {
        Guideline before = guidelineMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的学习指引不存在");
        return guidelineMapper.deleteByPrimaryKey(id);
    }
    
    /**
     *  查看指引详情
     */
    public Guideline getDetails(Long id) {
    	Guideline guideline = guidelineMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(guideline, "待查看的学习指引不存在");
        return guideline;
	}

    private boolean checkExist(Long id, String name) {
        return guidelineMapper.countByName(id, name) > 0;
    }

	
}
