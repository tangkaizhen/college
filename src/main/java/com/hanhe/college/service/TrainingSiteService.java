package com.hanhe.college.service;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.albaba.tools.util.MD5Util;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.TrainingTypeDTO;
import com.hanhe.college.entity.*;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.TrainingSiteParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.StringUtil;

/**
 * Created by Angelo on 2018/8/9.
 */
@Service
public class TrainingSiteService {
	@Autowired
	private TrainingSiteMapper trainingSiteMapper;
	@Autowired
	private TrainingTypeMapper trainingTypeMapper;
	@Autowired
	private TrainingSiteTypeMapper trainingSiteTypeMapper;
	@Autowired
	private AdministratorMapper administratorMapper;
	@Autowired
	private AdminRoleMapper adminRoleMapper;

	/**
	 * 培训网点列表
	 */
	public List<TrainingSite> list(String province, String trainingType, Integer pageNum, Integer pageSize) {
		if ("全部".equals(province)) {
			province = null;
		}
		if ("全部".equals(trainingType)) {
			trainingType = null;
		}
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return trainingSiteMapper.list(province, trainingType);
	}

	/**
	 * 添加培训网点
	 */
	@Transactional
	public long insert(TrainingSiteParam param) {
		BeanValidator.check(param);
		if (DateUtil.isExpired(DateUtil.parseDate(param.getTrainingEndDate()))) {
			throw new ParamException("开班结束时间必须晚于当前时间");
		}
		if (checkExist(param.getId(), param.getName())) {
			throw new ParamException("已存在相同名称的培训网点");
		}
		if (checkAdminExist(param.getAdminAccount())) {
			throw new ParamException("已存在相同账号的网点管理员");
		}
		List<TrainingType> trainingTypeList = trainingTypeMapper.getByIds(param.getTrainingTypeIds());
		if (CollectionUtils.isEmpty(trainingTypeList)) {
			throw new ParamException("指定培训类型不存在/已删除");
		}
		List<String> trainingTypes = trainingTypeList.stream().map(trainingType -> trainingType.getName()).collect(Collectors.toList());

		Date now = DateUtil.getNow();
		TrainingSite trainingSite = TrainingSite.builder().name(param.getName()).adminAccount(param.getAdminAccount())
				.trainingType(Joiner.on(",").join(trainingTypes)).className(param.getClassName())
				.trainingStartDate(DateUtil.parseDate(param.getTrainingStartDate()))
				.trainingEndDate(DateUtil.parseDate(param.getTrainingEndDate()))
                .province(param.getProvince()).city(param.getCity()).address(param.getAddress())
                .contactName1(param.getContactName1()).contactPhone1(param.getContactPhone1())
                .contactName2(param.getContactName2()).contactPhone2(param.getContactPhone2())
                .contactName3(param.getContactName3()).contactPhone3(param.getContactPhone3())
                .trainingDescription(param.getTrainingDescription())
				.advantage(param.getAdvantage()).feeDescription(param.getFeeDescription())
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
		trainingSite.setOperator(RequestHolder.getCurrentUserBean().getName());
		trainingSite.setOperateTime(now);
		trainingSite.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		trainingSiteMapper.insertSelective(trainingSite);
		long trainingSiteId = trainingSite.getId();

		// 培训网点-培训类型关系
		List<TrainingSiteType> trainingSiteTypeList = Lists.newArrayList();
		for(TrainingType trainingType : trainingTypeList) {
			TrainingSiteType trainingSiteType = TrainingSiteType.builder().trainingSiteId(trainingSiteId).trainingTypeId(trainingType.getId()).build();
			trainingSiteTypeList.add(trainingSiteType);
		}
		trainingSiteTypeMapper.batchInsert(trainingSiteTypeList);

		// 网点管理员
		Administrator administrator = Administrator.builder().name(param.getAdminAccount())
				.nickname(param.getAdminAccount()).password(param.getAdminPassword())
				.type(Constants.ADMINISTRATOR_TYPE_MASTER).trainingSiteId(trainingSiteId)
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).updateTime(now).build();
		administrator.setOperator(RequestHolder.getCurrentUserBean().getName());
		administrator.setOperateTime(now);
		administrator.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		administratorMapper.insertSelective(administrator);

