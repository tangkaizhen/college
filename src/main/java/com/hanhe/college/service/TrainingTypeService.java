package com.hanhe.college.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.TrainingSiteTypeMapper;
import com.hanhe.college.dao.TrainingTypeMapper;
import com.hanhe.college.dao.UavTypeMapper;
import com.hanhe.college.dao.UserTypeMapper;
import com.hanhe.college.entity.TrainingType;
import com.hanhe.college.entity.UavType;
import com.hanhe.college.entity.UserType;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.TrainingTypeParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/7/31.
 */
@Service
public class TrainingTypeService {

	@Autowired
	private TrainingTypeMapper trainingTypeMapper;
	@Autowired
	private UserTypeMapper userTypeMapper;
	@Autowired
	private UavTypeMapper uavTypeMapper;
	@Autowired
	private TrainingSiteTypeMapper trainingSiteTypeMapper;

	public List<TrainingType> getAvailable() {
		return trainingTypeMapper.getAvailable();
	}

	/**
	 * 添加培训类别
	 */
	public long insert(TrainingTypeParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getName())) {
			throw new ParamException("已存在相同名称的培训类型");
		}
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");

		TrainingType trainingType = TrainingType.builder().userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).userType(userType.getName()).uavType(uavType.getName())
				.name(param.getName()).state(Constants.DEFAULT_STATE_NORMAL).build();
		trainingType.setOperator(RequestHolder.getCurrentUserBean().getName());
		trainingType.setOperateTime(DateUtil.getNow());
		trainingType.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		trainingTypeMapper.insertSelective(trainingType);
		return trainingType.getId();
	}

	/**
	 * 更新培训类别
	 */
	public int update(TrainingTypeParam param) {
		BeanValidator.check(param);
		TrainingType before = trainingTypeMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的培训类型不存在");
		if (checkExist(param.getId(), param.getName())) {
			throw new ParamException("已存在相同名称的培训类型");
		}
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");

		TrainingType after = TrainingType.builder().id(param.getId()).userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).userType(userType.getName()).uavType(uavType.getName())
				.name(param.getName()).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return trainingTypeMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 删除培训类别
	 */
	public int delete(long id) {
		TrainingType before = trainingTypeMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的培训类型不存在");
		if (isTrainingSiteExist(id)) {
			throw new ParamException("培训网点中该培训类型尚在使用，无法删除");
		}
		TrainingType after = TrainingType.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return trainingTypeMapper.updateByPrimaryKeySelective(after);
	}

	private boolean checkExist(Long id, String name) {
		return trainingTypeMapper.countByName(id, name) > 0;
	}

	private boolean isTrainingSiteExist(long trainingTypeId) {
		return trainingSiteTypeMapper.isExist(trainingTypeId) > 0;
	}
}