		// 网点管理员权限
		Long adminId = administrator.getId();
		AdminRole adminRole = AdminRole.builder().adminId(adminId).roleId(Constants.ROLE_TRAINING_SITE_ID)
				.operator(RequestHolder.getCurrentUserBean().getName())
				.operateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest())).operateTime(new Date()).build();
		adminRoleMapper.insertSelective(adminRole);

		return trainingSiteId;
	}

	/**
     *  更新培训网点
     */
	@Transactional
    public int update(TrainingSiteParam param) {
		param.setAdminAccount("PASS");
		param.setAdminPassword("PASSSS");
        BeanValidator.check(param);
        TrainingSite before = trainingSiteMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的培训网点不存在");
		if (DateUtil.isExpired(DateUtil.parseDate(param.getTrainingEndDate()))) {
			throw new ParamException("开班结束时间必须晚于当前时间");
		}
        if (checkExist(param.getId(), param.getName())) {
            throw new ParamException("已存在相同名称的培训网点");
        }
		// 培训类型更新
		boolean isChange = true;
		List<Long> originTrainingTypeIdList = trainingSiteTypeMapper.getByTrainingSiteId(param.getId());
		List<Long> trainingTypeIdList = StringUtil.splitToListLong(param.getTrainingTypeIds());
		if (originTrainingTypeIdList.size() == trainingTypeIdList.size()) {
			Set<Long> originTypeIdSet = Sets.newHashSet(originTrainingTypeIdList);
			Set<Long> typeIdSet = Sets.newHashSet(trainingTypeIdList);
			originTypeIdSet.removeAll(typeIdSet);
			if (CollectionUtils.isEmpty(originTypeIdSet)) {
				isChange = false;
			}
		}
        TrainingSite after = TrainingSite.builder().id(param.getId()).name(param.getName()).className(param.getClassName())
                .trainingStartDate(DateUtil.parseDate(param.getTrainingStartDate()))
                .trainingEndDate(DateUtil.parseDate(param.getTrainingEndDate()))
                .province(param.getProvince()).city(param.getCity()).address(param.getAddress())
                .contactName1(param.getContactName1()).contactPhone1(param.getContactPhone1())
                .contactName2(param.getContactName2()).contactPhone2(param.getContactPhone2())
                .contactName3(param.getContactName3()).contactPhone3(param.getContactPhone3())
                .trainingDescription(param.getTrainingDescription()).advantage(param.getAdvantage()).feeDescription(param.getFeeDescription()).build();
        after.setOperator(RequestHolder.getCurrentUserBean().getName());
        after.setOperateTime(DateUtil.getNow());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        // 更新培训网点-培训类型关系
        if (isChange) {
			List<TrainingType> trainingTypeList = trainingTypeMapper.getByIds(param.getTrainingTypeIds());
			if (CollectionUtils.isEmpty(trainingTypeList)) {
				throw new ParamException("指定培训类型不存在/已删除");
			}
			// 更新培训类型
			List<String> trainingTypes = trainingTypeList.stream().map(trainingType -> trainingType.getName()).collect(Collectors.toList());
			after.setTrainingType(Joiner.on(",").join(trainingTypes));


            long trainingSiteId = param.getId();
            trainingSiteTypeMapper.deleteByTrainingSiteId(trainingSiteId);
            List<TrainingSiteType> trainingSiteTypeList = Lists.newArrayList();
            for(Long trainingTypeId : trainingTypeIdList) {
                TrainingSiteType trainingSiteType = TrainingSiteType.builder().trainingSiteId(trainingSiteId).trainingTypeId(trainingTypeId).build();
                trainingSiteTypeList.add(trainingSiteType);
            }
            trainingSiteTypeMapper.batchInsert(trainingSiteTypeList);
		}
		return trainingSiteMapper.updateByPrimaryKeySelective(after);
    }

	/**
	 * 删除培训网点
	 */
	@Transactional
	public int delete(long id) {
		TrainingSite before = trainingSiteMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的培训网点不存在");
		Administrator admin = administratorMapper.getByName(before.getAdminAccount());
		Preconditions.checkNotNull(admin, "待删除的培训网点管理员异常");
		String operator = RequestHolder.getCurrentUserBean().getName();
		Date now = DateUtil.getNow();
		String operateIp = IpUtil.getRemoteIp(RequestHolder.getCurrentRequest());
		TrainingSite after = TrainingSite.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(operator);
		after.setOperateTime(now);
		after.setOperateIp(operateIp);
		int result = trainingSiteMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			Administrator administrator = Administrator.builder().id(admin.getId())
					.state(Constants.DEFAULT_STATE_DELETE).build();
			administrator.setOperator(operator);
			administrator.setOperateTime(now);
			administrator.setOperateIp(operateIp);
			administratorMapper.updateByPrimaryKeySelective(administrator);
			adminRoleMapper.deleteByAdminId(admin.getId());

			trainingSiteTypeMapper.deleteByTrainingSiteId(id);
		}
		return result;
	}

	/**
	 * 查看培训网点详情
	 */
	public TrainingSite getDetails(long id) {
		TrainingSite trainingSite = trainingSiteMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(trainingSite, "待查看的培训网点不存在");
		return trainingSite;
	}

	/**
	 * 获取可报名培训类型
	 */
	public List<TrainingTypeDTO> getAvailableTrainingTypes(long id, long userId) {
		TrainingSite trainingSite = trainingSiteMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(trainingSite, "待报名的培训网点不存在");
		if (DateUtil.isExpired(trainingSite.getTrainingEndDate())) {
			throw new ParamException("已过开班结束时间，暂无法报名");
		}
		List<TrainingTypeDTO> trainingTypes = trainingSiteTypeMapper.getAvailableTrainingTypes(id, userId);
		// 仅显示通过综测的可报名培训类型
		return trainingTypes.stream().filter(trainingTypeDTO -> trainingTypeDTO.isPass()).collect(Collectors.toList());
	}

	/**
	 * 重置网点管理员密码
	 */
	public int resetMasterPwd(long id, String password) {
		Administrator before = administratorMapper.getByTrainingSiteId(id);
		Preconditions.checkNotNull(before, "待重置密码的网点管理员不存在");
		if (StringUtils.isEmpty(password)) {
			password = MD5Util.encrypt(Constants.DEFAULT_PASSWORD);
		}
		Administrator after = Administrator.builder().id(before.getId()).password(password.toLowerCase())
				.build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return administratorMapper.updateByPrimaryKeySelective(after);
	}

	private boolean checkExist(Long id, String name) {
		return trainingSiteMapper.countByName(id, name) > 0;
	}

	private boolean checkAdminExist(String adminAccount) {
		return administratorMapper.countByName(null, adminAccount, adminAccount) > 0;
	}
}
